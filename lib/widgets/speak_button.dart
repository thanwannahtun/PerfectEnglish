// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import '../services/kokoro_tts_service.dart';
// import '../services/tts_sentence_splitter.dart';
// import 'tts_model_downloader.dart';
//
// /// Three distinct UI states for the button
// enum _SpeakState { idle, loading, playing, paused }
//
// class SpeakButton extends StatefulWidget {
//   final String text;
//   final double? iconSize;
//   final Color? color;
//   final int speakerId;
//
//   const SpeakButton({
//     super.key,
//     required this.text,
//     this.iconSize = 28,
//     this.color,
//     this.speakerId = 0,
//   });
//
//   @override
//   State<SpeakButton> createState() => _SpeakButtonState();
// }
//
// class _SpeakButtonState extends State<SpeakButton> {
//   final _service = KokoroTtsService.instance;
//
//   AudioPlayer? _player;
//   _SpeakState _state = _SpeakState.idle;
//
//   // Set to true to abort the background synthesis loop
//   bool _cancelRequested = false;
//
//   // Track how many sources have been queued so we know when synthesis is done
//   int _sourcesQueued = 0;
//   int _sourcesTotal = 0;
//
//   StreamSubscription? _playerStateSub;
//
//   bool get _isLongText => TtsSentenceSplitter.split(widget.text).length > 1;
//
//   @override
//   void dispose() {
//     _cancelRequested = true;
//     _playerStateSub?.cancel();
//     _player?.stop();
//     _player?.dispose();
//     super.dispose();
//   }
//
//   Future<void> _onTap() async {
//     switch (_state) {
//       case _SpeakState.idle:
//         await _startSpeaking();
//       case _SpeakState.loading:
//         // Cancel the pending synthesis
//         await _stopAll();
//       case _SpeakState.playing:
//         await _pause();
//       case _SpeakState.paused:
//         await _resume();
//     }
//   }
//
//   // ─── Start ───────────────────────────────────────────────────────────────
//
//   Future<void> _startSpeaking() async {
//     final downloaded = await _service.isModelDownloaded();
//     if (!downloaded) {
//       if (mounted) _showDownloadSheet();
//       return;
//     }
//
//     if (_isLongText) {
//       await _speakParagraph();
//     } else {
//       await _speakSingle();
//     }
//   }
//
//   // ─── Pause / Resume ───────────────────────────────────────────────────────
//
//   Future<void> _pause() async {
//     await _player?.pause();
//     if (mounted) setState(() => _state = _SpeakState.paused);
//   }
//
//   Future<void> _resume() async {
//     await _player?.play();
//     if (mounted) setState(() => _state = _SpeakState.playing);
//   }
//
//   // ─── Stop ─────────────────────────────────────────────────────────────────
//
//   Future<void> _stopAll() async {
//     _cancelRequested = true;
//     _playerStateSub?.cancel();
//     _playerStateSub = null;
//     await _player?.stop();
//     _player?.dispose();
//     _player = null;
//     _sourcesQueued = 0;
//     _sourcesTotal = 0;
//     if (mounted) setState(() => _state = _SpeakState.idle);
//   }
//
//   // ─── Single sentence ─────────────────────────────────────────────────────
//
//   Future<void> _speakSingle() async {
//     if (mounted) setState(() => _state = _SpeakState.loading);
//     _cancelRequested = false;
//
//     try {
//       final text = widget.text.trim().isEmpty
//           ? 'No text detected.'
//           : widget.text;
//       final path = await _service.synthesizeToFile(
//         text,
//         speakerId: widget.speakerId,
//       );
//       if (path == null || !mounted || _cancelRequested) {
//         if (mounted) setState(() => _state = _SpeakState.idle);
//         return;
//       }
//
//       await _setupAndPlay([AudioSource.file(path)]);
//     } catch (_) {
//       if (mounted) setState(() => _state = _SpeakState.idle);
//     }
//   }
//
//   // ─── Paragraph pipeline ──────────────────────────────────────────────────
//   //
//   // Fix for UI freeze:
//   //   sherpa_onnx is FFI — it CANNOT be moved to Isolate.run() safely.
//   //   The solution is to keep synthesis on the main isolate but use VERY
//   //   SHORT chunks via TtsSentenceSplitter so each blocking call is ≤200ms.
//   //   The pipeline still overlaps playback with synthesis so it's fast.
//   //
//   // Fix for pause/restart:
//   //   We never dispose the player on pause. We track three states:
//   //   loading → playing → paused → playing (resume, no re-synthesis).
//   //
//   Future<void> _speakParagraph() async {
//     if (mounted) setState(() => _state = _SpeakState.loading);
//     _cancelRequested = false;
//
//     final text = widget.text.trim().isEmpty ? 'No text detected.' : widget.text;
//     final sentences = TtsSentenceSplitter.split(
//       text,
//     ).where((s) => s.trim().isNotEmpty).toList();
//
//     if (sentences.isEmpty) {
//       if (mounted) setState(() => _state = _SpeakState.idle);
//       return;
//     }
//
//     _sourcesTotal = sentences.length;
//     _sourcesQueued = 0;
//
//     try {
//       // ── Synthesize sentence 0 synchronously before touching the player ──
//       // This is the only "loading" delay the user sees (~1–1.5s)
//       final firstPath = await _service.synthesizeToFile(
//         sentences[0],
//         speakerId: widget.speakerId,
//       );
//
//       if (firstPath == null || !mounted || _cancelRequested) {
//         if (mounted) setState(() => _state = _SpeakState.idle);
//         return;
//       }
//
//       _sourcesQueued = 1;
//
//       // ── Start player with sentence 0, begin playing immediately ─────────
//       await _setupAndPlay([AudioSource.file(firstPath)]);
//
//       // ── Synthesize remaining sentences while sentence 0 plays ────────────
//       // Each call blocks the event loop for ~100–300ms (one short sentence).
//       // Because sentences are short, this causes no perceptible jank.
//       // We yield with Future.microtask between sentences to keep UI responsive.
//       for (int i = 1; i < sentences.length; i++) {
//         if (_cancelRequested || !mounted) break;
//
//         // Yield to the event loop — lets Flutter render a frame between synths
//         await Future.delayed(Duration.zero);
//
//         if (_cancelRequested || !mounted) break;
//
//         final path = await _service.synthesizeToFile(
//           sentences[i],
//           speakerId: widget.speakerId,
//         );
//
//         if (path == null || _cancelRequested || !mounted) break;
//
//         // addAudioSource appends to the live playlist gaplessly
//         await _player?.addAudioSource(AudioSource.file(path));
//         _sourcesQueued++;
//       }
//     } catch (e) {
//       if (mounted) setState(() => _state = _SpeakState.idle);
//     }
//   }
//
//   // ─── Shared player setup ─────────────────────────────────────────────────
//
//   Future<void> _setupAndPlay(List<AudioSource> initial) async {
//     _player?.dispose();
//     _player = AudioPlayer();
//
//     // Watch for completion — fires when the whole playlist finishes
//     _playerStateSub = _player!.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         if (mounted) setState(() => _state = _SpeakState.idle);
//       }
//     });
//
//     await _player!.setAudioSources(
//       initial,
//       initialIndex: 0,
//       initialPosition: Duration.zero,
//     );
//
//     if (mounted) setState(() => _state = _SpeakState.playing);
//
//     // Play without awaiting — synthesis loop continues concurrently
//     _player!.play();
//   }
//
//   // ─── Download sheet ──────────────────────────────────────────────────────
//
//   void _showDownloadSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: TtsModelDownloader(
//           onModelReady: () {
//             Navigator.pop(context);
//             _onTap();
//           },
//         ),
//       ),
//     );
//   }
//
//   // ─── Build ───────────────────────────────────────────────────────────────
//
//   @override
//   Widget build(BuildContext context) {
//     final color = widget.color ?? Theme.of(context).colorScheme.primary;
//     final size = widget.iconSize!;
//
//     return IconButton(
//       onPressed: _onTap,
//       iconSize: size,
//       tooltip: switch (_state) {
//         _SpeakState.idle => 'Listen',
//         _SpeakState.loading => 'Cancel',
//         _SpeakState.playing => 'Pause',
//         _SpeakState.paused => 'Resume',
//       },
//       icon: switch (_state) {
//         _SpeakState.loading => SizedBox(
//           width: size - 4,
//           height: size - 4,
//           child: CircularProgressIndicator(strokeWidth: 2, color: color),
//         ),
//         _SpeakState.playing => Icon(
//           Icons.pause_circle_outline_rounded,
//           color: color,
//         ),
//         _SpeakState.paused => Icon(
//           Icons.play_circle_outline_rounded,
//           color: color,
//         ),
//         _SpeakState.idle => Icon(Icons.volume_up_rounded, color: color),
//       },
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../services/kokoro_tts_service.dart';
import '../services/tts_sentence_splitter.dart';
import 'tts_model_downloader.dart';

enum _SpeakState { idle, loading, playing, paused }

class SpeakButton extends StatefulWidget {
  final String text;
  final double? iconSize;
  final Color? color;
  final int speakerId;

  const SpeakButton({
    super.key,
    required this.text,
    this.iconSize = 28,
    this.color,
    this.speakerId = 0,
  });

  @override
  State<SpeakButton> createState() => _SpeakButtonState();
}

class _SpeakButtonState extends State<SpeakButton> {
  final _service = KokoroTtsService.instance;

  // ── Created once, reused forever — never disposed mid-session ───────────
  late final AudioPlayer _player;
  StreamSubscription<PlayerState>? _playerStateSub;

  _SpeakState _state = _SpeakState.idle;

  // Increment on every new play request.
  // Every async step checks its captured generation against this value.
  // If they differ, the request was superseded — bail out silently.
  int _generation = 0;

  bool get _isLongText =>
      TtsSentenceSplitter.split(widget.text).length > 1;

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // One permanent subscription — checks generation so stale events are ignored
    _playerStateSub = _player.playerStateStream.listen((ps) {
      if (!mounted) return;
      if (ps.processingState == ProcessingState.completed) {
        // Only reset if we're still in the same play session
        if (_state == _SpeakState.playing || _state == _SpeakState.paused) {
          setState(() => _state = _SpeakState.idle);
        }
      }
    });
  }

  @override
  void dispose() {
    _generation++; // invalidate any running async loops
    _playerStateSub?.cancel();
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  // ── Tap handler ───────────────────────────────────────────────────────────

  Future<void> _onTap() async {
    switch (_state) {
      case _SpeakState.idle:
        await _startSpeaking();
      case _SpeakState.loading:
        _cancelCurrent(); // abort synthesis, go back to idle immediately
      case _SpeakState.playing:
        await _pause();
      case _SpeakState.paused:
        await _resume();
    }
  }

  // ── Cancel without touching the player ───────────────────────────────────

  void _cancelCurrent() {
    _generation++;
    _player.stop(); // stop any audio that already started
    if (mounted) setState(() => _state = _SpeakState.idle);
  }

  // ── Pause / Resume ────────────────────────────────────────────────────────

  Future<void> _pause() async {
    await _player.pause();
    if (mounted) setState(() => _state = _SpeakState.paused);
  }

  Future<void> _resume() async {
    await _player.play();
    if (mounted) setState(() => _state = _SpeakState.playing);
  }

  // ── Start ─────────────────────────────────────────────────────────────────

  Future<void> _startSpeaking() async {
    final downloaded = await _service.isModelDownloaded();
    if (!downloaded) {
      if (mounted) _showDownloadSheet();
      return;
    }
    if (_isLongText) {
      await _speakParagraph();
    } else {
      await _speakSingle();
    }
  }

  // ── Single sentence ───────────────────────────────────────────────────────

  Future<void> _speakSingle() async {
    // Capture generation before the first await
    final gen = ++_generation;
    if (mounted) setState(() => _state = _SpeakState.loading);

    try {
      final text = widget.text.trim().isEmpty ? 'No text detected.' : widget.text;
      final path = await _service.synthesizeToFile(
        text,
        speakerId: widget.speakerId,
      );

      // Stale check — user may have tapped again while we were synthesising
      if (!mounted || _generation != gen || path == null) return;

      await _player.stop(); // ensure player is clean before loading
      await _player.setAudioSources([AudioSource.file(path)]);

      if (!mounted || _generation != gen) return;

      setState(() => _state = _SpeakState.playing);
      _player.play(); // fire-and-forget; completion handled by stream above
    } catch (_) {
      if (mounted && _generation == gen) {
        setState(() => _state = _SpeakState.idle);
      }
    }
  }

  // ── Paragraph pipeline ────────────────────────────────────────────────────

  Future<void> _speakParagraph() async {
    final gen = ++_generation;
    if (mounted) setState(() => _state = _SpeakState.loading);

    final text = widget.text.trim().isEmpty ? 'No text detected.' : widget.text;
    final sentences = TtsSentenceSplitter.split(text)
        .where((s) => s.trim().isNotEmpty)
        .toList();

    if (sentences.isEmpty) {
      if (mounted) setState(() => _state = _SpeakState.idle);
      return;
    }

    try {
      // ── Sentence 0: synthesise first, then hand to player ─────────────
      final firstPath = await _service.synthesizeToFile(
        sentences[0],
        speakerId: widget.speakerId,
      );

      if (!mounted || _generation != gen || firstPath == null) return;

      await _player.stop();
      await _player.setAudioSources([AudioSource.file(firstPath)]);

      if (!mounted || _generation != gen) return;

      setState(() => _state = _SpeakState.playing);
      _player.play(); // starts immediately — user hears audio now

      // ── Sentences 1…n: synthesise while previous sentence plays ───────
      for (int i = 1; i < sentences.length; i++) {
        // Yield to the event loop — lets Flutter render a frame
        await Future.delayed(Duration.zero);

        // Stale check after every yield point
        if (!mounted || _generation != gen) return;

        final path = await _service.synthesizeToFile(
          sentences[i],
          speakerId: widget.speakerId,
        );

        if (!mounted || _generation != gen || path == null) return;

        await _player.addAudioSource(AudioSource.file(path));
      }
    } catch (_) {
      if (mounted && _generation == gen) {
        setState(() => _state = _SpeakState.idle);
      }
    }
  }

  // ── Download sheet ────────────────────────────────────────────────────────

  void _showDownloadSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TtsModelDownloader(
          onModelReady: () {
            Navigator.pop(context);
            _onTap();
          },
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;
    final size = widget.iconSize!;

    return IconButton(
      onPressed: _onTap,
      iconSize: size,
      tooltip: switch (_state) {
        _SpeakState.idle    => 'Listen',
        _SpeakState.loading => 'Cancel',
        _SpeakState.playing => 'Pause',
        _SpeakState.paused  => 'Resume',
      },
      icon: switch (_state) {
        _SpeakState.loading => SizedBox(
          width: size - 4,
          height: size - 4,
          child: CircularProgressIndicator(strokeWidth: 2, color: color),
        ),
        _SpeakState.playing => Icon(Icons.pause_circle_outline_rounded, color: color),
        _SpeakState.paused  => Icon(Icons.play_circle_outline_rounded, color: color),
        _SpeakState.idle    => Icon(Icons.volume_up_rounded, color: color),
      },
    );
  }
}

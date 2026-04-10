import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../services/kokoro_tts_service.dart';
import '../widgets/tts_model_downloader.dart';

class SpeakButton extends StatefulWidget {
  final String text;
  final double? iconSize;
  final Color? color;

  /// speakerId: 0=female(af_sky), 10=male(am_adam)
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
  final _player = AudioPlayer();
  final _service = KokoroTtsService.instance;
  bool _isSpeaking = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _onTap() async {
    if (_isSpeaking) {
      await _player.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }

    // Check if model is downloaded
    final downloaded = await _service.isModelDownloaded();
    if (!downloaded) {
      if (mounted) _showDownloadSheet();
      return;
    }

    setState(() => _isLoading = true);

    try {
      final text = widget.text.trim() == "".trim() ? "No Text Detected!" : widget.text;
      final path = await _service.synthesizeToFile(
        text,
        speakerId: widget.speakerId,
      );
      if (path == null) return;

      if (mounted) setState(() { _isLoading = false; _isSpeaking = true; });

      await _player.play(DeviceFileSource(path));
      _player.onPlayerComplete.listen((_) {
        if (mounted) setState(() => _isSpeaking = false);
      });
    } catch (e) {
      if (mounted) setState(() { _isLoading = false; _isSpeaking = false; });
    }
  }

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
            _onTap(); // Auto-speak after download
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onTap,
      iconSize: widget.iconSize,
      icon: _isLoading
          ? SizedBox(
        width: widget.iconSize! - 4,
        height: widget.iconSize! - 4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: widget.color ?? Theme.of(context).colorScheme.primary,
        ),
      )
          : Icon(
        _isSpeaking
            ? Icons.stop_circle_outlined
            : Icons.volume_up_rounded,
        color: widget.color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
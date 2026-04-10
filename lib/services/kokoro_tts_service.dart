import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sherpa_onnx/sherpa_onnx.dart' as sherpa;

import 'dart:async';
import 'dart:isolate';
import 'tts_isolate_worker.dart';
import 'tts_sentence_splitter.dart';

// ─── Model Info ───────────────────────────────────────────────────────────────
// Single .tar.bz2 archive — this is the VERIFIED working URL from official docs:
// https://k2-fsa.github.io/sherpa/onnx/tts/pretrained_models/kokoro.html
const _kModelArchiveUrl =
    'https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/kokoro-en-v0_19.tar.bz2';

// The folder name that tar creates after extraction
const _kModelFolder = 'kokoro-en-v0_19';

// Approximate total download size in MB
const kModelTotalSizeMb = 336; // uncompressed ~336MB, tar.bz2 ~170MB download

enum TtsModelStatus { notDownloaded, downloading, extracting, ready, error }

class KokoroTtsService {
  KokoroTtsService._();
  static final KokoroTtsService instance = KokoroTtsService._();

  sherpa.OfflineTts? _tts;
  bool _initialized = false;
  bool get isInitialized => _initialized;

  TtsModelStatus _status = TtsModelStatus.notDownloaded;
  TtsModelStatus get status => _status;

  double _downloadProgress = 0.0;
  double get downloadProgress => _downloadProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // ─── Directory Helpers ────────────────────────────────────────────────────

  /// Root directory where model archives & folders are stored
  Future<Directory> get _modelsRootDir async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(appDir.path, 'tts_models'));
    if (!dir.existsSync()) await dir.create(recursive: true);
    return dir;
  }

  /// The extracted model folder path
  Future<String> get _modelDirPath async {
    final root = await _modelsRootDir;
    return p.join(root.path, _kModelFolder);
  }

  /// Pipelined sentence-by-sentence TTS [streaming]
  Isolate? _synthIsolate;
  SendPort? _isolateSendPort;
  bool _isolateReady = false;


  // ─── Status Check ────────────────────────────────────────────────────────

  /// Returns true only when model.onnx exists and is > 300MB (full model)
  Future<bool> isModelDownloaded() async {
    final dirPath = await _modelDirPath;
    final modelFile = File(p.join(dirPath, 'model.onnx'));
    // model.onnx for kokoro-en-v0_19 is ~330MB
    return modelFile.existsSync() && modelFile.lengthSync() > 300 * 1024 * 1024;
  }

  // ─── Download & Extract ───────────────────────────────────────────────────

  /// Downloads the single tar.bz2 and extracts it.
  /// [onProgress] 0.0–1.0 covering download phase (extraction has no progress).
  Future<void> downloadModel({
    required void Function(double progress) onProgress,
    void Function(String error)? onError,
  }) async {
    _status = TtsModelStatus.downloading;
    _downloadProgress = 0.0;
    _errorMessage = null;

    try {
      final root = await _modelsRootDir;
      final archivePath = p.join(root.path, 'kokoro-en-v0_19.tar.bz2');
      final archiveFile = File(archivePath);

      // ── Download ──────────────────────────────────────────────────────────
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 15),
        followRedirects: true,       // ✅ Required — GitHub redirects to CDN
        maxRedirects: 10,            // ✅ Allow multiple redirects
        validateStatus: (status) => status != null && status < 400,
      ));

      await dio.download(
        _kModelArchiveUrl,
        archivePath,
        deleteOnError: true,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            _downloadProgress = received / total;
            onProgress(_downloadProgress * 0.9); // Reserve 10% for extraction
          }
        },
      );

      if (!archiveFile.existsSync() || archiveFile.lengthSync() < 1024 * 1024) {
        throw Exception('Downloaded archive is invalid or empty.');
      }

      // ── Extract ───────────────────────────────────────────────────────────
      _status = TtsModelStatus.extracting;
      onProgress(0.92);

      await _extractArchive(archiveFile, root);
      onProgress(1.0);

      // Verify extraction succeeded
      final modelOk = await isModelDownloaded();
      if (!modelOk) {
        throw Exception('Extraction failed — model.onnx not found or too small.');
      }

      _status = TtsModelStatus.ready;
      _downloadProgress = 1.0;
    } catch (e) {
      _status = TtsModelStatus.error;
      _errorMessage = _friendlyError(e.toString());
      onError?.call(_errorMessage!);
    }
  }

  /// Extracts .tar.bz2 using the system `tar` command.
  /// On Android, `tar` is available since API 21+ in /system/bin/tar.
  Future<void> _extractArchive(File archive, Directory destDir) async {
    // Try system tar first (available on Android 5+, iOS, macOS, Linux)
    try {
      final result = await Process.run(
        'tar',
        ['-xjf', archive.path, '-C', destDir.path],
        runInShell: false,
      );
      if (result.exitCode == 0) {
        await archive.delete();
        return;
      }
      // If tar failed with error, throw to fall back
      throw Exception('tar exit code ${result.exitCode}: ${result.stderr}');
    } catch (_) {
      // Fall back: try without -j flag (some Android `tar` variants)
      // and decompress separately
      await _extractFallback(archive, destDir);
    }
  }

  /// Fallback extraction using `bunzip2` + `tar` for Android devices
  /// where the built-in tar doesn't support -j (bzip2) directly.
  Future<void> _extractFallback(File archive, Directory destDir) async {
    final root = await _modelsRootDir;
    final tarPath = p.join(root.path, 'kokoro-en-v0_19.tar');

    // Step 1: decompress bzip2 -> .tar
    final bz2Result = await Process.run(
      'bunzip2',
      ['-f', '-k', archive.path], // -k = keep original
    );
    // bunzip2 creates file without .bz2 extension in same dir
    final decompressedTar = File(
      archive.path.replaceAll('.bz2', ''),
    );

    if (bz2Result.exitCode != 0 || !decompressedTar.existsSync()) {
      // Last resort: try xz/gzip style with shell
      final shellResult = await Process.run(
        '/bin/sh',
        ['-c', 'cd "${destDir.path}" && tar xjf "${archive.path}"'],
      );
      if (shellResult.exitCode != 0) {
        throw Exception('All extraction methods failed. '
            'bunzip2: ${bz2Result.stderr}, shell tar: ${shellResult.stderr}');
      }
      await archive.delete();
      return;
    }

    // Step 2: extract .tar
    final tarResult = await Process.run(
      'tar',
      ['-xf', decompressedTar.path, '-C', destDir.path],
    );
    if (tarResult.exitCode == 0) {
      await archive.delete();
      await decompressedTar.delete();
    } else {
      throw Exception('tar extraction failed: ${tarResult.stderr}');
    }
  }

  String _friendlyError(String raw) {
    if (raw.contains('SocketException') || raw.contains('Connection')) {
      return 'No internet connection. Please check your network and try again.';
    }
    if (raw.contains('TimeoutException') || raw.contains('timeout')) {
      return 'Download timed out. Please try again on a faster connection.';
    }
    if (raw.contains('404') || raw.contains('Not Found')) {
      return 'Model file not found on server. Please report this issue.';
    }
    if (raw.contains('invalid') || raw.contains('empty')) {
      return 'Download was incomplete. Please try again.';
    }
    return 'Download failed: $raw';
  }

  // ─── Initialize ───────────────────────────────────────────────────────────

  Future<void> initialize() async {
    if (_initialized) return;

    if (!await isModelDownloaded()) {
      _status = TtsModelStatus.notDownloaded;
      return;
    }

    try {
      final dirPath = await _modelDirPath;

      final kokoroConfig = sherpa.OfflineTtsKokoroModelConfig(
        model: p.join(dirPath, 'model.onnx'),
        voices: p.join(dirPath, 'voices.bin'),
        tokens: p.join(dirPath, 'tokens.txt'),
        dataDir: p.join(dirPath, 'espeak-ng-data'),
        lengthScale: 1.0,
      );

      final modelConfig = sherpa.OfflineTtsModelConfig(
        kokoro: kokoroConfig,
        numThreads: 4,
        // numThreads: 2,
        debug: false,
        provider: 'cpu',
      );

      final ttsConfig = sherpa.OfflineTtsConfig(
        model: modelConfig,
        maxNumSenetences: 1,
        // maxNumSenetences: 2,
      );

      _tts = sherpa.OfflineTts(ttsConfig);
      _initialized = true;
      _status = TtsModelStatus.ready;
    } catch (e) {
      _status = TtsModelStatus.error;
      _errorMessage = 'Failed to load TTS model: $e';
    }
  }

  // ─── Synthesize ───────────────────────────────────────────────────────────

  /// Returns raw GeneratedAudio (has .samples Float32List and .sampleRate int)
  Future<sherpa.GeneratedAudio?> synthesize(
      String text, {
        int speakerId = 0,   // 0=af_sky (female), 10=af_sky, 11=am_adam (male)
        double speed = 1.0,
      }) async {
    if (!_initialized) await initialize();
    if (_tts == null) return null;
    if (text.trim().isEmpty) return null;

    return _tts!.generate(
      text: text.trim(),
      sid: speakerId,
      speed: speed,
    );
  }

  /// Synthesizes to a WAV file and returns the file path.
  /// Uses sherpa.writeWave() — the CORRECT official Dart API.
  ///
  /// ✅ FIX: audio.save() does NOT exist. Use sherpa.writeWave() instead.
  Future<String?> synthesizeToFile(
      String text, {
        int speakerId = 0,
        double speed = 1.0,
      }) async {
    final audio = await synthesize(text, speakerId: speakerId, speed: speed);
    if (audio == null) return null;

    final tempDir = await getTemporaryDirectory();
    final outPath = p.join(
      tempDir.path,
      'tts_${DateTime.now().millisecondsSinceEpoch}.wav',
    );

    // ✅ CORRECT API — top-level writeWave function from sherpa_onnx package
    final success = sherpa.writeWave(
      filename: outPath,
      samples: audio.samples,      // Float32List
      sampleRate: audio.sampleRate, // int (24000 for Kokoro)
    );

    return success ? outPath : null;
  }


  /// Starts the background synthesis isolate (call once after initialize())
  Future<void> startIsolate() async {
    if (_isolateReady) return;

    final receivePort = ReceivePort();
    _synthIsolate = await Isolate.spawn(
      ttsIsolateEntryPoint,
      receivePort.sendPort,
    );

    // First message from isolate is its SendPort
    _isolateSendPort = await receivePort.first as SendPort;
    _isolateReady = true;
  }

  void stopIsolate() {
    _isolateSendPort?.send('dispose');
    _synthIsolate?.kill(priority: Isolate.immediate);
    _synthIsolate = null;
    _isolateSendPort = null;
    _isolateReady = false;
  }

  /// Returns a Stream of WAV file paths, one per sentence.
  /// Call `just_audio` ConcatenatingAudioSource to play them as they arrive.
  ///
  /// Usage pattern:
  ///   final stream = service.synthesizeParagraph(text);
  ///   stream.listen((path) => player.add(AudioSource.file(path)));
  Stream<TtsSynthResult> synthesizeParagraph(
      String text, {
        int speakerId = 0,
        double speed = 1.0,
      }) async* {
    if (!_initialized) await initialize();
    final dirPath = await _modelDirPath;
    final sentences = TtsSentenceSplitter.split(text);

    for (final sentence in sentences) {
      if (sentence.trim().isEmpty) continue;

      // Each sentence gets its own reply port
      final replyPort = ReceivePort();

      if (_isolateReady && _isolateSendPort != null) {
        // Fast path: use pre-warmed isolate
        _isolateSendPort!.send(TtsSynthRequest(
          text: sentence,
          speakerId: speakerId,
          speed: speed,
          modelDir: dirPath,
          replyPort: replyPort.sendPort,
        ));
        final result = await replyPort.first as TtsSynthResult;
        replyPort.close();
        yield result;
      } else {
        // Fallback: synthesize inline (no isolate)
        final path = await synthesizeToFile(sentence,
            speakerId: speakerId, speed: speed);
        replyPort.close();
        yield TtsSynthResult(
          wavPath: path,
          originalText: sentence,
        );
      }
    }
  }

  // ─── Cleanup ──────────────────────────────────────────────────────────────

  void dispose() {
    _tts?.free();
    _tts = null;
    _initialized = false;
  }

  Future<void> deleteModel() async {
    final dirPath = await _modelDirPath;
    final dir = Directory(dirPath);
    if (dir.existsSync()) await dir.delete(recursive: true);

    // Also delete any leftover archive
    final root = await _modelsRootDir;
    final archive = File(p.join(root.path, 'kokoro-en-v0_19.tar.bz2'));
    if (archive.existsSync()) await archive.delete();

    _tts?.free();
    _tts = null;
    _initialized = false;
    _status = TtsModelStatus.notDownloaded;
    _downloadProgress = 0.0;
  }
}
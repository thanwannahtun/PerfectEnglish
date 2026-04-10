// runs synthesis in a background Isolate so the UI never freezes.
import 'dart:isolate';
import 'dart:typed_data';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sherpa_onnx/sherpa_onnx.dart' as sherpa;

/// Message sent TO the isolate
class TtsSynthRequest {
  final String text;
  final int speakerId;
  final double speed;
  final String modelDir; // passed so isolate can init its own TTS instance
  final SendPort replyPort;
  const TtsSynthRequest({
    required this.text,
    required this.speakerId,
    required this.speed,
    required this.modelDir,
    required this.replyPort,
  });
}

/// Message sent FROM the isolate back to main
class TtsSynthResult {
  final String? wavPath; // null = error
  final String? error;
  final String originalText;
  const TtsSynthResult({this.wavPath, this.error, required this.originalText});
}

/// Entry point for the synthesis isolate.
/// Each isolate gets its own sherpa_onnx TTS instance.
Future<void> ttsIsolateEntryPoint(SendPort mainSendPort) async {
  final receivePort = ReceivePort();
  // Tell main we're ready and send our port
  mainSendPort.send(receivePort.sendPort);

  sherpa.OfflineTts? tts;
  String? lastModelDir;

  await for (final message in receivePort) {
    if (message is TtsSynthRequest) {
      try {
        sherpa.initBindings();

        // Initialize TTS only once per isolate (or if model changed)
        if (tts == null || lastModelDir != message.modelDir) {
          tts?.free();
          final dir = message.modelDir;
          final kokoroConfig = sherpa.OfflineTtsKokoroModelConfig(
            model: p.join(dir, 'model.onnx'),
            voices: p.join(dir, 'voices.bin'),
            tokens: p.join(dir, 'tokens.txt'),
            dataDir: p.join(dir, 'espeak-ng-data'),
            lengthScale: 1.0,
          );
          tts = sherpa.OfflineTts(
            sherpa.OfflineTtsConfig(
              model: sherpa.OfflineTtsModelConfig(
                kokoro: kokoroConfig,
                numThreads: 4, // 4 threads inside isolate
                debug: false,
                provider: 'cpu',
              ),
              maxNumSenetences: 1,
            ),
          );
          lastModelDir = dir;
        }

        // Synthesize
        final audio = tts!.generate(
          text: message.text,
          sid: message.speakerId,
          speed: message.speed,
        );

        // Write WAV to temp file
        final tempDir = await getTemporaryDirectory();
        final outPath = p.join(
          tempDir.path,
          'tts_${DateTime.now().microsecondsSinceEpoch}.wav',
        );
        final ok = sherpa.writeWave(
          filename: outPath,
          samples: audio.samples,
          sampleRate: audio.sampleRate,
        );

        message.replyPort.send(TtsSynthResult(
          wavPath: ok ? outPath : null,
          error: ok ? null : 'writeWave failed',
          originalText: message.text,
        ));
      } catch (e) {
        message.replyPort.send(TtsSynthResult(
          wavPath: null,
          error: e.toString(),
          originalText: message.text,
        ));
      }
    } else if (message == 'dispose') {
      tts?.free();
      receivePort.close();
      break;
    }
  }
}
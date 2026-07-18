// import 'package:flutter/material.dart';
// import '../services/kokoro_tts_service.dart';
//
// class TtsModelDownloader extends StatefulWidget {
//   final VoidCallback onModelReady;
//   const TtsModelDownloader({super.key, required this.onModelReady});
//
//   @override
//   State<TtsModelDownloader> createState() => _TtsModelDownloaderState();
// }
//
// class _TtsModelDownloaderState extends State<TtsModelDownloader> {
//   final _service = KokoroTtsService.instance;
//   double _progress = 0.0;
//   bool _isDownloading = false;
//   String? _error;
//   TtsModelStatus _phase = TtsModelStatus.notDownloaded;
//
//   Future<void> _startDownload() async {
//     setState(() {
//       _isDownloading = true;
//       _error = null;
//       _progress = 0.0;
//       _phase = TtsModelStatus.downloading;
//     });
//
//     await _service.downloadModel(
//       onProgress: (prog) {
//         if (mounted) {
//           setState(() {
//             _progress = prog;
//             _phase = _service.status;
//           });
//         }
//       },
//       onError: (e) {
//         if (mounted) {
//           setState(() {
//             _error = e;
//             _isDownloading = false;
//             _phase = TtsModelStatus.error;
//           });
//         }
//       },
//     );
//
//     if (_service.status == TtsModelStatus.ready) {
//       await _service.initialize();
//       if (mounted) widget.onModelReady();
//     } else if (mounted) {
//       setState(() => _isDownloading = false);
//     }
//   }
//
//   String get _statusLabel {
//     switch (_phase) {
//       case TtsModelStatus.downloading:
//         return 'Downloading... ${(_progress * 100).toStringAsFixed(0)}%';
//       case TtsModelStatus.extracting:
//         return 'Extracting model files...';
//       case TtsModelStatus.ready:
//         return 'Done!';
//       default:
//         return '';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surfaceVariant,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.record_voice_over_rounded,
//               size: 48, color: theme.colorScheme.primary),
//           const SizedBox(height: 12),
//           Text('AI Voice Engine (Kokoro)',
//               style: theme.textTheme.titleMedium
//                   ?.copyWith(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 6),
//           Text(
//             'Download the offline AI voice once (~170MB compressed).\n'
//                 'After download, works fully offline forever.',
//             textAlign: TextAlign.center,
//             style: theme.textTheme.bodySmall
//                 ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
//           ),
//           const SizedBox(height: 16),
//           if (_isDownloading) ...[
//             LinearProgressIndicator(
//               value: _phase == TtsModelStatus.extracting ? null : _progress,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             const SizedBox(height: 8),
//             Text(_statusLabel, style: theme.textTheme.bodySmall),
//           ] else ...[
//             if (_error != null) ...[
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.errorContainer,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   _error!,
//                   style: TextStyle(
//                       color: theme.colorScheme.onErrorContainer, fontSize: 12),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(height: 10),
//             ],
//             ElevatedButton.icon(
//               onPressed: _startDownload,
//               icon: const Icon(Icons.download_rounded),
//               label: Text(_error != null ? 'Retry Download' : 'Download AI Voice'),
//               style: ElevatedButton.styleFrom(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../services/kokoro_tts_service.dart';
import '../services/tts_download_notification_service.dart';

class TtsModelDownloader extends StatefulWidget {
  final VoidCallback onModelReady;

  const TtsModelDownloader({super.key, required this.onModelReady});

  @override
  State<TtsModelDownloader> createState() => _TtsModelDownloaderState();
}

class _TtsModelDownloaderState extends State<TtsModelDownloader> {
  final _service = KokoroTtsService.instance;
  final _notif = TtsDownloadNotificationService.instance;

  Future<void> _startDownload() async {
    await _notif.requestPermission();

    await _notif.showProgress(
      progress: 0,
      title: 'Downloading AI Voice',
      body: 'Starting download…',
    );

    // Call service download, relying on ListenableBuilder for UI updates
    await _service.downloadModel(
      onProgress: (prog) {
        final phase = _service.status;
        if (phase == TtsModelStatus.extracting) {
          _notif.showProgress(
            progress: null,
            title: 'Installing AI Voice',
            body: 'Extracting model files…',
          );
        } else {
          final pct = (prog * 100).toInt();
          _notif.showProgress(
            progress: prog,
            title: 'Downloading AI Voice',
            body: '$pct% • ${(prog * 170).toStringAsFixed(0)} / 170 MB',
          );
        }
      },
      onError: (e) {
        _notif.showError(e);
      },
    );

    if (_service.status == TtsModelStatus.ready) {
      await _service.initialize();
      await _notif.showComplete();
      widget.onModelReady();
    }
  }

  String _getStatusLabel(TtsModelStatus phase, double progress) {
    switch (phase) {
      case TtsModelStatus.downloading:
        return 'Downloading… ${(progress * 100).toStringAsFixed(0)}%';
      case TtsModelStatus.extracting:
        return 'Extracting model files…';
      case TtsModelStatus.ready:
        return 'Done!';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListenableBuilder(
      listenable: _service,
      builder: (context, child) {
        final phase = _service.status;
        final progress = _service.downloadProgress;
        final error = _service.errorMessage;
        final isDownloading = phase == TtsModelStatus.downloading || phase == TtsModelStatus.extracting;

        return Container(
          margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline.withAlpha(50)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.record_voice_over_rounded,
            size: 48,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            'AI Voice Engine (Kokoro)',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Download the offline AI voice once (~170 MB).\n'
            'Runs fully offline after download.\n'
            'You can close this sheet — download continues in background.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          if (isDownloading) ...[
            LinearProgressIndicator(
              value: phase == TtsModelStatus.extracting ? null : progress,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text(_getStatusLabel(phase, progress), style: theme.textTheme.bodySmall),
            const SizedBox(height: 8),
            // Let user close sheet manually too
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Continue browsing'),
            ),
          ] else ...[
            if (error != null) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  error,
                  style: TextStyle(
                    color: theme.colorScheme.onErrorContainer,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
            ],
            ElevatedButton.icon(
              onPressed: _startDownload,
              icon: const Icon(Icons.download_rounded),
              label: Text(
                error != null ? 'Retry Download' : 'Download AI Voice',
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ],
      ),
    );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../services/kokoro_tts_service.dart';

class TtsModelDownloader extends StatefulWidget {
  final VoidCallback onModelReady;
  const TtsModelDownloader({super.key, required this.onModelReady});

  @override
  State<TtsModelDownloader> createState() => _TtsModelDownloaderState();
}

class _TtsModelDownloaderState extends State<TtsModelDownloader> {
  final _service = KokoroTtsService.instance;
  double _progress = 0.0;
  bool _isDownloading = false;
  String? _error;
  TtsModelStatus _phase = TtsModelStatus.notDownloaded;

  Future<void> _startDownload() async {
    setState(() {
      _isDownloading = true;
      _error = null;
      _progress = 0.0;
      _phase = TtsModelStatus.downloading;
    });

    await _service.downloadModel(
      onProgress: (prog) {
        if (mounted) {
          setState(() {
            _progress = prog;
            _phase = _service.status;
          });
        }
      },
      onError: (e) {
        if (mounted) {
          setState(() {
            _error = e;
            _isDownloading = false;
            _phase = TtsModelStatus.error;
          });
        }
      },
    );

    if (_service.status == TtsModelStatus.ready) {
      await _service.initialize();
      if (mounted) widget.onModelReady();
    } else if (mounted) {
      setState(() => _isDownloading = false);
    }
  }

  String get _statusLabel {
    switch (_phase) {
      case TtsModelStatus.downloading:
        return 'Downloading... ${(_progress * 100).toStringAsFixed(0)}%';
      case TtsModelStatus.extracting:
        return 'Extracting model files...';
      case TtsModelStatus.ready:
        return 'Done!';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.record_voice_over_rounded,
              size: 48, color: theme.colorScheme.primary),
          const SizedBox(height: 12),
          Text('AI Voice Engine (Kokoro)',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(
            'Download the offline AI voice once (~170MB compressed).\n'
                'After download, works fully offline forever.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          if (_isDownloading) ...[
            LinearProgressIndicator(
              value: _phase == TtsModelStatus.extracting ? null : _progress,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 8),
            Text(_statusLabel, style: theme.textTheme.bodySmall),
          ] else ...[
            if (_error != null) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _error!,
                  style: TextStyle(
                      color: theme.colorScheme.onErrorContainer, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
            ],
            ElevatedButton.icon(
              onPressed: _startDownload,
              icon: const Icon(Icons.download_rounded),
              label: Text(_error != null ? 'Retry Download' : 'Download AI Voice'),
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
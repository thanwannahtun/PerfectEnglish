import 'package:flutter/material.dart';
import '../services/kokoro_tts_service.dart';
import '../widgets/tts_model_downloader.dart';

class TtsSettingsPage extends StatefulWidget {
  const TtsSettingsPage({super.key});

  @override
  State<TtsSettingsPage> createState() => _TtsSettingsPageState();
}

class _TtsSettingsPageState extends State<TtsSettingsPage> {
  final _service = KokoroTtsService.instance;
  bool _isModelReady = false;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    final ready = await _service.isModelDownloaded();
    if (ready && !_service.isInitialized) await _service.initialize();
    if (mounted) setState(() { _isModelReady = ready; _checking = false; });
  }

  Future<void> _deleteModel() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete AI Voice?'),
        content: const Text(
          'This will remove the downloaded model (~85MB). '
              'You can re-download it anytime.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _service.deleteModel();
      if (mounted) setState(() => _isModelReady = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListenableBuilder(
          listenable: _service,
          builder: (context, _) {
            if (_checking) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_service.status == TtsModelStatus.ready || _isModelReady) {
              return _buildReadyView();
            }
            return TtsModelDownloader(
              onModelReady: () {
                if (mounted) setState(() => _isModelReady = true);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildReadyView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.1),
            child: const Icon(Icons.check_circle, color: Colors.green),
          ),
          title: const Text('Kokoro AI Voice'),
          subtitle: const Text('Ready · Offline · ~85MB'),
        ),
        const Divider(),
        const SizedBox(height: 8),
        Text(
          'The Kokoro-82M model is a high-quality, fully offline English TTS '
              'engine. Once downloaded, it works without any internet connection.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: _deleteModel,
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          label: const Text('Delete Model', style: TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
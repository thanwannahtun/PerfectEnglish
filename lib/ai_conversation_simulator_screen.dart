import 'package:flutter/material.dart';
import 'package:perfect_english/services/ai_api_service.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/widgets/formatted_markdown_text.dart';

class AiConversationSimulatorScreen extends StatefulWidget {
  const AiConversationSimulatorScreen({super.key});

  @override
  State<AiConversationSimulatorScreen> createState() =>
      _AiConversationSimulatorScreenState();
}

class _AiConversationSimulatorScreenState
    extends State<AiConversationSimulatorScreen> {
  List<Map<String, dynamic>> _scenarios = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadScenarios();
  }

  Future<void> _loadScenarios() async {
    setState(() => _isLoading = true);
    final list = await AiApiService.instance.getConversationScenarios();
    if (!mounted) return;
    setState(() {
      _scenarios = list;
      _isLoading = false;
    });
  }

  void _startCustomConversation() async {
    if (!AuthService.instance.isLoggedIn) {
      final authOk = await AuthDialog.show(context);
      if (!authOk || !AuthService.instance.isLoggedIn) return;
    }

    final customController = TextEditingController();
    String selectedLevel = 'intermediate';

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: Colors.green),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Custom Situation (စိတ်ကြိုက် အခြေအနေ)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter any topic or roleplay scenario you want to practice:',
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: customController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hintText:
                            'e.g. Negotiating rent with landlord, ordering traditional tea...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Select Level (အဆင့် ရွေးချယ်ပါ):',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: selectedLevel,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'beginner',
                          child: FittedBox(
                            fit: BoxFit.scaleDown,

                            child: Text('(အခြေခံ)'),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'intermediate',
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('(အလယ်အလတ်)'),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'advanced',
                          child: FittedBox(
                            fit: BoxFit.scaleDown,

                            child: Text('(အဆင့်မြင့်)'),
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null)
                          setDialogState(() => selectedLevel = val);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final text = customController.text.trim();
                    if (text.isNotEmpty) {
                      Navigator.pop(context, {
                        'topic': text,
                        'level': selectedLevel,
                      });
                    }
                  },
                  child: const Text('Start Roleplay'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConversationSimulator(
            scenarioSlug: 'custom',
            title: result['topic']!,
            customTopic: result['topic'],
            level: result['level'],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Conversation Simulator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadScenarios,
            tooltip: 'Refresh Scenarios',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startCustomConversation,
        icon: const Icon(Icons.add_comment_rounded),
        label: const Text("Custom Situation (စိတ်ကြိုက်)"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: theme.colorScheme.primaryContainer.withValues(
                      alpha: 0.4,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.record_voice_over_rounded,
                            size: 36,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Real-Time Roleplay Practice",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "လက်တွေ့ဘဝ စကားပြောအခြေအနေများကို AI နှင့် လေ့ကျင့်ပါ",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Choose a situation (အခြေအနေ ရွေးချယ်ပါ):",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _scenarios.length,
                      itemBuilder: (context, index) {
                        final s = _scenarios[index];
                        final iconStr = s['icon'] as String? ?? '💬';
                        final titleEn = s['titleEnglish'] as String? ?? '';
                        final titleMm = s['titleBurmese'] as String? ?? '';
                        final slug = s['slug'] as String? ?? '';

                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: theme.colorScheme.outlineVariant,
                            ),
                          ),
                          child: ListTile(
                            leading: Text(
                              iconStr,
                              style: const TextStyle(fontSize: 28),
                            ),
                            title: Text(
                              titleEn,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: titleMm.isNotEmpty
                                ? Text("🇲🇲 $titleMm")
                                : null,
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () async {
                              if (!AuthService.instance.isLoggedIn) {
                                final authOk = await AuthDialog.show(context);
                                if (!authOk || !AuthService.instance.isLoggedIn)
                                  return;
                              }
                              if (!context.mounted) return;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ConversationSimulator(
                                    scenarioSlug: slug,
                                    title: titleEn,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ─── ROLEPLAY SESSION SCREEN ──────────────────────────────────────────────────
class ConversationSimulator extends StatefulWidget {
  const ConversationSimulator({
    super.key,
    required this.scenarioSlug,
    required this.title,
    this.customTopic,
    this.level,
  });

  final String scenarioSlug;
  final String title;
  final String? customTopic;
  final String? level;

  @override
  State<ConversationSimulator> createState() => _ConversationSimulatorState();
}

class _ConversationSimulatorState extends State<ConversationSimulator> {
  final List<Map<String, String>> _turns = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? _sessionId;
  bool _isInitializing = true;
  bool _isSending = false;
  bool _isEnded = false;
  Map<String, dynamic>? _summary;

  @override
  void initState() {
    super.initState();
    _startSession();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _startSession() async {
    setState(() => _isInitializing = true);
    try {
      final res = await AiApiService.instance.startConversation(
        scenario: widget.scenarioSlug,
        customTopic: widget.customTopic,
        level: widget.level ?? 'intermediate',
      );

      if (!mounted) return;
      setState(() {
        _sessionId = res['sessionId'] as String?;
        final opening = res['aiMessage'] as String? ?? 'Hello!';
        _turns.add({'role': 'model', 'content': opening});
        _isInitializing = false;
      });
    } on AuthRequiredException {
      if (!mounted) return;
      Navigator.pop(context);
      await AuthDialog.show(context);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isInitializing = false);
    }
  }

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _isSending || _sessionId == null || _isEnded) return;

    _textController.clear();
    setState(() {
      _turns.add({'role': 'user', 'content': text});
      _isSending = true;
    });

    _scrollToBottom();

    try {
      final res = await AiApiService.instance.respondConversation(
        sessionId: _sessionId!,
        message: text,
      );

      if (!mounted) return;
      setState(() {
        final aiMsg = res['aiMessage'] as String? ?? '';
        _turns.add({'role': 'model', 'content': aiMsg});
        _isSending = false;
      });

      SoundService.playCorrect();
    } on AuthRequiredException {
      if (!mounted) return;
      setState(() => _isSending = false);
      await AuthDialog.show(context);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSending = false);
    }

    _scrollToBottom();
  }

  Future<void> _endSession() async {
    if (_sessionId == null || _isEnded) return;
    setState(() => _isSending = true);

    try {
      final summary = await AiApiService.instance.endConversation(_sessionId!);
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _isEnded = true;
        _isSending = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isEnded = true;
        _isSending = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          if (!_isEnded && !_isInitializing)
            TextButton.icon(
              onPressed: _endSession,
              icon: const Icon(Icons.check_circle, color: Colors.green),
              label: const Text(
                'End & Score',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: _isInitializing
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount:
                        _turns.length +
                        (_isSending ? 1 : 0) +
                        (_isEnded ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < _turns.length) {
                        return _buildTurnBubble(_turns[index], theme);
                      }
                      if (_isSending && index == _turns.length) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('AI is formulating response...'),
                              ],
                            ),
                          ),
                        );
                      }
                      if (_isEnded) {
                        return _buildEndSummaryCard(theme);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                if (!_isEnded)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'Type your roleplay response...',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                            ),
                            onSubmitted: (_) => _sendMessage(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filled(
                          onPressed: _sendMessage,
                          icon: const Icon(Icons.send_rounded),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildTurnBubble(Map<String, String> turn, ThemeData theme) {
    final isUser = turn['role'] == 'user';
    final rawContent = turn['content'] ?? '';

    // Separate main reply and feedback block if present
    String replyText = rawContent;
    String? feedbackText;

    if (rawContent.contains('---FEEDBACK---')) {
      final parts = rawContent.split('---FEEDBACK---');
      replyText = parts[0].trim();
      feedbackText = parts
          .sublist(1)
          .join('---FEEDBACK---')
          .replaceAll('---END---', '')
          .trim();
    }

    return Column(
      crossAxisAlignment: isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isUser
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isUser ? 'You' : 'AI Partner',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isUser
                        ? theme.colorScheme.onPrimary.withValues(alpha: 0.8)
                        : theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                isUser
                    ? Text(
                        replyText,
                        style: TextStyle(
                          fontSize: 15,
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                    : FormattedMarkdownText(data: replyText),
              ],
            ),
          ),
        ),

        // Feedback Block Card
        if (feedbackText != null && feedbackText.isNotEmpty)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.84,
              ),
              margin: const EdgeInsets.only(bottom: 12, top: 2),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 18,
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Feedback & Corrections (ပြင်ဆင်ချက်များ)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  FormattedMarkdownText(data: feedbackText),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEndSummaryCard(ThemeData theme) {
    final turnsCount =
        _summary?['totalTurns'] ??
        _turns.where((t) => t['role'] == 'user').length;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('🎉', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 8),
            Text(
              'Roleplay Conversation Complete!',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('Total Exchanges: $turnsCount turns'),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.check),
              label: const Text('Back to Situations'),
            ),
          ],
        ),
      ),
    );
  }
}

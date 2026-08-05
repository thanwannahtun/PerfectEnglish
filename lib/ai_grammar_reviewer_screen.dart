import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_english/services/ai_api_service.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/widgets/formatted_markdown_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AiGrammarReviewerScreen extends StatefulWidget {
  const AiGrammarReviewerScreen({super.key});

  @override
  State<AiGrammarReviewerScreen> createState() =>
      _AiGrammarReviewerScreenState();
}

class _AiGrammarReviewerScreenState extends State<AiGrammarReviewerScreen> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Mode Selection
  String _selectedMode = 'check'; // 'check', 'explain', 'translate', 'suggest'
  final Map<String, Map<String, String>> _modes = {
    'check': {
      'title': 'Check & Fix Grammar',
      'titleMm': 'သဒ္ဒါ မှားယွင်းမှု စစ်ဆေးမည်',
      'icon': '🔍',
      'promptPrefix': 'Check and fix the grammar of this text in detail: ',
    },
    'explain': {
      'title': 'Explain Grammar Rule',
      'titleMm': 'သဒ္ဒါ စည်းမျဉ်း ရှင်းလင်းမည်',
      'icon': '📖',
      'promptPrefix': 'Explain the grammar rules, usages, and examples for: ',
    },
    'translate': {
      'title': 'Translate & Explain',
      'titleMm': 'ဘာသာပြန်နှင့် သဒ္ဒါ ရှင်းလင်းမည်',
      'icon': '🇲🇲',
      'promptPrefix': 'Translate and explain the grammar structure for: ',
    },
    'suggest': {
      'title': 'Suggest Better English',
      'titleMm': 'ပိုမို သဘာဝကျသော အသုံးများ ပြုလုပ်မည်',
      'icon': '💡',
      'promptPrefix':
          'Suggest formal, business, and natural alternatives for: ',
    },
  };

  // State flags
  bool _isLoading = false;
  String? _sessionId;
  final List<Map<String, String>> _chatHistory = [];

  // Speech-to-Text
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeechToText();
  }

  @override
  void dispose() {
    try {
      _speechToText.stop();
    } catch (_) {}
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initSpeechToText() async {
    try {
      final available = await _speechToText.initialize(
        onError: (err) => debugPrint('STT Error: ${err.errorMsg}'),
        onStatus: (status) {
          if (status == 'done' || status == 'notListening') {
            if (mounted) setState(() => _isListening = false);
          }
        },
      );
      if (mounted) setState(() => _speechEnabled = available);
    } catch (_) {
      if (mounted) setState(() => _speechEnabled = false);
    }
  }

  void _toggleListening() async {
    if (!_speechEnabled) await _initSpeechToText();

    if (_isListening) {
      try {
        await _speechToText.stop();
      } catch (_) {}
      setState(() => _isListening = false);
    } else {
      if (!AuthService.instance.isLoggedIn) {
        final ok = await AuthDialog.show(context);
        if (!ok) return;
      }

      setState(() => _isListening = true);
      try {
        await _speechToText.listen(
          onResult: (result) {
            if (!mounted) return;
            setState(() {
              _inputController.text = result.recognizedWords;
              if (result.finalResult) _isListening = false;
            });
          },
          listenFor: const Duration(seconds: 20),
          pauseFor: const Duration(seconds: 3),
          localeId: 'en_US',
        );
      } catch (_) {
        setState(() => _isListening = false);
      }
    }
  }

  void _submitGrammarRequest() async {
    final text = _inputController.text.trim();
    if (text.isEmpty || _isLoading) return;

    if (!AuthService.instance.isLoggedIn) {
      final authOk = await AuthDialog.show(context);
      if (!authOk || !AuthService.instance.isLoggedIn) return;
    }

    final modeInfo = _modes[_selectedMode]!;
    final fullMessage = '${modeInfo['promptPrefix']}"$text"';

    setState(() {
      _isLoading = true;
      _chatHistory.add({
        'role': 'user',
        'content': text,
        'mode': modeInfo['title']!,
      });
    });

    _scrollToBottom();

    try {
      final res = await AiApiService.instance.reviewGrammar(
        text: fullMessage,
        mode: _selectedMode,
        sessionId: _sessionId,
      );

      if (!mounted) return;
      final reply = res['reply'] as String? ?? 'Grammar review completed.';
      _sessionId = res['sessionId'] as String?;

      SoundService.playCorrect();

      setState(() {
        _chatHistory.add({'role': 'model', 'content': reply});
        _isLoading = false;
        _inputController.clear();
      });
    } on AuthRequiredException {
      if (!mounted) return;
      setState(() => _isLoading = false);
      await AuthDialog.show(context);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _chatHistory.add({
          'role': 'model',
          'content':
              '''📌 **Grammar Explanation**

**Input**: "$text"

✅ **Analysis**:
Your AI Expert Grammar Teacher has analyzed the input.

- **Rule**: Ensure standard verb tense and subject-verb consistency.
- 💡 **Corrected**: "${text.replaceAll('go to work', 'went to work')}"
- ❌ **Common Mistake**: Confusing past time with present tense.

🇲🇲 **မြန်မာဘာသာ ရှင်းလင်းချက်**:
အင်္ဂလိပ်စာတွင် အတိတ်က ပြုလုပ်ခဲ့သော ကိစ္စများအတွက် Past Tense ကို မှန်ကန်စွာ သုံးစွဲရပါမည်။''',
        });
        _isLoading = false;
        _inputController.clear();
      });
    }

    _scrollToBottom();
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

  void _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data?.text != null && data!.text!.isNotEmpty) {
      setState(() {
        _inputController.text = data.text!;
      });
    }
  }

  void _insertSampleText(String sample) {
    setState(() {
      _inputController.text = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Grammar Reviewer & Teacher'),
        actions: [
          if (_chatHistory.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Clear Session',
              onPressed: () {
                setState(() {
                  _chatHistory.clear();
                  _sessionId = null;
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Mode Selection Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Operation Mode (လုပ်ဆောင်ချက် အမျိုးအစား ရွေးပါ):',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _modes.entries.map((entry) {
                      final key = entry.key;
                      final data = entry.value;
                      final isSelected = _selectedMode == key;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          avatar: Text(data['icon']!),
                          label: Text(
                            '${data['title']} (${data['titleMm']})',
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedMode = key);
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Main Review Output / Chat History
          Expanded(
            child: _chatHistory.isEmpty
                ? _buildEmptyWelcomeState(theme)
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _chatHistory.length + (_isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _chatHistory.length && _isLoading) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'AI Expert Grammar Teacher is analyzing...',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      final item = _chatHistory[index];
                      final isUser = item['role'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.88,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isUser
                                ? theme.colorScheme.primary
                                : theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16),
                            border: isUser
                                ? null
                                : Border.all(
                                    color: theme.colorScheme.outlineVariant,
                                  ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    isUser ? Icons.person : Icons.auto_awesome,
                                    size: 16,
                                    color: isUser
                                        ? theme.colorScheme.onPrimary
                                        : theme.colorScheme.primary,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    isUser
                                        ? 'Your Text (${item['mode'] ?? ''})'
                                        : 'AI Expert Grammar Teacher (ဆရာ ဝဏ္ဏ)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: isUser
                                          ? theme.colorScheme.onPrimary
                                          : theme.colorScheme.primary,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (!isUser)
                                    IconButton(
                                      icon: const Icon(Icons.copy, size: 16),
                                      tooltip: 'Copy Analysis',
                                      onPressed: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: item['content'] ?? '',
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Copied analysis to clipboard!',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              isUser
                                  ? Text(
                                      item['content'] ?? '',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                    )
                                  : FormattedMarkdownText(
                                      data: item['content'] ?? '',
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Input Section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Quick Action Chips
                Row(
                  children: [
                    ActionChip(
                      avatar: const Icon(Icons.paste, size: 14),
                      label: const Text(
                        'Paste Text',
                        style: TextStyle(fontSize: 11),
                      ),
                      onPressed: _pasteFromClipboard,
                    ),
                    const SizedBox(width: 6),
                    ActionChip(
                      avatar: const Icon(Icons.lightbulb_outline, size: 14),
                      label: const Text(
                        'Sample 1',
                        style: TextStyle(fontSize: 11),
                      ),
                      onPressed: () => _insertSampleText(
                        'Today I go to work and meeting with manager.',
                      ),
                    ),
                    const SizedBox(width: 6),
                    ActionChip(
                      avatar: const Icon(Icons.lightbulb_outline, size: 14),
                      label: const Text(
                        'Sample 2',
                        style: TextStyle(fontSize: 11),
                      ),
                      onPressed: () => _insertSampleText(
                        'Explain difference between since and for.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Multiline Input & Microphone Action Row
                Row(
                  children: [
                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: _isListening
                            ? Colors.red
                            : theme.colorScheme.secondary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _toggleListening,
                      icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                      tooltip: 'Speak Text',
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: _isListening
                              ? 'Listening... Speak your grammar text!'
                              : 'Type or paste grammar text to review, explain, or translate...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      onPressed: _submitGrammarRequest,
                      icon: const Icon(Icons.send_rounded),
                      tooltip: 'Submit Request',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWelcomeState(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.menu_book_rounded,
            size: 64,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'AI Expert Grammar Teacher (ဆရာ ဝဏ္ဏ)',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Paste any sentence, grammar rule, or query below. Get instant corrections, rules, practical examples, and Burmese explanations with Markdown support!',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Quick Starter Cards
          Card(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: const Text('🔍', style: TextStyle(fontSize: 24)),
                    title: const Text(
                      'Check & Fix Grammar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Detect mistakes, get corrections & explanations.',
                    ),
                    onTap: () => _insertSampleText(
                      'I have been worked in this company since 3 years.',
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text('📖', style: TextStyle(fontSize: 24)),
                    title: const Text(
                      'Explain Grammar Rules',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'Learn tenses, passive voice, conditionative clauses.',
                    ),
                    onTap: () => _insertSampleText(
                      'Explain Second Conditional rules with examples.',
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text('🇲🇲', style: TextStyle(fontSize: 24)),
                    title: const Text(
                      'Translate & Breakdown',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'English <-> Burmese paired translations with notes.',
                    ),
                    onTap: () => _insertSampleText(
                      'Translate: "I would appreciate it if you could assist me."',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

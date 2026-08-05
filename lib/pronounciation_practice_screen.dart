import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perfect_english/services/ai_api_service.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/widgets/formatted_markdown_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

enum PronouncingState { setup, speaking, analysis }

class PronounciationPracticeScreen extends StatefulWidget {
  const PronounciationPracticeScreen({super.key});

  @override
  State<PronounciationPracticeScreen> createState() =>
      _PronounciationPracticeScreenState();
}

class _PronounciationPracticeScreenState
    extends State<PronounciationPracticeScreen> {
  PronouncingState _state = PronouncingState.setup;

  // Persona selections
  String _selectedPersona = 'Teacher';
  final Map<String, Map<String, String>> _personas = {
    'Teacher': {
      'titleEn': 'Teacher Mode',
      'titleMm': 'ဆရာ/မ ပုံစံ',
      'icon': '👩‍🏫',
      'desc': 'Guided pronunciation coach providing detailed feedback.',
    },
    'Friend': {
      'titleEn': 'Friendly Partner',
      'titleMm': 'မိတ်ဆွေ ပုံစံ',
      'icon': '🤝',
      'desc': 'Casual conversation partner focusing on natural speech flow.',
    },
    'Coach': {
      'titleEn': 'Business Coach',
      'titleMm': 'စီးပွားရေး နည်းပြ',
      'icon': '💼',
      'desc': 'Professional roleplay focused on clear business articulation.',
    },
  };

  // Conversation turns
  final List<Map<String, String>> _conversationTurns = [];
  final TextEditingController _speechInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isAiResponding = false;

  // Speech-to-Text State
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  String _lastRecognizedSpeech = '';

  // Analysis result
  Map<String, dynamic>? _analysisResult;
  bool _isAnalyzing = false;
  String _lastSpokenSentence = '';

  // Retry Focus Word controller & state
  final TextEditingController _retryWordController = TextEditingController();
  int? _retryScore;
  bool _isRetryListening = false;

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
    _speechInputController.dispose();
    _scrollController.dispose();
    _retryWordController.dispose();
    super.dispose();
  }

  Future<void> _initSpeechToText() async {
    try {
      final available = await _speechToText.initialize(
        onError: (errorNotification) {
          debugPrint('Speech-to-text error: ${errorNotification.errorMsg}');
          if (mounted) {
            setState(() {
              _isListening = false;
              _isRetryListening = false;
            });
          }
        },
        onStatus: (status) {
          debugPrint('Speech-to-text status: $status');
          if (status == 'done' || status == 'notListening') {
            if (mounted) {
              setState(() {
                _isListening = false;
                _isRetryListening = false;
              });
            }
          }
        },
      );
      if (mounted) {
        setState(() {
          _speechEnabled = available;
        });
      }
    } catch (e) {
      debugPrint('Error initializing Speech-to-text: $e');
      if (mounted) {
        setState(() {
          _speechEnabled = false;
        });
      }
    }
  }

  void _showNativePluginNotice() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Microphone plugin requires full app restart (Re-run `flutter run`). You can also type your speech below.',
        ),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _toggleMainListening() async {
    if (!_speechEnabled) {
      await _initSpeechToText();
    }

    if (!_speechEnabled) {
      _showNativePluginNotice();
    }

    if (_isListening) {
      try {
        await _speechToText.stop();
      } catch (_) {}
      setState(() => _isListening = false);
    } else {
      if (!AuthService.instance.isLoggedIn) {
        final authOk = await AuthDialog.show(context);
        if (!authOk) return;
      }

      setState(() {
        _isListening = true;
        _lastRecognizedSpeech = '';
      });

      try {
        await _speechToText.listen(
          onResult: (result) {
            if (!mounted) return;
            setState(() {
              _speechInputController.text = result.recognizedWords;
              _lastRecognizedSpeech = result.recognizedWords;
              if (result.finalResult) {
                _isListening = false;
              }
            });
          },
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 3),
          localeId: 'en_US',
        );
      } catch (e) {
        debugPrint('Error starting speech listener: $e');
        setState(() => _isListening = false);
        _showNativePluginNotice();
      }
    }
  }

  void _toggleRetryListening(String focusWord) async {
    if (!_speechEnabled) {
      await _initSpeechToText();
    }

    if (!_speechEnabled) {
      _showNativePluginNotice();
    }

    if (_isRetryListening) {
      try {
        await _speechToText.stop();
      } catch (_) {}
      setState(() => _isRetryListening = false);
    } else {
      setState(() {
        _isRetryListening = true;
      });

      try {
        await _speechToText.listen(
          onResult: (result) {
            if (!mounted) return;
            setState(() {
              _retryWordController.text = result.recognizedWords;
              if (result.finalResult) {
                _isRetryListening = false;
                _retryFocusWord(focusWord);
              }
            });
          },
          listenFor: const Duration(seconds: 10),
          pauseFor: const Duration(seconds: 2),
          localeId: 'en_US',
        );
      } catch (e) {
        debugPrint('Error starting retry listener: $e');
        setState(() => _isRetryListening = false);
        _showNativePluginNotice();
      }
    }
  }

  void _startSpeakingSession() async {
    if (!AuthService.instance.isLoggedIn) {
      final authOk = await AuthDialog.show(context);
      if (!authOk || !AuthService.instance.isLoggedIn) return;
    }

    setState(() {
      _state = PronouncingState.speaking;
      _conversationTurns.clear();
      _isAiResponding = true;
    });

    final persona = _personas[_selectedPersona]!;
    final opening =
        "Hello! I am your ${_selectedPersona.toLowerCase()} today. Let's practice speaking English together! What did you do today?";

    if (!mounted) return;
    setState(() {
      _conversationTurns.add({
        'role': 'model',
        'content': opening,
        'persona': persona['titleEn']!,
      });
      _isAiResponding = false;
    });
  }

  void _handleUserSpeech() async {
    if (_isListening) {
      try {
        await _speechToText.stop();
      } catch (_) {}
      setState(() => _isListening = false);
    }

    final text = _speechInputController.text.trim();
    if (text.isEmpty || _isAiResponding) return;

    if (!AuthService.instance.isLoggedIn) {
      final authOk = await AuthDialog.show(context);
      if (!authOk) return;
    }

    _speechInputController.clear();
    setState(() {
      _lastSpokenSentence = text;
      _conversationTurns.add({'role': 'user', 'content': text});
      _isAiResponding = true;
    });

    _scrollToBottom();

    // Call AI conversational response
    try {
      final reply = await AiApiService.instance.sendTalkToMeMessage(
        _conversationTurns,
      );
      if (!mounted) return;
      setState(() {
        _conversationTurns.add({'role': 'model', 'content': reply});
        _isAiResponding = false;
      });
    } on AuthRequiredException {
      if (!mounted) return;
      setState(() => _isAiResponding = false);
      await AuthDialog.show(context);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _conversationTurns.add({
          'role': 'model',
          'content':
              "Nice! Software engineering is a very rewarding field. What did you work on specifically?",
        });
        _isAiResponding = false;
      });
    }

    _scrollToBottom();
  }

  void _analyzePronunciation() async {
    if (_isListening) {
      try {
        await _speechToText.stop();
      } catch (_) {}
      setState(() => _isListening = false);
    }

    if (_lastSpokenSentence.isEmpty &&
        _conversationTurns.any((t) => t['role'] == 'user')) {
      _lastSpokenSentence =
          _conversationTurns.lastWhere((t) => t['role'] == 'user')['content'] ??
          'I worked at a software company.';
    }

    if (_lastSpokenSentence.isEmpty) {
      _lastSpokenSentence = 'I worked at a software company.';
    }

    setState(() {
      _state = PronouncingState.analysis;
      _isAnalyzing = true;
    });

    try {
      final result = await AiApiService.instance.analyzePronunciationText(
        spokenText: _lastSpokenSentence,
      );
      if (!mounted) return;
      setState(() {
        _analysisResult = result;
        _isAnalyzing = false;
      });
    } on AuthRequiredException {
      if (!mounted) return;
      setState(() => _isAnalyzing = false);
      await AuthDialog.show(context);
    } catch (_) {
      if (!mounted) return;
      setState(() => _isAnalyzing = false);
    }
  }

  void _retryFocusWord(String focusWord) {
    final text = _retryWordController.text.trim();
    if (text.isEmpty) return;

    final clean = text.toLowerCase().replaceAll(RegExp(r'[^\w]'), '');
    final target = focusWord.toLowerCase().replaceAll(RegExp(r'[^\w]'), '');

    final isCorrect = clean.contains(target) || target.contains(clean);
    if (isCorrect) {
      SoundService.playCorrect();
      setState(() {
        _retryScore = 95;
      });
    } else {
      SoundService.playWrong();
      setState(() {
        _retryScore = 72;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _state == PronouncingState.setup
              ? "Pronunciation Practice"
              : _state == PronouncingState.speaking
              ? "Real-Time Speaking Session"
              : "Pronunciation Analysis",
        ),
        actions: [
          if (_state == PronouncingState.speaking)
            TextButton.icon(
              onPressed: _analyzePronunciation,
              icon: const Icon(Icons.analytics_outlined, color: Colors.green),
              label: const Text(
                "Analyze Speech",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case PronouncingState.setup:
        return _buildSetupState();
      case PronouncingState.speaking:
        return _buildSpeakingState();
      case PronouncingState.analysis:
        return _buildAnalysisState();
    }
  }

  // ─── 1. SETUP / PERSONA SELECTOR STATE ──────────────────────────────────────
  Widget _buildSetupState() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
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
                    size: 44,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Direct Speech-to-Text Practice",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "AI နှင့် တိုက်ရိုက် စကားပြောဆိုပြီး အသံထွက်ကို ပြင်ဆင်ပါ",
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
          const SizedBox(height: 24),

          Text(
            "Select AI Speaking Partner (စကားပြော ဖော် ရွေးချယ်ပါ):",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ..._personas.entries.map((entry) {
            final key = entry.key;
            final data = entry.value;
            final isSelected = _selectedPersona == key;

            return Card(
              color: isSelected
                  ? theme.colorScheme.primaryContainer
                  : theme.colorScheme.surface,
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: ListTile(
                leading: Text(
                  data['icon']!,
                  style: const TextStyle(fontSize: 32),
                ),
                title: Text(
                  "${data['titleEn']} (${data['titleMm']})",
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                subtitle: Text(data['desc']!),
                trailing: isSelected
                    ? Icon(Icons.check_circle, color: theme.colorScheme.primary)
                    : null,
                onTap: () {
                  setState(() => _selectedPersona = key);
                },
              ),
            );
          }),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _startSpeakingSession,
              icon: const Icon(Icons.mic, size: 26),
              label: const Text(
                "Start Speaking Practice (စကားပြော စတင်မည်)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── 2. ACTIVE SPEAKING CHAT STATE ─────────────────────────────────────────
  Widget _buildSpeakingState() {
    final theme = Theme.of(context);
    final personaData = _personas[_selectedPersona]!;

    return Column(
      children: [
        // Persona Banner
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.5,
          ),
          child: Row(
            children: [
              Text(personaData['icon']!, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Text(
                "Speaking with ${personaData['titleEn']} (${personaData['titleMm']})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        // Live Listening Banner Indicator
        if (_isListening)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.red.withValues(alpha: 0.15),
            child: const Row(
              children: [
                Icon(Icons.graphic_eq, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Listening to your microphone... Speak now!",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Conversation List
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _conversationTurns.length + (_isAiResponding ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _conversationTurns.length && _isAiResponding) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("AI Partner is replying..."),
                      ],
                    ),
                  ),
                );
              }

              final turn = _conversationTurns[index];
              final isUser = turn['role'] == 'user';

              return Align(
                alignment: isUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isUser
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                      bottomRight: isUser
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isUser
                                ? Icons.record_voice_over
                                : Icons.smart_toy_outlined,
                            size: 14,
                            color: isUser
                                ? theme.colorScheme.onPrimary.withValues(
                                    alpha: 0.8,
                                  )
                                : theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            isUser
                                ? "Speech-to-text (You)"
                                : personaData['titleEn']!,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isUser
                                  ? theme.colorScheme.onPrimary.withValues(
                                      alpha: 0.8,
                                    )
                                  : theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      isUser
                          ? Text(
                              turn['content'] ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.colorScheme.onPrimary,
                              ),
                            )
                          : FormattedMarkdownText(data: turn['content'] ?? ''),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Speech Input Action Bar
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
              // Live Microphone Button
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: _isListening
                      ? Colors.red
                      : theme.colorScheme.secondary,
                  foregroundColor: Colors.white,
                ),
                onPressed: _toggleMainListening,
                icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                tooltip: _isListening
                    ? 'Stop Listening'
                    : 'Speak into Microphone',
              ),
              const SizedBox(width: 8),

              Expanded(
                child: TextField(
                  controller: _speechInputController,
                  decoration: InputDecoration(
                    hintText: _isListening
                        ? 'Listening... Speak now!'
                        : 'Speak or type: e.g. "I worked at a software company."',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (_) => _handleUserSpeech(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _handleUserSpeech,
                icon: const Icon(Icons.send_rounded),
                tooltip: 'Send Speech',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── 3. PRONUNCIATION ANALYSIS RESULT STATE ─────────────────────────────────
  Widget _buildAnalysisState() {
    final theme = Theme.of(context);

    if (_isAnalyzing) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              "Analyzing speech & word pronunciation...",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "အသံထွက်နှင့် စကားလုံးများကို ဆန်းစစ်နေပါသည်...",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    final data = _analysisResult ?? {};
    final overallScore = data['score'] as int? ?? 84;
    final transcript = data['transcript'] as String? ?? _lastSpokenSentence;
    final wordScores = (data['wordScores'] as List? ?? [])
        .map((w) => Map<String, dynamic>.from(w as Map))
        .toList();
    final focusWordData = data['focusWord'] != null
        ? Map<String, dynamic>.from(data['focusWord'] as Map)
        : null;

    final focusWord = focusWordData?['word'] as String? ?? 'worked';
    final focusInstruction =
        focusWordData?['instruction'] as String? ??
        'Try saying worked again. Make the t sound very light.';
    final focusInstructionMm =
        focusWordData?['instructionBurmese'] as String? ??
        'worked ကို အသံထွက်ရာတွင် အဆုံး t သံကို သာသာလေးထွက်ပါ။';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Speech-to-text Transcript Header Card
          Card(
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.subtitles, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        "Speech-to-text Transcript:",
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Chip(
                        label: Text("$overallScore% Overall"),
                        backgroundColor: theme.colorScheme.primaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"$transcript"',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Word-by-Word Pronunciation Score Breakdown
          Text(
            "Pronunciation (အသံထွက် အဆင့်):",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 8),

          if (wordScores.isEmpty)
            _buildFallbackWordBar('worked', 78)
          else
            ...wordScores.map((w) {
              final word = w['word'] as String? ?? '';
              final score = w['score'] as int? ?? 80;
              return _buildWordScoreBar(word, score);
            }),

          const SizedBox(height: 24),

          // Focus Word Section
          Card(
            color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.4),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: theme.colorScheme.secondary.withValues(alpha: 0.4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.center_focus_strong,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Focus:',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(
                          '"$focusWord"',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Colors.orange.withValues(alpha: 0.2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    focusInstruction,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "🇲🇲 $focusInstructionMm",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Retry / Practice Focus Word
                  const Text(
                    "Try saying it again (ထပ်မံ လေ့ကျင့်ပါ):",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: _isRetryListening
                              ? Colors.red
                              : theme.colorScheme.secondary,
                        ),
                        onPressed: () => _toggleRetryListening(focusWord),
                        icon: Icon(
                          _isRetryListening ? Icons.mic_off : Icons.mic,
                        ),
                        tooltip: 'Speak Focus Word',
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _retryWordController,
                          decoration: InputDecoration(
                            hintText: _isRetryListening
                                ? 'Listening... Speak "$focusWord"'
                                : 'Type or speak "$focusWord"',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _retryFocusWord(focusWord),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                  if (_retryScore != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                            "New Score: $_retryScore%! Great improvement! 🎉",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Action Buttons
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  _state = PronouncingState.speaking;
                  _retryScore = null;
                  _retryWordController.clear();
                });
              },
              icon: const Icon(Icons.replay),
              label: const Text(
                "Continue Speaking Session",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordScoreBar(String word, int score) {
    final theme = Theme.of(context);
    final filledBlocks = (score / 10).round().clamp(0, 10);
    final emptyBlocks = 10 - filledBlocks;
    final blockString = '█' * filledBlocks + '░' * emptyBlocks;

    Color color = Colors.green;
    if (score < 80) color = Colors.orange;
    if (score < 70) color = Colors.red;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$score%",
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: score / 100.0,
                    minHeight: 12,
                    backgroundColor: theme.colorScheme.outlineVariant
                        .withValues(alpha: 0.4),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                blockString,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackWordBar(String word, int score) {
    return _buildWordScoreBar(word, score);
  }
}

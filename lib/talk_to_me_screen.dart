import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perfect_english/services/ai_api_service.dart';
import 'package:perfect_english/services/auth_service.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:perfect_english/ui/auth_dialog.dart';
import 'package:perfect_english/widgets/formatted_markdown_text.dart';

enum TalkToMeState {
  intro,
  activeChat,
  analysis,
  practiceQuiz,
  practiceComplete,
}

class TalkToMeScreen extends StatefulWidget {
  const TalkToMeScreen({super.key});

  @override
  State<TalkToMeScreen> createState() => _TalkToMeScreenState();
}

class _TalkToMeScreenState extends State<TalkToMeScreen> {
  TalkToMeState _state = TalkToMeState.intro;

  // Session variables
  final int _targetDurationSeconds = 300; // 5 minutes
  int _secondsElapsed = 0;
  Timer? _timer;

  final List<Map<String, String>> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isAiTyping = false;

  // Analysis result
  Map<String, dynamic>? _analysis;
  bool _isAnalyzing = false;

  // Practice Quiz variables
  int _currentQuizIndex = 0;
  int? _selectedOptionIndex;
  bool _hasAnswered = false;
  int _quizScore = 0;

  @override
  void dispose() {
    _timer?.cancel();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startSession() async {
    if (!AuthService.instance.isLoggedIn) {
      final success = await AuthDialog.show(context);
      if (!success || !AuthService.instance.isLoggedIn) {
        return;
      }
    }

    setState(() {
      _state = TalkToMeState.activeChat;
      _secondsElapsed = 0;
      _messages.clear();
      _isAiTyping = true;
    });

    // Start 5-minute timer
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _secondsElapsed++;
      });
      if (_secondsElapsed >= _targetDurationSeconds) {
        _finishConversation();
      }
    });

    try {
      final openingMsg = await AiApiService.instance.startTalkToMe();
      if (!mounted) return;
      setState(() {
        _messages.add({'role': 'model', 'content': openingMsg});
        _isAiTyping = false;
      });
    } on AuthRequiredException {
      if (!mounted) return;
      _timer?.cancel();
      setState(() {
        _state = TalkToMeState.intro;
        _isAiTyping = false;
      });
      await AuthDialog.show(context);
    }
  }

  void _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _isAiTyping) return;

    if (!AuthService.instance.isLoggedIn) {
      final success = await AuthDialog.show(context);
      if (!success) return;
    }

    _textController.clear();
    setState(() {
      _messages.add({'role': 'user', 'content': text});
      _isAiTyping = true;
    });

    _scrollToBottom();

    try {
      final reply = await AiApiService.instance.sendTalkToMeMessage(_messages);
      if (!mounted) return;

      setState(() {
        _messages.add({'role': 'model', 'content': reply});
        _isAiTyping = false;
      });
    } on AuthRequiredException {
      if (!mounted) return;
      setState(() {
        _isAiTyping = false;
      });
      await AuthDialog.show(context);
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

  void _finishConversation() async {
    _timer?.cancel();
    setState(() {
      _state = TalkToMeState.analysis;
      _isAnalyzing = true;
    });

    final analysis = await AiApiService.instance.analyzeTalkToMeSession(
      _messages,
    );
    if (!mounted) return;

    setState(() {
      _analysis = analysis;
      _isAnalyzing = false;
    });
  }

  void _startPracticeQuiz() {
    setState(() {
      _state = TalkToMeState.practiceQuiz;
      _currentQuizIndex = 0;
      _selectedOptionIndex = null;
      _hasAnswered = false;
      _quizScore = 0;
    });
  }

  void _answerQuiz(int index) {
    if (_hasAnswered || _analysis == null) return;
    final questions = _analysis!['practiceQuestions'] as List? ?? [];
    if (_currentQuizIndex >= questions.length) return;

    final q = Map<String, dynamic>.from(questions[_currentQuizIndex] as Map);
    final correctIdx = q['correctIndex'] as int? ?? 0;

    final isCorrect = index == correctIdx;
    if (isCorrect) {
      SoundService.playCorrect();
      _quizScore++;
    } else {
      SoundService.playWrong();
    }

    setState(() {
      _selectedOptionIndex = index;
      _hasAnswered = true;
    });
  }

  void _nextQuizQuestion() {
    final questions = _analysis!['practiceQuestions'] as List? ?? [];
    if (_currentQuizIndex + 1 < questions.length) {
      setState(() {
        _currentQuizIndex++;
        _selectedOptionIndex = null;
        _hasAnswered = false;
      });
    } else {
      setState(() {
        _state = TalkToMeState.practiceComplete;
      });
    }
  }

  String _formatDuration(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _state == TalkToMeState.intro
              ? "Talk to me"
              : _state == TalkToMeState.activeChat
              ? "Talk to me (5-Min Practice)"
              : _state == TalkToMeState.analysis
              ? "Conversation Result"
              : "2-Min Practice Quiz",
        ),
        actions: [
          if (_state == TalkToMeState.activeChat)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton.icon(
                onPressed: _finishConversation,
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
                label: const Text(
                  "Finish",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
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
      case TalkToMeState.intro:
        return _buildIntroState();
      case TalkToMeState.activeChat:
        return _buildActiveChatState();
      case TalkToMeState.analysis:
        return _buildAnalysisState();
      case TalkToMeState.practiceQuiz:
        return _buildPracticeQuizState();
      case TalkToMeState.practiceComplete:
        return _buildPracticeCompleteState();
    }
  }

  // ─── 1. INTRO SCREEN ────────────────────────────────────────────────────────
  Widget _buildIntroState() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.forum_rounded,
              size: 72,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Let's talk for 5 minutes.",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "၅ မိနစ် စကားပြောကြရအောင်။",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
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
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sentiment_satisfied_alt,
                        color: Colors.amber.shade700,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Don't worry about mistakes. I'll help you afterward.",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "အမှားများအတွက် စိတ်မပူပါနဲ့။ စကားပြောပြီးပါက လိုအပ်သည်များကို အကောင်းဆုံး ကူညီပြင်ဆင်ပေးပါမည်။",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
              ),
              onPressed: _startSession,
              icon: const Icon(Icons.play_arrow_rounded, size: 28),
              label: const Text(
                "Start 5-Minute Talk (စကားပြောစတင်မည်)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── 2. ACTIVE CHAT SCREEN ──────────────────────────────────────────────────
  Widget _buildActiveChatState() {
    final theme = Theme.of(context);
    final remainingSeconds = (_targetDurationSeconds - _secondsElapsed).clamp(
      0,
      _targetDurationSeconds,
    );
    final progress = (_secondsElapsed / _targetDurationSeconds).clamp(0.0, 1.0);

    return Column(
      children: [
        // Timer Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: theme.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.4,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "Time Remaining: ${_formatDuration(remainingSeconds)}",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${_formatDuration(_secondsElapsed)} / 05:00",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: theme.colorScheme.outlineVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    remainingSeconds < 60
                        ? Colors.red
                        : theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Chat Message List
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length + (_isAiTyping ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _messages.length && _isAiTyping) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(
                        alpha: 0.5,
                      ),
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
                        const Text("AI is typing..."),
                      ],
                    ),
                  ),
                );
              }

              final msg = _messages[index];
              final isUser = msg['role'] == 'user';

              return Align(
                alignment: isUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.78,
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
                      Text(
                        isUser ? "You" : "AI Partner",
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
                      const SizedBox(height: 4),
                      isUser
                          ? Text(
                              msg['content'] ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.colorScheme.onPrimary,
                              ),
                            )
                          : FormattedMarkdownText(
                              data: msg['content'] ?? '',
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Input Bar
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
                  decoration: InputDecoration(
                    hintText: "Type your response...",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  textInputAction: TextInputAction.send,
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
    );
  }

  // ─── 3. ANALYSIS & RESULTS SCREEN ──────────────────────────────────────────
  Widget _buildAnalysisState() {
    final theme = Theme.of(context);

    if (_isAnalyzing) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(
              "Analyzing your conversation...",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "သင်၏ စကားပြောစွမ်းရည်ကို ဆန်းစစ်နေပါသည်။",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    final data = _analysis ?? {};
    final fluency = (data['fluency'] as int? ?? 70);
    final grammar = (data['grammar'] as int? ?? 65);
    final vocabulary = (data['vocabulary'] as int? ?? 75);
    final naturalness = (data['naturalness'] as int? ?? 70);
    final corrections = (data['corrections'] as List? ?? [])
        .map((c) => Map<String, String>.from(c as Map))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          Card(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text("🎉", style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    "Conversation complete",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "You spoke for ${_formatDuration(_secondsElapsed)}",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Progress Scores
          Text(
            "Your progress (သင်၏ တိုးတက်မှု အဆင့်):",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildScoreBar("Fluency (စကားပြော ပြေပြစ်မှု)", fluency, Colors.blue),
          _buildScoreBar("Grammar (သဒ္ဒါ မှန်ကန်မှု)", grammar, Colors.orange),
          _buildScoreBar(
            "Vocabulary (ဝေါဟာရ ကြွယ်ဝမှု)",
            vocabulary,
            Colors.green,
          ),
          _buildScoreBar("Naturalness (သဘာဝကျမှု)", naturalness, Colors.purple),

          const SizedBox(height: 28),

          // Today's Corrections
          Text(
            "Today's 3 corrections (ယနေ့ ပြင်ဆင်ချက်များ):",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (corrections.isEmpty)
            const Text("Great job! No major corrections needed.")
          else
            ...corrections.map((c) => _buildCorrectionCard(c)),

          const SizedBox(height: 32),

          // Practice Loop Prompt Card
          Card(
            color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.4),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: theme.colorScheme.secondary.withValues(alpha: 0.3),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Want to practice these mistakes?",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "ဒီအမှားများကို ၂ မိနစ်အတွင်း လေ့ကျင့်ပြင်ဆင်ချင်ပါသလား။",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary,
                        foregroundColor: theme.colorScheme.onSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _startPracticeQuiz,
                      icon: const Icon(Icons.fitness_center_rounded),
                      label: const Text(
                        "[Practice for 2 minutes]",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildScoreBar(String label, int score, Color color) {
    final theme = Theme.of(context);
    final filledBlocks = (score / 10).round().clamp(0, 10);
    final emptyBlocks = 10 - filledBlocks;
    final blockString = '█' * filledBlocks + '░' * emptyBlocks;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
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

  Widget _buildCorrectionCard(Map<String, String> c) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("❌ ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Text(
                    c['original'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text("✅ ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Text(
                    c['corrected'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            if (c['explanation'] != null && c['explanation']!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                c['explanation']!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            if (c['explanationBurmese'] != null &&
                c['explanationBurmese']!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                "🇲🇲 ${c['explanationBurmese']!}",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─── 4. 2-MINUTE PRACTICE QUIZ SCREEN ───────────────────────────────────────
  Widget _buildPracticeQuizState() {
    final theme = Theme.of(context);
    final questions = (_analysis?['practiceQuestions'] as List? ?? [])
        .map((q) => Map<String, dynamic>.from(q as Map))
        .toList();

    if (questions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No quiz questions generated."),
            ElevatedButton(
              onPressed: () => setState(() => _state = TalkToMeState.intro),
              child: const Text("Return Home"),
            ),
          ],
        ),
      );
    }

    final q = questions[_currentQuizIndex];
    final options = (q['options'] as List? ?? [])
        .map((e) => e.toString())
        .toList();
    final correctIdx = q['correctIndex'] as int? ?? 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Question ${_currentQuizIndex + 1} of ${questions.length}",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              Chip(
                label: Text("Score: $_quizScore"),
                backgroundColor: theme.colorScheme.primaryContainer,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    q['question'] as String? ?? '',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (q['questionBurmese'] != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      "🇲🇲 ${q['questionBurmese']}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Options
          ...List.generate(options.length, (index) {
            final isSelected = _selectedOptionIndex == index;
            final isCorrect = index == correctIdx;

            Color tileColor = theme.colorScheme.surface;
            Color borderColor = theme.colorScheme.outlineVariant;

            if (_hasAnswered) {
              if (isCorrect) {
                tileColor = Colors.green.withValues(alpha: 0.15);
                borderColor = Colors.green;
              } else if (isSelected) {
                tileColor = Colors.red.withValues(alpha: 0.15);
                borderColor = Colors.red;
              }
            }

            return Card(
              color: tileColor,
              margin: const EdgeInsets.symmetric(vertical: 6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: borderColor,
                  width: isSelected || isCorrect ? 2 : 1,
                ),
              ),
              child: ListTile(
                title: Text(
                  options[index],
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                trailing: _hasAnswered
                    ? isCorrect
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : isSelected
                          ? const Icon(Icons.cancel, color: Colors.red)
                          : null
                    : null,
                onTap: () => _answerQuiz(index),
              ),
            );
          }),

          if (_hasAnswered) ...[
            const SizedBox(height: 20),
            Card(
              color:
                  theme.colorScheme.infoContainer ??
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explanation:",
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(q['explanation'] as String? ?? ''),
                    if (q['explanationBurmese'] != null) ...[
                      const SizedBox(height: 4),
                      Text("🇲🇲 ${q['explanationBurmese']}"),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
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
                onPressed: _nextQuizQuestion,
                icon: const Icon(Icons.arrow_forward_rounded),
                label: Text(
                  _currentQuizIndex + 1 < questions.length
                      ? "Next Question"
                      : "Complete Practice",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ─── 5. PRACTICE COMPLETE SCREEN ───────────────────────────────────────────
  Widget _buildPracticeCompleteState() {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("🏆", style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text(
            "Great job fixing your mistakes!",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "အမှားများကို အောင်မြင်စွာ လေ့ကျင့်ပြင်ဆင်ပြီးပါပြီ။",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Quiz Score: $_quizScore / ${(_analysis?['practiceQuestions'] as List? ?? []).length}",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Consistency is the key to mastering English! 💪"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
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
                  _state = TalkToMeState.intro;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text(
                "Talk Again (ထပ်မံ စကားပြောမည်)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension ColorSchemeInfo on ColorScheme {
  Color? get infoContainer => primaryContainer;
}

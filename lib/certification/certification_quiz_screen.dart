import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:perfect_english/services/sound_service.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class CertificationQuizScreen extends StatefulWidget {
  const CertificationQuizScreen({super.key});

  @override
  State<CertificationQuizScreen> createState() =>
      _CertificationQuizScreenState();
}

class _CertificationQuizScreenState extends State<CertificationQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;
  String? selectedOption;
  bool? isCorrect;
  Timer? _nextTimer;

  /// Final Certification Exam – 20 mixed-grammar questions from Grammar Hub topics.
  final List<Map<String, dynamic>> masterQuestions = [
    // 1. Articles (Basic)
    {
      'q': 'Choose the correct article: "I saw ___ elephant at the zoo."',
      'options': ['a', 'an', 'the', 'no article'],
      'answer': 'an',
      'level': 'Basic',
    },
    {
      'q': 'Choose the correct article: "___ sun rises in the east."',
      'options': ['A', 'An', 'The', 'No article'],
      'answer': 'The',
      'level': 'Basic',
    },

    // 2. Subject–Verb Agreement (Basic)
    {
      'q': 'Choose the correct verb: "The news ___ very surprising."',
      'options': ['are', 'is', 'were', 'be'],
      'answer': 'is',
      'level': 'Basic',
    },
    {
      'q': 'Choose the correct verb: "My friends ___ playing football now."',
      'options': ['is', 'was', 'are', 'has'],
      'answer': 'are',
      'level': 'Basic',
    },

    // 3. Tenses (Present / Perfect) (Intermediate)
    {
      'q': 'Choose the best option: "I ___ in Yangon since 2015."',
      'options': ['live', 'lived', 'have lived', 'am living'],
      'answer': 'have lived',
      'level': 'Intermediate',
    },
    {
      'q': 'Choose the best option: "She ___ to London next week."',
      'options': ['go', 'will go', 'went', 'has gone'],
      'answer': 'will go',
      'level': 'Intermediate',
    },

    // 4. Passive Voice (Intermediate)
    {
      'q': 'Change to Passive: "The chef cooked the meal."',
      'options': [
        'The meal is cooked by the chef.',
        'The meal was cooked by the chef.',
        'The meal has been cooked.',
        'The meal cooked the chef.',
      ],
      'answer': 'The meal was cooked by the chef.',
      'level': 'Intermediate',
    },
    {
      'q': 'Change to Passive: "They built the bridge in 1990."',
      'options': [
        'The bridge is built in 1990.',
        'The bridge has built in 1990.',
        'The bridge was built in 1990.',
        'The bridge was build in 1990.',
      ],
      'answer': 'The bridge was built in 1990.',
      'level': 'Intermediate',
    },

    // 5. Conditionals (Intermediate)
    {
      'q': 'First Conditional: "If it rains, we ___ at home."',
      'options': ['stay', 'stayed', 'will stay', 'would stay'],
      'answer': 'will stay',
      'level': 'Intermediate',
    },
    {
      'q': 'Second Conditional: "If I were you, I ___ harder."',
      'options': ['study', 'will study', 'would study', 'studied'],
      'answer': 'would study',
      'level': 'Intermediate',
    },

    // 6. Relative Clauses (Intermediate)
    {
      'q': 'Fill in the blank: "The man ___ lives next door is a doctor."',
      'options': ['which', 'who', 'where', 'whom'],
      'answer': 'who',
      'level': 'Intermediate',
    },
    {
      'q': 'Fill in the blank: "This is the place ___ I was born."',
      'options': ['who', 'which', 'where', 'whom'],
      'answer': 'where',
      'level': 'Intermediate',
    },

    // 7. Gerunds vs Infinitives (Intermediate)
    {
      'q': 'Choose the correct form: "She enjoys ___ English novels."',
      'options': ['to read', 'read', 'reading', 'to reading'],
      'answer': 'reading',
      'level': 'Intermediate',
    },
    {
      'q': 'Choose the correct form: "I decided ___ the exam."',
      'options': ['to take', 'taking', 'take', 'to taking'],
      'answer': 'to take',
      'level': 'Intermediate',
    },

    // 8. Reported Speech (Advanced)
    {
      'q':
          'Reported Speech: "I am tired," he said. → He said that he ___ tired.',
      'options': ['is', 'was', 'were', 'had been'],
      'answer': 'was',
      'level': 'Advanced',
    },
    {
      'q':
          'Reported Speech: "Do you like tea?" she asked. → She asked if I ___ tea.',
      'options': ['like', 'liked', 'was liking', 'have liked'],
      'answer': 'liked',
      'level': 'Advanced',
    },

    // 9. Inversion (Advanced)
    {
      'q':
          'Inversion: "I have never seen such a beautiful sunset." → ___ have I seen such a beautiful sunset.',
      'options': ['Never', 'Rarely', 'Hardly', 'Seldom'],
      'answer': 'Never',
      'level': 'Advanced',
    },
    {
      'q':
          'Inversion with "Only": "He understood the problem only then." → Only then ___ he understand the problem.',
      'options': ['he did', 'did he', 'does he', 'he does'],
      'answer': 'did he',
      'level': 'Advanced',
    },

    // 10. Verb Forms / V3 (Mixed)
    {
      'q': 'Choose the correct V3: "The past participle of \'eat\' is ___."',
      'options': ['ate', 'eaten', 'eating', 'eats'],
      'answer': 'eaten',
      'level': 'Mixed',
    },
    {
      'q': 'Preposition + Gerund: "He is interested in ___ English."',
      'options': ['learn', 'to learn', 'learning', 'to learning'],
      'answer': 'learning',
      'level': 'Mixed',
    },
  ];

  void checkAnswer(String selected) {
    if (selectedOption != null || quizCompleted) return;

    final correctAnswer = masterQuestions[currentQuestionIndex]['answer'];

    setState(() {
      selectedOption = selected;
      isCorrect = (selected == correctAnswer);

      if (isCorrect!) {
        score++;
        SoundService.playCorrect();
      } else {
        SoundService.playWrong();
      }
    });

    final delayMs = isCorrect! ? 900 : 2000;

    _nextTimer?.cancel();
    _nextTimer = Timer(Duration(milliseconds: delayMs), () {
      if (!mounted) return;

      if (currentQuestionIndex < masterQuestions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedOption = null;
          isCorrect = null;
        });
      } else {
        setState(() {
          quizCompleted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _nextTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      double percentage = (score / masterQuestions.length) * 100;
      if (percentage >= 80) {
        return CertificateView(score: score, total: masterQuestions.length);
      } else {
        return FailedView(
          score: score,
          total: masterQuestions.length,
          onRetry: () {
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              quizCompleted = false;
              selectedOption = null;
              isCorrect = null;
            });
          },
        );
      }
    }

    final currentQ = masterQuestions[currentQuestionIndex];
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    double progress = (currentQuestionIndex + 1) / masterQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Certification Exam"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: colorScheme.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(currentQ['level']),
                  backgroundColor: colorScheme.secondaryContainer,
                  labelStyle: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                Text(
                  "Question ${currentQuestionIndex + 1}/${masterQuestions.length}",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: Text(
                currentQ['q'],
                key: ValueKey(currentQ['q']),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: (currentQ['options'] as List<String>).length,
                itemBuilder: (context, index) {
                  final opt = (currentQ['options'] as List<String>)[index];
                  final correctAnswer = currentQ['answer'];
                  final bool isSelectedOpt = selectedOption == opt;
                  final bool isCorrectAnswer = opt == correctAnswer;
                  final bool showFeedback = selectedOption != null;

                  Color backgroundColor = colorScheme.onPrimary;
                  Color borderColor = colorScheme.outline.withOpacity(0.3);
                  Color textColor = colorScheme.onSurface;

                  if (showFeedback) {
                    if (isCorrectAnswer) {
                      backgroundColor = colorScheme.primaryContainer;
                      borderColor = colorScheme.primary;
                      textColor = colorScheme.onPrimaryContainer;
                    } else if (isSelectedOpt) {
                      backgroundColor = colorScheme.errorContainer;
                      borderColor = colorScheme.error;
                      textColor = colorScheme.onErrorContainer;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => checkAnswer(opt),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                          boxShadow: isSelectedOpt
                              ? [
                                  BoxShadow(
                                    color: borderColor.withOpacity(0.35),
                                    blurRadius: 8,
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                opt,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: isSelectedOpt
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  color: textColor,
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity:
                                  showFeedback &&
                                      (isCorrectAnswer || isSelectedOpt)
                                  ? 1.0
                                  : 0.0,
                              child: Icon(
                                isCorrectAnswer
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: isCorrectAnswer
                                    ? colorScheme.primary
                                    : colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
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

// The Shared Certificate (The Pride)
// If the user scores above 80%, they get the Gold Certificate.
// Below that, they get a Completion Certificate.

class CertificateView extends StatefulWidget {
  final int score;
  final int total;

  const CertificateView({super.key, required this.score, required this.total});

  @override
  State<CertificateView> createState() => _CertificateViewState();
}

class _CertificateViewState extends State<CertificateView> {
  final ScreenshotController screenshotController = ScreenshotController();
  bool isSharing = false;

  void _shareCertificate() async {
    setState(() => isSharing = true);
    try {
      final image = await screenshotController.capture(delay: const Duration(milliseconds: 10));
      if (image == null) return;
      
      final directory = await getTemporaryDirectory();
      final imagePath = await File('${directory.path}/certificate.png').create();
      await imagePath.writeAsBytes(image);

      final percentage = (widget.score / widget.total) * 100;
      await Share.shareXFiles(
        [XFile(imagePath.path)],
        text: 'I just scored ${percentage.toStringAsFixed(0)}% on the Perfect English Final Exam!',
      );
    } catch (e) {
      debugPrint('Error sharing certificate: $e');
    } finally {
      if (mounted) setState(() => isSharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SoundService.playAchievement();
    double percentage = (widget.score / widget.total) * 100;
    
    final now = DateTime.now();
    final months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    final todayDate = '${months[now.month - 1]} ${now.day}, ${now.year}';

    return Stack(
      children: [
        Theme(
          data: ThemeData(),
          child: Scaffold(
            backgroundColor: Colors.indigo.shade900,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Screenshot(
                          controller: screenshotController,
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDFBF7),
                                border: Border.all(color: Colors.amber.shade700, width: 8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Watermark
                                  Opacity(
                                    opacity: 0.08,
                                    child: Image.asset(
                                      'assets/images/perfect_english_logo.png',
                                      width: 250,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/perfect_english_logo.png', 
                                          height: 70,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.school, size: 70, color: Colors.indigo),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          "CERTIFICATE OF MERIT",
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontFamily: 'serif',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo.shade900,
                                            letterSpacing: 2,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 15),
                                        const Text(
                                          "This is proudly presented to the user of",
                                          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "PERFECT ENGLISH APP",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber,
                                            letterSpacing: 1.5,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          "For successfully mastering English Grammar\nwith an outstanding score of:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          "${percentage.toStringAsFixed(0)}%",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo.shade800,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "Awarded on $todayDate",
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                                        ),
                                        const SizedBox(height: 30),
                                        // Signatures
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Container(width: 80, height: 1, color: Colors.black),
                                                const SizedBox(height: 5),
                                                const Text("Director", style: TextStyle(fontSize: 12, color: Colors.black87)),
                                              ],
                                            ),
                                            const Icon(Icons.verified, size: 50, color: Colors.amber),
                                            Column(
                                              children: [
                                                Container(width: 80, height: 1, color: Colors.black),
                                                const SizedBox(height: 5),
                                                const Text("Instructor", style: TextStyle(fontSize: 12, color: Colors.black87)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: isSharing ? null : _shareCertificate,
                        icon: isSharing ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.share),
                        label: Text(isSharing ? "Preparing..." : "Share Your Achievement"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Confetti / Balloons
        ...List.generate(12, (_) => const Balloon(color: Colors.pink)),
        const Firework(),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}

class FailedView extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRetry;

  const FailedView({super.key, required this.score, required this.total, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    double percentage = (score / total) * 100;

    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                "Keep Learning!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "You scored ${percentage.toStringAsFixed(0)}%.",
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
              const SizedBox(height: 10),
              const Text(
                "You need at least 80% to earn the Certificate of Merit.\nReview the lessons and try again!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text("Retry Exam"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Home", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
🚀 Big Improvements for "Perfect English":
Level-Based Rewards: Instead of a generic certificate,
the certificate should dynamically list the specific Advanced topics they passed
(e.g., "Master of Inversion and Reported Speech").

Sound Effects: Add a "Success Chime" for correct answers and a "Victory Fanfare"
when the certificate is revealed.

Global Leaderboard: You could implement a Firebase backend to show
how the user ranks compared to other learners in Myanmar.

Badges: Unlock digital badges like "Tense Wizard," "Passive Pro," and "Advanced Scholar"
as they progress through the quiz.
*/

class Firework extends StatefulWidget {
  const Firework({super.key});

  @override
  State<Firework> createState() => _FireworkState();
}

class _FireworkState extends State<Firework>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        double r = controller.value * 120;

        return Stack(
          children: List.generate(12, (i) {
            double angle = i * 30 * pi / 180;

            return Positioned(
              left: 200 + cos(angle) * r,
              top: 200 + sin(angle) * r,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class Sparkle extends StatefulWidget {
  const Sparkle({super.key});

  @override
  State<Sparkle> createState() => _SparkleState();
}

class _SparkleState extends State<Sparkle> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.5, end: 1.4).animate(controller),
      child: const Icon(Icons.star, color: Colors.amber, size: 25),
    );
  }
}

class Balloon extends StatefulWidget {
  final Color color;

  const Balloon({super.key, required this.color});

  @override
  State<Balloon> createState() => _BalloonState();
}

class _BalloonState extends State<Balloon> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final double startLeft = Random().nextDouble() * 1000;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4 + Random().nextInt(3)),
    )..repeat();

    animation = Tween(begin: 1.2, end: -0.2).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        return Positioned(
          bottom: MediaQuery.of(context).size.height * animation.value,
          left: startLeft,
          child: child!,
        );
      },
      child: Column(
        children: [
          Container(
            width: 30,
            height: 40,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(width: 2, height: 20, color: Colors.grey),
        ],
      ),
    );
  }
}

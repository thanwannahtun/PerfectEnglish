import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfect_english/services/sound_service.dart';

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

  final List<Map<String, dynamic>> masterQuestions = [
    // Basic
    {
      'q': 'Choose the correct Article: "I saw ___ elephant at the zoo."',
      'options': ['a', 'an', 'the', 'no article'],
      'answer': 'an',
      'level': 'Basic',
    },
    // Intermediate
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
    // Advanced
    {
      'q': 'Inversion: "I have never seen such a beautiful sunset."',
      'options': [
        'Never I have seen such a sunset.',
        'Never seen have I such a sunset.',
        'Never have I seen such a sunset.',
        'Never saw I such a sunset.',
      ],
      'answer': 'Never have I seen such a sunset.',
      'level': 'Advanced',
    },
    // Add 20-50 more questions here...
  ];

  void checkAnswer(String selected) {
    if (selected == masterQuestions[currentQuestionIndex]['answer']) {
      score++;
    }

    if (currentQuestionIndex < masterQuestions.length - 1) {
      setState(() => currentQuestionIndex++);
    } else {
      setState(() => quizCompleted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      return CertificateView(score: score, total: masterQuestions.length);
    }

    final currentQ = masterQuestions[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / masterQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Certification Exam"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(value: progress, color: Colors.amber),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: Column(
          children: [
            Chip(
              label: Text(currentQ['level']),
              backgroundColor: Colors.indigo[100],
            ),
            const SizedBox(height: 20),
            Text(
              "Question ${currentQuestionIndex + 1}/${masterQuestions.length}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              currentQ['q'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...(currentQ['options'] as List<String>).map(
              (opt) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => checkAnswer(opt),
                    child: Text(
                      opt,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
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

class CertificateView extends StatelessWidget {
  final int score;
  final int total;

  const CertificateView({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    SoundService.playAchievement();
    double percentage = (score / total) * 100;
    bool isExcellent = percentage >= 80;

    return Stack(
      children: [
        Theme(
          data: ThemeData(),
          child: Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo.shade900, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber, width: 8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.verified, size: 80, color: Colors.amber),
                      const SizedBox(height: 20),
                      const Text(
                        "CERTIFICATE OF MERIT",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 20),
                      const Text(
                        "This is to certify that the user of",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Text(
                        "PERFECT ENGLISH APP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Has successfully mastered English Grammar including",
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "TENSES, PASSIVE VOICE, & INVERSION",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Final Score: $percentage%",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: isExcellent ? Colors.green : Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Date: February 24, 2026",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          /* Add screenshot share logic here */
                        },
                        icon: const Icon(Icons.share),
                        label: const Text("Share Your Achievement"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // certificate UI
        ...List.generate(12, (_) => const Balloon(color: Colors.pink)),
        const Firework(),
        Positioned(
          top: 25,
          left: 25,
          child: IconButton.outlined(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ),
      ],
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

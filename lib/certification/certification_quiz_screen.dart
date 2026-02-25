import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Final Certification Exam"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(value: progress, color: Colors.amber),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.indigo),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => checkAnswer(opt),
                    child: Text(
                      opt,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.indigo,
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
    double percentage = (score / total) * 100;
    bool isExcellent = percentage >= 80;

    return Scaffold(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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

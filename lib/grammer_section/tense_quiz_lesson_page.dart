import 'package:flutter/material.dart';

class QuizLessonPage extends StatefulWidget {
  final List<dynamic> quizData;
  final String tenseTitle;

  const QuizLessonPage({
    super.key,
    required this.quizData,
    required this.tenseTitle,
  });

  @override
  State<QuizLessonPage> createState() => _QuizLessonPageState();
}

class _QuizLessonPageState extends State<QuizLessonPage> {
  int currentIdx = 0;
  int score = 0;
  bool? isCorrect;
  String? selectedOption;

  void checkAnswer(String answer) {
    if (selectedOption != null) return; // Prevent double clicking

    setState(() {
      selectedOption = answer;
      isCorrect = (answer == widget.quizData[currentIdx]['a']);
      if (isCorrect!) score++;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (currentIdx < widget.quizData.length - 1) {
        setState(() {
          currentIdx++;
          selectedOption = null;
          isCorrect = null;
        });
      } else {
        showResultDialog();
      }
    });
  }

  void showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed! 🎉"),
        content: Text("You scored $score out of ${widget.quizData.length}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Finish"),
          ),
        ],
      ),
    ).then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quizData[currentIdx];

    return Scaffold(
      appBar: AppBar(title: Text("${widget.tenseTitle} Practice")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentIdx + 1) / widget.quizData.length,
            ),
            const SizedBox(height: 30),
            // Type Tag
            Chip(
              label: Text(quiz['type'] ?? 'Practice'),
              // backgroundColor: Colors.indigo.shade50,
            ),
            const SizedBox(height: 16),
            // Question
            Text(
              quiz['q'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              quiz['mm'],
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
            // Options
            ...(quiz['options'] as List).map((opt) {
              Color color = Theme.of(context).colorScheme.surface;
              Color textColor = Theme.of(
                context,
              ).colorScheme.onPrimaryContainer;
              if (selectedOption == opt) {
                color = isCorrect!
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onError;
                textColor = isCorrect!
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : Theme.of(context).colorScheme.onPrimaryContainer;
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => checkAnswer(opt),
                  child: Text(
                    opt,
                    style: TextStyle(fontSize: 18, color: textColor),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            if (isCorrect != null)
              Text(
                isCorrect! ? "✅ Correct!" : "❌ Wrong. Answer: ${quiz['a']}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isCorrect! ? Colors.green : Colors.red,
                ),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

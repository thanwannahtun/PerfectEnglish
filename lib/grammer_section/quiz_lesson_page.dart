import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../services/sound_service.dart';

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

// ... imports stay the same

class _QuizLessonPageState extends State<QuizLessonPage> {
  int currentIdx = 0;
  int score = 0;
  bool? isCorrect;
  String? selectedOption;
  Timer? _nextPageTimer;

  void checkAnswer(String answer) {
    if (selectedOption != null) return;

    final String correctAnswer = widget.quizData[currentIdx]['a'];

    setState(() {
      selectedOption = answer;
      isCorrect = (answer == correctAnswer);

      if (isCorrect!) {
        SoundService.playCorrect();
        score++;
      } else {
        SoundService.playWrong();
      }
    });

    // Dynamic delay: Longer delay if wrong so they can study the correct answer
    int delaySeconds = isCorrect! ? 1 : 3;

    _nextPageTimer = Timer(Duration(seconds: delaySeconds), () {
      if (mounted) {
        if (currentIdx < widget.quizData.length - 1) {
          setState(() {
            currentIdx++;
            selectedOption = null;
            isCorrect = null;
          });
        } else {
          showResultDialog();
        }
      }
    });
  }

  // ... dispose and navigation methods
  @override
  void dispose() {
    _nextPageTimer?.cancel(); // Clean up timer on exit
    super.dispose();
  }

  void goToPrevious() {
    _nextPageTimer?.cancel(); // Stop the auto-next timer immediately
    if (currentIdx > 0) {
      setState(() {
        currentIdx--;
        // We keep the selectedOption and isCorrect from the previous state
        // if you want them to see their old answer, but usually,
        // we reset it or let it stay "frozen" for review.
        selectedOption = null;
        isCorrect = null;
      });
    }
  }

  void showResultDialog() {
    SoundService.playAchievement();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          "Quiz Completed! 🎉",
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
    if (widget.quizData.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("လေ့ကျင့်ခန်းများ မရှိသေးပါ")),
        body: Center(child: Lottie.asset("assets/lottie/no-data.json")),
      );
    }

    final quiz = widget.quizData[currentIdx];

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.tenseTitle} Practice"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
            LinearProgressIndicator(
              value: (currentIdx + 1) / widget.quizData.length,
            ),
            const SizedBox(height: 10),
            Text(
              "Question ${currentIdx + 1}/${widget.quizData.length}",
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Chip(label: Text(quiz['type'] ?? 'Practice')),
            const SizedBox(height: 16),
            Text(
              quiz['q'] ?? "-",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              quiz['mm'] ?? "-",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),

            // Options List
            // Inside build -> Column
            ...((quiz['options'] ?? []) as List).map((opt) {
              final String correctAnswer = quiz['a'];
              bool isSelected = (selectedOption == opt);
              bool isCorrectAnswer = (opt == correctAnswer);
              bool showFeedback = (selectedOption != null);

              // Define colors based on state
              Color backgroundColor = Theme.of(context).colorScheme.surface;

              Color borderColor = Colors.grey.shade300;
              Color textColor = Theme.of(context).colorScheme.onSurface;

              if (showFeedback) {
                if (isCorrectAnswer) {
                  backgroundColor = Theme.of(context).colorScheme.onSurface;
                  borderColor = Colors.green;
                  textColor = Colors.green.shade900;
                } else if (isSelected) {
                  backgroundColor = Theme.of(context).colorScheme.onSurface;
                  borderColor = Colors.red;
                  textColor = Colors.red.shade900;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  // Use GestureDetector for custom feedback
                  onTap: () => checkAnswer(opt),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: borderColor.withOpacity(0.3),
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ),
                        // Animated Fade-in for the Icons
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity:
                              showFeedback && (isCorrectAnswer || isSelected)
                              ? 1.0
                              : 0.0,
                          child: Icon(
                            isCorrectAnswer ? Icons.check_circle : Icons.cancel,
                            color: isCorrectAnswer ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            const Spacer(),

            // Navigation Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIdx > 0)
                  TextButton.icon(
                    onPressed: goToPrevious,
                    icon: const Icon(Icons.navigate_before),
                    label: const Text("Previous"),
                  )
                else
                  const SizedBox.shrink(),

                // Optional: You could add a manual "Next" button here
                // if they want to skip the 2-second wait.
              ],
            ),
          ],
        ),
      ),
    );
  }
}

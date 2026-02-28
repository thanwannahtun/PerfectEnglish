import 'dart:async';
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

    // Dynamic delay: slightly longer if wrong so they can study the correct answer
    final delayMs = isCorrect! ? 900 : 2000;

    _nextPageTimer = Timer(Duration(milliseconds: delayMs), () {
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
        selectedOption = null;
        isCorrect = null;
      });
    }
  }

  void showResultDialog() {
    SoundService.playLevelUpgrade();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                backgroundImage: AssetImage(
                  'assets/images/perfect_english_logo.png',
                ),
                radius: 25,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Quiz Completed!",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You scored $score out of ${widget.quizData.length}",
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.stars_rounded, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Keep practicing with Perfect English!",
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Finish"),
            ),
          ],
        );
      },
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

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
              backgroundColor: colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(quiz['type'] ?? 'Practice'),
                  backgroundColor: colorScheme.secondaryContainer,
                  labelStyle: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                Text(
                  "Question ${currentIdx + 1}/${widget.quizData.length}",
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
                quiz['q'] ?? "-",
                key: ValueKey(quiz['q']),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: Text(
                quiz['mm'] ?? "-",
                key: ValueKey(quiz['mm']),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
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
              // Color backgroundColor = colorScheme.surface;
              Color backgroundColor = colorScheme.onPrimary;
              Color borderColor = colorScheme.outline.withOpacity(0.3);
              Color textColor = colorScheme.onSurface;

              if (showFeedback) {
                if (isCorrectAnswer) {
                  backgroundColor = colorScheme.primaryContainer;
                  borderColor = colorScheme.primary;
                  textColor = colorScheme.onPrimaryContainer;
                } else if (isSelected) {
                  backgroundColor = colorScheme.errorContainer;
                  borderColor = colorScheme.error;
                  textColor = colorScheme.onErrorContainer;
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

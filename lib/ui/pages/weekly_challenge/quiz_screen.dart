import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/ui/pages/weekly_challenge/result_screen.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../model/weekly_challenge_model.dart';

class QuizScreen extends StatefulWidget {
  final WeeklyChallenge weeklyChallenge;

  QuizScreen({required this.weeklyChallenge});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizCompleted = false;
  Map<int, String?> selectedAnswers = {}; // Store selected answers
  int remainingTime = 30;

  // Method to handle answer selection
  void selectAnswer(String selectedOption) {
    final currentQuestion =
        widget.weeklyChallenge.quizQuestions[currentQuestionIndex];

    if (selectedOption == currentQuestion.correctAnswer) {
      setState(() {
        score += currentQuestion.points;
      });
    }

    setState(() {
      selectedAnswers[currentQuestionIndex] = selectedOption;
      if (currentQuestionIndex <
          widget.weeklyChallenge.quizQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        quizCompleted = true;
        Get.to(
          ResultsScreen(
            score: score,
            quizQuestions: widget.weeklyChallenge.quizQuestions,
            totalPoints: widget.weeklyChallenge.pointsForCompletion,
          ),
        );
      }
    });
  }

  String getScoreText() {
    return 'Total Score: $score/${widget.weeklyChallenge.quizQuestions.fold(0, (sum, q) => sum + q.points)}';
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        widget.weeklyChallenge.quizQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weekly Quiz", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColorLight,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: !quizCompleted,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColorLight,
              AppColor.primaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) /
                      widget.weeklyChallenge.quizQuestions.length,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  color: Colors.white,
                ),
                16.rVerticalSizedBox(),
                Text(
                  "Question ${currentQuestionIndex + 1} of ${widget.weeklyChallenge.quizQuestions.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                12.rVerticalSizedBox(),
                Text(currentQuestion.question,
                    style: AppTextStyles.textStyleBlack16With400
                        .copyWith(color: AppColor.whiteColor)),
                16.rVerticalSizedBox(),
                for (var option in currentQuestion.options)
                  ElevatedButton(
                    onPressed: () => selectAnswer(option),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedAnswers[currentQuestionIndex] == option
                              ? Colors.green
                              : Colors.white,
                      foregroundColor:
                          selectedAnswers[currentQuestionIndex] == option
                              ? Colors.white
                              : AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                    ),
                    child: Text(option,
                        style: AppTextStyles.textStylePrimary14With600),
                  ).paddingVertical8(),
                24.rVerticalSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

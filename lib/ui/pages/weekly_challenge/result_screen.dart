import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Routing/route_names.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_text_styles.dart';
import '../../../model/weekly_challenge_model.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalPoints;
  final List<QuizQuestion> quizQuestions;

  const ResultsScreen(
      {super.key,
      required this.score,
      required this.quizQuestions,
      required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColorLight,
        centerTitle: true,
        elevation: 0,
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
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.reward1, // Replace with your image path
                  height: 100,
                  width: 100,
                ),
                8.rVerticalSizedBox(),
                Text('Points Earned: $score / $totalPoints',
                    style: AppTextStyles.textStyleWhite18With600),
                16.rVerticalSizedBox(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Correct Answers:',
                      style: AppTextStyles.textStyleWhite16With500),
                ),
                2.rVerticalSizedBox(),
                ListView.builder(
                  itemCount: quizQuestions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final question = quizQuestions[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Q${index + 1}: ${question.question}',
                              style: AppTextStyles.textStyleBlack14With700),
                          4.rVerticalSizedBox(),
                          Text('Answer: ${question.correctAnswer}',
                              style: AppTextStyles.textStyleBlack14With400),
                        ],
                      ).paddingAll16(),
                    );
                  },
                ),
                8.rVerticalSizedBox(),
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(dashboardViewRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                    ),
                    child: Text("Back to Home",
                            style: AppTextStyles.textStylePrimary14With600
                                .copyWith(fontWeight: FontWeight.w700))
                        .paddingHorizontal8(),
                  ).paddingVertical8(),
                ),
                32.rVerticalSizedBox()
              ],
            ).paddingHorizontal24(),
          ),
        ),
      ),
    );
  }
}

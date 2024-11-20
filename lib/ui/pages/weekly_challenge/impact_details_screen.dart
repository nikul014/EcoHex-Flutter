import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/app_theme.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/ui/pages/weekly_challenge/quiz_screen.dart';
import 'package:eco_challenge/ui/widgets/base_button.dart';
import 'package:eco_challenge/ui/widgets/base_common_widget.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/weekly_challenge_model.dart';

class ImpactDetailScreen extends StatefulWidget {
  WeeklyChallenge weeklyChallenge;

  ImpactDetailScreen({super.key, required this.weeklyChallenge});

  @override
  _ImpactDetailScreenState createState() => _ImpactDetailScreenState();
}

class _ImpactDetailScreenState extends State<ImpactDetailScreen>
    with BaseCommonWidget {
  int currentPageIndex = 0;

  // Method to navigate to the next impact detail
  void nextPage() {
    if (currentPageIndex < widget.weeklyChallenge.impactDetails.length - 1) {
      setState(() {
        currentPageIndex++;
      });
    } else {
      Get.to(() => QuizScreen(weeklyChallenge: widget.weeklyChallenge));
    }
  }

  // Method to navigate to the previous impact detail
  void previousPage() {
    if (currentPageIndex > 0) {
      setState(() {
        currentPageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the current impact detail
    final currentImpact =
        widget.weeklyChallenge.impactDetails[currentPageIndex];

    return Scaffold(
      appBar:
          AppBar(title: Text(widget.weeklyChallenge.title), centerTitle: true),
      body: Container(
        decoration: AppTheme.boxDecorationPrimaryCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: loadCachedNetworkImage(
                imageUrl: currentImpact.image,
                height: 200,
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
            16.rVerticalSizedBox(),
            Text(
              currentImpact.pageTitle,
              style: AppTextStyles.textStyleBlack16With700,
            ),
            12.rVerticalSizedBox(),
            Expanded(
              child: Container(
                decoration: AppTheme.boxDecorationPrimaryCard,
                child: SingleChildScrollView(
                  child: Text(
                    currentImpact.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ).paddingAll16(),
                ),
              ),
            ),
            4.rVerticalSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                        text: 'Previous',
                        isWrapWidth: true,
                        onSubmit: previousPage)
                    .visibleWhen(isVisible: currentPageIndex != 0),
                BaseButton(text: 'Next', isWrapWidth: true, onSubmit: nextPage),
              ],
            ).paddingVertical8(),
          ],
        ).paddingHorizontal8().paddingUpSide816(),
      ),
    );
  }
}

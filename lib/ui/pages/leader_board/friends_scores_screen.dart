import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_theme.dart';

class FriendsScoresScreen extends StatelessWidget {
  final List<Map<String, dynamic>> friends = [
    {"name": "John Doe", "points": 200},
    {"name": "Jane Smith", "points": 250},
    {"name": "Chris Lee", "points": 180},
    {"name": "Amy Turner", "points": 300},
  ];

  @override
  Widget build(BuildContext context) {
    friends.sort((a, b) => b["points"].compareTo(a["points"]));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Scores'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: friends.length,
          itemBuilder: (context, index) {
            final rank = index + 1;
            return Container(
              decoration: AppTheme.boxDecorationPrimaryCard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Rank icon and number
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "#$rank",
                          style: AppTextStyles.textStyleWhite14With600,
                        ),
                      ),
                      8.rHorizontalSizedBox(),
                      Text(
                        friends[index]["name"],
                        style: AppTextStyles.textStyleBlack16With700,
                      ),
                    ],
                  ),
                  6.rVerticalSizedBox(),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          size: 16, color: AppColor.yellowColor),
                      4.rHorizontalSizedBox(),
                      Text(
                        "Points Earned: ${friends[index]["points"]}",
                        style: AppTextStyles.textStyleBlackTwo14With400,
                      ),
                    ],
                  ),
                  4.rVerticalSizedBox(),
                ],
              ).paddingAll12(),
            ).paddingVertical4();
          },
        ),
      ),
    );
  }
}

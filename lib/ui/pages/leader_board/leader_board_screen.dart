import 'package:eco_challenge/constants/app_colors.dart';
import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For formatting the date

import '../../../constants/app_icons.dart';
import '../../../constants/app_theme.dart';
import '../redeem_rewards/redeem_rewards.dart';
import 'friends_scores_screen.dart';

class LeaderboardScreen extends StatelessWidget {
  final int myRank = 5; // Example rank
  final int totalPoints = 780; // Example total points
  final List<Map<String, dynamic>> recentPoints = [
    {
      "points": 100,
      "title": "Plastic Recycling Event",
      "date": DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      "points": 150,
      "title": "Plant Grow Challenge",
      "date": DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      "points": 200,
      "title": "Weekly Health Challenge",
      "date": DateTime.now().subtract(const Duration(days: 3)),
    },
    {
      "points": 250,
      "title": "Energy Saving Initiative",
      "date": DateTime.now().subtract(const Duration(days: 4)),
    },
    {
      "points": 300,
      "title": "Mindful Living Workshop",
      "date": DateTime.now().subtract(const Duration(days: 5)),
    },
  ];

  // Function to format date into a more readable format
  String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  void navigateToFriendsScores(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FriendsScoresScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Rank',
                        style: AppTextStyles.textStyleBlack12With400,
                      ),
                      Text("#$myRank",
                          style: AppTextStyles.textStyleBlack18With700),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    AppIcons.reward2, // Replace with your image path
                    height: 120,
                    width: 120,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Balance',
                        style: AppTextStyles.textStyleBlack12With400,
                      ),
                      Text("$totalPoints Points",
                          style: AppTextStyles.textStyleBlack18With700),
                    ],
                  ),
                ),
              ],
            ),
            2.rVerticalSizedBox(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Spacing buttons evenly
              children: [
                // Button to Convert Points to Reward
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Get.to(() => RedeemRewardsScreen());
                    },
                    icon: const Icon(
                      Icons.local_offer, // Icon for reward conversion
                      color: AppColor.primaryColor,
                      size: 16,
                    ),
                    label: Text(
                      "Redeem Rewards",
                      style: AppTextStyles.textStylePrimary14With600,
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: const BorderSide(
                          color: AppColor.primaryColor, width: 1),
                    ),
                  ),
                ),

                6.rHorizontalSizedBox(),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Get.to(() => FriendsScoresScreen());
                    },
                    icon: const Icon(
                      Icons.group, // Icon for friends' scores
                      size: 16,
                      color: AppColor.primaryColor,
                    ),
                    label: Text(
                      "Community Scores",
                      style: AppTextStyles.textStylePrimary14With600,
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: const BorderSide(
                          color: AppColor.primaryColor, width: 1),
                    ),
                  ),
                ),
              ],
            ),
            12.rVerticalSizedBox(),
            // Recent Points Earned Title
            Text(
              "Points History",
              style: AppTextStyles.textStylePrimary14With600
                  .copyWith(fontWeight: FontWeight.w700),
            ).paddingHorizontal8(),
            8.rVerticalSizedBox(),
            // Recent Points List
            ListView.builder(
              shrinkWrap: true,
              itemCount: recentPoints.length,
              itemBuilder: (context, index) {
                final point = recentPoints[index];
                return Container(
                  decoration: AppTheme.boxDecorationPrimaryCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(point["title"],
                          style: AppTextStyles.textStyleBlack16With700),
                      4.rVerticalSizedBox(),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              size: 16, color: AppColor.yellowColor),
                          4.rHorizontalSizedBox(),
                          Text(
                            "Points Earned: ${point["points"]}",
                            style: AppTextStyles.textStyleBlackTwo12With400,
                          ),
                        ],
                      ),
                      4.rVerticalSizedBox(),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 16, color: AppColor.primaryColor),
                          4.rHorizontalSizedBox(),
                          Text(
                            "Date: ${formatDate(point["date"])}",
                            style: AppTextStyles.textStyleBlackTwo12With400,
                          ),
                        ],
                      ),
                      3.rVerticalSizedBox(),
                    ],
                  ).paddingAll12(),
                ).paddingVertical4();
              },
            ).paddingHorizontal4(),
          ],
        ).paddingHorizontal16(),
      ),
    );
  }
}

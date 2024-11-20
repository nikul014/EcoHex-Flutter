import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_text_styles.dart';
import '../../../constants/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      "name": "Nikul Kukadiya",
      "role": "Lead Developer",
      "profileImage":
          "assets/images/nikul.jpg", // Replace with actual image paths
    },
    {
      "name": "Ashish Bhasin",
      "role": "Idea and Vision",
      "profileImage":
          "assets/images/ashish.jpg", // Replace with actual image paths
    },
    {
      "name": "Kavya Bhojani",
      "role": "UI/UX Designer",
      "profileImage":
          "assets/images/kavya.jpg", // Replace with actual image paths
    },
    {
      "name": "Meer Patel",
      "role": "Backend Developer",
      "profileImage":
          "assets/images/meer.jpg", // Replace with actual image paths
    },
    {
      "name": "Purshotham Parthy",
      "role": "Legal matters",
      "profileImage":
          "assets/images/purshotham.jpg", // Replace with actual image paths
    },
    {
      "name": "Raj Patel",
      "role": "Quality Analyst",
      "profileImage":
          "assets/images/raj.jpg", // Replace with actual image paths
    },
  ];
// Function to get the initials of the name
  String _getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = "";
    for (String part in nameParts) {
      initials += part.isNotEmpty ? part[0] : '';
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eco Challenge App",
                style: AppTextStyles.textStyleBlack22With700,
              ),
              8.rVerticalSizedBox(),
              Text(
                "The Eco Challenge app was created with a passion to help people contribute towards a more sustainable future. Our goal is to engage individuals in eco-friendly activities and reward them for making a positive impact on the environment. This app allows users to participate in various challenges, earn points, and redeem them for sustainable rewards.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              16.rVerticalSizedBox(),

              // Team Section
              Text(
                "Meet the Team",
                style: AppTextStyles.textStyleBlack18With700,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: AppTheme.boxDecorationPrimaryCard,
                    child: Row(
                      children: [
                        // Profile Image
                        CircleAvatar(
                          radius: 24,
                          child: Text(
                              _getInitials(teamMembers[index]["name"] ?? ''),
                              style: AppTextStyles.textStyleWhite14With700),
                        ),
                        8.rHorizontalSizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teamMembers[index]["name"]!,
                              style: AppTextStyles.textStyleBlack16With700,
                            ),
                            Text(
                              teamMembers[index]["role"]!,
                              style: AppTextStyles.textStyleBlackTwo14With400,
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll12(),
                  ).paddingAllDefault();
                },
              ),
              16.rVerticalSizedBox(),
              Text(
                "Started: September 2024",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              4.rVerticalSizedBox(),

              Text(
                "© 2024 Eco Challenge. All rights reserved.",
                style: AppTextStyles.textStyleBlack12With400,
              ),
              SizedBox(height: 8),
              Text(
                "The idea and development of Eco Challenge are owned by the project team listed above. Any use or reproduction of the application for commercial purposes without permission is strictly prohibited.",
                style: AppTextStyles.textStyleBlack12With400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

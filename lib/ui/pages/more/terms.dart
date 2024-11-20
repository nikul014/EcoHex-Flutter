import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_text_styles.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and description
            Text(
              "Eco Challenge - Terms & Conditions",
              style: AppTextStyles.textStyleBlack22With700,
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to Eco Challenge! Please read these Terms and Conditions carefully before using our services.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 24),

            // Terms content
            Text(
              "1. Introduction",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "By using the Eco Challenge app, you agree to be bound by the terms and conditions outlined below. If you do not agree, please do not use the services.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "2. Eligibility",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "To participate in the Eco Challenge, you must be at least 18 years old. If you are under 18, you must have the consent of a parent or legal guardian to participate.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "3. Points and Rewards",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "Points can be earned through challenges, tasks, and other activities within the app. These points can be redeemed for rewards from our eco-conscious brand partners. Points cannot be transferred or exchanged for cash.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "4. User Responsibilities",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "You are responsible for ensuring that your account information is accurate and up-to-date. You must not share your login credentials with others, and you are solely responsible for all activities that occur under your account.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "5. Prohibited Activities",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "You agree not to engage in any activities that may harm the app or its users, including but not limited to spamming, cheating, or attempting to manipulate the points system.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "6. Privacy Policy",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "We respect your privacy and are committed to protecting your personal data. For more information, please review our Privacy Policy.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "7. Modifications to the Terms",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "We reserve the right to modify or update these Terms and Conditions at any time. All changes will be communicated through the app, and it is your responsibility to review them regularly.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 16),

            Text(
              "8. Contact Us",
              style: AppTextStyles.textStyleBlack18With700,
            ),
            SizedBox(height: 8),
            Text(
              "If you have any questions or concerns regarding these Terms and Conditions, please contact us at support@ecochallenge.com.",
              style: AppTextStyles.textStyleBlack14With400,
            ),
            SizedBox(height: 24),

            // Footer with a disclaimer
            Divider(),

            16.rVerticalSizedBox(),
            Text(
              "By using this app, you acknowledge that you have read, understood, and agree to these Terms and Conditions.",
              style: AppTextStyles.textStyleBlack12With400,
            ),
            16.rVerticalSizedBox()
          ],
        ).paddingHorizontal24(),
      ),
    );
  }
}

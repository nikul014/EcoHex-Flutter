import 'package:flutter/material.dart';

import '../../../constants/app_text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Privacy Policy Title
              Text(
                "Privacy Policy",
                style: AppTextStyles.textStyleBlack22With700,
              ),
              SizedBox(height: 16),
              Text(
                "Effective Date: January 2024",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 16),

              // Privacy Policy Content
              Text(
                "We at Eco Challenge respect your privacy and are committed to protecting your personal data. This Privacy Policy outlines the types of information we collect, how we use it, and how we protect it.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Information Collection Section
              Text(
                "1. Information We Collect",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "When you use Eco Challenge, we may collect the following types of information:\n"
                "- Personal information such as name, email address, and phone number.\n"
                "- Usage data, including your activity on the app, interactions with the challenges, and other in-app actions.\n"
                "- Device information, including the device you use to access the app, operating system, and app version.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Information Usage Section
              Text(
                "2. How We Use Your Information",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "We use the information we collect to:\n"
                "- Improve the user experience and app functionality.\n"
                "- Provide personalized content and recommendations.\n"
                "- Process your participation in challenges and rewards.\n"
                "- Send you notifications about updates, challenges, or rewards.\n"
                "- Ensure the security and integrity of the app.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Data Sharing Section
              Text(
                "3. Data Sharing",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "We do not sell or rent your personal data to third parties. However, we may share your data in the following circumstances:\n"
                "- With service providers and partners who assist in app operations.\n"
                "- If required by law, such as in response to a court order or legal process.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Data Protection Section
              Text(
                "4. Data Protection",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "We take reasonable steps to protect your personal data. These include:\n"
                "- Implementing encryption to protect data in transit.\n"
                "- Using secure servers to store your information.\n"
                "- Limiting access to your data to authorized personnel only.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // User Rights Section
              Text(
                "5. Your Rights",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "You have the right to:\n"
                "- Access your personal data.\n"
                "- Correct or update your information.\n"
                "- Request the deletion of your data.\n"
                "- Opt-out of receiving marketing communications.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Changes to Privacy Policy Section
              Text(
                "6. Changes to This Privacy Policy",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "We may update this Privacy Policy from time to time. If we make significant changes, we will notify you through the app or by email. Please review this policy periodically to stay informed about how we are protecting your data.",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Contact Information Section
              Text(
                "7. Contact Us",
                style: AppTextStyles.textStyleBlack16With700,
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions or concerns about this Privacy Policy, please contact us at:\n"
                "Email: support@eco-challenge.com\n"
                "Phone: +1-782-882-8273",
                style: AppTextStyles.textStyleBlack14With400,
              ),
              SizedBox(height: 24),

              // Copyright and Ownership Information
              Divider(),
              SizedBox(height: 8),
              Text(
                "© 2024 Eco Challenge. All rights reserved.",
                style: AppTextStyles.textStyleBlack12With400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

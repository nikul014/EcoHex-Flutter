import 'package:eco_challenge/constants/app_theme.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class RedeemRewardsScreen extends StatelessWidget {
  final int myPoints = 780; // Example points for the user

  final List<Map<String, dynamic>> rewards = [
    {
      "title": "10% Off on Nike Eco-Friendly Products",
      "pointsRequired": 100,
      "description": "Get 10% off on Nike's sustainable product range.",
      "brand": "Nike", // Brand name
    },
    {
      "title": "\$20 Off Patagonia Gear",
      "pointsRequired": 200,
      "description": "Get \$20 off on Patagonia's eco-friendly gear.",
      "brand": "Patagonia", // Brand name
    },
    {
      "title": "Free Gift with Organic Cotton T-shirt",
      "pointsRequired": 300,
      "description": "Get a free organic cotton T-shirt from Levi's.",
      "brand": "Levi's", // Brand name
    },
    {
      "title": "Free Shipping on All Eco-Friendly Products",
      "pointsRequired": 150,
      "description":
          "Enjoy free shipping on all sustainable products from Adidas.",
      "brand": "Adidas", // Brand name
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redeem Rewards'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display available points at the top
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star,
                size: 26,
                color: AppColor.primaryColor,
              ),
              4.rHorizontalSizedBox(),
              Text(
                "Balance: $myPoints Points",
                style: AppTextStyles.textStyleBlack18With700.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ).paddingHorizontal4(),
          16.rVerticalSizedBox(),
          Expanded(
            child: ListView.builder(
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];

                // If the user has enough points, they can redeem the reward
                bool canRedeem = myPoints >= reward["pointsRequired"];

                return Container(
                  decoration: AppTheme.boxDecorationPrimaryCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reward title
                      Text(
                        reward["title"],
                        style: AppTextStyles.textStyleBlack16With700,
                      ),
                      4.rVerticalSizedBox(),
                      Text(
                        "Brand: ${reward['brand']}",
                        style: AppTextStyles.textStyleBlackTwo12With400,
                      ),
                      2.rVerticalSizedBox(),
                      Text(
                        reward["description"],
                        style: AppTextStyles.textStyleBlackTwo12With400,
                      ),
                      4.rVerticalSizedBox(),

                      Row(
                        children: [
                          Text(
                            "Required Points: ${reward["pointsRequired"]}",
                            style: AppTextStyles.textStyleBlack14With700,
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: canRedeem
                                ? () {
                                    // Logic for redeeming the reward
                                    // Show a confirmation dialog or process redemption
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Reward redeemed! You will receive the coupon details on registered email.'),
                                      ),
                                    );
                                  }
                                : null, // Disable button if not enough points
                            icon: const Icon(
                              Icons.local_offer, // Icon for reward conversion
                              color: AppColor.primaryColor,
                              size: 16,
                            ),
                            label: Text(
                              canRedeem ? "Redeem" : "Not Enough Points",
                              style: AppTextStyles.textStylePrimary14With600,
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: const BorderSide(
                                  color: AppColor.primaryColor, width: 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll16(),
                ).paddingAllDefault();
              },
            ),
          ),
        ],
      ).paddingHorizontal16(),
    );
  }
}

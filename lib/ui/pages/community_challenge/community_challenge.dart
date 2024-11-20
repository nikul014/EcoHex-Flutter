import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/ui/widgets/base_common_widget.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_theme.dart';
import '../../../data_handler/data_constants.dart';
import 'community_challenge_detail.dart';

class CommunityChallengesScreen extends StatelessWidget with BaseCommonWidget {
  CommunityChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Challenges')),
      body: ListView.builder(
        itemCount: DataConstants.challenges.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final challenge = DataConstants.challenges[index];
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.to(() => ChallengeDetailScreen(challenge: challenge));
              },
              child: Container(
                  decoration: AppTheme.boxDecorationPrimaryCard,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.successGreen.withOpacity(.1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                          child: Text(
                            challenge.points,
                            style: const TextStyle(
                                fontSize: 12, color: AppColor.successGreen),
                          ).paddingUpSide48(),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side: Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: loadCachedNetworkImage(
                              imageUrl: challenge.image,
                              height: 72,
                              width: 72,
                            ),
                          ),
                          8.rHorizontalSizedBox(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Challenge Name
                                Text(
                                  challenge.challengeName,
                                  style: AppTextStyles.textStyleBlack14With700,
                                ),
                                2.rVerticalSizedBox(),
                                Text(
                                  challenge.description,
                                  style:
                                      AppTextStyles.textStyleBlackTwo14With400,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                2.rVerticalSizedBox(),
                                Text(
                                  "${challenge.startDate} - ${challenge.endDate}",
                                  style:
                                      AppTextStyles.textStyleBlackTwo12With400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).paddingAllDefault(),
                    ],
                  )).paddingAllDefault());
        },
      ).paddingHorizontal16(),
    );
  }
}

import 'package:confetti/confetti.dart';
import 'package:eco_challenge/constants/app_colors.dart';
import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/app_theme.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/ui/pages/winner/winner_screen.dart';
import 'package:eco_challenge/ui/widgets/base_button.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/community_challenge_model.dart';
import '../../widgets/base_common_widget.dart';
import '../qr_code_scanner/scan_qrcode_screen.dart';
import 'community_challenge_controller.dart';

class ChallengeDetailScreen extends StatelessWidget with BaseCommonWidget {
  final CommunityChallenge challenge;

  final CommunityChallengeController communityChallengeController =
      Get.put(CommunityChallengeController()); // Initialize controller

  ChallengeDetailScreen({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.challengeName),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: loadCachedNetworkImage(
                    imageUrl: challenge.image,
                    height: 200,
                    width: double.infinity,
                    boxFit: BoxFit.cover,
                  ),
                ),
                8.rVerticalSizedBox(),
                Text(
                  challenge.description,
                  style: AppTextStyles.textStyleBlack14With400,
                ),
                16.rVerticalSizedBox(),
                Container(
                  decoration: AppTheme.boxDecorationPrimaryCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Challenge Details",
                          style: AppTextStyles.textStylePrimary14With600),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: AppColor.primaryColor, size: 20),
                          6.rHorizontalSizedBox(),
                          Text("Points: ${challenge.points}",
                              style: AppTextStyles.textStyleBlack14With700
                                  .copyWith(color: AppColor.primaryColor)),
                        ],
                      ),
                      8.rVerticalSizedBox(),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              color: AppColor.primaryColor, size: 20),
                          6.rHorizontalSizedBox(),
                          Text(
                            "Event Date: ${challenge.startDate} - ${challenge.endDate}",
                            style: AppTextStyles.textStyleBlackTwo14With400,
                          ),
                        ],
                      ),
                      if (challenge.startTime != null &&
                          challenge.endTime != null) ...[
                        8.rVerticalSizedBox(),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                color: AppColor.primaryColor, size: 20),
                            6.rHorizontalSizedBox(),
                            Text(
                              "Time: ${challenge.startTime} - ${challenge.endTime}",
                              style: AppTextStyles.textStyleBlackTwo14With400,
                            ),
                          ],
                        ),
                      ],
                      4.rVerticalSizedBox(),
                      Row(
                        children: [
                          const Icon(Icons.place,
                              color: Colors.redAccent, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              challenge.locationAddress,
                              style: AppTextStyles.textStyleBlackTwo14With400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll16(),
                ),
                16.rVerticalSizedBox(),
                Obx(() {
                  return Center(
                    child: BaseButton(
                      text: 'Scan QR Code',
                      isWrapWidth: true,
                      onSubmit: () async {
                        final result = await Get.to(() =>
                            ScanQRCodeScreen()); // Await the result from ScanQRCodeScreen
                        if (result == true) {
                          communityChallengeController
                              .updateScannedResult(true);
                          communityChallengeController.confettiController
                              .play();
                          communityChallengeController.update();

                          showWinnerDialog(context, challenge.challengeName,
                              challenge.points);
                        }
                      },
                    ).visibleWhen(
                        isVisible:
                            communityChallengeController.scannedResult.isFalse),
                  );
                })
                // Confetti Animation when result is true
              ],
            ).paddingHorizontal16(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Obx(() {
              if (communityChallengeController.scannedResult.isTrue) {
                return ConfettiWidget(
                  confettiController:
                      communityChallengeController.confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  numberOfParticles: 100,
                  shouldLoop: false,
                  colors: const [
                    Colors.blue,
                    Colors.red,
                    Colors.green,
                    Colors.yellow
                  ],
                );
              } else {
                return const SizedBox.shrink(); // No confetti if not scanned
              }
            }),
          ),
        ],
      ),
    );
  }
}

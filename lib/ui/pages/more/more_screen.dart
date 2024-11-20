import 'package:eco_challenge/ui/pages/leader_board/leader_board_screen.dart';
import 'package:eco_challenge/ui/pages/more/privacy_policy.dart';
import 'package:eco_challenge/ui/pages/more/terms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/language/language_constants.dart';
import '../../../constants/size_config.dart';
import '../../../routing/route_names.dart';
import '../../../utils/extensions.dart';
import '../../widgets/base_common_widget.dart';
import '../web_view/web_view_screen.dart';
import 'about.dart';
import 'more_controller.dart';

class MoreScreen extends GetView<MoreController> with BaseCommonWidget {
  MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('More'),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (MoreController model) {
              return getBody(context);
            },
          ),
        ));
  }

  Widget getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievements',
          style: AppTextStyles.textStyleBlack16With700,
        ),
        16.rVerticalSizedBox(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.rSize()),
              border: Border.all(
                  color: AppColor.blueBorderColor, width: 1.rSize())),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getMenuWidget("Leaderboard", onTap: () {
                Get.to(() =>
                    LeaderboardScreen()); // Correct way to push the new screen
              }),
            ],
          ),
        ),
        16.rVerticalSizedBox(),
        Text(
          'Information',
          style: AppTextStyles.textStyleBlack16With700,
        ),
        16.rVerticalSizedBox(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.rSize()),
              border: Border.all(
                  color: AppColor.blueBorderColor, width: 1.rSize())),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getMenuWidget(LanguageConst.aboutUs, onTap: () {
                Get.to(() =>
                    AboutUsScreen()); // Correct way to push the new screen
              }),
              1.rVerticalGreySizedBox(),
              getMenuWidget(LanguageConst.termsAndCondition, onTap: () {
                Get.to(() =>
                    TermsAndConditionsScreen()); // Correct way to push the new screen
              }),
              1.rVerticalGreySizedBox(),
              getMenuWidget(LanguageConst.privacyPolicy, onTap: () {
                Get.to(() =>
                    PrivacyPolicyScreen()); // Correct way to push the new screen
              }),
            ],
          ),
        ),
        24.rVerticalSizedBox(),
        Text(
          'General Settings',
          style: AppTextStyles.textStyleBlack16With700,
        ),
        16.rVerticalSizedBox(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.rSize()),
              border: Border.all(
                  color: AppColor.blueBorderColor, width: 1.rSize())),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  controller.userSignOut();
                },
                child: SizedBox(
                  width: Get.width,
                  child: Text(
                    'Logout',
                    style: AppTextStyles.textStyleBlack14With600,
                  ).paddingAll16(),
                ),
              ),
            ],
          ),
        ),
      ],
    ).paddingAll16();
  }

  Widget getMenuWidget(String title, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.toNamed(webViewRoute,
                arguments: WebViewModel('https://raftlabs.co/', title));
          },
      child: SizedBox(
        width: Get.width,
        child: Text(
          title,
          style: AppTextStyles.textStyleBlack14With600,
        ).paddingAll16(),
      ),
    );
  }
}

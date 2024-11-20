import 'package:eco_challenge/constants/app_colors.dart';
import 'package:eco_challenge/constants/app_icons.dart';
import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/size_config.dart';
import 'package:eco_challenge/ui/widgets/base_button.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Routing/route_names.dart';

void showWinnerDialog(
  BuildContext context,
  String event,
  String points,
) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissal by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: AppColor.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Congratulations!",
                style: AppTextStyles.textStylePrimary16With600),
            8.rVerticalSizedBox(),
            Image.asset(
              AppIcons.reward1, // Replace with your image path
              height: 100,
              width: 100,
            ),
            8.rVerticalSizedBox(),
            Text(
              "Rewards ${points}",
              style: AppTextStyles.textStylePrimary16With600
                  .copyWith(color: AppColor.accentYellowColor),
            ),
            4.rVerticalSizedBox(),
            Text("Event: ${event}",
                style: AppTextStyles.textStyleBlack14With700),
            16.rVerticalSizedBox(),
            BaseButton(
              text: "Go Home",
              isOutlined: true,
              onSubmit: () {
                Get.offAllNamed(dashboardViewRoute);
              },
              isWrapWidth: true,
            )
          ],
        ).paddingAll16(),
      );
    },
  );
}

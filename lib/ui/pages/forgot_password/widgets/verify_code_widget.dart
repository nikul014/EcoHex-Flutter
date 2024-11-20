import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/size_config.dart';
import '../../../../ui/widgets/base_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/base_common_widget.dart';
import '../forgot_password_controller.dart';
import 'fp_title_widget.dart';

class VerifyCode extends GetView<ForgotPasswordController>
    with BaseCommonWidget {
  VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForgotPasswordTitleWidget(
          mainTitle: "Verify your email",
          subTitle: "Please enter the 6 digit code sent to your email.",
        ),
        AppTextField(
          controller: controller.verificationCodeController,
          focusNode: controller.verificationCodeFocusNode,
          keyboardType: TextInputType.number,
          hintText: "Enter verification code",
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.done,
          onTap: () {
            controller.update();
          },
          onChanged: (val) {
            controller.update();
          },
        ),
        20.rVerticalSizedBox(),
        BaseButton(
          text: "Verify",
          enabled: controller.verificationCodeController.text.length > 3,
          onSubmit: () {
            controller.navigateToNext();
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/language/language_constants.dart';
import '../../../../constants/size_config.dart';
import '../../../../ui/widgets/base_button.dart';
import '../../../../utils/validator.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/base_common_widget.dart';
import '../forgot_password_controller.dart';
import 'fp_title_widget.dart';

class EnterEmailOrUsername extends GetView<ForgotPasswordController>
    with BaseCommonWidget {
  EnterEmailOrUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForgotPasswordTitleWidget(
          mainTitle: "Forgot Password",
          subTitle:
              "Please enter your email address to receive a verification code.",
        ),
        AppTextField(
          controller: controller.emailController,
          focusNode: controller.emailFocusNode,
          keyboardType: TextInputType.text,
          hintText: "Enter email ",
          validator: (value) {
            if (Validator.validateEmailFields(
                    controller.emailController.text) ==
                false) {
              return LanguageConst.emailError;
            }
          },
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
          text: "Continue",
          onSubmit: () {
            controller.checkEmailExistOrNot();
          },
        ),
      ],
    );
  }
}

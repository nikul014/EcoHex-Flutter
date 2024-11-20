import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text_styles.dart';
import '../../../../constants/language/language_constants.dart';
import '../../../../constants/size_config.dart';
import '../../../../ui/widgets/base_button.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/base_common_widget.dart';
import '../forgot_password_controller.dart';
import 'fp_title_widget.dart';

class ResetPassword extends GetView<ForgotPasswordController>
    with BaseCommonWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForgotPasswordTitleWidget(
          mainTitle: "Reset password",
          subTitle: "Please enter password as per below instructions !",
        ),
        AppTextField(
          controller: controller.passwordController,
          focusNode: controller.passwordFocusNode,
          keyboardType: TextInputType.text,
          hintText: "Enter password",
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.next,
          suffixWidget: InkWell(
            onTap: () {
              controller.isPasswordHide = !controller.isPasswordHide;
              controller.update();
            },
            child: Utils.passwordHideShowWidget(controller.isPasswordHide),
          ),
          obscureText: controller.isPasswordHide,
          onTap: () {
            controller.update();
          },
          onChanged: (val) async {
            controller.isUppar = val.contains(RegExp(r'[A-Z]'));
            controller.isNumber = val.contains(RegExp(r'[0-9]'));
            controller.isLower = val.contains(RegExp(r'[a-z]'));
            controller.isSpecialCharacter =
                val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
            controller.update();
          },
          onSubmitted: (val) async {
            FocusScope.of(context)
                .requestFocus(controller.confirmPasswordFocusNode);
          },
        ),
        controller.passwordController!.text.isNotEmpty
            ? Wrap(
                children: [
                  Text(
                    LanguageConst.atLeast8Char,
                    style: AppTextStyles.textStyleBlackTwo12With400,
                  ).paddingSideOnly(top: 2, right: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        size: SizeConfig.font14,
                        color: controller.isUppar
                            ? AppColor.primaryColor
                            : Colors.red,
                      ),
                      2.rHorizontalSizedBox(),
                      Text(
                        LanguageConst.upperCase,
                        style: AppTextStyles.textStyle400(
                          textColor: controller.isUppar
                              ? AppColor.primaryColor
                              : Colors.red,
                          fontSize: SizeConfig.font12,
                        ),
                      ),
                    ],
                  ).paddingSideOnly(top: 2, right: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        size: SizeConfig.font14,
                        color: controller.isNumber
                            ? AppColor.primaryColor
                            : Colors.red,
                      ),
                      2.rHorizontalSizedBox(),
                      Text(
                        LanguageConst.oneNumber,
                        style: AppTextStyles.textStyle400(
                          textColor: controller.isNumber
                              ? AppColor.primaryColor
                              : Colors.red,
                          fontSize: SizeConfig.font12,
                        ),
                      ),
                    ],
                  ).paddingSideOnly(top: 2, right: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        size: SizeConfig.font14,
                        color: controller.isLower
                            ? AppColor.primaryColor
                            : Colors.red,
                      ),
                      2.rHorizontalSizedBox(),
                      Text(
                        LanguageConst.lowerCase,
                        style: AppTextStyles.textStyle400(
                          textColor: controller.isLower
                              ? AppColor.primaryColor
                              : Colors.red,
                          fontSize: SizeConfig.font12,
                        ),
                      ),
                    ],
                  ).paddingSideOnly(top: 2, right: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        size: SizeConfig.font14,
                        color: controller.isSpecialCharacter
                            ? AppColor.primaryColor
                            : Colors.red,
                      ),
                      2.rHorizontalSizedBox(),
                      Text(
                        LanguageConst.specialCharacter,
                        style: AppTextStyles.textStyle400(
                          textColor: controller.isSpecialCharacter
                              ? AppColor.primaryColor
                              : Colors.red,
                          fontSize: SizeConfig.font12,
                        ),
                      ),
                    ],
                  ).paddingSideOnly(top: 2, right: 8),
                ],
              )
            : Container(),
        10.rVerticalSizedBox(),
        AppTextField(
          controller: controller.confirmPasswordController,
          focusNode: controller.confirmPasswordFocusNode,
          keyboardType: TextInputType.text,
          hintText: "Confirm password",
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.done,
          suffixWidget: InkWell(
            onTap: () {
              controller.isConfirmPasswordHide =
                  !controller.isConfirmPasswordHide;
              controller.update();
            },
            child:
                Utils.passwordHideShowWidget(controller.isConfirmPasswordHide),
          ),
          obscureText: controller.isConfirmPasswordHide,
          onTap: () {
            controller.update();
          },
          onChanged: (val) {
            controller.update();
          },
        ),
        Text(
          'Enter the 6 digit code sent to your email.',
          style: AppTextStyles.textStyleBlackTwo12With400,
        ),
        10.rVerticalSizedBox(),
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
          text: "Reset password",
          enabled: controller.passwordController.text.length >= 10 &&
              controller.passwordController.text ==
                  controller.confirmPasswordController.text &&
              controller.verificationCodeController.text.length >= 4,
          onSubmit: () {
            controller.validateAndResetPassword();
          },
        ),
      ],
    );
  }
}

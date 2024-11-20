import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/enums/view_state.dart';
import '../../../constants/language/language_constants.dart';
import '../../../constants/size_config.dart';
import '../../../utils/extensions.dart';
import '../../../utils/utils.dart';
import '../../../utils/validator.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_common_widget.dart';
import 'sign_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> with BaseCommonWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (SignUpController model) {
              return getBody(context);
            },
          ),
        ));
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.profileFormKey,
        child: Column(
          children: [
            36.rVerticalSizedBox(),
            AppTextField(
              controller: controller.firstNameController,
              focusNode: controller.firstNameFocusNode,
              validator: Validations.isNotEmpty,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
              ],
              onSubmitted: (val) {
                controller.lastNameFocusNode.requestFocus();
              },
              hintText: LanguageConst.firstName,
              onChanged: (val) {
                controller.update();
              },
            ).paddingVertical8(),
            AppTextField(
              controller: controller.lastNameController,
              focusNode: controller.lastNameFocusNode,
              validator: Validations.isNotEmpty,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
              ],
              onSubmitted: (val) {
                controller.emailFocusNode.requestFocus();
              },
              hintText: LanguageConst.lastName,
              onChanged: (val) {
                controller.update();
              },
            ).paddingVertical8(),
            AppTextField(
              textInputAction: TextInputAction.done,
              controller: controller.emailController,
              focusNode: controller.emailFocusNode,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[ ]'), allow: false)
              ],
              validator: Validations.emailValidator,
              onSubmitted: (val) {
                controller.passwordFocusNode.requestFocus();
              },
              onChanged: (val) {
                controller.update();
              },
              hintText: LanguageConst.emailAddress,
            ).paddingVertical8(),
            AppTextField(
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              validator: Validations.passwordValidator,
              onSubmitted: (val) {
                controller.cPasswordFocusNode.requestFocus();
              },
              onChanged: (val) async {
                checkPasswordSecurity(val);
              },
              obscureText: controller.passwordVisible,
              obscuringCharacter: '*',
              suffixWidget: InkWell(
                onTap: () {
                  controller.passwordVisible = !controller.passwordVisible;
                  controller.update();
                },
                child: Icon(
                  controller.passwordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                  color: AppColor.blackTextColor,
                ),
              ),
              hintText: LanguageConst.password,
            ),
            controller.passwordController!.text.isNotEmpty
                ? Wrap(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            controller.isMin8Chars ? Icons.check : Icons.clear,
                            size: SizeConfig.font14,
                            color: controller.isMin8Chars
                                ? AppColor.greenColor
                                : Colors.red,
                          ),
                          2.rHorizontalSizedBox(),
                          Text(
                            LanguageConst.atLeast8Char,
                            style: AppTextStyles.textStyle400(
                              textColor: controller.isMin8Chars
                                  ? AppColor.greenColor
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
                            controller.isUppar ? Icons.check : Icons.clear,
                            size: SizeConfig.font14,
                            color: controller.isUppar
                                ? AppColor.greenColor
                                : Colors.red,
                          ),
                          2.rHorizontalSizedBox(),
                          Text(
                            LanguageConst.upperCase,
                            style: AppTextStyles.textStyle400(
                              textColor: controller.isUppar
                                  ? AppColor.greenColor
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
                            controller.isNumber ? Icons.check : Icons.clear,
                            size: SizeConfig.font14,
                            color: controller.isNumber
                                ? AppColor.greenColor
                                : Colors.red,
                          ),
                          2.rHorizontalSizedBox(),
                          Text(
                            LanguageConst.oneNumber,
                            style: AppTextStyles.textStyle400(
                              textColor: controller.isNumber
                                  ? AppColor.greenColor
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
                            controller.isLower ? Icons.check : Icons.clear,
                            size: SizeConfig.font14,
                            color: controller.isLower
                                ? AppColor.greenColor
                                : Colors.red,
                          ),
                          2.rHorizontalSizedBox(),
                          Text(
                            LanguageConst.lowerCase,
                            style: AppTextStyles.textStyle400(
                              textColor: controller.isLower
                                  ? AppColor.greenColor
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
                            controller.isSpecialCharacter
                                ? Icons.check
                                : Icons.clear,
                            size: SizeConfig.font14,
                            color: controller.isSpecialCharacter
                                ? AppColor.greenColor
                                : Colors.red,
                          ),
                          2.rHorizontalSizedBox(),
                          Text(
                            LanguageConst.specialCharacter,
                            style: AppTextStyles.textStyle400(
                              textColor: controller.isSpecialCharacter
                                  ? AppColor.greenColor
                                  : Colors.red,
                              fontSize: SizeConfig.font12,
                            ),
                          ),
                        ],
                      ).paddingSideOnly(top: 2, right: 8),
                    ],
                  ).paddingSideOnly(bottom: 8.rSize())
                : Container(),
            8.rVerticalSizedBox(),
            AppTextField(
              controller: controller.cPasswordController,
              focusNode: controller.cPasswordFocusNode,
              validator: Validations.passwordValidator,
              onSubmitted: (val) {
                if (controller.passwordController.text.trim() !=
                    controller.cPasswordController.text.trim()) {
                  Utils.showSuccessToast(
                      "Password and confirm password mismatched!", true);
                } else if (controller.profileFormKey.currentState!.validate()) {
                  controller.validateAndNavigateToNext();
                }
              },
              onChanged: (val) {
                controller.update();
              },
              obscureText: controller.cPasswordVisible,
              obscuringCharacter: '*',
              suffixWidget: InkWell(
                onTap: () {
                  controller.cPasswordVisible = !controller.cPasswordVisible;
                  controller.update();
                },
                child: Icon(
                  controller.cPasswordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                  color: AppColor.blackTextColor,
                ),
              ),
              hintText: LanguageConst.confirmPassword,
            ).paddingVertical8(),
            16.rVerticalSizedBox(),
            getSignInButton(),
          ],
        ),
      ),
    ).paddingHorizontal24();
  }

  void checkPasswordSecurity(String val) {
    controller.isUppar = val.contains(RegExp(r'[A-Z]'));
    controller.isNumber = val.contains(RegExp(r'[0-9]'));
    controller.isLower = val.contains(RegExp(r'[a-z]'));
    controller.isSpecialCharacter =
        val.contains(RegExp(r'''[!'_\-=~`@#$%^&*(),.?":{}|<>+\[\]\\/;]'''));
    controller.isMin8Chars = controller.passwordController.text.length >= 8;
    controller.update();
  }

  Widget getSignInButton() {
    if (controller.state == ViewStateEnum.busy) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return BaseButton(
      text: LanguageConst.register,
      onSubmit: () async {
        if (controller.passwordController.text.trim() !=
            controller.cPasswordController.text.trim()) {
          Utils.showSuccessToast(
              "Password and confirm password mismatched!", true);
        } else if (controller.profileFormKey.currentState!.validate()) {
          controller.validateAndNavigateToNext();
        }
      },
    );
  }
}

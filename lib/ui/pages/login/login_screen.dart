import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/enums/view_state.dart';
import '../../../constants/language/language_constants.dart';
import '../../../constants/size_config.dart';
import '../../../routing/route_names.dart';
import '../../../utils/extensions.dart';
import '../../../utils/validator.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_common_widget.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> with BaseCommonWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (LoginController model) {
              return _getBody(model, context);
            },
          ),
        ));
  }

  Widget _getBody(LoginController model, BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: _getBaseContainer(model, context));
  }

  Widget _getBaseContainer(LoginController model, BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            AppIcons.grassBack,
          ),
        ),
        Center(
          child: Form(
            key: controller.emailFormKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.rVerticalSizedBox(),
                  Center(
                      child: Image.asset(AppIcons.logoWhite, width: 160.rSize())
                          .paddingHorizontal8()),
                  36.rVerticalSizedBox(),
                  Text(
                    LanguageConst.loginPrompt,
                    style: AppTextStyles.textStyleBlack16With700,
                  ).paddingHorizontal8(),
                  24.rVerticalSizedBox(),
                  AppTextField(
                    textInputAction: TextInputAction.done,
                    controller: controller.emailController,
                    focusNode: controller.emailFocusNode,
                    validator: Validations.emailValidator,
                    onSubmitted: (val) {
                      controller.passwordFocusNode.requestFocus();
                    },
                    onChanged: (val) {
                      controller.update();
                    },
                    hintText: LanguageConst.emailAddressHint,
                  ).paddingHorizontal8(),
                  8.rVerticalSizedBox(),
                  AppTextField(
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocusNode,
                    validator: Validations.passwordValidator,
                    onSubmitted: (val) {
                      if (controller.emailFormKey.currentState!.validate()) {
                        controller.validateAndNavigateToNext();
                      }
                    },
                    onChanged: (val) {
                      controller.update();
                    },
                    obscureText: controller.passwordVisible,
                    obscuringCharacter: '*',
                    suffixWidget: InkWell(
                      onTap: () {
                        controller.passwordVisible =
                            !controller.passwordVisible;
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
                    hintText: LanguageConst.passwordPrompt,
                  ).paddingHorizontal8(),
                  8.rVerticalSizedBox(),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(forgotPasswordViewRoute);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.textStyleBlack14With600,
                          ))
                    ],
                  ),
                  24.rVerticalSizedBox(),
                  getSignInButton(controller.emailController.text
                          .trim()
                          .isNotNullOrEmpty)
                      .paddingHorizontal8(),
                  12.rVerticalSizedBox(),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        Get.toNamed(signUpViewRoute);
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'New to Eco Challenge? ',
                              style: AppTextStyles.textStyleBlack14With400,
                              children: [
                                TextSpan(
                                    text: 'Register',
                                    style: AppTextStyles.textStyleBlue14With400)
                              ])).paddingAll12(),
                    ),
                  ),
                ],
              ).paddingScreen(),
            ),
          ),
        ),
      ],
    );
  }

  Widget getSignInButton(bool buttonEnabled) {
    if (controller.state == ViewStateEnum.busy) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return BaseButton(
      enabled: buttonEnabled,
      text: LanguageConst.signIn,
      onSubmit: () async {
        if (controller.emailFormKey.currentState!.validate()) {
          controller.validateAndNavigateToNext();
        }
      },
    );
  }
}

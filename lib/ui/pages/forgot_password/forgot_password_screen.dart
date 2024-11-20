import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_paddings.dart';
import '../../../constants/enums/forgot_password_status.dart';
import '../../../constants/size_config.dart';
import '../../../ui/pages/forgot_password/widgets/email_field_widget.dart';
import '../../../ui/pages/forgot_password/widgets/reset_password_widget.dart';
import '../../../ui/pages/forgot_password/widgets/verify_code_widget.dart';
import '../../widgets/base_common_widget.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController>
    with BaseCommonWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Forgot Password"),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (ForgotPasswordController model) {
              return _getBody(model, context);
            },
          ),
        ));
  }

  Widget _getBody(ForgotPasswordController model, BuildContext context) {
    return _getBaseContainer(model, context);
  }

  Widget _getBaseContainer(
    ForgotPasswordController model,
    BuildContext context,
  ) {
    return SingleChildScrollView(
      padding: AppPaddings.getContentPadding(
        left: 20.rWidth(),
        right: 20.rWidth(),
        top: 10.rHeight(),
        bottom: 55.rHeight(),
      ),
      child: switchCaseOfForgotPasswordStatus(),
    );
  }

  Widget switchCaseOfForgotPasswordStatus() {
    switch (controller.forgotPasswordStatus!) {
      case ForgotPasswordStatus.enterUsername:
        return EnterEmailOrUsername();
      case ForgotPasswordStatus.verifyCode:
        return VerifyCode();
      case ForgotPasswordStatus.resetPassword:
        return ResetPassword();
    }
  }
}

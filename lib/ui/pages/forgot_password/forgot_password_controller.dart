import 'package:flutter/cupertino.dart';

import '../../../constants/enums/forgot_password_status.dart';
import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';
import '../../../model/profile/user_profile.dart';

class ForgotPasswordController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode verificationCodeFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool isPasswordHide = true;
  bool isConfirmPasswordHide = true;

  bool isUppar = false,
      isLower = false,
      isSpecialCharacter = false,
      isNumber = false;

  List<UserProfile>? users;

  ForgotPasswordStatus? forgotPasswordStatus =
      ForgotPasswordStatus.enterUsername;

  checkEmailExistOrNot() async {
    Map<String, String> headers = {};
    setLoaderState(ViewStateEnum.busy);

    validateAndSendRequest();
  }

  void validateAndSendRequest() async {
    // await CognitoService.setUserPoolData(isManual: true);
    // setLoaderState(ViewStateEnum.busy);
    // final Map<String, dynamic> demoMap = {};
    // var sendRequestCallback = await CognitoService.requestForgotPassword(
    //   emailController.text.trim(),
    // );
    // print('This is the result $sendRequestCallback');
    // if (sendRequestCallback.runtimeType == demoMap.runtimeType) {
    //   setLoaderState(ViewStateEnum.idle);
    //   forgotPasswordStatus = ForgotPasswordStatus.resetPassword;
    //   Utils.showMessageInSnackBar(
    //       "Verification code sent successfully !", false);
    //   update();
    // } else {
    //   setLoaderState(ViewStateEnum.idle);
    //   Utils.showMessageInSnackBar(sendRequestCallback.toString(), true);
    // }
  }

  void navigateToNext() {
    forgotPasswordStatus = ForgotPasswordStatus.resetPassword;
    update();
  }

  void validateAndResetPassword() async {
    // if (!verificationCodeController.text.isNotNullOrEmpty) {
    //   Utils.showSuccessToast(
    //       "Please enter the 6 digit code sent to your email.", false);
    //   return;
    // }
    // setLoaderState(ViewStateEnum.busy);
    // // Logger.info("Check the username is there >>>> ${emailController.text}");
    // var forgotPasswordCallback = await CognitoService.forgotPassword(
    //   verificationCode: verificationCodeController.text.trim(),
    //   newPassword: passwordController.text.trim(),
    //   userName: emailController.text.trim(),
    // );
    // if (forgotPasswordCallback.runtimeType == bool) {
    //   setLoaderState(ViewStateEnum.idle);
    //   Get.offAllNamed(loginViewRoute);
    //   Utils.showSuccessToast("Password changed successfully !", false);
    // } else {
    //   setLoaderState(ViewStateEnum.idle);
    //   Utils.showMessageInSnackBar(forgotPasswordCallback.toString(), true);
    // }
  }
}

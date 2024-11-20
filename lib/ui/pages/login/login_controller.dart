import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_singleton.dart';
import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';
import '../../../data_handler/network/graphql_service.dart';
import '../../../model/profile/user_profile.dart';
import '../../../routing/route_names.dart';
import '../../../utils/utils.dart';

class LoginController extends BaseController {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  TextEditingController emailController =
      TextEditingController(text: 'oliverclint12@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Abc123##\$\$');

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool passwordVisible = true;

  void validateAndNavigateToNext() async {
    setLoaderState(ViewStateEnum.busy);

    // await CognitoService.signIn(
    //   username: emailController.text.trim().removeAllWhitespace,
    //   password: passwordController.text.trim(),
    // ).then((value) async {
    //   if (value.runtimeType == CognitoUserSession) {
    //     CognitoUserSession session = value;
    //     CognitoService.storeIdAndRefreshToken(
    //         session.idToken.jwtToken!, session.refreshToken!.token!);

    await GraphQLService.init().whenComplete(() async {
      await GraphQLService().getUserProfile(onSuccess: (val) {
        UserProfile? userProfile = AppSingleton.loggedInUserProfile;
        if (userProfile != null) {
          Get.offAllNamed(dashboardViewRoute);
          update();
          setLoaderState(ViewStateEnum.idle);
          Utils.showSuccessToast("User logged in successfully !", false);
        } else {
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) => Utils.showReactiveDialog(
          //         LanguageConst.reActiveAccount,
          //         LanguageConst.reActiveAccountMsg,
          //         LanguageConst.reActiveBtnText));
          Utils.showSuccessToast('User is disabled!', true);
          update();
          setLoaderState(ViewStateEnum.idle);
        }
      });
    });
    // } else {
    //   setLoaderState(ViewStateEnum.idle);
    //   if (value?.toString().compareTo("User is disabled.") == 0) {
    //     // showDialog(
    //     //     context: context,
    //     //     builder: (BuildContext context) => Utils.showReactiveDialog(
    //     //         LanguageConst.reActiveAccount,
    //     //         LanguageConst.reActiveAccountMsg,
    //     //         LanguageConst.reActiveBtnText));
    //     Utils.showSuccessToast('User is disabled!', true);
    //     return;
    //   }
    //   Utils.showMessageInSnackBar(value, true);
    // }
    // });
  }
}

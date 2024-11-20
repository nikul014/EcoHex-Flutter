import 'package:flutter/cupertino.dart';

import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';

class SignUpController extends BaseController {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode cPasswordFocusNode = FocusNode();

  bool passwordVisible = true;
  bool cPasswordVisible = true;

  bool isUppar = false,
      isLower = false,
      isSpecialCharacter = false,
      isNumber = false,
      isMin8Chars = false;

  void validateAndNavigateToNext() async {
    setLoaderState(ViewStateEnum.busy);
    // if (referralController.text.isNotNullOrEmpty) {
    //   bool res = await checkReferralCodeIfAny(
    //       emailVal, referralController.text.trim());
    //   if (!res) {
    //     return;
    //   } else {
    //     setLoaderState(ViewStateEnum.busy);
    //   }
    // }
    // await CognitoService.setUserPoolData(isManual: true);
    // var serviceData = await CognitoService.signUp(
    //     emailVal,
    //     fullNameVal,
    //     password,
    //     selectedUserType!.name,
    //     birthDateC.text,
    //     companyNameController.text,
    //     // UserType.creator.name,
    //     referralController.text);
    //
    // await UserPreference.setValue(
    //     key: PrefKeys.fullName, value: companyNameVal);
    // if (serviceData.runtimeType == CognitoUser) {
    //   //  context.wizardController.goNext();
    //
    //   RegistrationArgumentModel registrationArgumentModel =
    //       RegistrationArgumentModel(
    //           email: emailVal,
    //           fullName: fullNameVal,
    //           userId: companyNameController.text,
    //           companyName: companyNameVal,
    //           mobileNumber: mobileNumberVal,
    //           password: password,
    //           userType: selectedUserType,
    //           userName: userNameController.text);
    //
    //   await UserPreference.setValue(
    //       key: SharedPrefKey.otpVerificationDetails.name,
    //       value: jsonEncode(registrationArgumentModel.toJson()));
    //
    //   Get.toNamed(otpVerificationViewRoute,
    //       arguments: registrationArgumentModel);
    // } else {
    //   Utils.showMessageInSnackBar(serviceData.toString(), true);
    // }
    // setLoaderState(ViewStateEnum.idle);
  }
}

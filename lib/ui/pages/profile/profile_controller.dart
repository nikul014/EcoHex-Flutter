import 'package:flutter/cupertino.dart';

import '../../../app_singleton.dart';
import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';
import '../../../utils/utils.dart';

class ProfileController extends BaseController {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    emailController.text = AppSingleton.loggedInUserProfile?.email ?? '';
    firstNameController.text = AppSingleton.loggedInUserProfile?.fullName ?? '';
    lastNameController.text = AppSingleton.loggedInUserProfile?.fullName ?? '';
  }

  void validateAndNavigateToNext() async {
    setLoaderState(ViewStateEnum.busy);
    await Future.delayed(const Duration(seconds: 2));
    Utils.showSuccessToast("You cannot update this details for now", true);
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
    setLoaderState(ViewStateEnum.idle);
  }
}

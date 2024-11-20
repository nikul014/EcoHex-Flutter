import '../../../controller/base_controller.dart';

class HomeController extends BaseController {
  // void userSignOut() async {
  //   setLoaderState(ViewStateEnum.busy);
  //   var validSignOut = await CognitoService.signOut();
  //   if (validSignOut.runtimeType == bool) {
  //     setLoaderState(ViewStateEnum.idle);
  //     await UserPreference.clear();
  //     UserPreference.setValue(key: SharedPrefKey.isFirstTime.name, value: true);
  //     String userId = AppSingleton.loggedInUserProfile?.id ?? '';
  //     UserPreference.setValue(
  //         key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
  //     Get.offAllNamed(introductionViewRoute);
  //   } else {
  //     setLoaderState(ViewStateEnum.idle);
  //     Utils.showMessageInSnackBar(validSignOut.toString(), true);
  //   }
  // }
}

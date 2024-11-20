import 'package:get/get.dart';

import '../../../Routing/route_names.dart';
import '../../../app_singleton.dart';
import '../../../constants/enums/view_state.dart';
import '../../../controller/base_controller.dart';
import '../../../utils/shared_prefs.dart';

class MoreController extends BaseController {
  void userSignOut() async {
    setLoaderState(ViewStateEnum.busy);

    setLoaderState(ViewStateEnum.idle);
    await UserPreference.clear();
    UserPreference.setValue(key: SharedPrefKey.isFirstTime.name, value: true);
    String userId = AppSingleton.loggedInUserProfile?.id ?? '';
    UserPreference.setValue(
        key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
    Get.offAllNamed(introductionViewRoute);
  }
}

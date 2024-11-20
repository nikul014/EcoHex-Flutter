import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_singleton.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../data_handler/network/graphql_service.dart';
import '../../routing/route_names.dart';
import '../../utils/extensions.dart';
import '../../utils/shared_prefs.dart';
import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool isQuickAction = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      checkUserLoggedInOrNot();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              body: Center(
                child:
                    Image.asset(AppIcons.logoWhite, width: 180).paddingAll26(),
              ),
            ).addSizeConfigInitialization())
        .addBlackStatusBar();
  }

  void checkUserLoggedInOrNot() async {
    AppSingleton().connectionStatus.hasConnection;
    bool isUserFirstTime =
        await UserPreference.getValue(key: SharedPrefKey.isFirstTime.name) ??
            true;
    bool isUserLoggedIn =
        await UserPreference.getValue(key: SharedPrefKey.isLogin.name) ?? false;

    if (isUserFirstTime) {
      await UserPreference.setValue(
          key: SharedPrefKey.isFirstTime.name, value: false);
      Get.offAllNamed(introductionViewRoute);
    } else {
      if (isUserLoggedIn) {
        bool isValid = await Utils.checkTokenValidityUpdated();
        if (!isValid) {
          Get.offAllNamed(introductionViewRoute);
          return;
        }
        await GraphQLService().getUserProfile(onSuccess: (val) {
          try {
            if (AppSingleton.loggedInUserProfile != null) {
              Get.offAllNamed(dashboardViewRoute);
            } else {
              Get.offAllNamed(loginViewRoute);
            }
          } catch (e) {
            Get.offAllNamed(loginViewRoute);
          }
        });
      } else {
        Get.offAllNamed(loginViewRoute);
      }
    }
  }
}

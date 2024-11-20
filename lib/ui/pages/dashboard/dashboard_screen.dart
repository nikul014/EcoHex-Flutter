import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/language/language_constants.dart';
import '../../../constants/size_config.dart';
import '../../../utils/extensions.dart';
import '../../widgets/base_common_widget.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> with BaseCommonWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: (state) async {
          onWidgetDidBuild(callback: () {});
        },
        autoRemove: false,
        dispose: (state) {},
        builder: (DashboardController model) {
          return Scaffold(
            body: controller.pages[controller.currentIndex],
            backgroundColor: AppColor.whiteColor,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(16.rSize()),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) async {
                    controller.changeTab(index);
                  },
                  backgroundColor: AppColor.black4_5TextColor,
                  selectedItemColor: AppColor.primaryColor,
                  unselectedItemColor: AppColor.black3TextColor,
                  currentIndex: controller.currentIndex,
                  items: [
                    getBottomNavigationItem(
                        LanguageConst.home, Icons.home_outlined),
                    getBottomNavigationItem(
                        LanguageConst.history, Icons.history),
                    getBottomNavigationItem(
                        LanguageConst.profile, Icons.person_outline_rounded),
                    getBottomNavigationItem(
                        LanguageConst.more, Icons.more_horiz_outlined),
                  ]),
            ),
          );
        });
  }

  BottomNavigationBarItem getBottomNavigationItem(String title, IconData icon) {
    return BottomNavigationBarItem(
      label: title,
      activeIcon: Icon(
        icon,
        size: 24.rSize(),
        color: AppColor.primaryColor,
      ),
      icon: Icon(
        icon,
        size: 24.rSize(),
        color: AppColor.black3TextColor,
      ),
    );
  }
}

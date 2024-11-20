import 'package:eco_challenge/ui/pages/community_challenge/community_challenge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/dashboard/dashboard_binding.dart';
import '../ui/pages/dashboard/dashboard_screen.dart';
import '../ui/pages/forgot_password/forgot_password_binding.dart';
import '../ui/pages/forgot_password/forgot_password_screen.dart';
import '../ui/pages/history/history_binding.dart';
import '../ui/pages/history/history_screen.dart';
import '../ui/pages/home/home_binding.dart';
import '../ui/pages/home/home_screen.dart';
import '../ui/pages/internet_page/internet_page_view.dart';
import '../ui/pages/introduction_screen.dart';
import '../ui/pages/login/login_binding.dart';
import '../ui/pages/login/login_screen.dart';
import '../ui/pages/more/more_binding.dart';
import '../ui/pages/more/more_screen.dart';
import '../ui/pages/profile/profile_binding.dart';
import '../ui/pages/profile/profile_screen.dart';
import '../ui/pages/sign_up/sign_up_binding.dart';
import '../ui/pages/sign_up/sign_up_screen.dart';
import '../ui/pages/splash_screen.dart';
import '../ui/pages/web_view/web_view_screen.dart';
import 'route_names.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case internetPageViewRoute:
      return getPageRoutes(
        routeName: internetPageViewRoute,
        settings: settings,
        page: () => const InternetPageView(),
      );

    case introductionViewRoute:
      return getPageRoutes(
        routeName: introductionViewRoute,
        settings: settings,
        page: () => const IntroductionViewPage(),
      );

    case splashViewRoute:
      return getPageRoutes(
        routeName: splashViewRoute,
        settings: settings,
        page: () => const SplashScreen(),
      );

    case loginViewRoute:
      return getPageRoutes(
        routeName: loginViewRoute,
        settings: settings,
        bindings: [LoginBinding()],
        page: () => LoginScreen(),
      );
    case signUpViewRoute:
      return getPageRoutes(
        routeName: signUpViewRoute,
        settings: settings,
        bindings: [SignUpBinding()],
        page: () => SignUpScreen(),
      );
    case forgotPasswordViewRoute:
      return getPageRoutes(
        routeName: forgotPasswordViewRoute,
        settings: settings,
        bindings: [ForgotPasswordBinding()],
        page: () => ForgotPasswordScreen(),
      );

    case dashboardViewRoute:
      return getPageRoutes(
        routeName: dashboardViewRoute,
        settings: settings,
        bindings: [
          DashboardBinding(),
          HomeBinding(),
          ProfileBinding(),
          MoreBinding(),
          HistoryBinding()
        ],
        page: () => DashboardScreen(),
      );
    case homeViewRoute:
      return getPageRoutes(
        routeName: homeViewRoute,
        settings: settings,
        bindings: [HomeBinding()],
        page: () => HomeScreen(),
      );
    case profileViewRoute:
      return getPageRoutes(
        routeName: profileViewRoute,
        settings: settings,
        bindings: [ProfileBinding()],
        page: () => ProfileScreen(),
      );
    case moreViewRoute:
      return getPageRoutes(
        routeName: moreViewRoute,
        settings: settings,
        bindings: [MoreBinding()],
        page: () => MoreScreen(),
      );

    case webViewRoute:
      return getPageRoutes(
        routeName: webViewRoute,
        settings: settings,
        page: () => const WebViewScreen(),
      );

    case historyViewRoute:
      return getPageRoutes(
        routeName: historyViewRoute,
        settings: settings,
        bindings: [HistoryBinding()],
        page: () => HistoryScreen(),
      );
    case communityChallengeViewRoute:
      return getPageRoutes(
        routeName: communityChallengeViewRoute,
        settings: settings,
        page: () => CommunityChallengesScreen(),
      );
  }
}

/// Use This Method To Call Pages
PageRoute getPageRoutes(
    {required String routeName,
    required Function page,
    required RouteSettings settings,
    List<Bindings>? bindings,
    Transition? transition,
    Duration? transitionDuration}) {
  return GetPageRoute(
    transition: transition,
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 300),
    page: () => SafeArea(
      child: page(),
      bottom: false,
      top: false,
    ),
    // transition: Transition.rightToLeft,
    routeName: routeName,
    settings: settings,
    bindings: bindings,
  );
}

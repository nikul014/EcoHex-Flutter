import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'constants/app_theme.dart';
import 'constants/language/language_constants.dart';
import 'routing/route_names.dart';
import 'routing/router.dart';
import 'utils/extensions.dart';

/*

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await NotificationUtils().registerNotifications();
  // FirebaseMessaging.instance.subscribeToTopic('general');
  await UserPreference.initSharedPrefs();
  await SecureStorageUtil.initSecureStorage();
  await Logger.init();
  // checkNewNotificationValue();
  runZonedGuarded(
    () => runApp(const MyApp()),
    FirebaseCrashlytics.instance.recordError,
  );
}

 */
GlobalKey<NavigatorState> navigationKey = GlobalKey(debugLabel: "MaterialKey");

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      navigatorKey: navigationKey,
      initialRoute: splashViewRoute,
      onGenerateRoute: generateRoute,
      title: LanguageConst.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.baseTheme,
    ).addBlackStatusBar();
  }

  void localLogWriter(String text, {bool isError = false}) {
    Future.microtask(() => debugPrint('** $text ** isError: [$isError]'));
  }
}

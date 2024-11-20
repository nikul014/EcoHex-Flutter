import 'package:eco_challenge/utils/logger.dart';
import 'package:eco_challenge/utils/secure_storage.dart';
import 'package:eco_challenge/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await NotificationUtils().registerNotifications();
  // FirebaseMessaging.instance.subscribeToTopic('general');
  await UserPreference.initSharedPrefs();
  await SecureStorageUtil.initSecureStorage();
  await Logger.init();
  // checkNewNotificationValue();
  runApp(const MyApp());
}

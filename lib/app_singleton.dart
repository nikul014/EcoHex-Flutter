import 'dart:async';
import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';

import 'model/profile/user_profile.dart';
import 'utils/connection_status.dart';
import 'utils/logs_common_utils.dart';
import 'utils/shared_prefs.dart';
import 'utils/utils.dart';

class AppSingleton {
  static final AppSingleton _singleton = AppSingleton._internal();

  PackageInfo? packageInfo;

  factory AppSingleton() {
    return _singleton;
  }

  AppSingleton._internal() {
    ConnectionStatus connectionStatusSingleton = ConnectionStatus();
    connectionStatus = connectionStatusSingleton;
    initThings();
  }

  initThings() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  bool showBusinessUserRegisterAlert = false;
  bool clearPostCaption = true;

  late ConnectionStatus connectionStatus;

  static UserProfile? loggedInUserProfile = UserProfile.fromRawJson(
    UserPreference.getValue(key: SharedPrefKey.userProfileData.name) ?? "",
  );

  static Future<String> getUserId() async {
    return loggedInUserProfile?.id ?? (await Utils.getUserIdFromToken());
  }

  Timer? _appSessionTimer;

  DateTime isTokenTimeout(String token) {
    final parts = token.split('.');

    if (parts.length != 3) {}

    final payloadMap = json.decode(Utils.decodeBase64(parts[1]));

    if (payloadMap is! Map<String, dynamic>) {}

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(payloadMap['exp'] * 1000);
    return dateTime;
  }

  static int tokenTimeOutMinutes = 10;

  Future<dynamic> sessionTimeOutHandler({required String userIdToken}) async {}

  updateTheToken() async {
    LogsCommonUtils.writeToLogFile(
        'This is update the token and init session happens',
        title: 'updateTheToken');
  }

  Timer _setTimeout(callback, {required Duration duration}) {
    return Timer(duration, callback);
  }
}

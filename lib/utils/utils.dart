import 'dart:async';
import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../app_singleton.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_paddings.dart';
import '../constants/app_sized_box.dart';
import '../constants/app_text_styles.dart';
import '../constants/size_config.dart';
import '../constants/time_durations.dart';
import '../routing/route_names.dart';
import '../ui/widgets/base_button.dart';
import '../ui/widgets/base_loading_widget.dart';
import 'extensions.dart';
import 'logger.dart';
import 'secure_storage.dart';
import 'shared_prefs.dart';

class Utils {
  static FilteringTextInputFormatter numberFormatter =
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));
  static FilteringTextInputFormatter textFormatter =
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));
  static FilteringTextInputFormatter emailRules =
      FilteringTextInputFormatter.allow(RegExp(r'[+~/>*<!#$%^&()=?/;:,€]'));

  static int timeDuration = 300;
  static Duration duration300 = Duration(milliseconds: timeDuration);

  static String getAmPmFromDateTime(String mainString) {
    String dateTimeString = getValidDateString(mainString);
    DateTime dateTime = DateTime.parse(dateTimeString);

    DateTime localDateTime = dateTime.toLocal();
    String roughTimeString = DateFormat('hh:mm a').format(localDateTime);

    return roughTimeString;
  }

  static DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  static String getDateFromTime(String mainString) {
    String dateTimeString = getValidDateString(mainString);
    DateTime dateTime = DateTime.parse(dateTimeString);

    DateTime localDateTime = dateTime.toLocal();
    String roughTimeString = DateFormat('dd MMM, yyyy').format(localDateTime);

    return roughTimeString;
  }

  static String getTimeFromTime(String mainString) {
    String dateTimeString = getValidDateString(mainString);
    DateTime dateTime = DateTime.parse(dateTimeString);

    DateTime localDateTime = dateTime.toLocal();
    String roughTimeString = DateFormat('hh:mm a').format(localDateTime);

    return roughTimeString;
  }

  static String getDisplayTimeFromTime(String mainString) {
    String dateTimeString = getValidDateString(mainString);
    DateTime dateTime = DateTime.parse(dateTimeString);

    DateTime localDateTime = dateTime.toLocal();
    DateTime now = DateTime.now();
    Duration difference = now.difference(localDateTime);
    int minutes = difference.inMinutes;
    if (minutes >= 30) {
      String roughTimeString = DateFormat('hh:mm a').format(localDateTime);
      return roughTimeString;
    } else {
      if (minutes < 1) {
        return "Moments Ago";
      } else {
        return "$minutes Min";
      }
    }
  }

  getTimeFromTimeStamp(num? timestamp) {
    if (timestamp == null) return '';
    var localDateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000);
    String roughTimeString =
        DateFormat('hh:mm a dd, MMM').format(localDateTime);

    return roughTimeString;
  }

  static int getHoursFromDateTime(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);
      DateTime dateTime = DateTime.parse(dateTimeString);
      DateTime localDateTime = dateTime.toLocal();
      return DateTime.now().difference(localDateTime).inHours;
    } catch (e) {
      return 100;
    }
  }

  static String getDateFromDateTime(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);
      DateTime dateTime = DateTime.parse(dateTimeString);
      DateTime localDateTime = dateTime.toLocal();
      String roughTimeString = DateFormat('dd MMM yyyy').format(localDateTime);
      return roughTimeString;
    } catch (e) {
      return '';
    }
  }

  static String getTimeAgoString(String mainString) {
    String dateTimeString = getValidDateString(mainString);
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateTime localDateTime = dateTime.toLocal();
    Duration diff = DateTime.now().difference(localDateTime);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : '(s)'} ago';
    } else {
      return 'just now';
    }
  }

  static String isToday(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);
      DateTime dateTime = DateTime.parse(dateTimeString);
      DateTime localDateTime = dateTime.toLocal();
      Duration diff = DateTime.now().difference(localDateTime);
      if (diff.inDays >= 1) {
        return "Older";
      } else {
        return "Today";
      }
    } catch (e) {
      return "";
    }
  }

  static String getVerboseDateTimeRepresentation(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);
      DateTime dateTime = DateTime.parse(dateTimeString);

      DateTime now = DateTime.now();
      DateTime localDateTime = dateTime.toLocal();

      String roughTimeString = DateFormat('hh:mm a').format(localDateTime);

      if (localDateTime.day == now.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        var diff = now.difference(localDateTime);
        if (diff.inHours > 0) {
          return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
        }
        if (diff.inMinutes > 0) {
          return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
        }
        return "just now";
      }

      DateTime yesterday = now.subtract(const Duration(days: 1));

      if (localDateTime.day == yesterday.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        return 'Yesterday, $roughTimeString';
      }

      if (now.difference(localDateTime).inDays < 7) {
        String weekday = DateFormat('EEEE').format(localDateTime);

        return '$weekday, $roughTimeString';
      }

      return '${DateFormat('dd-MM-yyyy').format(localDateTime)}, $roughTimeString';
    } catch (e) {
      return "";
    }
  }

  static String getValidDateString(String mainString) {
    String dateTimeString = mainString;
    try {
      if (dateTimeString.length != 32) {
        final startIndex = dateTimeString.indexOf('.');
        final endIndex = dateTimeString.indexOf('+', startIndex);

        String subString = dateTimeString.substring(startIndex + 1, endIndex);
        dateTimeString =
            '${dateTimeString.substring(0, 19)}.${subString.padRight(6, "0")}${dateTimeString.substring(endIndex)}';
      }
    } catch (e) {
      // debugPrint('Error in date conversation');
      dateTimeString = mainString;
    }
    return dateTimeString;
  }

  static String getVerboseDayFromDateTime(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);

      DateTime dateTime = DateTime.parse(dateTimeString);
      DateTime localDateTime = dateTime.toLocal();
      DateTime now = DateTime.now();

      if (localDateTime.day == now.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        return 'Today';
      }

      DateTime yesterday = now.subtract(const Duration(days: 1));

      if (localDateTime.day == yesterday.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        return 'Yesterday';
      }

      if (now.difference(localDateTime).inDays < 7) {
        String weekday = DateFormat('EEEE').format(localDateTime);
        return weekday;
      }
      return DateFormat('dd/MM/yy').format(localDateTime);
    } catch (e) {
      return '';
    }
  }

  static String getVerboseChatDateTimeRepresentation(String mainString) {
    try {
      String dateTimeString = getValidDateString(mainString);

      DateTime dateTime = DateTime.parse(dateTimeString);

      DateTime now = DateTime.now();
      DateTime localDateTime = dateTime.toLocal();

      String roughTimeString = DateFormat('hh:mm a').format(localDateTime);

      if (localDateTime.day == now.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        var diff = now.difference(localDateTime);
        if (diff.inHours < 1 && diff.inMinutes > 0) {
          return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
        }
        return roughTimeString;
      }

      DateTime yesterday = now.subtract(const Duration(days: 1));

      if (localDateTime.day == yesterday.day &&
          localDateTime.month == now.month &&
          localDateTime.year == now.year) {
        return 'Yesterday';
      }

      if (now.difference(localDateTime).inDays < 7) {
        String weekday = DateFormat('EEEE').format(localDateTime);

        return weekday;
      }

      return DateFormat('dd/MM/yy').format(localDateTime);
    } catch (e) {
      return "";
    }
  }

  static String getCurrentDateTime() {
    return "${DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now().toUtc())}.000000+00:00";
  }

  static String removeAllHtmlTags(String htmlText) {
    if (htmlText == null) return '';
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static String serverTimeFormate(DateTime dateTime) {
    return DateFormat("hh:mm a").format(dateTime);
  }

  static Future<bool> checkInternetConnectionAndShowMessage() async {
    // ConnectivityResult connectivityResult =
    //     await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   Fimber.i(">> No Connection Available <<");
    //   showMessageInSnackBar(LanguageConst.internetNotAvailable, true);
    //   return false;
    // } else {
    //   Fimber.i(">> Connection Available <<");
    return true;
    // }
  }

  static showSuccessToast(String message, bool isError) {
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? AppColor.redColor : AppColor.blackTextColor,
      textColor: AppColor.whiteTextColor,
      msg: message.capitalizeFirst ?? message,
    );
  }

  static String padString(String input, int targetLength, String padChar) {
    if (input.length >= targetLength) {
      return input;
    } else {
      int padLength = targetLength - input.length;
      String padding = padChar * padLength;
      return input + padding;
    }
  }

  static showMessageInSnackBar(String message, bool isError,
      {Duration? duration}) {
    try {
      if (message.isNotNullOrEmpty) {
        Get.snackbar("", "",
            boxShadows: [
              const BoxShadow(
                // color: Colors.yellow,
                color: AppColor.black4TextColor,
                offset: Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 8,
                spreadRadius: 2.0,
              )
            ],
            borderRadius: 8.rSize(),
            margin: AppPaddings.defaultPadding,
            // padding: AppPaddings.defaultPadding16,
            isDismissible: true,
            snackPosition: SnackPosition.BOTTOM,
            // maxWidth: double.infinity,
            backgroundColor: AppColor.whiteColor,
            //isError ? AppColor.redColor : AppColor.greenColor,
            colorText: AppColor.blackTextColor,
            duration: duration ?? TimeDurations.snackBarDuration,
            titleText: Row(
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyles.textStyleBlack14With400,
                    maxLines: 15,
                  ),
                ),
                16.rHorizontalSizedBox(),
                Image.asset(
                  isError ? AppIcons.unVerifiedImage : AppIcons.verifyImage,
                  height: 36.rWidth(),
                  width: 36.rWidth(),
                ),
              ],
            ),
            messageText: AppSizedBox.sizedBox0);
      }
    } catch (e) {
      Fimber.e(e.toString());
    }
  }

  static BoxBorder customBorderWidget() {
    return Border.all(
      color: AppColor.primaryColor,
      width: 1.5,
    );
  }

  static Future<String> getUserIdFromToken() async {
    String? token = await SecureStorageUtil.getValue(
        key: EncryptedPrefKeys.awsUserIdToken.name);

    if (token.isNotNullOrEmpty) {
      Map<String, dynamic> payload = Jwt.parseJwt(token!);
      await SecureStorageUtil.setValue(
          key: EncryptedPrefKeys.awsUserData.name, value: json.encode(payload));
      String userId = json
          .decode(payload['https://hasura.io/jwt/claims'])['x-hasura-user-id'];
      return userId;
    } else {
      return '';
    }
  }

  static Widget emptyRefreshListWidget(
      {required String listEmptyMessage,
      Color? color,
      bool isLoading = false,
      required Function() onTap}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: isLoading
          ? const Center(child: BaseLoadingWidget()).paddingAll16()
          : GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.refresh,
                      color: AppColor.blackColor,
                      size: 24,
                    ),
                    8.rVerticalSizedBox(),
                    Text(
                      listEmptyMessage,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ).paddingAll16(),
    );
  }

  static Future<bool> checkTokenValidityUpdated() async {
    // if (DateTime.now()
    //     .add(Duration(minutes: AppSingleton.tokenTimeOutMinutes))
    //     .isBefore(tokenExpiration(await SecureStorageUtil.getValue(
    //             key: EncryptedPrefKeys.awsUserIdToken.name) ??
    //         ''))) {
    return true;
    // } else {
    //   LogsCommonUtils.writeToLogFile(
    //       'This is token expired error and trying to refresh',
    //       title: 'checkTokenValidityUpdated');
    //   var response = await CognitoService.refreshTokenUpdated();
    //   AppSingleton().subscriptionStateController?.isReconnect.value =
    //       !(AppSingleton().subscriptionStateController?.isReconnect.value ??
    //           false);
    //   return response;
    // }
  }

  static showSessionExpireDialog({String? message}) async {
    if (Get.context != null) {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) => Dialog(
                insetPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  width: SizeConfig.getWidthPercentage(0.5,
                      elseWidthPercentage: 0.75),
                  padding: EdgeInsets.symmetric(
                      horizontal: 24.rWidth(), vertical: 16.rHeight()),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session Expire$message',
                        style: AppTextStyles.textStyleBlack18With700,
                      ),
                      12.rVerticalSizedBox(),
                      Text(
                        'Your session has been expired! Please login again to proceed further.',
                        style: AppTextStyles.textStyleBlack14With400,
                      ),
                      16.rVerticalSizedBox(),
                      1.rVerticalGreySizedBox(),
                      12.rVerticalSizedBox(),
                      Align(
                        alignment: Alignment.topRight,
                        child: BaseButton(
                            text: 'Retry',
                            isWrapWidth: true,
                            fontSize: SizeConfig.font12,
                            onSubmit: () async {
                              AppSingleton.loggedInUserProfile = null;
                              await UserPreference.clear();

                              Get.offAllNamed(splashViewRoute);
                            }),
                      )
                    ],
                  ),
                ),
              ));
    } else {
      AppSingleton.loggedInUserProfile = null;
      await UserPreference.clear();
      Get.offAllNamed(splashViewRoute);
    }
  }

  // static showReactiveDialog(String title, String desc, String btnName2) {
  //   return Dialog(
  //     insetPadding: EdgeInsets.zero,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  //     child: SizedBox(
  //         width: Get.width * 0.75,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               title,
  //               style: AppTextStyles.textStyleBlack18With700,
  //             ),
  //             12.rVerticalSizedBox(),
  //             Text(
  //               desc,
  //               style: AppTextStyles.textStyleBlack14With400,
  //             ),
  //             12.rVerticalSizedBox(),
  //             SizedBox(
  //               height: 40.rHeight(),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: BaseButton(
  //                       text: LanguageConst.cancel,
  //                       isOutlined: true,
  //                       onSubmit: () {
  //                         Get.back();
  //                       },
  //                     ),
  //                   ),
  //                   8.rHorizontalSizedBox(),
  //                   Expanded(
  //                     child: BaseButton(
  //                         text: btnName2,
  //                         onSubmit: () {
  //                           Get.back();
  //                           showDialog(
  //                               context: Get.context!,
  //                               builder: (BuildContext context) =>
  //                                   ReActiveAccountDialog());
  //                         }),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ).paddingAll16()),
  //   );
  // }

  static DateTime tokenExpiration(String token) {
    if (token.isNullOrEmpty) {
      return DateTime.now();
    }
    final parts = token.split('.');

    if (parts.length != 3) {
      Logger.error("Throw exception >>>>>");
// throw InvalidTokenException();
    }

    final payloadMap = json.decode(decodeBase64(parts[1]));

    if (payloadMap is! Map<String, dynamic>) {
      Logger.error("Throw exception of payload >>>>>");
    }

    return DateTime.fromMillisecondsSinceEpoch(payloadMap['exp'] * 1000);
  }

  static String decodeBase64(String str) {
    var output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        Logger.error("Throw exception of switch cases >>>>>");
    }

    return utf8.decode(base64Url.decode(output));
  }

  static passwordHideShowWidget(bool isPasswordShow) {
    return Container(
      margin: AppPaddings.defaultPadding16,
      child: Icon(
        isPasswordShow
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 20,
        color: AppColor.blackTextColor,
      ),
    );
  }
}

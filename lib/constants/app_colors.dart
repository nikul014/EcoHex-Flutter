import 'package:flutter/material.dart';

class AppColor {
  ///basic theme colors
  static const Color primaryColor = Color(0xff0C7773); //0C7773
  static const Color gradientSecondColor = Color(0xff0C955B);
  static const Color primaryColorLight = Color(0xff5ea19e);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color linksColor = Color(0xff3F69FF);
  static const Color redColor = Color(0xffcf0f22);

  /// Only below text colors and combinations used for icons and most of the ui screens
  /// took nearly equal color rather than adding other colors
  static const Color blueBorderColor = Color(0xFFE3E7EC);
  static const Color lightBackgroundColor = Color(0xFFF1FAFF);
  static const Color blackTextColor = Color(0xFF000000);
  static const Color successGreen = Color(0xFF27AE60);
  static const Color declinedBgColor = Color(0xFFFFEDE3);
  static const Color pinkAvatar = Color(0xFFFFDEDE);
  static const Color pinkSelected = Color(0xFFFFF5F2);
  // static const Color blackTextColor = Color(0xFF131415);
  static const Color black2TextColor = Color(0xff676C72);
  static const Color black3TextColor = Color(0xFFA2A7AB);
  static const Color black4TextColor = Color(0xFFC1C4C7);
  static const Color black4_5TextColor = Color(0xFFF0F0F0);
  static const Color black5TextColor = Color(0xFFF6F6F6);
  static const Color black7TextColor = Color(0xFFF9F9F9);
  static const Color black6TextColor = Color(0xFF333333);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color accentYellowColor = Color(0xFF841F34);
  static const Color yellowColor = Color(0xFFDB9344);
  static const Color yellow = Colors.amber;

  /// this is the custom class for color which can be use in all over the app
  static const Color transparent = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greenColor = Color(0xFF31D0AA);
}

class ColorThemeModel {
  Color primaryColor;
  Color primaryColorDark;
  Color secondaryColor;
  Color backgroundColor;
  Color bottomAppBarColor;
  Color? buttonThemeColor;
  Color textFieldLabelTextColor;
  Color textFieldHelperTextColor;
  Color errorColor;
  Brightness brightness;
  String? fontFamily;

  ColorThemeModel({
    required this.primaryColor,
    required this.primaryColorDark,
    required this.secondaryColor,
    this.backgroundColor = AppColor.backgroundColor,
    this.bottomAppBarColor = AppColor.backgroundColor,
    this.textFieldLabelTextColor = AppColor.blackTextColor,
    this.textFieldHelperTextColor = AppColor.black3TextColor,
    this.errorColor = Colors.red,
    this.brightness = Brightness.light,
    this.buttonThemeColor,
    this.fontFamily,
  });
}

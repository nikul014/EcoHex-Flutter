import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'hi_in.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_us,
        'hi_IN': hi_in,
      };
}

class AppLanguagesConstant {
  static const Locale defaultLocalization = Locale('en', 'US');
  static const Locale hindiLocalization = Locale('hi', 'IN');
}

import 'dart:ui';

import 'package:get/get.dart';

import 'en_usdart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Get.locale;

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, /*'es_ES': es_ES, 'ar_DZ': ar_DZ*/
      };
}

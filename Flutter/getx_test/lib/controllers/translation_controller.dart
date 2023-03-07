import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  void changeLanguage(String languageCode, String countryCode) {
    final Locale locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}

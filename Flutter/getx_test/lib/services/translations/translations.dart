// import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'package:get/get.dart';

class TranslationMessage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {"hello": "Hello everybody", "user": "I'm @name @surname."},
        "ru_RU": {"hello": "Привет всем", "user": "Я @name @surname."},
        "hy_AM": {"hello": "Բարև բոլորին", "user": "Ես @name @surname֊ն եմ."},
      };
}

import 'package:get/get.dart';
import 'package:getx_test/controllers/translation_controller.dart';

class TranslationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TranslationController(), fenix: true);
  }
}

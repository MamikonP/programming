import 'package:get/get.dart';
import 'package:getx_test/controllers/cart/cart_controller.dart';
import 'package:getx_test/controllers/cart/item_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
    Get.create(() => ItemController());
  }
}

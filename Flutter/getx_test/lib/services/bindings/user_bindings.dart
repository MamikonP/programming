import 'package:get/get.dart';
import 'package:getx_test/controllers/user/user_controller.dart';
import 'package:getx_test/controllers/user/users_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.create(() => UserController());
  }
}

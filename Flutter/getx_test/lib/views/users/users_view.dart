import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/user/users_controller.dart';
import 'package:getx_test/models/user.dart';
import 'package:getx_test/views/users/widgets/user.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);

  // final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Human Resources",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: controller.obx(
          (data) => SafeArea(
                child: ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    UserModel user = data[index];
                    return UserView(
                      user: user,
                    );
                  }),
                ),
              ),
          onEmpty: ErrorWidget("Data is empty"), onError: (error) {
        return ErrorWidget("Something went wrong:\n$error");
      },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}

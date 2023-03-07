import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/models/user.dart';

class UserController extends GetxController {
  final user = UserModel(0, "", "", "", "").obs;

  GlobalKey<FormState> firstNameKey = GlobalKey();
  GlobalKey<FormState> lastNameKey = GlobalKey();
  GlobalKey<FormState> emailKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void updateUser(UserModel modifiedUser) {
    user.update((val) {
      val = modifiedUser;
    });
  }
}

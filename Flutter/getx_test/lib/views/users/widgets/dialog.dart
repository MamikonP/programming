import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/user/user_controller.dart';
import 'package:getx_test/controllers/user/users_controller.dart';
import 'package:getx_test/models/user.dart';

class UserFormField extends StatelessWidget {
  final String text;
  final String value;
  final TextEditingController controller;
  const UserFormField(
      {Key? key,
      required this.text,
      required this.value,
      required this.controller})
      : super(key: key);

  String? validate(String? value) {
    switch (text) {
      case "First Name":
      case "Last Name":
        if (value == null || value.isEmpty) return null;
        if (value.isNotEmpty && !value.contains(' ') && !value.contains('')) {
          return null;
        }
        return "Name is empty or contains spaces.";
      default:
        if (value == null || value.isEmpty) return null;
        if (value.length < 3) {
          return "Email length must be at least 3 characters.";
        }
        if (!value.contains("@")) {
          return "Invalid email address.";
        }
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              hintText: text),
          validator: (value) => validate(value)),
    );
  }
}

void showUserDialog(UserController controller, UserModel user) {
  final usersController = Get.find<UsersController>();
  Get.defaultDialog(
    title: "Edit ${user.firstName}'s",
    onCancel: () => Get.back(closeOverlays: false),
    content: Column(
      children: [
        Form(
          key: controller.firstNameKey,
          child: UserFormField(
            text: 'First Name',
            value: user.firstName,
            controller: controller.firstNameController,
          ),
        ),
        Form(
          key: controller.lastNameKey,
          child: UserFormField(
            text: 'Last Name',
            value: user.lastName,
            controller: controller.lastNameController,
          ),
        ),
        Form(
          key: controller.emailKey,
          child: UserFormField(
            text: 'Email',
            value: user.email,
            controller: controller.emailController,
          ),
        ),
      ],
    ),
    onConfirm: () {
      String? firstName = controller.firstNameController.text == ""
          ? null
          : controller.firstNameController.text;
      String? lastName = controller.lastNameController.text == ""
          ? null
          : controller.lastNameController.text;
      String? email = controller.emailController.text == ""
          ? null
          : controller.emailController.text;
      if (controller.firstNameKey.currentState!.validate()) {
        controller.updateUser(user.copyWith(firstName: firstName));
      }
      if (controller.lastNameKey.currentState!.validate()) {
        controller.updateUser(user.copyWith(
          lastName: lastName,
        ));
      }
      if (controller.emailKey.currentState!.validate()) {
        controller.updateUser(user.copyWith(
          email: email,
        ));
      }
      usersController.updateUser(user.copyWith(
        firstName: firstName,
        lastName: lastName,
        email: email,
      ));
      Get.back(closeOverlays: false);
    },
  );
}

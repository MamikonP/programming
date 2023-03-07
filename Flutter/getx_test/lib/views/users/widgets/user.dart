import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_test/controllers/user/user_controller.dart';
import 'package:getx_test/models/user.dart';
import 'package:getx_test/views/users/widgets/dialog.dart';

class UserView extends StatelessWidget {
  final UserModel user;
  const UserView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${user.firstName} ${user.lastName}",
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          final controller = Get.find<UserController>();
          showUserDialog(controller, user);
        },
      ),
    );
  }
}

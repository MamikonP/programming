import 'package:get/get.dart';
import 'package:getx_test/models/user.dart';
import 'package:getx_test/services/providers/user_provider.dart';

class UsersController extends GetxController with StateMixin<List<UserModel>> {
  final UserProvider _userProvider = UserProvider();
  final users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _userProvider.fetchUsers().then((response) {
      users.value = response;
      change(response, status: RxStatus.success());
    }, onError: (error) {
      change(error, status: RxStatus.error());
    });
  }

  void updateUser(UserModel user) {
    List<UserModel> allUsers = users.value.map((e) {
      return e.id == user.id ? user : e;
    }).toList();
    if (allUsers.isNotEmpty) {
      users.value = allUsers;
      change(allUsers, status: RxStatus.success());
    }
  }
}

import 'package:get/get_connect.dart';
import 'package:getx_test/models/user.dart';

class UserProvider extends GetConnect {
  Future<List<UserModel>> fetchUsers() async {
    final response = await get("https://reqres.in/api/users");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    }
    Iterable listData = response.body['data'];
    return List<UserModel>.from(
        listData.map((data) => UserModel.fromJson(data)));
  }
}

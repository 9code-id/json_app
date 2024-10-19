import 'package:json_app/model/user/user.dart';
import 'package:json_app/service/data_service/data_service.dart';

class UserService {
  static List<User> users = [];
  Future<List<User>> getUsers() async {
    List<Map<String, dynamic>> data = await DataService().loadDataJson();
    users = data.map((e) => User.fromJson(e)).toList();
    return users;
  }

  void update({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) {
    User user = users.firstWhere((element) => element.id == id);
    user.firstName = firstName;
    user.lastName = lastName;
    user.email = email;
    user.dob = dob;
  }
}

import 'package:json_app/model/user/user.dart';
import 'package:json_app/service/data_service/data_service.dart';

class UserService {
  static List<User> users = [];
  Future<List<User>> getUsers() async {
    List data = await DataService().loadDataJson();
    users = data.map((e) => User.fromJson(e)).toList();
    users.sort((a, b) => a.firstName!.compareTo(b.firstName!));
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

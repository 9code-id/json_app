import 'package:json_app/model/user/user.dart';
import 'package:json_app/service/data_service/data_service.dart';

class UserService {
  static List<User> users = [];
  Future<List<User>> getUsers() async {
    List data = await DataService().loadDataJson();
    users = data.map((e) => User.fromJson(e)).toList();
    sortUsers();
    return users;
  }

  void sortUsers() {
    users.sort((a, b) => a.firstName!.compareTo(b.firstName!));
  }

  void create({
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) {
    UserService.users.add(User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstName: firstName,
      lastName: lastName,
      email: email,
      dob: dob,
    ));
    sortUsers();
  }

  void update({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) {
    User user = UserService.users.firstWhere((element) => element.id == id);
    user.firstName = firstName;
    user.lastName = lastName;
    user.email = email;
    user.dob = dob;
    sortUsers();
  }

  void delete(String id) {
    UserService.users.removeWhere((element) => element.id == id);
    sortUsers();
  }
}

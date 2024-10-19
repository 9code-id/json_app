import 'dart:convert';

import 'package:json_app/model/user/user.dart';
import 'package:json_app/service/db_service/db_service.dart';
import 'package:json_app/service/user_service/user_service.dart';

class AuthService {
  bool get isLoggedIn => DBService.get("isLoggedIn") == "true";
  String get userId => DBService.get("userId") ?? "-";
  Map<String, dynamic> get userObj => jsonDecode(DBService.get("user") ?? "{}");
  User get user => User.fromJson(userObj);

  bool login(String id) {
    var userIndex = UserService.users.indexWhere((element) => element.id == id);
    bool isLoggedIn = userIndex > -1;

    if (isLoggedIn) {
      DBService.set("isLoggedIn", "true");
      DBService.set("userId", id);
      DBService.set("user", jsonEncode(UserService.users[userIndex]));
    }
    return isLoggedIn;
  }

  void logout() {
    DBService.set("isLoggedIn", "false");
  }

  void reloadUserData() {
    var userIndex =
        UserService.users.indexWhere((element) => element.id == userId);
    DBService.set("user", jsonEncode(UserService.users[userIndex]));
  }
}

import 'package:json_app/service/db_service/db_service.dart';
import 'package:json_app/service/user_service/user_service.dart';

class AuthService {
  bool login(String id) {
    bool isLoggedIn =
        UserService.users.indexWhere((element) => element.id == id) > -1;

    if (isLoggedIn) {
      DBService.set("isLoggedIn", "true");
    }
    return isLoggedIn;
  }

  void logout() {
    DBService.set("isLoggedIn", "false");
  }

  bool get isLoggedIn => DBService.get("isLoggedIn") == "true";
}

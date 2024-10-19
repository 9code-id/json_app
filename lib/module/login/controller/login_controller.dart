import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import 'package:json_app/service/auth_service/auth_service.dart';
import 'package:json_app/state_util.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? userId = "5c8a80f52dfee238898d64cf";
  login() {
    bool isNotValid = formKey.currentState!.validate() == false;
    if (isNotValid) {
      return;
    }

    bool isLoggedIn = AuthService().login(userId!);
    if (isLoggedIn) {
      Get.offAll(const MainNavigationView());
    }
  }
}

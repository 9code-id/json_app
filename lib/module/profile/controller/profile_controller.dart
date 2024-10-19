import 'package:flutter/material.dart';
import 'package:json_app/core.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;

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

  logout() {
    AuthService().logout();
    Get.offAll(const LoginView());
  }

  reload() {
    AuthService().reloadUserData();
    setState(() {});
  }
}

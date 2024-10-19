import 'package:flutter/material.dart';
import 'package:json_app/core.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

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

  String search = "";
  updateSearch(String value) {
    search = value;
    setState(() {});
  }

  reload() async {
    setState(() {});
  }

  reloadUserData() async {
    await UserService().getUsers();
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import '../controller/main_navigation_controller.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  Widget build(context, MainNavigationController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Navigation"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}

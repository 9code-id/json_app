import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import '../controller/contact_detail_controller.dart';

class ContactDetailView extends StatefulWidget {
  const ContactDetailView({super.key});

  Widget build(context, ContactDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
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
  State<ContactDetailView> createState() => ContactDetailController();
}

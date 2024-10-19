
import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import '../controller/contact_form_controller.dart';

class ContactFormView extends StatefulWidget {
  const ContactFormView({super.key});

  Widget build(context, ContactFormController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Form"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ContactFormView> createState() => ContactFormController();
}
    
import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import 'package:json_app/model/user/user.dart';
import '../controller/contact_detail_controller.dart';

class ContactDetailView extends StatefulWidget {
  final User item;
  const ContactDetailView({
    super.key,
    required this.item,
  });

  Widget build(context, ContactDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 48.0,
                  child: Text(
                    item.get2DigitChar(),
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Main Information",
                style: TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  color: primaryColor,
                ),
              ),
              const Divider(),
              QTextField(
                label: "First Name *",
                validator: Validator.required,
                prefixIcon: Icons.person_outline,
                value: controller.firstName,
                onChanged: (value) {
                  controller.firstName = value;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              QTextField(
                label: "Last Name *",
                validator: Validator.required,
                prefixIcon: Icons.person_outline,
                value: controller.lastName,
                onChanged: (value) {
                  controller.lastName = value;
                },
              ),
              Text(
                "Sub Information",
                style: TextStyle(
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  color: primaryColor,
                ),
              ),
              const Divider(),
              QTextField(
                label: "Email",
                validator: Validator.email,
                prefixIcon: Icons.email_outlined,
                value: controller.email,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              QDatePicker(
                label: "Birth date",
                validator: Validator.required,
                value: controller.dob,
                onChanged: (value) {
                  controller.dob = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => controller.update(),
                  child: const Text("Update"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () => controller.remove(),
                  child: const Text("Remove"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ContactDetailView> createState() => ContactDetailController();
}

import 'package:flutter/material.dart';
import 'package:json_app/core.dart';
import 'package:json_app/shared/theme/theme.dart';
import 'package:json_app/shared/util/validator/validator.dart';
import 'package:json_app/shared/widget/textfield/text_field.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi There!",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Please login to see your contact list",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: greyTextColor,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                QTextField(
                  label: "User ID *",
                  prefixIcon: Icons.person_outline,
                  validator: Validator.required,
                  value: controller.userId,
                  onChanged: (value) {
                    controller.userId = value;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 46,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}

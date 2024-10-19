import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_app/core.dart';
import 'package:json_app/shared/theme/theme.dart';
import 'package:json_app/shared/util/validator/date/date.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  Widget build(context, ProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          InkWell(
            onTap: () => controller.logout(),
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 48.0,
                child: Text(
                  AuthService().user.get2DigitChar(),
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "${AuthService().user.firstName} ${AuthService().user.lastName}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: textColor2,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "${AuthService().user.email}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: textColor2,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                AuthService().user.dob!.dMy,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  color: textColor2,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.to(ContactDetailView(
                      item: AuthService().user,
                    ));
                    controller.reload();
                  },
                  child: const Text("Update my detail"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}

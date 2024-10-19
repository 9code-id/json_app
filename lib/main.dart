import 'package:json_app/service/auth_service/auth_service.dart';
import 'package:json_app/service/db_service/db_service.dart';
import 'package:json_app/service/user_service/user_service.dart';
import 'package:json_app/state_util.dart';
import 'package:json_app/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserService().getUsers();
  await DBService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: AuthService().isLoggedIn
          ? const MainNavigationView()
          : const LoginView(),
    );
  }
}

import 'package:dentist_hospital_system/Auth/main_auth/app_session.dart';
import 'package:dentist_hospital_system/Auth/main_auth/session_manager.dart';
import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/Patient_main_screen/Patient_main_screen.dart';
import 'package:flutter/material.dart';
import 'Auth/main_auth/login_screen.dart';

import 'Users/Admin/Screens/Admin_Dashboard.dart';
import 'Users/Doctor/screens/Doctor_Dashboard.dart';
import 'Users/Student/screens/Student_Dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLoggedIn = await SessionManager.isLoggedIn();
  final role = await SessionManager.getUserRole();

  AppSession.currentRole = role;

  runApp(MyApp(isLoggedIn: isLoggedIn, role: role));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final UserRole? role;

  const MyApp({super.key, required this.isLoggedIn, required this.role});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _getStartScreen(),
    );
  }

  Widget _getStartScreen() {
    if (!isLoggedIn || role == null) {
      return const LoginScreen();
    }

    switch (role!) {
      case UserRole.admin:
        return const Admin_DashBoard();
      case UserRole.doctor:
        return const Doctor_DashBoard();
      case UserRole.student:
        return const Student_DashBoard();
      case UserRole.patient:
        return const PatientHomeScreen();
    }
  }
}

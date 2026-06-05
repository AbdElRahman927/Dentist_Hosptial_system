import 'package:dentist_hospital_system/Users/Admin/Admin_Drawer/Admin_Drawer.dart';
import 'package:dentist_hospital_system/Users/Doctor/Doctor_Drawer/Doctor_Drawer.dart';
import 'package:dentist_hospital_system/Users/Patient/Drawer/Patient_drawer.dart';
import 'package:dentist_hospital_system/Users/Student/Student_Drawer/Student_drawer.dart';
import 'package:flutter/material.dart';
import 'app_session.dart';
import 'user_role.dart';

class AppDrawerhandelr extends StatelessWidget {
  const AppDrawerhandelr({super.key});

  @override
  Widget build(BuildContext context) {
    final role = AppSession.currentRole;

    switch (role) {
      case UserRole.admin:
        return Drawer_Admin();

      case UserRole.doctor:
        return Drawer_Doctor();

      case UserRole.student:
        return Drawer_Student();
      case UserRole.patient:
        return PatientDrawer();

      default:
        return const SizedBox();
    }
  }
}

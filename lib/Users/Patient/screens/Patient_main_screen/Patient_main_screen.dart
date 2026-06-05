import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:flutter/material.dart';
import 'widgets/patient_header.dart';
import 'widgets/quick_actions.dart';
import 'widgets/upcoming_appointments.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerhandelr(),
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Patient Portal",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PatientHeader(),

          SizedBox(height: 20),

          QuickActions(),

          SizedBox(height: 20),

          UpcomingAppointments(),
        ],
      ),
    );
  }
}

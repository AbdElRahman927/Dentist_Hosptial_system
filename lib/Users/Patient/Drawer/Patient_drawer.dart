import 'package:dentist_hospital_system/Users/Patient/Drawer/Patient_drawer_tile.dart';
import 'package:dentist_hospital_system/Users/Patient/Drawer/label.dart';
import 'package:dentist_hospital_system/Users/Patient/Drawer/patient_drawer_header.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/Pateint_Profile/patient_profile_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/Patient_main_screen/Patient_main_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/book_appointments/book_appointment_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/diagnoses_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/screens/patient_appointments_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_settings/patient_settings_screen.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/prescriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/Auth/main_auth/login_screen.dart';
import 'package:dentist_hospital_system/Auth/main_auth/session_manager.dart';
import 'package:dentist_hospital_system/Auth/main_auth/app_session.dart';

// Screens (YOU will connect these later)
import 'package:dentist_hospital_system/screens/Help & support.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  Future<void> logout(BuildContext context) async {
    await SessionManager.logout();
    AppSession.currentRole = null;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            /// HEADER
            const PatientDrawerHeader(),

            Divider(height: 1, color: Colors.grey[200]),

            /// BODY
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                children: [
                  /// MAIN FEATURES
                  const PatientSectionLabel("PATIENT"),

                  PatientDrawerTile(
                    text: "Dashboard",
                    icon: const Icon(
                      Icons.dashboard_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PatientHomeScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "Book Appointment",
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookAppointmentScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "My Appointments",
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PatientAppointmentsScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "Prescriptions",
                    icon: const Icon(
                      Icons.medical_services_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PrescriptionsScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "Diagnoses",
                    icon: const Icon(
                      Icons.description_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DiagnosesScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 8),
                  Divider(height: 1, color: Colors.grey[200]),
                  const SizedBox(height: 8),

                  /// ACCOUNT
                  const PatientSectionLabel("ACCOUNT"),

                  PatientDrawerTile(
                    text: "Profile",
                    icon: const Icon(
                      Icons.person_outline,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PatientProfileScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "Notifications",
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {},
                  ),

                  PatientDrawerTile(
                    text: "Settings",
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PatientSettingsScreen(),
                        ),
                      );
                    },
                  ),

                  PatientDrawerTile(
                    text: "Help & Support",
                    icon: const Icon(
                      Icons.help_outline,
                      color: Color(0xff931A23),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Help_support()),
                      );
                    },
                  ),
                ],
              ),
            ),

            /// LOGOUT
            Divider(height: 1, color: Colors.grey[200]),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: InkWell(
                onTap: () => logout(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red[700]),
                      const SizedBox(width: 8),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.red[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

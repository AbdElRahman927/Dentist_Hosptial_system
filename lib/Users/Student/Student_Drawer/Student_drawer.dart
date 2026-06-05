import 'package:dentist_hospital_system/Users/Student/Student_Drawer/Student_drawer_widget.dart';
import 'package:dentist_hospital_system/Users/Student/screens/My_Student_Profile.dart';
import 'package:dentist_hospital_system/Users/Student/screens/Student_Dashboard.dart';
import 'package:dentist_hospital_system/Users/Student/screens/Student_Notifacation.dart';
import 'package:dentist_hospital_system/Users/Student/screens/Student_Settings.dart';
import 'package:dentist_hospital_system/Auth/main_auth/app_session.dart';
import 'package:dentist_hospital_system/Auth/main_auth/session_manager.dart';
import 'package:dentist_hospital_system/screens/Appointments/Appointment_screen.dart';
import 'package:dentist_hospital_system/screens/Help%20&%20support.dart';
import 'package:dentist_hospital_system/Auth/main_auth/login_screen.dart';
import 'package:dentist_hospital_system/screens/Patients/patient_screen.dart';
import 'package:flutter/material.dart';

class Drawer_Student extends StatelessWidget {
  const Drawer_Student({super.key});

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
            Container(
              padding: EdgeInsets.fromLTRB(20, 16, 12, 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xff931A23),
                    child: Text(
                      "OA",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Omar Ali",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "Year 3",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "DS-2023-001",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 22, color: Colors.grey[500]),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[200]),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  _sectionLabel("ACADEMIC"),
                  Student_Tile_Widget(
                    text: "Dashboard",
                    icon: Icon(
                      Icons.dashboard_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap:
                        () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Student_DashBoard(),
                          ),
                        ),
                  ),
                  Student_Tile_Widget(
                    text: "My Patients",
                    icon: Icon(Icons.people_outline, color: Color(0xff931A23)),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PatientsScreen(),
                          ),
                        ),
                  ),
                  Student_Tile_Widget(
                    text: "Appointments",
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AppointmentsScreeen(),
                          ),
                        ),
                  ),

                  SizedBox(height: 8),
                  Divider(height: 1, color: Colors.grey[200]),
                  SizedBox(height: 8),
                  _sectionLabel("ACCOUNT"),
                  Student_Tile_Widget(
                    text: "My Profile",
                    icon: Icon(Icons.person_outline, color: Color(0xff931A23)),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Student_Profile(),
                          ),
                        ),
                  ),
                  Student_Tile_Widget(
                    text: "Notifications",
                    icon: Icon(
                      Icons.notifications_none,
                      color: Color(0xff931A23),
                    ),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Student_Notification(),
                          ),
                        ),
                  ),
                  Student_Tile_Widget(
                    text: "Settings",
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Color(0xff931A23),
                    ),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Student_Settings(),
                          ),
                        ),
                  ),
                  Student_Tile_Widget(
                    text: "Help & Support",
                    icon: Icon(Icons.help_outline, color: Color(0xff931A23)),
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Help_support()),
                        ),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: Colors.grey[200]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: InkWell(
                onTap: () => logout(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red[700]),
                      SizedBox(width: 8),
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

  Widget _sectionLabel(String text) => Padding(
    padding: EdgeInsets.only(left: 12, bottom: 6, top: 4),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: Colors.grey[400],
        letterSpacing: 1.2,
      ),
    ),
  );
}

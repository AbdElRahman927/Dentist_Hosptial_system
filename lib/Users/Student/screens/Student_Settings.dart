import 'package:flutter/material.dart';

class Student_Settings extends StatefulWidget {
  const Student_Settings({super.key});
  @override
  State<Student_Settings> createState() => _Student_SettingsState();
}

class _Student_SettingsState extends State<Student_Settings> {
  bool classReminders = true;
  bool clinicAlerts = true;
  bool pushNotif = true;
  bool emailNotif = false;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(size: 28),
        title: Row(
          children: [
            Image.asset(
              "images/hospital.png",
              scale: 12,
              color: Color(0xff931A23),
            ),
            SizedBox(width: 10),
            Text("Settings", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Student info banner
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xff931A23),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff931A23).withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: Icon(
                    Icons.school_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omar Ali",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "2nd Year • DS-2023-001",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          _section("Academic"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.event_note_outlined,
              Colors.blue,
              "Class Schedule",
              "View & sync schedule",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.assignment_outlined,
              Color(0xff931A23),
              "Case Log Preferences",
              "Default templates",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.grading_outlined,
              Colors.purple,
              "Grade Notifications",
              "Exam & evaluation alerts",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),

          _section("Clinical"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.medical_services_outlined,
              Color(0xff931A23),
              "Clinic Preferences",
              "Default clinic settings",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.person_outline,
              Colors.teal,
              "Patient Notes Format",
              "Template preferences",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),

          _section("Notifications"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.alarm_outlined,
              Colors.blue,
              "Class Reminders",
              "15 min before sessions",
              Switch(
                value: classReminders,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => classReminders = v),
              ),
            ),
            _div(),
            _tile(
              Icons.local_hospital_outlined,
              Colors.orange,
              "Clinic Alerts",
              "Session & patient updates",
              Switch(
                value: clinicAlerts,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => clinicAlerts = v),
              ),
            ),
            _div(),
            _tile(
              Icons.notifications_outlined,
              Color(0xff931A23),
              "Push Notifications",
              "In-app alerts",
              Switch(
                value: pushNotif,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => pushNotif = v),
              ),
            ),
            _div(),
            _tile(
              Icons.email_outlined,
              Colors.purple,
              "Email Notifications",
              "Weekly summary",
              Switch(
                value: emailNotif,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => emailNotif = v),
              ),
            ),
          ]),
          SizedBox(height: 20),

          _section("Account"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.lock_outline,
              Colors.blue,
              "Change Password",
              "",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.dark_mode_outlined,
              Colors.blueGrey,
              "Dark Mode",
              "Switch to dark theme",
              Switch(
                value: darkMode,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => darkMode = v),
              ),
            ),
            _div(),
            _tile(
              Icons.language_outlined,
              Colors.teal,
              "Language",
              "English",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),

          _section("About"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.info_outline,
              Colors.grey,
              "App Version",
              "v1.0.0",
              SizedBox.shrink(),
            ),
            _div(),
            _tile(
              Icons.help_outline,
              Colors.grey,
              "Help & Support",
              "",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.privacy_tip_outlined,
              Colors.grey,
              "Privacy Policy",
              "",
              _arrow(),
            ),
          ]),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _section(String t) => Padding(
    padding: EdgeInsets.only(left: 4),
    child: Text(
      t,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    ),
  );

  Widget _card(List<Widget> c) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.15),
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(children: c),
  );

  Widget _tile(
    IconData icon,
    Color color,
    String title,
    String sub,
    Widget trailing,
  ) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              if (sub.isNotEmpty)
                Text(
                  sub,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
            ],
          ),
        ),
        trailing,
      ],
    ),
  );

  Widget _div() => Divider(height: 1, indent: 60, color: Colors.grey[200]);
  Widget _arrow() =>
      Icon(Icons.chevron_right, color: Colors.grey[400], size: 24);
}

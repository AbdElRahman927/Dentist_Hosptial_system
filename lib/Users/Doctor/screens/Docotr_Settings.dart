import 'package:flutter/material.dart';

class Doctor_Settings extends StatefulWidget {
  const Doctor_Settings({super.key});
  @override
  State<Doctor_Settings> createState() => _Doctor_SettingsState();
}

class _Doctor_SettingsState extends State<Doctor_Settings> {
  bool apptReminders = true;
  bool patientAlerts = true;
  bool pushNotif = true;
  bool emailNotif = false;
  bool darkMode = false;
  bool autoAccept = false;

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
          // Doctor info banner
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
                    Icons.medical_services_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Ahmed Hassan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Prosthodontics",
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

          _section("Appointment Settings"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.timer_outlined,
              Colors.blue,
              "Appointment Duration",
              "Default: 30 minutes",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.event_available_outlined,
              Colors.green,
              "Auto-Accept Appointments",
              "New bookings auto-confirmed",
              Switch(
                value: autoAccept,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => autoAccept = v),
              ),
            ),
            _div(),
            _tile(
              Icons.block_outlined,
              Colors.red,
              "Blocked Time Slots",
              "Manage unavailable times",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.repeat_outlined,
              Colors.teal,
              "Recurring Schedule",
              "Set weekly availability",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),

          _section("Notifications"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.alarm_outlined,
              Color(0xff931A23),
              "Appointment Reminders",
              "15 min before each appointment",
              Switch(
                value: apptReminders,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => apptReminders = v),
              ),
            ),
            _div(),
            _tile(
              Icons.person_outline,
              Colors.orange,
              "Patient Alerts",
              "New bookings & cancellations",
              Switch(
                value: patientAlerts,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => patientAlerts = v),
              ),
            ),
            _div(),
            _tile(
              Icons.notifications_outlined,
              Colors.blue,
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
              "Daily schedule summary",
              Switch(
                value: emailNotif,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => emailNotif = v),
              ),
            ),
          ]),
          SizedBox(height: 20),

          _section("Clinical"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.note_alt_outlined,
              Color(0xff931A23),
              "Note Templates",
              "Manage clinical note templates",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.folder_outlined,
              Colors.indigo,
              "Patient File Preferences",
              "Default view & sorting",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.school_outlined,
              Colors.orange,
              "Student Supervision",
              "Evaluation preferences",
              _arrow(),
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

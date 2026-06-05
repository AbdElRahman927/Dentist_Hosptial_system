import 'package:flutter/material.dart';

class Admin_Settings extends StatefulWidget {
  const Admin_Settings({super.key});
  @override
  State<Admin_Settings> createState() => _Admin_SettingsState();
}

class _Admin_SettingsState extends State<Admin_Settings> {
  bool autoBackup = true;
  bool emailNotif = true;
  bool pushNotif = true;
  bool maintenance = false;
  bool twoFA = true;
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
          _adminBanner(),
          SizedBox(height: 20),
          _section("Hospital Management"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.local_hospital_outlined,
              Color(0xff931A23),
              "Hospital Information",
              "Name, address, contacts",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.schedule_outlined,
              Colors.blue,
              "Working Hours",
              "Clinic operating hours",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.category_outlined,
              Colors.purple,
              "Departments",
              "Manage departments",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),
          _section("User Management"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.people_outline,
              Color(0xff931A23),
              "Manage Users",
              "Doctors, students, staff",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.verified_user_outlined,
              Colors.green,
              "Roles & Permissions",
              "Configure access levels",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.person_add_outlined,
              Colors.orange,
              "Pending Approvals",
              "3 pending registrations",
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),
          _section("Security"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.security_outlined,
              Colors.blue,
              "Two-Factor Auth",
              "Require 2FA for all staff",
              Switch(
                value: twoFA,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => twoFA = v),
              ),
            ),
            _div(),
            _tile(
              Icons.lock_outline,
              Colors.teal,
              "Password Policy",
              "Requirements & expiry",
              _arrow(),
            ),
            _div(),
            _tile(
              Icons.history_outlined,
              Colors.indigo,
              "Activity Log",
              "View audit trail",
              _arrow(),
            ),
          ]),
          SizedBox(height: 20),
          _section("System"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.backup_outlined,
              Colors.green,
              "Auto Backup",
              "Daily at 3:00 AM",
              Switch(
                value: autoBackup,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => autoBackup = v),
              ),
            ),
            _div(),
            _tile(
              Icons.engineering_outlined,
              Colors.orange,
              "Maintenance Mode",
              "Disable access temporarily",
              Switch(
                value: maintenance,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => maintenance = v),
              ),
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
          ]),
          SizedBox(height: 20),
          _section("Notifications"),
          SizedBox(height: 10),
          _card([
            _tile(
              Icons.email_outlined,
              Colors.blue,
              "Email Notifications",
              "System alerts via email",
              Switch(
                value: emailNotif,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => emailNotif = v),
              ),
            ),
            _div(),
            _tile(
              Icons.notifications_outlined,
              Color(0xff931A23),
              "Push Notifications",
              "In-app notifications",
              Switch(
                value: pushNotif,
                activeColor: Color(0xff931A23),
                onChanged: (v) => setState(() => pushNotif = v),
              ),
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
              "v1.0.0 (Build 2026.05)",
              SizedBox.shrink(),
            ),
            _div(),
            _tile(
              Icons.description_outlined,
              Colors.grey,
              "Terms & Conditions",
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

  Widget _adminBanner() => Container(
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
            Icons.admin_panel_settings,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "System Administrator",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Full access to all settings",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ],
    ),
  );

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

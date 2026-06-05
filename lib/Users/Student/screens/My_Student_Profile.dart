import 'package:dentist_hospital_system/Auth/main_auth/login_screen.dart';
import 'package:flutter/material.dart';

class Student_Profile extends StatelessWidget {
  const Student_Profile({super.key});

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
            Text("My Profile", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Profile Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xff931A23),
                  child: Text(
                    "OA",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "Omar Ali",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Dental Student",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "2nd Year",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xff931A23).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "DS-2023-001",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff931A23),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Stats
          Row(
            children: [
              _stat("Cases Done", "18", Icons.assignment_turned_in_outlined),
              SizedBox(width: 10),
              _stat("Patients", "12", Icons.people_outline),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _stat("Attendance", "92%", Icons.check_circle_outline),
              SizedBox(width: 10),
              _stat("GPA", "3.7", Icons.star_outline),
            ],
          ),
          SizedBox(height: 20),

          // Personal Information
          _sectionCard("Personal Information", [
            _infoRow(Icons.email_outlined, "Email", "omar.ali@std.nmu.edu.eg"),
            _infoRow(Icons.phone_outlined, "Phone", "+20 1098765432"),
            _infoRow(Icons.badge_outlined, "Student ID", "DS-2023-001"),
            _infoRow(
              Icons.calendar_today_outlined,
              "Enrolled",
              "September 2023",
            ),
          ]),
          SizedBox(height: 16),

          // Academic Info
          _sectionCard("Academic Info", [
            _infoRow(
              Icons.school_outlined,
              "Program",
              "Bachelor of Dental Surgery",
            ),
            _infoRow(Icons.class_outlined, "Year", "2nd Year"),
            _infoRow(Icons.person_outline, "Supervisor", "Dr. Ahmed Hassan"),
            _infoRow(Icons.category_outlined, "Department", "Prosthodontics"),
          ]),
          SizedBox(height: 16),

          // Clinical Progress
          _sectionCard("Clinical Progress", [
            _progressItem("Crown Preparations", 6, 10, Colors.blue),
            SizedBox(height: 14),
            _progressItem("Root Canals", 3, 8, Colors.orange),
            SizedBox(height: 14),
            _progressItem("Extractions", 8, 12, Colors.green),
            SizedBox(height: 14),
            _progressItem("Composite Fillings", 12, 15, Color(0xff931A23)),
          ]),
          SizedBox(height: 16),

          // Quick Actions
          _sectionCard("Quick Actions", [
            _actionRow(
              Icons.edit_outlined,
              "Edit Profile",
              Color(0xff931A23),
              () {},
            ),
            Divider(height: 1, color: Colors.grey[200]),
            _actionRow(
              Icons.lock_outlined,
              "Change Password",
              Colors.blue,
              () {},
            ),
            Divider(height: 1, color: Colors.grey[200]),
            _actionRow(
              Icons.download_outlined,
              "Download Transcript",
              Colors.green,
              () {},
            ),
          ]),
          SizedBox(height: 16),

          // Logout
          GestureDetector(
            onTap:
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (r) => false,
                ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Colors.red, size: 22),
                  SizedBox(width: 8),
                  Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _stat(String title, String value, IconData icon) => Expanded(
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Color(0xff931A23)),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );

  Widget _sectionCard(String title, List<Widget> children) => Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.12),
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14),
        ...children,
      ],
    ),
  );

  Widget _infoRow(IconData icon, String label, String value) => Padding(
    padding: EdgeInsets.only(bottom: 14),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xff931A23).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: Color(0xff931A23)),
        ),
        SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
            SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _progressItem(String procedure, int done, int total, Color color) {
    double progress = done / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              procedure,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              "$done/$total",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }

  Widget _actionRow(
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap,
  ) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    ),
  );
}

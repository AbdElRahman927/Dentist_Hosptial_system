import 'package:flutter/material.dart';

class Help_support extends StatelessWidget {
  const Help_support({super.key});

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
            Text("Help & Support", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header banner
          Container(
            padding: EdgeInsets.all(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.support_agent_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 12),
                Text(
                  "How can we help you?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Browse FAQ or contact support below",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Search
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Color(0xff931A23), width: 1.5),
              ),
              hintText: "Search help topics...",
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              contentPadding: EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          SizedBox(height: 20),

          // Quick Actions
          _section("Quick Actions"),
          SizedBox(height: 10),
          Row(
            children: [
              _quickAction(Icons.email_outlined, "Email\nSupport", Colors.blue),
              SizedBox(width: 10),
              _quickAction(Icons.phone_outlined, "Call\nHotline", Colors.green),
              SizedBox(width: 10),
              _quickAction(Icons.chat_outlined, "Live\nChat", Colors.orange),
            ],
          ),
          SizedBox(height: 20),

          // FAQ
          _section("Frequently Asked Questions"),
          SizedBox(height: 10),
          _faqCard([
            _faqItem(
              "How do I reset my password?",
              "Go to Settings > Account > Change Password. Enter your current password and set a new one. If you forgot your password, tap 'Forgot Password' on the login screen.",
            ),
            _faqItem(
              "How to book an appointment?",
              "Navigate to Appointments from the dashboard or drawer menu, then tap the + button to create a new appointment. Select the patient, doctor, date, and time.",
            ),
            _faqItem(
              "How do I view patient records?",
              "Go to Patients from the drawer, search for the patient, and tap on their card to view the full profile including medical history and appointments.",
            ),
            _faqItem(
              "Can I export reports?",
              "Yes, go to your profile and use the 'Download Data' option to export your reports in PDF format.",
            ),
            _faqItem(
              "How to contact the IT department?",
              "You can reach the IT department at it.support@nmu.edu.eg or call extension 4501 during working hours (Sun-Thu, 8AM-4PM).",
            ),
          ]),
          SizedBox(height: 20),

          // Contact Information
          _section("Contact Information"),
          SizedBox(height: 10),
          _card([
            _contactRow(
              Icons.location_on_outlined,
              "Address",
              "NMU Dental Hospital, New Mansoura City, Egypt",
            ),
            _div(),
            _contactRow(Icons.phone_outlined, "Phone", "+20 50 123 4567"),
            _div(),
            _contactRow(Icons.email_outlined, "Email", "support@nmu.edu.eg"),
            _div(),
            _contactRow(
              Icons.access_time_outlined,
              "Working Hours",
              "Sun - Thu, 8:00 AM - 4:00 PM",
            ),
          ]),
          SizedBox(height: 20),

          // App Info
          _section("About the App"),
          SizedBox(height: 10),
          _card([
            _contactRow(
              Icons.info_outline,
              "Version",
              "v1.0.0 (Build 2026.05)",
            ),
            _div(),
            _contactRow(Icons.code_outlined, "Developer", "NMU IT Department"),
            _div(),
            _contactRow(
              Icons.description_outlined,
              "Terms of Service",
              "View terms",
            ),
            _div(),
            _contactRow(
              Icons.privacy_tip_outlined,
              "Privacy Policy",
              "View policy",
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

  Widget _quickAction(IconData icon, String label, Color color) => Expanded(
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
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );

  Widget _faqCard(List<Widget> children) => Container(
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
    child: Column(children: children),
  );

  Widget _faqItem(String question, String answer) => Theme(
    data: ThemeData().copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 14),
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color(0xff931A23).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.help_outline, color: Color(0xff931A23), size: 18),
      ),
      title: Text(
        question,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      children: [
        Text(
          answer,
          style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.5),
        ),
      ],
    ),
  );

  Widget _card(List<Widget> c) => Container(
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
    child: Column(children: c),
  );

  Widget _contactRow(IconData icon, String label, String value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _div() => Divider(height: 1, indent: 60, color: Colors.grey[200]);
}

import 'package:flutter/material.dart';

import 'widgets/patient_settings_banner.dart';
import 'widgets/patient_settings_card.dart';
import 'widgets/patient_settings_section.dart';
import 'widgets/patient_settings_tile.dart';

class PatientSettingsScreen extends StatefulWidget {
  const PatientSettingsScreen({super.key});

  @override
  State<PatientSettingsScreen> createState() => _PatientSettingsScreenState();
}

class _PatientSettingsScreenState extends State<PatientSettingsScreen> {
  bool appointmentReminder = true;
  bool prescriptionReminder = true;
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool twoFA = false;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PatientSettingsBanner(),

          const SizedBox(height: 20),

          const PatientSettingsSection("Account"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.person_outline,
                color: const Color(0xff931A23),
                title: "Edit Profile",
                subtitle: "Update your information",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.lock_outline,
                color: Colors.blue,
                title: "Change Password",
                subtitle: "Update account password",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const PatientSettingsSection("Notifications"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.calendar_month_outlined,
                color: const Color(0xff931A23),
                title: "Appointment Reminders",
                subtitle: "Receive appointment alerts",
                trailing: Switch(
                  value: appointmentReminder,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      appointmentReminder = v;
                    });
                  },
                ),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.receipt_long_outlined,
                color: Colors.green,
                title: "Prescription Updates",
                subtitle: "Receive medication updates",
                trailing: Switch(
                  value: prescriptionReminder,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      prescriptionReminder = v;
                    });
                  },
                ),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.notifications_outlined,
                color: Colors.orange,
                title: "Push Notifications",
                subtitle: "Enable app notifications",
                trailing: Switch(
                  value: pushNotifications,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      pushNotifications = v;
                    });
                  },
                ),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.email_outlined,
                color: Colors.blue,
                title: "Email Notifications",
                subtitle: "Receive emails",
                trailing: Switch(
                  value: emailNotifications,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      emailNotifications = v;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const PatientSettingsSection("Privacy & Security"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.security_outlined,
                color: Colors.indigo,
                title: "Two-Factor Authentication",
                subtitle: "Extra account protection",
                trailing: Switch(
                  value: twoFA,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      twoFA = v;
                    });
                  },
                ),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.history_outlined,
                color: Colors.teal,
                title: "Login Activity",
                subtitle: "View login history",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const PatientSettingsSection("Medical Preferences"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.contact_phone_outlined,
                color: Colors.green,
                title: "Emergency Contact",
                subtitle: "Manage emergency contacts",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.share_outlined,
                color: Colors.purple,
                title: "Medical Data Sharing",
                subtitle: "Consent preferences",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const PatientSettingsSection("App Preferences"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.dark_mode_outlined,
                color: Colors.blueGrey,
                title: "Dark Mode",
                subtitle: "Switch theme",
                trailing: Switch(
                  value: darkMode,
                  activeColor: const Color(0xff931A23),
                  onChanged: (v) {
                    setState(() {
                      darkMode = v;
                    });
                  },
                ),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.language_outlined,
                color: Colors.blue,
                title: "Language",
                subtitle: "English",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const PatientSettingsSection("About"),

          const SizedBox(height: 10),

          PatientSettingsCard(
            children: [
              PatientSettingsTile(
                icon: Icons.info_outline,
                color: Colors.grey,
                title: "App Version",
                subtitle: "v1.0.0",
                trailing: const SizedBox(),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.description_outlined,
                color: Colors.grey,
                title: "Terms & Conditions",
                subtitle: "",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),

              const Divider(height: 1),

              PatientSettingsTile(
                icon: Icons.privacy_tip_outlined,
                color: Colors.grey,
                title: "Privacy Policy",
                subtitle: "",
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

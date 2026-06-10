import 'package:dentist_hospital_system/Users/Patient/screens/Pateint_Profile/widgets/patient_profile_card.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

import 'widgets/patient_profile_action_row.dart';
import 'widgets/patient_profile_header.dart';
import 'widgets/patient_profile_info_row.dart';
import 'widgets/patient_profile_section.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        surfaceTintColor: Colors.white,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PatientProfileHeader(),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: PatientProfileStatCard(
                  title: "Appointments",
                  value: "${patients[0].appointments?.length}",
                  icon: Icons.calendar_month_outlined,
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: PatientProfileStatCard(
                  title: "Visits",
                  value: "${patients[0].appointments?.length}",
                  icon: Icons.medical_services_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Expanded(
                child: PatientProfileStatCard(
                  title: "Prescriptions",
                  value: "3",
                  icon: Icons.receipt_long_outlined,
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: PatientProfileStatCard(
                  title: "Diagnoses",
                  value: "2",
                  icon: Icons.health_and_safety_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          PatientProfileSection(
            title: "Personal Information",
            children: [
              PatientProfileInfoRow(
                icon: Icons.email_outlined,
                label: "Email",
                value: patients[0].email!,
              ),

              PatientProfileInfoRow(
                icon: Icons.phone_outlined,
                label: "Phone",
                value: patients[0].phone!,
              ),

              PatientProfileInfoRow(
                icon: Icons.person_outline,
                label: "Gender",
                value: patients[0].gender!,
              ),

              PatientProfileInfoRow(
                icon: Icons.cake_outlined,
                label: "Date of Birth",
                value: "15 May 2000",
              ),
            ],
          ),

          const SizedBox(height: 16),

          PatientProfileSection(
            title: "Medical Information",
            children: const [
              PatientProfileInfoRow(
                icon: Icons.bloodtype_outlined,
                label: "Blood Type",
                value: "A+",
              ),

              PatientProfileInfoRow(
                icon: Icons.warning_amber_outlined,
                label: "Allergies",
                value: "Penicillin",
              ),

              PatientProfileInfoRow(
                icon: Icons.favorite_outline,
                label: "Chronic Diseases",
                value: "None",
              ),
            ],
          ),

          const SizedBox(height: 16),

          PatientProfileSection(
            title: "Quick Actions",
            children: [
              PatientProfileActionRow(
                icon: Icons.edit_outlined,
                text: "Edit Profile",
                color: const Color(0xff931A23),
                onTap: () {},
              ),

              Divider(),

              PatientProfileActionRow(
                icon: Icons.lock_outline,
                text: "Change Password",
                color: Colors.blue,
                onTap: () {},
              ),

              Divider(),

              PatientProfileActionRow(
                icon: Icons.download_outlined,
                text: "Download Medical Report",
                color: Colors.green,
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.logout, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

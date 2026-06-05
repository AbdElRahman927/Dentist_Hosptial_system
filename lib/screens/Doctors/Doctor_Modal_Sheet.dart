import 'package:dentist_hospital_system/screens/Doctors/Doctor_profile.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/DetailsCard.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/model_sheet_data_row.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';

import 'package:flutter/material.dart';

class Doctor_Modal_Sheet extends StatelessWidget {
  final Doctor_model doctor;

  const Doctor_Modal_Sheet({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        children: [
          /// ===== HEADER =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xff941419),
                  child: Text(
                    doctor.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctor.email ?? '',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 5),

                    /// STATUS
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: doctor.statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        doctor.statusLabel,
                        style: TextStyle(
                          fontSize: 12,
                          color: doctor.statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// ===== STATS =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                DetailsCard(
                  color1: Colors.blue.shade100,
                  number: doctor.patientsCount,
                  text: "Patients",
                  widget: Icon(
                    Icons.people_outline,
                    size: 30,
                    color: Colors.blue.shade900,
                  ),
                  color2: Colors.blue.shade900,
                ),
                const SizedBox(width: 10),
                DetailsCard(
                  color1: Colors.green.shade100,
                  number: doctor.studentsCount,
                  text: "Students",
                  widget: Icon(
                    Icons.school,
                    size: 30,
                    color: Colors.green.shade900,
                  ),
                  color2: Colors.green.shade900,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// ===== DETAILS =====
          Expanded(
            child: ListView(
              children: [
                Data_Row(
                  data: "Specialization",
                  value: doctor.specialization ?? '-',
                ),
                Data_Row(data: "License Number", value: doctor.license ?? '-'),
                Data_Row(data: "Experience", value: doctor.experience ?? '-'),
                Data_Row(
                  data: "Appointments",
                  value: "${doctor.numOfAppointments ?? 0}",
                ),

                /// ===== NAVIGATION =====
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorProfile(doctor: doctor),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff941419),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Full Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

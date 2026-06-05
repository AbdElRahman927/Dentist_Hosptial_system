import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/screens/Doctors/Doctor_Modal_Sheet.dart';

import '../model/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor_model? doctor;

  const DoctorCard({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => Doctor_Modal_Sheet(doctor: doctor!),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff931A23),
              child: Text(
                doctor!.initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),

            /// Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor!.name ?? ''),
                  Text(
                    doctor!.specialization ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Text("${doctor!.patientsCount} patients"),
                      const SizedBox(width: 10),
                      Text("${doctor!.studentsCount} students"),
                    ],
                  ),
                ],
              ),
            ),

            /// Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: doctor!.statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    doctor!.statusLabel,
                    style: TextStyle(color: doctor!.statusColor),
                  ),
                ),
                Text(
                  doctor!.lastActive ?? '',
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

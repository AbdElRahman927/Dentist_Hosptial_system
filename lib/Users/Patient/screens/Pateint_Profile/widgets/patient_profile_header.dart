import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

class PatientProfileHeader extends StatelessWidget {
  const PatientProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: const Color(0xff931A23),
            child: Text(
              patients[0].initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            patients[0].name!,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xff931A23).withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Patient ID: ${patients[0].id}",
              style: TextStyle(
                color: Color(0xff931A23),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

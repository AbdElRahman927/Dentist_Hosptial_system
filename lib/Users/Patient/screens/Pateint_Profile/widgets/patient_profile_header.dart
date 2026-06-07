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
            child: const Text(
              "AM",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Ahmed Mohamed",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(
                0xff931A23,
              ).withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Patient ID: PT-2025-001",
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
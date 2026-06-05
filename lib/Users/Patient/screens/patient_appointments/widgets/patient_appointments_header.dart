import 'package:flutter/material.dart';

class PatientAppointmentsHeader extends StatelessWidget {
  final int total;

  const PatientAppointmentsHeader({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff931A23),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          const Icon(
            Icons.calendar_month,
            color: Colors.white,
            size: 34,
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Appointments",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "$total Total Appointments",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
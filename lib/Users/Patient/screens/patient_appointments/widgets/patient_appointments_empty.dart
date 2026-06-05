import 'package:flutter/material.dart';

class PatientAppointmentsEmpty extends StatelessWidget {
  const PatientAppointmentsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            size: 70,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 12),

          Text(
            "No appointments found",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
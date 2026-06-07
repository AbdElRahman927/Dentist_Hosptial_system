import 'package:flutter/material.dart';

class DiagnosisEmptyState extends StatelessWidget {
  const DiagnosisEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_information_outlined,
            size: 70,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 12),

          Text(
            "No diagnosis records found",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
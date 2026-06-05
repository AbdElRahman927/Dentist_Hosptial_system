import 'package:flutter/material.dart';

class PatientEmptyState extends StatelessWidget {
  const PatientEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No patients found",
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PatientSettingsSection extends StatelessWidget {
  final String title;

  const PatientSettingsSection(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }
}
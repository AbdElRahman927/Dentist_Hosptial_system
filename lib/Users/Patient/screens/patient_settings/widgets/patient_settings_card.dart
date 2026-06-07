import 'package:flutter/material.dart';

class PatientSettingsCard extends StatelessWidget {
  final List<Widget> children;

  const PatientSettingsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
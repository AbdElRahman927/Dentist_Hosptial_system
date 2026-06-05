import 'package:flutter/material.dart';

class DoctorEmptyState extends StatelessWidget {
  const DoctorEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No doctors found"));
  }
}

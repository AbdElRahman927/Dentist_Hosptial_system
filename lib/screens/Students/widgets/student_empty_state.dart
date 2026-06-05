import 'package:flutter/material.dart';

class StudentEmptyState extends StatelessWidget {
  const StudentEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Students found"),
    );
  }
}
import 'package:flutter/material.dart';

class PrescriptionEmptyState extends StatelessWidget {
  const PrescriptionEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 70,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 12),
          Text(
            "No prescriptions found",
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
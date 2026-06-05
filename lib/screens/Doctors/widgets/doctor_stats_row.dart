import 'package:flutter/material.dart';

class DoctorStatsRow extends StatelessWidget {
  final int total;
  final int active;
  final int onLeave;
  final int inactive;

  const DoctorStatsRow({
    super.key,
    required this.total,
    required this.active,
    required this.onLeave,
    required this.inactive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem("$total", "Total", Colors.black),
          _divider(),
          _statItem("$active", "Active", Colors.green),
          _divider(),
          _statItem("$onLeave", "On Leave", Colors.orange),
          _divider(),
          _statItem("$inactive", "Inactive", Colors.red),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget _divider() => Container(width: 1, height: 35, color: Colors.grey[300]);
}

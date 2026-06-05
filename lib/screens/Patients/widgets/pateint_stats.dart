import 'package:flutter/material.dart';

class PatientStatsRow extends StatelessWidget {
  final int total;
  final int active;
  final int scheduled;
  final int completed;

  const PatientStatsRow({
    super.key,
    required this.total,
    required this.active,
    required this.scheduled,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem("$total", "Total", Colors.black),
          _divider(),
          _statItem("$active", "Active", Colors.green),
          _divider(),
          _statItem("$scheduled", "Scheduled", const Color(0xff931A23)),
          _divider(),
          _statItem("$completed", "Completed", Colors.blue),
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      ],
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 35, color: Colors.grey[300]);
  }
}

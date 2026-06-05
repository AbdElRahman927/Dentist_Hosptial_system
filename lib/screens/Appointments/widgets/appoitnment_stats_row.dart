import 'package:flutter/material.dart';

class AppointmentStatsRow extends StatelessWidget {
  final int total;
  final int scheduled;
  final int inProgress;
  final int completed;

  const AppointmentStatsRow({
    super.key,
    required this.total,
    required this.scheduled,
    required this.inProgress,
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
          _statItem("$scheduled", "Scheduled", Colors.blue),
          _divider(),
          _statItem("$inProgress", "In Progress", const Color(0xff931A23)),
          _divider(),
          _statItem("$completed", "Completed", Colors.green),
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
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _divider() => Container(width: 1, height: 35, color: Colors.grey[300]);
}

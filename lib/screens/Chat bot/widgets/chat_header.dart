import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final UserRole role;
  final String title;
  final String subtitle;

  const ChatHeader({
    super.key,
    required this.role,
    required this.title,
    required this.subtitle,
  });

  Color get _roleColor {
    switch (role) {
      case UserRole.admin:
        return const Color(0xff931A23);
      case UserRole.doctor:
        return Colors.blue;
      case UserRole.student:
        return Colors.green;
      case UserRole.patient:
        return Colors.yellow;
    }
  }

  String get _roleLabel {
    switch (role) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.doctor:
        return 'Doctor';
      case UserRole.student:
        return 'Student';
      case UserRole.patient:
        return 'Patient';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 2),
            color: Color(0x11000000),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff941419), Color(0xffC92A2A)],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.smart_toy_outlined, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _roleColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              _roleLabel,
              style: TextStyle(
                color: _roleColor,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
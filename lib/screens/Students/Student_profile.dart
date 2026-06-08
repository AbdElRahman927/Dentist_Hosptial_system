import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final StudentModel student;

  const StudentProfile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff931A23)),
        title: const Text(
          "Student Profile",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _headerCard(),
          const SizedBox(height: 16),
          _statsRow(),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Personal Information",
            children: [
              _infoRow(Icons.badge_outlined, "Student ID", student.id),
              _infoRow(Icons.email_outlined, "Email", student.email),
              _infoRow(Icons.phone_outlined, "Phone", student.phone),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Academic Information",
            children: [
              _infoRow(Icons.person_outline, "Supervisor", student.supervisor),
              _infoRow(Icons.school_outlined, "Year", student.year?.toString()),
              _infoRow(Icons.flag_outlined, "Status", student.statusLabel),
              _infoRow(
                Icons.access_time_outlined,
                "Last Active",
                student.lastActive,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Workload & Performance",
            children: [
              _infoRow(
                Icons.people_outline,
                "Patients",
                "${student.numOfPatients ?? 0}",
              ),
              _infoRow(
                Icons.calendar_month_outlined,
                "Appointments",
                "${student.numOfAppointments ?? 0}",
              ),
              _infoRow(
                Icons.trending_up_outlined,
                "Performance",
                student.performance == null ? "-" : "${student.performance}%",
              ),
            ],
          ),
          const SizedBox(height: 16),
          _quickActions(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff941419), Color(0xff2563EB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Text(
              student.initials.isEmpty ? "S" : student.initials,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff941419),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name ?? "-",
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  student.supervisor ?? "Student",
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    student.statusLabel,
                    style: TextStyle(
                      color: student.statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            title: "Patients",
            value: "${student.numOfPatients ?? 0}",
            icon: Icons.people_outline,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            title: "Appointments",
            value: "${student.numOfAppointments ?? 0}",
            icon: Icons.calendar_month_outlined,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statCard(
            title: "Performance",
            value:
                student.performance == null ? "-" : "${student.performance}%",
            icon: Icons.trending_up_outlined,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 10),
          SizedBox(
            width: 120,
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          Expanded(
            child: Text(
              value == null || value.isEmpty ? "-" : value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickActions() {
    return _sectionCard(
      title: "Quick Actions",
      children: [
        _actionRow(Icons.people_outline, "View Patients", Colors.blue, () {}),
        const Divider(),
        _actionRow(
          Icons.calendar_month_outlined,
          "View Appointments",
          Colors.green,
          () {},
        ),
        const Divider(),
        _actionRow(
          Icons.message_outlined,
          "Contact Supervisor",
          Colors.orange,
          () {},
        ),
      ],
    );
  }

  Widget _actionRow(
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}

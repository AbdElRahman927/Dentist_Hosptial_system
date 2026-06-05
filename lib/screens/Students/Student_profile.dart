import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';

class StudentProfile extends StatelessWidget {
  final StudentModel student;

  const StudentProfile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Student Profile"),
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
              _infoRow(Icons.badge, "Student ID", student.id),
              _infoRow(Icons.email, "Email", student.email),
              _infoRow(Icons.phone, "Phone", student.phone),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Academic Information",
            children: [
              _infoRow(Icons.school, "Year", student.year?.toString()),
              _infoRow(Icons.person, "Supervisor", student.supervisor),
              _infoRow(Icons.access_time, "Last Active", student.lastActive),
              _infoRow(Icons.info, "Status", student.statusLabel),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= HEADER =================
  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff931A23), Color(0xffC4454D)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Text(
              student.initials,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff931A23),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name ?? '-',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  student.supervisor ?? '-',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: student.statusColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    student.statusLabel,
                    style: TextStyle(
                      color: student.statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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

  /// ================= STATS =================
  Widget _statsRow() {
    return Row(
      children: [
        _statCard("Patients", student.numOfPatients ?? 0, Icons.people),
        const SizedBox(width: 10),
        _statCard(
          "Appointments",
          student.numOfAppointments ?? 0,
          Icons.calendar_today,
        ),
        const SizedBox(width: 10),
        _statCard("Performance", student.performance ?? 0, Icons.trending_up),
      ],
    );
  }

  Widget _statCard(String title, int value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xff931A23)),
            const SizedBox(height: 6),
            Text(
              "$value",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  /// ================= SECTION =================
  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  /// ================= INFO ROW =================
  Widget _infoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          Text(
            value ?? '-',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

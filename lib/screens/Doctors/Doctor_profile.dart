import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor_model doctor;

  const DoctorProfile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Doctor Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _headerCard(),
          const SizedBox(height: 16),
          _statsRow(),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Professional Info",
            children: [
              _infoRow(Icons.medical_services, doctor.specialization),
              _infoRow(Icons.badge, doctor.license),
              _infoRow(Icons.work_history, doctor.experience),
              _infoRow(Icons.apartment, doctor.department),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Contact Info",
            children: [
              _infoRow(Icons.email, doctor.email),
              _infoRow(Icons.phone, doctor.phone),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= HEADER =================
  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff941419), Color(0xffC92A2A)],
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
              doctor.initials,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff941419),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor.specialization ?? '',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _statusChip(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        doctor.statusLabel,
        style: TextStyle(
          color: doctor.statusColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// ================= STATS =================
  Widget _statsRow() {
    return Row(
      children: [
        _statCard(
          title: "Patients",
          value: doctor.patientsCount,
          icon: Icons.people,
          color: Colors.blue,
        ),
        const SizedBox(width: 12),
        _statCard(
          title: "Appointments",
          value: doctor.numOfAppointments ?? 0,
          icon: Icons.calendar_today,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required int value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(title),
            const SizedBox(height: 4),
            Text(
              "$value",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
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
        borderRadius: BorderRadius.circular(16),
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
  Widget _infoRow(IconData icon, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value ?? '-',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}

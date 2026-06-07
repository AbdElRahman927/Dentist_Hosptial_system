import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor_model doctor;

  const DoctorProfile({super.key, required this.doctor});

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
          "Doctor Profile",
          style: TextStyle(color: Color(0xff931A23)),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _headerCard(),

          const SizedBox(height: 16),

          _statsRow(),

          const SizedBox(height: 16),

          _professionalInfo(),

          const SizedBox(height: 16),

          _contactInfo(),

          const SizedBox(height: 16),

          _activitySection(),

          const SizedBox(height: 16),

          _quickActions(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // =========================================================
  // HEADER
  // =========================================================

  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
            radius: 36,
            backgroundColor: Colors.white,
            child: Text(
              doctor.initials,
              style: const TextStyle(
                color: Color(0xff941419),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name ?? "-",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  doctor.specialization ?? "-",
                  style: const TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    doctor.statusLabel,
                    style: TextStyle(
                      color: doctor.statusColor,
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

  // =========================================================
  // STATS
  // =========================================================

  Widget _statsRow() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            "Patients",
            "${doctor.patientsCount}",
            Icons.people_outline,
            Colors.blue,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            "Students",
            "${doctor.studentsCount}",
            Icons.school_outlined,
            Colors.orange,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _statCard(
            "Appointments",
            "${doctor.numOfAppointments ?? 0}",
            Icons.calendar_month_outlined,
            Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),

          const SizedBox(height: 6),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PROFESSIONAL
  // =========================================================

  Widget _professionalInfo() {
    return _sectionCard("Professional Information", [
      _infoRow(
        Icons.medical_services_outlined,
        "Specialization",
        doctor.specialization,
      ),

      _infoRow(Icons.apartment_outlined, "Department", doctor.department),

      _infoRow(Icons.badge_outlined, "License Number", doctor.license),

      _infoRow(
        Icons.workspace_premium_outlined,
        "Experience",
        doctor.experience,
      ),
    ]);
  }

  // =========================================================
  // CONTACT
  // =========================================================

  Widget _contactInfo() {
    return _sectionCard("Contact Information", [
      _infoRow(Icons.email_outlined, "Email", doctor.email),

      _infoRow(Icons.phone_outlined, "Phone", doctor.phone),
    ]);
  }

  // =========================================================
  // ACTIVITY
  // =========================================================

  Widget _activitySection() {
    return _sectionCard("Clinical Activity", [
      _infoRow(Icons.access_time_outlined, "Last Active", doctor.lastActive),

      _infoRow(Icons.flag_outlined, "Current Status", doctor.statusLabel),
    ]);
  }

  // =========================================================
  // ACTIONS
  // =========================================================

  Widget _quickActions() {
    return _sectionCard("Quick Actions", [
      _actionRow(
        Icons.calendar_month_outlined,
        "View Assigned Appointments",
        Colors.blue,
        () {},
      ),

      const Divider(),

      _actionRow(
        Icons.people_outline,
        "View Treated Patients",
        Colors.green,
        () {},
      ),

      const Divider(),

      _actionRow(
        Icons.school_outlined,
        "View Assigned Students",
        Colors.orange,
        () {},
      ),
    ]);
  }

  // =========================================================
  // SHARED WIDGETS
  // =========================================================

  Widget _sectionCard(String title, List<Widget> children) {
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
              value ?? "-",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
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

import 'package:dentist_hospital_system/screens/Doctors/Doctor_profile.dart';
import 'package:dentist_hospital_system/screens/Patients/model/patient_model.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  final PatientModel patient;

  const PatientProfile({super.key, required this.patient});

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
          "Patient Profile",
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
              _infoRow(Icons.badge_outlined, "Patient ID", patient.id),
              _infoRow(Icons.email_outlined, "Email", patient.email),
              _infoRow(Icons.phone_outlined, "Phone", patient.phone),
              _infoRow(Icons.cake_outlined, "Age", patient.age),
              _infoRow(Icons.person_outline, "Gender", patient.gender),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Medical Information",
            children: [
              _infoRow(
                Icons.medical_information_outlined,
                "Condition",
                patient.condition,
              ),
              _infoRow(
                Icons.health_and_safety_outlined,
                "Medical History",
                patient.medicalHistory,
              ),
              _infoRow(Icons.notes_outlined, "Notes", patient.notes),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Visits & Appointments",
            children: [
              _infoRow(
                Icons.calendar_today_outlined,
                "Last Visit",
                patient.lastVisit,
              ),
              _infoRow(
                Icons.event_available_outlined,
                "Next Visit",
                patient.nextVisit,
              ),
              _infoRow(
                Icons.event_note_outlined,
                "Appointments Count",
                "${patient.appointmentsCount}",
              ),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Assigned Doctor",
            children: [
              _linkedPersonRow(
                avatarText:
                    patient.assignedDoctor?.initials ??
                    _initialsFromName(patient.assignedDoctorDisplayName),
                name: patient.assignedDoctorDisplayName,
                subtitle: patient.assignedDoctorDisplaySpecialization,
                onTap:
                    patient.assignedDoctor == null
                        ? null
                        : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => DoctorProfile(
                                    doctor: patient.assignedDoctor!,
                                  ),
                            ),
                          );
                        },
              ),
              const SizedBox(height: 8),
              _infoRow(Icons.flag_outlined, "Status", patient.statusLabel),
            ],
          ),
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
              patient.initials.isEmpty ? "P" : patient.initials,
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
                  patient.name ?? "-",
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  patient.condition ?? "Patient",
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    patient.statusLabel,
                    style: TextStyle(
                      color: patient.statusColor,
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
        _statCard(
          title: "Appointments",
          value: "${patient.appointmentsCount}",
          icon: Icons.calendar_month_outlined,
          color: Colors.blue,
        ),
        const SizedBox(width: 12),
        _statCard(
          title: "Visits",
          value:
              patient.lastVisit == null || patient.lastVisit!.isEmpty
                  ? "0"
                  : "1+",
          icon: Icons.local_hospital_outlined,
          color: Colors.green,
        ),
        const SizedBox(width: 12),
        _statCard(
          title: "Status",
          value: patient.statusLabel,
          icon: Icons.flag_outlined,
          color: const Color(0xff931A23),
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
    return Expanded(
      child: Container(
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
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
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

  Widget _linkedPersonRow({
    required String avatarText,
    required String name,
    required String subtitle,
    required VoidCallback? onTap,
  }) {
    final content = Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xff941419),
          child: Text(
            avatarText.isEmpty ? "D" : avatarText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        if (onTap != null)
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: Colors.grey[400],
          ),
      ],
    );

    if (onTap == null) return content;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: content,
    );
  }

  String _initialsFromName(String name) {
    final value = name.trim();
    if (value.isEmpty) return '';
    final parts = value.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    final first = parts[0].substring(0, 1).toUpperCase();
    final last = parts[1].substring(0, 1).toUpperCase();
    return '$first$last';
  }
}

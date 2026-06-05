

import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:dentist_hospital_system/screens/Doctors/Doctor_profile.dart';
import 'package:dentist_hospital_system/screens/Patients/pateint_profile.dart';
import 'package:dentist_hospital_system/screens/Students/Student_profile.dart';
import 'package:flutter/material.dart';

class AppointmentProfile extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentProfile({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      // drawer: AppDrawerhandelr(),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff931A23)),
        title: const Text(
          "Appointment Profile",
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
          _sectionCard(
            title: "Appointment Details",
            children: [
              _infoRow(Icons.badge_outlined, "Appointment ID", appointment.id),
              _infoRow(Icons.calendar_today_outlined, "Date", appointment.date),
              _infoRow(Icons.watch_later_outlined, "Time", appointment.time),
              _infoRow(
                Icons.place_outlined,
                "Location",
                appointment.locationLabel,
              ),
              _infoRow(
                Icons.medical_services_outlined,
                "Treatment",
                appointment.treatmentLabel,
              ),
              _infoRow(Icons.flag_outlined, "Status", appointment.statusLabel),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Patient Information",
            children: [
              _linkedPersonRow(
                avatarText: appointment.patientInitials,
                name: appointment.patientName,
                subtitle: appointment.patientPhone,
                onTap:
                    appointment.patient == null
                        ? null
                        : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => PatientProfile(
                                    patient: appointment.patient!,
                                  ),
                            ),
                          );
                        },
              ),
              const SizedBox(height: 8),
              _infoRow(Icons.email_outlined, "Email", appointment.patientEmail),
              _infoRow(Icons.badge, "Patient ID", appointment.patientId),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Assigned Doctor",
            children: [
              _linkedPersonRow(
                avatarText: appointment.doctorInitials,
                name: appointment.doctorName,
                subtitle: appointment.doctorSpecialization,
                onTap:
                    appointment.doctor == null
                        ? null
                        : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => DoctorProfile(
                                    doctor: appointment.doctor!,
                                  ),
                            ),
                          );
                        },
              ),
              const SizedBox(height: 8),
              _infoRow(Icons.email_outlined, "Email", appointment.doctorEmail),
              _infoRow(Icons.phone_outlined, "Phone", appointment.doctorPhone),
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Assigned Student",
            children: [
              if (appointment.hasStudent) ...[
                _linkedPersonRow(
                  avatarText: appointment.studentInitials,
                  name: appointment.studentName,
                  subtitle: appointment.studentSupervisor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                                StudentProfile(student: appointment.student!),
                      ),
                    );
                  },
                ),
              ] else ...[
                Text(
                  "No Assigned Student",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: "Notes",
            children: [
              Text(
                appointment.detailsNote,
                style: TextStyle(color: Colors.grey[800], height: 1.4),
              ),
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
              appointment.patientInitials,
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
                  appointment.appointmentTitle,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  appointment.patientName,
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
                    appointment.statusLabel,
                    style: TextStyle(
                      color: appointment.statusColor,
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
          title: "Date",
          value: appointment.date ?? '-',
          icon: Icons.calendar_today,
          color: Colors.blue,
        ),
        const SizedBox(width: 12),
        _statCard(
          title: "Time",
          value: appointment.time ?? '-',
          icon: Icons.watch_later_outlined,
          color: Colors.green,
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
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
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
            width: 110,
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          Expanded(
            child: Text(
              value ?? '-',
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
            avatarText,
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
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: Colors.grey,
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
}

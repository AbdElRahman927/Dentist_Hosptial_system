import 'package:dentist_hospital_system/screens/Patients/model/patient_model.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  final PatientModel patient;

  const PatientProfile({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Patient Profile",
          style: TextStyle(color: Color(0xff931A23)),
        ),
        iconTheme: const IconThemeData(color: Color(0xff931A23)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _section(
              title: "Patient Information",
              children: [
                _infoRow("Patient ID", patient.id),
                _infoRow("Age", patient.age),
                _infoRow("Gender", patient.gender),
                _infoRow("Phone", patient.phone),
                _infoRow("Email", patient.email),
              ],
            ),
            _section(
              title: "Medical Details",
              children: [
                _infoRow("Condition", patient.condition),
                _infoRow("Medical History", patient.medicalHistory),
                _infoRow("Notes", patient.notes),
              ],
            ),
            _section(
              title: "Appointments",
              children: [
                _infoRow("Last Visit", patient.lastVisit),
                _infoRow("Next Visit", patient.nextVisit),
                _infoRow(
                  "Appointments Count",
                  patient.appointmentsCount.toString(),
                ),
              ],
            ),
            _section(
              title: "Assigned Doctor",
              children: [
                _infoRow("Doctor Name", patient.assignedDoctorDisplayName),
                _infoRow(
                  "Specialization",
                  patient.assignedDoctorDisplaySpecialization,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xff931A23),
            child: Text(
              patient.initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            patient.name ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          _statusBadge(),
        ],
      ),
    );
  }

  Widget _statusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: patient.statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        patient.statusLabel,
        style: TextStyle(
          color: patient.statusColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  // ================= SECTION =================
  Widget _section({required String title, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff931A23),
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  // ================= ROW =================
  Widget _infoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value == null || value.isEmpty ? "-" : value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

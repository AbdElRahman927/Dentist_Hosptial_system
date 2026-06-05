import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/model_sheet_data_row.dart';
import 'package:dentist_hospital_system/screens/Patients/model/patient_model.dart';
import 'package:dentist_hospital_system/screens/Patients/pateint_profile.dart';
import 'package:flutter/material.dart';

class Patient_Modal_Sheet extends StatelessWidget {
  final PatientModel patient;

  const Patient_Modal_Sheet({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xff941419),
                  child: Text(
                    patient.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        patient.email ?? '',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: patient.statusColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          patient.statusLabel,
                          style: TextStyle(
                            fontSize: 12,
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
          ),
          const Divider(color: Colors.black, thickness: 0, height: 10),
          Expanded(
            child: ListView(
              children: [
                Data_Row(data: "Patient ID", value: patient.id ?? '-'),
                Data_Row(data: "Age", value: patient.age ?? '-'),
                Data_Row(data: "Gender", value: patient.gender ?? '-'),
                Data_Row(data: "Phone", value: patient.phone ?? '-'),
                Data_Row(data: "Condition", value: patient.condition ?? '-'),
                Data_Row(
                  data: "Assigned Doctor",
                  value: patient.assignedDoctorDisplayName,
                ),
                Data_Row(data: "Last Visit", value: patient.lastVisit ?? '-'),
                Data_Row(data: "Next Visit", value: patient.nextVisit ?? '-'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfile(patient: patient),
                  ),
                );
              },
              style: ButtonStyle(
                maximumSize: const WidgetStatePropertyAll(
                  Size(double.infinity, 50),
                ),
                minimumSize: const WidgetStatePropertyAll(
                  Size(double.infinity, 50),
                ),
                backgroundColor: const WidgetStatePropertyAll(
                  Color(0xff941419),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "View Full Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, size: 24, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

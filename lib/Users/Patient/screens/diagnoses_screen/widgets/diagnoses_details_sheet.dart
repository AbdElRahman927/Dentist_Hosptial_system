import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/model/diagnoses_model.dart';
import 'package:flutter/material.dart';

class DiagnosisDetailsSheet extends StatelessWidget {
  final DiagnosisModel diagnosis;

  const DiagnosisDetailsSheet({super.key, required this.diagnosis});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF4F7FB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: MediaQuery.of(context).size.height * .85,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xff931A23),
                child: Text(
                  diagnosis.title.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      diagnosis.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      diagnosis.doctorName,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: [
                _item("Date", diagnosis.formattedDate),
                _item("Doctor", diagnosis.doctorName),
                _item("Specialization", diagnosis.specialization),
                _item("Chief Complaint", diagnosis.chiefComplaint),
                _item("Clinical Findings", diagnosis.clinicalFindings),
                _item("Diagnosis", diagnosis.diagnosis),
                _item("Treatment Plan", diagnosis.treatmentPlan),
                _item("Recommendations", diagnosis.recommendations),
                _item("Follow Up", diagnosis.followUp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          Text(value),
        ],
      ),
    );
  }
}

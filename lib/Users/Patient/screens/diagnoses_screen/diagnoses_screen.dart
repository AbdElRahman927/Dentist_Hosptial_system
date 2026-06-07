import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/model/diagnoses_model.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/widgets/diagnoses_card.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/widgets/diagnoses_details_sheet.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/widgets/diagnoses_epmty_state.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/diagnoses_screen/widgets/diagnoses_header.dart';
import 'package:flutter/material.dart';

class DiagnosesScreen extends StatefulWidget {
  const DiagnosesScreen({super.key});

  @override
  State<DiagnosesScreen> createState() => _DiagnosesScreenState();
}

class _DiagnosesScreenState extends State<DiagnosesScreen> {
  String searchQuery = '';

  final List<DiagnosisModel> diagnoses = [
    DiagnosisModel(
      id: "DX001",
      title: "Orthodontic Assessment",
      doctorName: "Dr. Ahmed Hassan",
      specialization: "Orthodontics",
      date: DateTime(2026, 5, 10),
      chiefComplaint: "Misaligned teeth",
      clinicalFindings: "Crowding in upper jaw",
      diagnosis: "Class II Malocclusion",
      treatmentPlan: "Braces for 18 months",
      recommendations: "Regular oral hygiene",
      followUp: "After 4 weeks",
      status: DiagnosisStatus.active,
    ),
    DiagnosisModel(
      id: "DX002",
      title: "Periodontal Examination",
      doctorName: "Dr. Nadia Farouk",
      specialization: "Periodontics",
      date: DateTime(2026, 3, 15),
      chiefComplaint: "Bleeding gums",
      clinicalFindings: "Inflammation detected",
      diagnosis: "Gingivitis",
      treatmentPlan: "Deep cleaning",
      recommendations: "Use medicated mouthwash",
      followUp: "After 2 weeks",
      status: DiagnosisStatus.resolved,
    ),
  ];

  List<DiagnosisModel> get filtered {
    if (searchQuery.isEmpty) return diagnoses;

    return diagnoses.where((d) {
      return d.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          d.doctorName.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final records = filtered;

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Diagnoses",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          DiagnosisHeader(total: diagnoses.length),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search diagnoses...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child:
                records.isEmpty
                    ? const DiagnosisEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: records.length,
                      itemBuilder: (_, index) {
                        final diagnosis = records[index];

                        return DiagnosisCard(
                          diagnosis: diagnosis,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) {
                                return DiagnosisDetailsSheet(
                                  diagnosis: diagnosis,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

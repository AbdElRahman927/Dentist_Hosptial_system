import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/model/prescription_model.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/widgets/prescription_Card.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/widgets/prescription_details_sheet.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/widgets/prescription_empty_state.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/prescriptions_screen/widgets/prescription_header.dart';
import 'package:flutter/material.dart';

class PrescriptionsScreen extends StatefulWidget {
  const PrescriptionsScreen({super.key});

  @override
  State<PrescriptionsScreen> createState() => _PrescriptionsScreenState();
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  final List<PrescriptionModel> prescriptions = [
    PrescriptionModel(
      id: 'PR-001',
      title: 'Orthodontic Follow-up',
      doctorName: 'Dr. Ahmed Hassan',
      doctorSpecialization: 'Orthodontics',
      date: DateTime(2026, 5, 12),
      diagnosis: 'Mild crowding and alignment adjustment',
      medicines: ['Painkiller', 'Mouth rinse'],
      dosageInstructions: 'Take after meals for 5 days',
      notes: 'Return after 2 weeks for review',
      status: PrescriptionStatus.active,
    ),
    PrescriptionModel(
      id: 'PR-002',
      title: 'Root Canal Care',
      doctorName: 'Dr. Karim Youssef',
      doctorSpecialization: 'Endodontics',
      date: DateTime(2026, 4, 30),
      diagnosis: 'Post root canal treatment care',
      medicines: ['Antibiotic', 'Anti-inflammatory'],
      dosageInstructions: 'Twice daily for 7 days',
      notes: 'Monitor swelling',
      status: PrescriptionStatus.completed,
    ),
    PrescriptionModel(
      id: 'PR-003',
      title: 'Gum Treatment',
      doctorName: 'Dr. Nadia Farouk',
      doctorSpecialization: 'Periodontics',
      date: DateTime(2026, 3, 18),
      diagnosis: 'Gingival inflammation',
      medicines: ['Gel', 'Vitamin supplement'],
      dosageInstructions: 'Apply once daily',
      notes: 'Prescription expired',
      status: PrescriptionStatus.expired,
    ),
  ];

  String searchQuery = '';

  List<PrescriptionModel> get filtered {
    final q = searchQuery.trim().toLowerCase();
    if (q.isEmpty) return prescriptions;
    return prescriptions.where((p) {
      return p.title.toLowerCase().contains(q) ||
          p.doctorName.toLowerCase().contains(q) ||
          p.diagnosis.toLowerCase().contains(q);
    }).toList();
  }

  int get activeCount =>
      prescriptions.where((p) => p.status == PrescriptionStatus.active).length;
  int get completedCount =>
      prescriptions
          .where((p) => p.status == PrescriptionStatus.completed)
          .length;
  int get expiredCount =>
      prescriptions.where((p) => p.status == PrescriptionStatus.expired).length;

  @override
  Widget build(BuildContext context) {
    final visible = filtered;

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff931A23)),
        title: const Text(
          "Prescriptions",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          PrescriptionHeader(
            total: prescriptions.length,
            active: activeCount,
            completed: completedCount,
            expired: expiredCount,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (v) => setState(() => searchQuery = v),
              decoration: InputDecoration(
                hintText: "Search prescriptions...",
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
                visible.isEmpty
                    ? const PrescriptionEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      itemCount: visible.length,
                      itemBuilder: (context, index) {
                        final prescription = visible[index];
                        return PrescriptionCard(
                          prescription: prescription,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22),
                                ),
                              ),
                              builder:
                                  (_) => PrescriptionDetailsSheet(
                                    prescription: prescription,
                                  ),
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

import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:dentist_hospital_system/screens/Patients/model/patient_model.dart';
import 'package:dentist_hospital_system/screens/Patients/patient_modal_sheet.dart';
import 'package:dentist_hospital_system/screens/Patients/widgets/pateint_stats.dart';
import 'package:dentist_hospital_system/screens/Patients/widgets/patient_card.dart';
import 'package:dentist_hospital_system/screens/Patients/widgets/patient_empty_state.dart';
import 'package:dentist_hospital_system/screens/Patients/widgets/patient_filter_bar.dart';
import 'package:dentist_hospital_system/screens/Patients/widgets/patient_search.dart';
import 'package:flutter/material.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  int selectedFilter = 0;
  String searchQuery = '';

  static const List<String> filters = [
    'All',
    'Active',
    'Scheduled',
    'Completed',
  ];

  List<PatientModel> get filteredPatients {
    final query = searchQuery.trim().toLowerCase();

    return patients.where((patient) {
      final matchesFilter = switch (selectedFilter) {
        0 => true,
        1 => patient.safeStatus == PatientStatus.active,
        2 => patient.safeStatus == PatientStatus.scheduled,
        3 => patient.safeStatus == PatientStatus.completed,
        _ => true,
      };

      final matchesSearch =
          query.isEmpty ||
          (patient.name ?? '').toLowerCase().contains(query) ||
          (patient.id ?? '').toLowerCase().contains(query) ||
          (patient.condition ?? '').toLowerCase().contains(query) ||
          (patient.assignedDoctorDisplayName).toLowerCase().contains(query);

      return matchesFilter && matchesSearch;
    }).toList();
  }

  int get activeCount =>
      patients.where((p) => p.safeStatus == PatientStatus.active).length;

  int get scheduledCount =>
      patients.where((p) => p.safeStatus == PatientStatus.scheduled).length;

  int get completedCount =>
      patients.where((p) => p.safeStatus == PatientStatus.completed).length;

  @override
  Widget build(BuildContext context) {
    final visiblePatients = filteredPatients;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: AppDrawerhandelr(),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(size: 28),
        title: Row(
          children: [
            const Text("Patients", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
      ),
      body: Column(
        children: [
          PatientSearchBar(
            onChanged: (value) => setState(() => searchQuery = value),
          ),
          PatientStatsRow(
            total: patients.length,
            active: activeCount,
            scheduled: scheduledCount,
            completed: completedCount,
          ),
          PatientFilterChips(
            filters: filters,
            selectedIndex: selectedFilter,
            onSelected: (index) => setState(() => selectedFilter = index),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Filter",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                visiblePatients.isEmpty
                    ? const PatientEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: visiblePatients.length,
                      itemBuilder: (context, index) {
                        final patient = visiblePatients[index];
                        return Patient_card(
                          patient: patient,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder:
                                  (_) => Patient_Modal_Sheet(patient: patient),
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

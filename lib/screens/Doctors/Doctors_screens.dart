import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:dentist_hospital_system/screens/Doctors/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

import 'model/doctor.dart';
import 'widgets/doctor_empty_state.dart';
import 'widgets/doctor_filter_chips.dart';
import 'widgets/doctor_search_bar.dart';
import 'widgets/doctor_stats_row.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  int selectedFilter = 0;
  String searchQuery = '';

  final List<String> filters = ['All', 'Active', 'On Leave', 'Inactive'];


  List<Doctor_model> get filteredDoctors {
    return doctors.where((doctor) {
      final matchFilter =
          selectedFilter == 0 || doctor.statusLabel == filters[selectedFilter];

      final matchSearch =
          searchQuery.isEmpty ||
          (doctor.name ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          (doctor.specialization ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          );

      return matchFilter && matchSearch;
    }).toList();
  }

  int get activeCount => doctors.where((d) => d.statusLabel == 'Active').length;
  int get leaveCount =>
      doctors.where((d) => d.statusLabel == 'On Leave').length;
  int get inactiveCount =>
      doctors.where((d) => d.statusLabel == 'Inactive').length;

  @override
  Widget build(BuildContext context) {
    final filtered = filteredDoctors;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: AppDrawerhandelr(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Doctors",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          DoctorSearchBar(
            onChanged: (value) => setState(() => searchQuery = value),
          ),

          DoctorStatsRow(
            total: doctors.length,
            active: activeCount,
            onLeave: leaveCount,
            inactive: inactiveCount,
          ),

          DoctorFilterChips(
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
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Filter",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child:
                filtered.isEmpty
                    ? const DoctorEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => DoctorCard(doctor: filtered[i]),
                    ),
          ),
        ],
      ),
    );
  }
}

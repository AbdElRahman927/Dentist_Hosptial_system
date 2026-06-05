import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';
import 'package:dentist_hospital_system/screens/Students/widgets/student_card.dart';
import 'package:dentist_hospital_system/screens/Students/widgets/student_empty_state.dart';
import 'package:dentist_hospital_system/screens/Students/widgets/student_filters.dart';
import 'package:dentist_hospital_system/screens/Students/widgets/student_search.dart';
import 'package:dentist_hospital_system/screens/Students/widgets/studetns_stats.dart';
import 'package:flutter/material.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  int selectedFilter = 0;
  String searchQuery = '';

  final List<String> filters = ['All', 'Active', 'On Leave', 'Inactive'];

  final List<StudentModel> students = [
    StudentModel(
      phone: '011',
      email: "[EMAIL_ADDRESS]",
      name: 'Dr. Ahmed Hassan',
      year: 3,
      numOfPatients: 142,
      supervisor: 'Dr. Mohamed',
      state: 'Active',
    ),
    StudentModel(
      phone: '011',
      email: "[EMAIL_ADDRESS]",
      name: 'Dr. Hamada Hassan',
      year: 5,
      numOfPatients: 45,
      supervisor: 'Dr. Salem',
      state: 'On Leave',
    ),
    StudentModel(
      phone: '011',
      email: "[EMAIL_ADDRESS]",
      name: 'Dr. Mohey',
      year: 4,
      numOfPatients: 99,
      supervisor: 'Dr. Ibrahim',
      state: 'Inactive',
    ),
  ];

  List<StudentModel> get filteredStudents {
    return students.where((student) {
      final matchFilter =
          selectedFilter == 0 || student.state == filters[selectedFilter];

      final matchSearch =
          searchQuery.isEmpty ||
          (student.name ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          (student.email ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          );

      return matchFilter && matchSearch;
    }).toList();
  }

  int get activeCount => students.where((d) => d.state == 'Active').length;
  int get leaveCount => students.where((d) => d.state == 'On Leave').length;
  int get inactiveCount => students.where((d) => d.state == 'Inactive').length;

  @override
  Widget build(BuildContext context) {
    final filtered = filteredStudents;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: AppDrawerhandelr(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Students",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          StudentSearchBar(
            onChanged: (value) => setState(() => searchQuery = value),
          ),

          StudentStatsRow(
            total: students.length,
            active: activeCount,
            onLeave: leaveCount,
            inactive: inactiveCount,
          ),

          StudentFilterChips(
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
                filtered.isEmpty
                    ? const StudentEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => StudentCard(student: filtered[i]),
                    ),
          ),
        ],
      ),
    );
  }
}

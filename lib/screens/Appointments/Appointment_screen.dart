import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Appointments/Appointment_Modal_Sheet.dart';
import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:dentist_hospital_system/screens/Appointments/widgets/Appointment_empty_state.dart';
import 'package:dentist_hospital_system/screens/Appointments/widgets/Appoitnment_card.dart';
import 'package:dentist_hospital_system/screens/Appointments/widgets/appointment_filter.dart';
import 'package:dentist_hospital_system/screens/Appointments/widgets/appointment_search_bar.dart';
import 'package:dentist_hospital_system/screens/Appointments/widgets/appoitnment_stats_row.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

class AppointmentsScreeen extends StatefulWidget {
  const AppointmentsScreeen({super.key});

  @override
  State<AppointmentsScreeen> createState() => _AppointmentsScreeenState();
}

class _AppointmentsScreeenState extends State<AppointmentsScreeen> {
  int selectedFilter = 0;
  String searchQuery = '';

  static const filters = [
    'All',
    'Scheduled',
    'In Progress',
    'Completed',
    'Cancelled',
  ];


  List<AppointmentModel> get filteredAppointments {
    final query = searchQuery.trim().toLowerCase();

    return appointments.where((appointment) {
      final matchesFilter = switch (selectedFilter) {
        0 => true,
        1 => appointment.safeStatus == AppointmentStatus.scheduled,
        2 => appointment.safeStatus == AppointmentStatus.inProgress,
        3 => appointment.safeStatus == AppointmentStatus.completed,
        4 => appointment.safeStatus == AppointmentStatus.cancelled,
        _ => true,
      };

      final matchesSearch =
          query.isEmpty ||
          (appointment.appointmentTitle).toLowerCase().contains(query) ||
          appointment.patientName.toLowerCase().contains(query) ||
          appointment.doctorName.toLowerCase().contains(query) ||
          (appointment.id ?? '').toLowerCase().contains(query);

      return matchesFilter && matchesSearch;
    }).toList();
  }

  int get scheduledCount =>
      appointments
          .where((a) => a.safeStatus == AppointmentStatus.scheduled)
          .length;

  int get inProgressCount =>
      appointments
          .where((a) => a.safeStatus == AppointmentStatus.inProgress)
          .length;

  int get completedCount =>
      appointments
          .where((a) => a.safeStatus == AppointmentStatus.completed)
          .length;

  @override
  Widget build(BuildContext context) {
    final visibleAppointments = filteredAppointments;

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
            const Text(
              "Appointments",
              style: TextStyle(color: Color(0xff931A23)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          AppointmentSearchBar(
            onChanged: (value) => setState(() => searchQuery = value),
          ),
          AppointmentStatsRow(
            total: appointments.length,
            scheduled: scheduledCount,
            inProgress: inProgressCount,
            completed: completedCount,
          ),
          AppointmentFilterChips(
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
                visibleAppointments.isEmpty
                    ? const AppointmentEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: visibleAppointments.length,
                      itemBuilder: (context, index) {
                        final appointment = visibleAppointments[index];
                        return AppointmentCard(
                          appointment: appointment,
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
                                  (_) => AppointmentModalSheet(
                                    appointment: appointment,
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

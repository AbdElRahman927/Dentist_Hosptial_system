import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointment_card.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_empty.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_filter_tabs.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_header.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_search.dart';
import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

class PatientAppointmentsScreen extends StatefulWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  State<PatientAppointmentsScreen> createState() =>
      _PatientAppointmentsScreenState();
}

class _PatientAppointmentsScreenState extends State<PatientAppointmentsScreen> {
  int selectedFilter = 0;
  String search = '';

  final filters = [
    "All",
    "Pending",
    "InProgress",
    "Confirmed",
    "Completed",
    "Cancelled",
    "Scheduled",
  ];

  List<AppointmentModel> get filteredAppointments {
    return myappointments.where((appointment) {
      final matchFilter =
          selectedFilter == 0 ||
          appointment.statusLabel == filters[selectedFilter];

      final matchSearch =
          search.isEmpty ||
          (appointment.doctor?.name ?? '').toLowerCase().contains(
            search.toLowerCase(),
          ) ||
          (appointment.doctor?.specialization ?? '').toLowerCase().contains(
            search.toLowerCase(),
          );

      return matchFilter && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredAppointments;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Appointments",
          style: TextStyle(
            color: Color(0xff931A23),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          PatientAppointmentsHeader(total: myappointments.length),

          PatientAppointmentsSearch(
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
          ),

          PatientAppointmentsFilterTabs(
            filters: filters,
            selectedFilter: selectedFilter,
            onSelected: (index) {
              setState(() {
                selectedFilter = index;
              });
            },
          ),

          Expanded(
            child:
                filtered.isEmpty
                    ? const PatientAppointmentsEmpty()
                    : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16),
                      itemCount: filtered.length,
                      itemBuilder:
                          (_, index) => PatientAppointmentCard(
                            appointment: filtered[index],
                          ),
                    ),
          ),
        ],
      ),
    );
  }
}

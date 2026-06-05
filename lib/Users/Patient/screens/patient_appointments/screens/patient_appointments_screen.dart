import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointment_card.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_empty.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_filter_tabs.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_header.dart';
import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointments_search.dart';
import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';
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

  final List<AppointmentModel> appointments = [
    AppointmentModel(
      id: '1',

      doctor: Doctor_model(
        name: 'Dr. Ahmed Hassan',
        specialization: 'Orthodontics',
      ),
      date: "15 May 2026",
      time: "10:30 AM",
      location: "Dental Clinic A",

      state: 'Confirmed',
    ),

    AppointmentModel(
      doctor: Doctor_model(
        name: "Dr. Sara Mohamed",
        specialization: "Periodontics",
      ),
      date: "20 May 2026",
      time: "12:00 PM",
      location: "Dental Clinic B",

      state: 'InProgress',
    ),

    AppointmentModel(
      doctor: Doctor_model(
        name: "Dr. Mohamed Ali",
        specialization: "Endodontics",
      ),
      date: "7 May 2026",
      time: "9:00 AM",
      location: "Dental Clinic C",
      state: 'completed',
    ),
  ];

  List<AppointmentModel> get filteredAppointments {
    return appointments.where((appointment) {
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
          PatientAppointmentsHeader(total: appointments.length),

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

import 'package:dentist_hospital_system/Users/Patient/screens/patient_appointments/widgets/patient_appointment_card.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Next Appointment",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Center(child: PatientAppointmentCard(appointment: myappointments[0])),
      ],
    );
  }
}

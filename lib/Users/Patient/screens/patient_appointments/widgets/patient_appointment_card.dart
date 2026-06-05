import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:flutter/material.dart';

class PatientAppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const PatientAppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: 0.06),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xff931A23),

                child: Text(
                  appointment.doctor!.initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      appointment.doctorSpecialization,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: appointment.statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Text(
                  appointment.statusLabel,
                  style: TextStyle(
                    color: appointment.statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// INFO
          _infoRow(Icons.calendar_month_outlined, appointment.date),

          const SizedBox(height: 10),

          _infoRow(Icons.access_time_outlined, appointment.time),

          const SizedBox(height: 10),

          _infoRow(Icons.location_on_outlined, appointment.location),

          if (appointment.notes != null) ...[
            const SizedBox(height: 16),

            Text(appointment.notes!, style: TextStyle(color: Colors.grey[700])),
          ],
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String? text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xff931A23)),

        const SizedBox(width: 10),

        Text(text ?? '', style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

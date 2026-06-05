import 'package:dentist_hospital_system/screens/Patients/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';

enum AppointmentStatus {
  scheduled,
  inProgress,
  completed,
  cancelled,
  confirmed,
}

extension AppointmentStatusUI on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.scheduled:
        return 'Scheduled';
      case AppointmentStatus.inProgress:
        return 'InProgress';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
    }
  }

  Color get color {
    switch (this) {
      case AppointmentStatus.scheduled:
        return Colors.blue;
      case AppointmentStatus.inProgress:
        return const Color(0xff931A23);
      case AppointmentStatus.completed:
        return Colors.green;
      case AppointmentStatus.cancelled:
        return Colors.red;
      case AppointmentStatus.confirmed:
        return Colors.green;
    }
  }
}

class AppointmentModel {
  String? id;
  String? state;
  PatientModel? patient;
  String? note;
  Doctor_model? doctor;
  StudentModel? student;
  String? date;
  String? time;
  String? notes;

  String? title;
  String? treatment;
  String? location;

  AppointmentModel({
    this.id,
    this.patient,
    this.doctor,
    this.student,
    this.date,
    this.time,
    this.notes,
    this.note,
    this.state,
    this.title,
    this.treatment,
    this.location,
  });

  AppointmentStatus get safeStatus {
    switch (state?.toLowerCase()) {
      case 'inprogress':
        return AppointmentStatus.inProgress;
      case 'completed':
        return AppointmentStatus.completed;
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'scheduled':
      case 'pending':
        return AppointmentStatus.scheduled;
      case 'cancelled':
      case 'canceled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.scheduled;
    }
  }

  String get statusLabel => safeStatus.label;
  Color get statusColor => safeStatus.color;

  String get appointmentTitle =>
      title ?? treatment ?? note ?? notes ?? 'Appointment';
  String get treatmentLabel => treatment ?? note ?? notes ?? '-';
  String get detailsNote => notes ?? note ?? '-';
  String get locationLabel => location ?? '-';

  String get patientName => patient?.name ?? '-';
  String get patientEmail => patient?.email ?? '-';
  String get patientPhone => patient?.phone ?? '-';
  String get patientId => patient?.id ?? '-';
  String get patientInitials => patient?.initials ?? '';

  String get doctorName => doctor?.name ?? '-';
  String get doctorEmail => doctor?.email ?? '-';
  String get doctorPhone => doctor?.phone ?? '-';
  String get doctorSpecialization => doctor?.specialization ?? '-';
  String get doctorInitials => doctor?.initials ?? '';

  String get studentName => student?.name ?? '-';
  String get studentSupervisor => student?.supervisor ?? '-';
  String get studentInitials => student?.initials ?? '';

  bool get hasStudent => student != null;
  bool get hasDoctor => doctor != null;
  bool get hasPatient => patient != null;
}

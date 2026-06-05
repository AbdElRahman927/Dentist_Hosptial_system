import 'package:flutter/material.dart';
import 'package:dentist_hospital_system/screens/Appointments/model/appointment_model.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';

enum PatientStatus { active, scheduled, completed, inactive }

extension PatientStatusUI on PatientStatus {
  String get label {
    switch (this) {
      case PatientStatus.active:
        return 'Active';
      case PatientStatus.scheduled:
        return 'Scheduled';
      case PatientStatus.completed:
        return 'Completed';
      case PatientStatus.inactive:
        return 'Inactive';
    }
  }

  Color get color {
    switch (this) {
      case PatientStatus.active:
        return Colors.green;
      case PatientStatus.scheduled:
        return const Color(0xff931A23);
      case PatientStatus.completed:
        return Colors.blue;
      case PatientStatus.inactive:
        return Colors.grey;
    }
  }
}

class PatientModel {
  String? name;
  String? email;
  String? image;
  String? state;
  String? phone;
  String? id;
  String? age;
  String? gender;
  String? medicalHistory;
  String? notes;

  String? condition;
  String? lastVisit;
  String? nextVisit;

  String? assignedDoctorName;
  String? assignedDoctorSpecialization;

  Doctor_model? assignedDoctor;
  PatientStatus? status;

  List<AppointmentModel>? appointments;

  PatientModel({
    this.name,
    this.email,
    this.id,
    this.state,
    this.phone,
    this.image,
    this.age,
    this.gender,
    this.medicalHistory,
    this.notes,
    this.condition,
    this.lastVisit,
    this.nextVisit,
    this.assignedDoctorName,
    this.assignedDoctorSpecialization,
    this.assignedDoctor,
    this.status,
    this.appointments,
  });

  PatientStatus get safeStatus {
    if (status != null) return status!;

    switch ((state ?? '').toLowerCase()) {
      case 'active':
        return PatientStatus.active;
      case 'scheduled':
        return PatientStatus.scheduled;
      case 'completed':
        return PatientStatus.completed;
      case 'inactive':
        return PatientStatus.inactive;
      default:
        return PatientStatus.active;
    }
  }

  String get statusLabel => safeStatus.label;
  Color get statusColor => safeStatus.color;

  String get initials {
    final value = (name ?? '').trim();
    if (value.isEmpty) return '';

    final parts = value.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }

    final first = parts[0].substring(0, 1).toUpperCase();
    final last = parts[1].substring(0, 1).toUpperCase();
    return '$first$last';
  }

  String get assignedDoctorDisplayName {
    return assignedDoctor?.name ?? assignedDoctorName ?? '-';
  }

  String get assignedDoctorDisplaySpecialization {
    return assignedDoctor?.specialization ?? assignedDoctorSpecialization ?? '-';
  }

  int get appointmentsCount => appointments?.length ?? 0;
}
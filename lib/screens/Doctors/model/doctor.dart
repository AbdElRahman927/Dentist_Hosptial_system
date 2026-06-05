import 'package:flutter/material.dart';

/// ================= ENUM =================
enum DoctorStatus { active, onLeave, inactive }

/// ================= EXTENSION (UI LOGIC) =================
extension DoctorStatusUI on DoctorStatus {
  String get label {
    switch (this) {
      case DoctorStatus.active:
        return 'Active';
      case DoctorStatus.onLeave:
        return 'On Leave';
      case DoctorStatus.inactive:
        return 'Inactive';
    }
  }

  Color get color {
    switch (this) {
      case DoctorStatus.active:
        return Colors.green;
      case DoctorStatus.onLeave:
        return Colors.orange;
      case DoctorStatus.inactive:
        return Colors.red;
    }
  }
}

/// ================= MODEL =================
class Doctor_model {
  /// Existing fields (unchanged)
  String? name;
  String? email;
  String? image;
  String? state; // ⚠️ we will map this to enum
  String? phone;
  String? specialization;
  String? license;
  String? experience;
  String? lastActive;
  String? department;
  int? numOfPatients;
  int? numOfAppointments;
  int? numOfStudents;
  // List<Student_model>? students;
  // List<AppointmentModel>? appointments;
  // List<AppointmentModel>? patients;

  /// ================= NEW CLEAN FIELDS =================

  /// Optional override (if you want to stop using string state later)
  DoctorStatus? status;

  Doctor_model({
    this.name,
    this.email,
    this.state,
    this.phone,
    this.license,
    this.specialization,
    this.experience,
    this.image,
    this.lastActive,
    this.numOfPatients,
    this.numOfAppointments,
    this.numOfStudents,
    // this.students,
    // this.appointments,
    // this.patients,
    this.department,
    this.status,
  });

  /// ================= HELPERS =================

  /// Convert old string state → enum safely
  DoctorStatus get safeStatus {
    if (status != null) return status!;

    switch (state?.toLowerCase()) {
      case 'active':
        return DoctorStatus.active;
      case 'on leave':
        return DoctorStatus.onLeave;
      case 'inactive':
        return DoctorStatus.inactive;
      default:
        return DoctorStatus.inactive;
    }
  }

  /// UI label (clean usage in widgets)
  String get statusLabel => safeStatus.label;

  /// UI color
  Color get statusColor => safeStatus.color;

  /// Initials generator (replaces manual initials in your old list)
  String get initials {
    if (name == null || name!.isEmpty) return '';
    final parts = name!.split(' ');
    if (parts.length == 1) return parts[0][0];
    return parts[0][0] + parts[1][0];
  }

  /// Safe values (avoid null crashes in UI)
  int get patientsCount => numOfPatients ?? 0;
  int get studentsCount => numOfStudents ?? 0;
}
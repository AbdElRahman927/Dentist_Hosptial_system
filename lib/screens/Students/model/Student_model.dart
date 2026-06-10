import 'dart:ui';

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

class StudentModel {
  final String? name;
  final String? email;
  final String? image;
  final String? phone;
  final String? id;
  final String? supervisor;
  final String? year;
  final int? numOfPatients;
  final int? numOfAppointments;
  final int? performance;
  final String? state;
  final String? lastActive;
  final String? group;

  StudentModel({
    this.group,
    this.name,
    this.email,
    this.image,
    this.phone,
    this.id,
    this.supervisor,
    this.year,
    this.numOfPatients,
    this.numOfAppointments,
    this.performance,
    this.state,
    this.lastActive,
  });

  /// Convert old string state → enum safely
  DoctorStatus get safeStatus {
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
}

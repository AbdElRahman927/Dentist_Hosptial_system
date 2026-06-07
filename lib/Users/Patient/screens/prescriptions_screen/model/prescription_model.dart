import 'package:flutter/material.dart';

enum PrescriptionStatus { active, completed, expired }

extension PrescriptionStatusUI on PrescriptionStatus {
  String get label {
    switch (this) {
      case PrescriptionStatus.active:
        return 'Active';
      case PrescriptionStatus.completed:
        return 'Completed';
      case PrescriptionStatus.expired:
        return 'Expired';
    }
  }

  Color get color {
    switch (this) {
      case PrescriptionStatus.active:
        return Colors.blue;
      case PrescriptionStatus.completed:
        return Colors.green;
      case PrescriptionStatus.expired:
        return Colors.red;
    }
  }
}

class PrescriptionModel {
  final String id;
  final String title;
  final String doctorName;
  final String doctorSpecialization;
  final DateTime date;
  final String diagnosis;
  final List<String> medicines;
  final String dosageInstructions;
  final String notes;
  final PrescriptionStatus status;

  const PrescriptionModel({
    required this.id,
    required this.title,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.date,
    required this.diagnosis,
    required this.medicines,
    required this.dosageInstructions,
    required this.notes,
    this.status = PrescriptionStatus.active,
  });

  String get formattedDate {
    return "${date.day}/${date.month}/${date.year}";
  }

  String get medicinesPreview {
    if (medicines.isEmpty) return '-';
    if (medicines.length == 1) return medicines.first;
    return "${medicines.first} +${medicines.length - 1}";
  }
}
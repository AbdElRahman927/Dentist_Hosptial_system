import 'package:flutter/material.dart';

enum DiagnosisStatus {
  active,
  resolved,
  followUpRequired,
}

extension DiagnosisStatusUI on DiagnosisStatus {
  String get label {
    switch (this) {
      case DiagnosisStatus.active:
        return "Active";
      case DiagnosisStatus.resolved:
        return "Resolved";
      case DiagnosisStatus.followUpRequired:
        return "Follow Up";
    }
  }

  Color get color {
    switch (this) {
      case DiagnosisStatus.active:
        return Colors.blue;
      case DiagnosisStatus.resolved:
        return Colors.green;
      case DiagnosisStatus.followUpRequired:
        return Colors.orange;
    }
  }
}

class DiagnosisModel {
  final String id;

  final String title;

  final String doctorName;
  final String specialization;

  final DateTime date;

  final String chiefComplaint;

  final String clinicalFindings;

  final String diagnosis;

  final String treatmentPlan;

  final String recommendations;

  final String followUp;

  final DiagnosisStatus status;

  const DiagnosisModel({
    required this.id,
    required this.title,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.chiefComplaint,
    required this.clinicalFindings,
    required this.diagnosis,
    required this.treatmentPlan,
    required this.recommendations,
    required this.followUp,
    required this.status,
  });

  String get formattedDate {
    return "${date.day}/${date.month}/${date.year}";
  }
}
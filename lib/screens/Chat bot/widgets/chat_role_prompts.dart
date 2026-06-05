import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';

List<String> chatPromptsForRole(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return [
        'Show today’s overview',
        'List pending appointments',
        'Check staff activity',
        'Find a patient',
      ];
    case UserRole.doctor:
      return [
        'Show my schedule',
        'Find patient details',
        'Summarize today’s visits',
        'Check follow-ups',
      ];
    case UserRole.student:
      return [
        'Show my tasks',
        'Find my supervisor',
        'Today’s appointments',
        'Review assigned patients',
      ];
    case UserRole.patient:
      return [
        'Show my appointments',
        'Find my doctor',
        'Check my records',
        'Book an appointment',
      ];
  }
}
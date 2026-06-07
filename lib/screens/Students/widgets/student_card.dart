import 'package:dentist_hospital_system/screens/Students/Student_Modal_sheet.dart';
import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final StudentModel? student;

  const StudentCard({super.key, this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => StudentModalSheet(student: student!),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff931A23),
              child: Text(
                student!.initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),

            /// Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student!.name ?? ''),
                  Text(
                    student!.email ?? '',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Text("${student!.year} year"),
                      const SizedBox(width: 10),
                      Text("${student!.numOfPatients} patients"),
                    ],
                  ),
                ],
              ),
            ),

            /// Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: student!.safeStatus.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    student!.safeStatus.label,
                    style: TextStyle(color: student!.safeStatus.color),
                  ),
                ),
                Text(
                  student!.safeStatus.label,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

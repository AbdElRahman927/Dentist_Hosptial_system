import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/DetailsCard.dart';
import 'package:dentist_hospital_system/screens/Students/Student_profile.dart';
import 'package:dentist_hospital_system/screens/Students/model/Student_model.dart';
import 'package:flutter/material.dart';

class StudentModalSheet extends StatelessWidget {
  final StudentModel student;

  const StudentModalSheet({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            /// ===== HEADER =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xff941419),
                    child: Text(
                      student.initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        student.email ?? '',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 5),

                      /// STATUS
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: student.statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          student.statusLabel,
                          style: TextStyle(
                            fontSize: 12,
                            color: student.statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ===== STATS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  DetailsCard(
                    color1: Colors.blue.shade100,
                    number: student.numOfPatients,
                    text: "Patients",
                    widget: Icon(
                      Icons.people_outline,
                      size: 30,
                      color: Colors.blue.shade900,
                    ),
                    color2: Colors.blue.shade900,
                  ),
                  const SizedBox(width: 10),
                  DetailsCard(
                    color1: Colors.green.shade100,
                    number: student.numOfAppointments,
                    text: "Appointments",
                    widget: Icon(
                      Icons.school,
                      size: 30,
                      color: Colors.green.shade900,
                    ),
                    color2: Colors.green.shade900,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ===== DETAILS =====
            Expanded(
              child: ListView(
                children: [
                  _row("Email", student.email),
                  _row("Phone", student.phone),
                  _row("Supervisor", student.supervisor),
                  _row("Year", "${student.year}"),
                  _row("Email", student.email),
                  _row("Status", student.statusLabel),
                  _row("Total Appointments", "${student.numOfAppointments}"),
                  _row("Total Patients", "${student.numOfPatients}"),

                  /// ===== NAVIGATION =====
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StudentProfile(student: student),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff941419),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View Full Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String data, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              child: Text(
                data,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value ?? '-',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

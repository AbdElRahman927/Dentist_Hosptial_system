import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Doctor_Specific_widgets/Doctor_Table_Detail_Card.dart';
import 'package:dentist_hospital_system/screens/Appointments/Appointment_screen.dart';
import 'package:dentist_hospital_system/screens/Doctors/Doctors_screens.dart';
import 'package:dentist_hospital_system/screens/Patients/patient_screen.dart';
import 'package:dentist_hospital_system/screens/Students/Studetns_screens.dart';
import 'package:flutter/material.dart';

class Doctor_Widgets_Table extends StatelessWidget {
  const Doctor_Widgets_Table({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Doctor_Table_Details_card(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorsScreen(),
                  ),
                );
              },
              image: Image(
                width: 25,
                image: AssetImage("images/doctor.png"),
                color: Color(0xff931A23),
              ),
              title: "Total Doctors",
              number: "3",
            ),
            SizedBox(width: 20),
            Doctor_Table_Details_card(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentsScreen(),
                  ),
                );
              },
              image: Image(
                width: 25,
                image: AssetImage("images/graduation.png"),
                color: Color(0xff931A23),
              ),
              title: "Total Students",
              number: "3",
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Doctor_Table_Details_card(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientsScreen(),
                  ),
                );
              },
              image: Image(
                width: 25,
                image: AssetImage("images/patient.png"),
                color: Color(0xff931A23),
              ),
              title: "Total Patients",
              number: "3",
            ),
            SizedBox(width: 20),
            Doctor_Table_Details_card(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentsScreeen(),
                  ),
                );
              },
              image: Icon(
                Icons.calendar_month_outlined,
                color: Color(0xff931A23),
                size: 25,
              ),
              title: "Appointments",
              number: "3",
            ),
          ],
        ),
      ],
    );
  }
}

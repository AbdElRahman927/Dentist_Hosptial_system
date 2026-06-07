import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/table_cards/Table_Detail_Card.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/table_cards/card_Model.dart';
import 'package:dentist_hospital_system/screens/Appointments/Appointment_screen.dart';
import 'package:dentist_hospital_system/screens/Patients/patient_screen.dart';
import 'package:flutter/material.dart';

class StudentTable extends StatelessWidget {
  const StudentTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<card_Model> list = [
      

      card_Model(
        image: "images/patient.png",
        title: "Total Patients",
        number: "3",
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PatientsScreen()),
          );
        },
      ),
      card_Model(
        image: "images/calendar.png",
        title: "Appointments",
        number: "3",
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppointmentsScreeen(),
            ),
          );
        },
      ),
      card_Model(
        image: "images/diagnosis.png",
        title: "Total Diagnoses",
        number: "3",
        ontap: null,
      ),
    ];

    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      runSpacing: 20,
      children:
          list
              .map(
                (e) => Table_Details_card(
                  image: Image(
                    image: AssetImage(e.image),
                    color: Color(0xff931A23),
                  ),
                  title: e.title,
                  number: e.number,
                  ontap: e.ontap,
                ),
              )
              .toList(),
    );
  }
}

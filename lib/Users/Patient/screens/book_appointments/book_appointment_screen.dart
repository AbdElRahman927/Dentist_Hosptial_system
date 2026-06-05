import 'package:dentist_hospital_system/Users/Patient/screens/Patient_main_screen/Patient_main_screen.dart';
import 'package:dentist_hospital_system/screens/Doctors/model/doctor.dart';
import 'package:flutter/material.dart';
import 'Widgets/Doctor_Card.dart';
import 'Widgets/Section_Header.dart';
import 'Widgets/Date_Selector.dart';
import 'Widgets/Time_Slots_List.dart';
import 'Widgets/Notes_Field.dart';
import 'Widgets/Booking_Button.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectedDoctorIndex = 0;
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  final doctors = [
    Doctor_model(name: "Dr. Ahmed", specialization: "Orthodontist", image: ""),
    Doctor_model(name: "Dr. Sara", specialization: "Dentist", image: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            /// Doctor Selection
            const SectionHeader(title: "Select Doctor"),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    doctor: doctors[index],
                    isSelected: selectedDoctorIndex == index,
                    onTap: () {
                      setState(() => selectedDoctorIndex = index);
                    },
                  );
                },
              ),
            ),

            /// Date
            const SectionHeader(title: "Select Date"),
            DateSelector(
              selectedDate: selectedDate,
              onDatePicked: (date) {
                setState(() => selectedDate = date);
              },
            ),

            /// Time
            const SectionHeader(title: "Select Time"),
            TimeSlotsList(
              selectedTime: selectedTime,
              onSelect: (time) {
                setState(() => selectedTime = time);
              },
            ),

            /// Notes
            const SectionHeader(title: "Notes"),
            const NotesField(),

            const SizedBox(height: 20),

            /// Button
            BookingButton(
              onTap: () {
                // YOU HANDLE LOGIC
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text("Appointment Booked"),
                      content: const Text(
                        "Your appointment has been booked successfully!",
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff931A23),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const PatientHomeScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "OK",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

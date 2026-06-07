import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/WelcomeBanner.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Doctor_Specific_widgets/Active_Students.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Doctor_Specific_widgets/doctor_table.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Recent_appointments.dart';
import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/controller/chat_controller.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/screens/AI_Chat_Screen.dart';
import 'package:flutter/material.dart';

class Doctor_DashBoard extends StatefulWidget {
  const Doctor_DashBoard({super.key});

  @override
  State<Doctor_DashBoard> createState() => _Doctor_DashBoardState();
}

class _Doctor_DashBoardState extends State<Doctor_DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AiChatScreen(
                    role: UserRole.doctor,
                    userName: "Dr.Ahmed",
                    controller: ChatController(),
                  ),
            ),
          );
        },
        backgroundColor: Color(0xff931A23),
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        elevation: 5,
        child: Icon(Icons.chat_bubble_outline),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(size: 30),
        title: Row(
          children: [
            Image.asset(
              "images/hospital.png",
              scale: 12,
              color: Color(0xff931A23),
            ),
            SizedBox(width: 10),
            Text("NMU Dental", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xff931A23),
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawerhandelr(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[200]),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 16),
            // Welcome banner
            Welcomebanner(
              userName: 'Dr.Ahmed Hassan',
              bannerstatavalue: ['8', '5', '2'],
              bannerstatelabel: ['Today\'s Patients', 'Supervised Students', 'Pending Reviews'],
              userrole: UserRole.doctor,
            ),
            SizedBox(height: 20),

            // Quick overview
            Text(
              "Your Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            DoctorTable(),

            SizedBox(height: 20),

            // Today's Clinic Schedule
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Clinic",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff931A23).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "May 8",
                          style: TextStyle(
                            color: Color(0xff931A23),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  _scheduleItem(
                    "09:00 AM",
                    "Mahmoud Taha",
                    "Orthodontic Checkup",
                    Colors.blue,
                    "Confirmed",
                  ),
                  _scheduleItem(
                    "10:30 AM",
                    "Sara Ahmed",
                    "Root Canal Treatment",
                    Color(0xff931A23),
                    "In Progress",
                  ),
                  _scheduleItem(
                    "12:00 PM",
                    "Ali Mohamed",
                    "Dental Implant Consult",
                    Colors.orange,
                    "Pending",
                  ),
                  _scheduleItem(
                    "02:00 PM",
                    "Nour Ibrahim",
                    "Teeth Whitening",
                    Colors.green,
                    "Confirmed",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Student supervision section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pending Student Cases",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "3 pending",
                          style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  _caseItem(
                    "Omar Ali",
                    "Composite Filling - Tooth #14",
                    "Submitted 2h ago",
                  ),
                  _caseItem(
                    "Fatima Hassan",
                    "Extraction - Tooth #38",
                    "Submitted 4h ago",
                  ),
                  _caseItem(
                    "Youssef Khaled",
                    "Scaling & Polishing",
                    "Submitted yesterday",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Active_Students(),
            SizedBox(height: 20),
            Recent_appointments(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _scheduleItem(
    String time,
    String patient,
    String procedure,
    Color color,
    String status,
  ) => Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                procedure,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _caseItem(String student, String procedure, String time) => Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xff931A23),
          child: Text(
            student.split(' ').map((w) => w[0]).join(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                procedure,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Text(time, style: TextStyle(fontSize: 11, color: Colors.grey[400])),
      ],
    ),
  );
}

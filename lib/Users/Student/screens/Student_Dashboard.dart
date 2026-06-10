import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/WelcomeBanner.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Recent_appointments.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Student_Specific_widgets/student_table.dart';
import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/controller/chat_controller.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/screens/AI_Chat_Screen.dart';
import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:flutter/material.dart';

class Student_DashBoard extends StatefulWidget {
  const Student_DashBoard({super.key});

  @override
  State<Student_DashBoard> createState() => _Student_DashBoardState();
}

class _Student_DashBoardState extends State<Student_DashBoard> {
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
                    role: UserRole.student,
                    userName: "Omar",
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
            Welcomebanner(
              userName: 'Omar Ali',
              bannerstatavalue: ['28', '87%', '156h'],
              bannerstatelabel: ['Cases', 'Performance', 'Hours'],
              userrole: UserRole.student,
            ),
            SizedBox(height: 20),

            // Quick overview
            Text(
              "Your Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            StudentTable(),

            SizedBox(height: 20),

            // Today's Clinical Sessions
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
                        "Today's Schedule",
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
                          "May 9",
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
                    "Clinical Rotation",
                    "Orthodontics Dept. - Dr. Ahmed",
                    Colors.blue,
                  ),
                  _scheduleItem(
                    "11:00 AM",
                    "Patient: Mahmoud Taha",
                    "Orthodontic Checkup (Supervised)",
                    Color(0xff931A23),
                  ),
                  _scheduleItem(
                    "01:00 PM",
                    "Lecture: Dental Materials",
                    "Hall B - Prof. Samir",
                    Colors.orange,
                  ),
                  _scheduleItem(
                    "03:00 PM",
                    "Lab Session",
                    "Prosthodontics Lab",
                    Colors.green,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Clinical Progress
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
                  Text(
                    "Clinical Requirements Progress",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _progressBar("Composite Fillings", 8, 10, Colors.blue),
                  _progressBar("Root Canals", 3, 5, Color(0xff931A23)),
                  _progressBar("Extractions", 6, 8, Colors.orange),
                  _progressBar("Scaling & Polishing", 12, 15, Colors.green),
                  _progressBar("Impressions", 4, 10, Colors.purple),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Supervising Doctor
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
                  Text(
                    "Supervising Doctor",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xff931A23),
                        child: Text(
                          doctors[0].initials.toString(),
                          style: TextStyle(
                            color: Colors.white,
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
                              students[0].supervisor.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              doctors[0].specialization.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 8, color: Colors.green),
                            SizedBox(width: 4),
                            Text(
                              "Available",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

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
    String title,
    String subtitle,
    Color color,
  ) => Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 42,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Text(
          time,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _progressBar(String label, int current, int total, Color color) {
    double progress = current / total;
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              Text(
                "$current / $total",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}

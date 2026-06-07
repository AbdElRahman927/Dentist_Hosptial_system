import 'package:dentist_hospital_system/Users/Admin/Screens/Admin_Notifacation.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/WelcomeBanner.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Admin_Specific_widgets/Active_Doctors.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Doctor_Specific_widgets/Active_Students.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Recent_appointments.dart';
import 'package:dentist_hospital_system/Widgets/2_Dashboard_Widgets/Admin_Specific_widgets/admin_table.dart';
import 'package:dentist_hospital_system/Auth/main_auth/Drawerhandler.dart';
import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/controller/chat_controller.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/screens/AI_Chat_Screen.dart';
import 'package:flutter/material.dart';

class Admin_DashBoard extends StatefulWidget {
  const Admin_DashBoard({super.key});

  @override
  State<Admin_DashBoard> createState() => _Admin_DashBoardState();
}

class _Admin_DashBoardState extends State<Admin_DashBoard> {
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
                    role: UserRole.admin,
                    userName: "Admin",
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Admin_Notification(),
                ),
              );
            },
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
              userrole: UserRole.admin,
              userName: "Admin",
              bannerstatavalue: ["12", "3", "98%"],
              bannerstatelabel: [
                "Today's\nAppointments",
                "Pending\nApprovals",
                "System\nUptime",
              ],
            ),

            SizedBox(height: 20),

            // Quick overview label
            Text(
              "Hospital Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            AdminTable(),

            SizedBox(height: 20),

            // Today's Schedule summary
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
                    "08:00 AM",
                    "Staff Meeting",
                    "Conference Room A",
                    Colors.blue,
                  ),
                  _scheduleItem(
                    "10:00 AM",
                    "Equipment Inspection",
                    "Radiology Dept.",
                    Colors.orange,
                  ),
                  _scheduleItem(
                    "01:00 PM",
                    "New Doctor Onboarding",
                    "Admin Office",
                    Colors.green,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Active_Doctors(),
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
    String title,
    String location,
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
                location,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

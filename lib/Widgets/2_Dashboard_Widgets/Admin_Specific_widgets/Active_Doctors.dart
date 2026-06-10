import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:dentist_hospital_system/screens/Doctors/Doctors_screens.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/Widget_Row_Child.dart';
import 'package:flutter/material.dart';

class Active_Doctors extends StatelessWidget {
  const Active_Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Doctors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsScreen(),
                    ),
                  );
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Color(0xff931A23),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Widget_Row_Child(
                child1: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color(0xff931A23),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        doctors[index].initials,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${doctors[index].name}"),
                        Text("${doctors[index].specialization}"),
                      ],
                    ),
                  ],
                ),
                child2: Text("${doctors[index].lastActive}"),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:dentist_hospital_system/screens/Data/data.dart';
import 'package:dentist_hospital_system/screens/Students/Studetns_screens.dart';
import 'package:dentist_hospital_system/Widgets/1_Main_Widgets/Widget_Row_Child.dart';
import 'package:flutter/material.dart';

class Active_Students extends StatelessWidget {
  const Active_Students({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Students",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentsScreen(),
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
          Builder(
            builder: (context) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                            students[index].initials,
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
                            Text(
                              "${students[index].name}",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Year ${students[index].year} - ID ${students[index].id}",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "${students[index].supervisor}",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    child2: Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.green),
                        Text(
                          "87%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

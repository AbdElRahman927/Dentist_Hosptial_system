import 'package:flutter/material.dart';

class Student_Notification extends StatefulWidget {
  const Student_Notification({super.key});
  @override
  State<Student_Notification> createState() => _Student_NotificationState();
}

class _Student_NotificationState extends State<Student_Notification> {
  int selectedFilter = 0;
  final filters = ['All', 'Academic', 'Clinical', 'General'];

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Case Report Approved',
      'subtitle':
          'Dr. Ahmed Hassan approved your Crown Preparation case report. Great work!',
      'time': '10 min ago',
      'icon': Icons.check_circle_outline,
      'color': Colors.green,
      'isRead': false,
      'category': 'Clinical',
    },
    {
      'title': 'New Clinical Session Assigned',
      'subtitle':
          'You have been assigned to Clinic Room 302 for Thursday\'s session.',
      'time': '1 hour ago',
      'icon': Icons.medical_services_outlined,
      'color': Color(0xff931A23),
      'isRead': false,
      'category': 'Clinical',
    },
    {
      'title': 'Exam Schedule Published',
      'subtitle':
          'The final practical exam schedule for Prosthodontics has been published.',
      'time': '3 hours ago',
      'icon': Icons.event_note_outlined,
      'color': Colors.blue,
      'isRead': false,
      'category': 'Academic',
    },
    {
      'title': 'Patient Assignment',
      'subtitle':
          'You have been assigned a new patient: Mahmoud Taha — Orthodontic case.',
      'time': '5 hours ago',
      'icon': Icons.person_add_outlined,
      'color': Colors.purple,
      'isRead': true,
      'category': 'Clinical',
    },
    {
      'title': 'Attendance Reminder',
      'subtitle':
          'You have 2 absences this month. Please maintain your attendance record.',
      'time': '1 day ago',
      'icon': Icons.warning_amber_outlined,
      'color': Colors.orange,
      'isRead': true,
      'category': 'Academic',
    },
    {
      'title': 'Evaluation Feedback',
      'subtitle':
          'Dr. Hassan left feedback on your clinical performance evaluation.',
      'time': '2 days ago',
      'icon': Icons.rate_review_outlined,
      'color': Colors.teal,
      'isRead': true,
      'category': 'Academic',
    },
    {
      'title': 'Hospital Announcement',
      'subtitle': 'The hospital will be closed on May 15th for maintenance.',
      'time': '3 days ago',
      'icon': Icons.campaign_outlined,
      'color': Colors.indigo,
      'isRead': true,
      'category': 'General',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var filtered =
        selectedFilter == 0
            ? notifications
            : notifications
                .where((n) => n['category'] == filters[selectedFilter])
                .toList();
    int unread = notifications.where((n) => !n['isRead']).length;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(size: 28),
        title: Row(
          children: [
            Image.asset(
              "images/hospital.png",
              scale: 12,
              color: Color(0xff931A23),
            ),
            SizedBox(width: 10),
            Text("Notifications", style: TextStyle(color: Color(0xff931A23))),
          ],
        ),
        actions: [
          TextButton(
            onPressed:
                () => setState(() {
                  for (var n in notifications) n['isRead'] = true;
                }),
            child: Text(
              "Mark all read",
              style: TextStyle(color: Color(0xff931A23), fontSize: 13),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xff931A23).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: Color(0xff931A23),
                    size: 22,
                  ),
                ),
                SizedBox(width: 12),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    children: [
                      TextSpan(text: "You have "),
                      TextSpan(
                        text: "$unread unread",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff931A23),
                        ),
                      ),
                      TextSpan(text: " notifications"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: List.generate(filters.length, (i) {
                bool sel = selectedFilter == i;
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedFilter = i),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: sel ? Color(0xff931A23) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.3),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        filters[i],
                        style: TextStyle(
                          color: sel ? Colors.white : Colors.grey[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child:
                filtered.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_off_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No notifications",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => _notifCard(filtered[i]),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _notifCard(Map<String, dynamic> n) => Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color:
          n['isRead']
              ? Colors.white
              : Color(0xff931A23).withValues(alpha: 0.04),
      borderRadius: BorderRadius.circular(16),
      border:
          n['isRead']
              ? null
              : Border.all(color: Color(0xff931A23).withValues(alpha: 0.15)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.15),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: (n['color'] as Color).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(n['icon'], color: n['color'], size: 24),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      n['title'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            n['isRead'] ? FontWeight.w500 : FontWeight.bold,
                      ),
                    ),
                  ),
                  if (!n['isRead'])
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color(0xff931A23),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                n['subtitle'],
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Text(
                    n['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      n['category'],
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

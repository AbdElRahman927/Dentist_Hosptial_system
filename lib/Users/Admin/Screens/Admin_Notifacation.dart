import 'package:flutter/material.dart';

class Admin_Notification extends StatefulWidget {
  const Admin_Notification({super.key});

  @override
  State<Admin_Notification> createState() => _Admin_NotificationState();
}

class _Admin_NotificationState extends State<Admin_Notification> {
  int selectedFilter = 0;
  final List<String> filters = ['All', 'System', 'Staff', 'Appointments'];

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Doctor Registration',
      'subtitle':
          'Dr. Sarah Mohamed has been added to the system and is pending approval.',
      'time': '2 min ago',
      'icon': Icons.person_add_outlined,
      'color': Color(0xff931A23),
      'isRead': false,
      'category': 'Staff',
    },
    {
      'title': 'System Backup Completed',
      'subtitle':
          'Daily automated backup has been completed successfully at 3:00 AM.',
      'time': '1 hour ago',
      'icon': Icons.cloud_done_outlined,
      'color': Colors.green,
      'isRead': false,
      'category': 'System',
    },
    {
      'title': 'Appointment Overflow Alert',
      'subtitle':
          'The Orthodontics department has exceeded daily appointment capacity.',
      'time': '3 hours ago',
      'icon': Icons.warning_amber_outlined,
      'color': Colors.orange,
      'isRead': true,
      'category': 'Appointments',
    },
    {
      'title': 'Monthly Report Ready',
      'subtitle': 'April 2026 hospital performance report is ready for review.',
      'time': '5 hours ago',
      'icon': Icons.assessment_outlined,
      'color': Colors.blue,
      'isRead': true,
      'category': 'System',
    },
    {
      'title': 'Student Evaluation Due',
      'subtitle': '12 student evaluations are pending your approval this week.',
      'time': '1 day ago',
      'icon': Icons.school_outlined,
      'color': Colors.purple,
      'isRead': true,
      'category': 'Staff',
    },
    {
      'title': 'Equipment Maintenance',
      'subtitle':
          'Dental Unit #3 in Room 205 is scheduled for maintenance tomorrow.',
      'time': '1 day ago',
      'icon': Icons.build_outlined,
      'color': Colors.teal,
      'isRead': true,
      'category': 'System',
    },
    {
      'title': 'New Patient Batch Import',
      'subtitle':
          '45 new patient records have been successfully imported into the system.',
      'time': '2 days ago',
      'icon': Icons.people_outline,
      'color': Color(0xff931A23),
      'isRead': true,
      'category': 'System',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredNotifications =
        selectedFilter == 0
            ? notifications
            : notifications
                .where((n) => n['category'] == filters[selectedFilter])
                .toList();

    int unreadCount = notifications.where((n) => !n['isRead']).length;

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
            onPressed: () {
              setState(() {
                for (var n in notifications) {
                  n['isRead'] = true;
                }
              });
            },
            child: Text(
              "Mark all read",
              style: TextStyle(color: Color(0xff931A23), fontSize: 13),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Unread counter banner
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
                Text(
                  "You have ",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                Text(
                  "$unreadCount unread",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff931A23),
                  ),
                ),
                Text(
                  " notifications",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // Filter chips
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: List.generate(filters.length, (index) {
                bool isSelected = selectedFilter == index;
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xff931A23) : Colors.white,
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
                        filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[700],
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

          // Notification list
          Expanded(
            child:
                filteredNotifications.isEmpty
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredNotifications.length,
                      itemBuilder: (context, index) {
                        final notif = filteredNotifications[index];
                        return _buildNotificationCard(notif);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notif) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            notif['isRead']
                ? Colors.white
                : Color(0xff931A23).withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border:
            notif['isRead']
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
              color: (notif['color'] as Color).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(notif['icon'], color: notif['color'], size: 24),
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
                        notif['title'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              notif['isRead']
                                  ? FontWeight.w500
                                  : FontWeight.bold,
                        ),
                      ),
                    ),
                    if (!notif['isRead'])
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
                  notif['subtitle'],
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
                      notif['time'],
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
                        notif['category'],
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
}

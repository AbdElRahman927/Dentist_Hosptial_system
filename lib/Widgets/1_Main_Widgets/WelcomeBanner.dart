import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:flutter/material.dart';

class Welcomebanner extends StatelessWidget {
  const Welcomebanner({
    super.key,
    required this.userName,
    required this.bannerstatavalue,
    required this.bannerstatelabel,
    required this.userrole,
  });
  final String userName;
  final UserRole userrole;
  final List<String> bannerstatelabel;
  final List<String> bannerstatavalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff931A23), Color(0xffB52D38)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xff931A23).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning 👋",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  userrole == UserRole.admin
                      ? Icons.admin_panel_settings
                      : userrole == UserRole.doctor
                      ? Icons.medical_services
                      : Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bannerStat(bannerstatavalue[0], bannerstatelabel[0]),
                _bannerDivider(),
                _bannerStat(bannerstatavalue[1], bannerstatelabel[1]),
                _bannerDivider(),
                _bannerStat(bannerstatavalue[2], bannerstatelabel[2]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _bannerDivider() =>
    Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.3));
Widget _bannerStat(String value, String label) => Column(
  children: [
    Text(
      value,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    SizedBox(height: 4),
    Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
        color: Colors.white.withValues(alpha: 0.8),
      ),
    ),
  ],
);

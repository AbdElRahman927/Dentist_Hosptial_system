import 'package:flutter/material.dart';

class Admin_Tile_Widget extends StatelessWidget {
  const Admin_Tile_Widget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(width: 30, height: 30, child: FittedBox(child: icon)),
                SizedBox(width: 14),
                Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Spacer(),
                Icon(Icons.chevron_right, size: 20, color: Colors.grey[400]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

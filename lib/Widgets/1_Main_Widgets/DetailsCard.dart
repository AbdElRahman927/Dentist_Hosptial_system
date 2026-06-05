import 'dart:ui';

import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    this.widget,
    this.number,
    this.text,
    this.color1,
    this.color2,
  });

  final Widget? widget;
  final int? number;
  final String? text;
  final Color? color1;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget!,
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color2,
              ),
            ),
            Text(text!, style: TextStyle(fontSize: 18, color: color2)),
          ],
        ),
      ),
    );
  }
}

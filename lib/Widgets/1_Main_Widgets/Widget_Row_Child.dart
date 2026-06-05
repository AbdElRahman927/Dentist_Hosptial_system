
import 'package:flutter/material.dart';

class Widget_Row_Child extends StatelessWidget {
  const Widget_Row_Child({
    super.key,
    required this.child1,
    required this.child2,
  });
  final Widget child1;
  final Widget child2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [child1, child2],
      ),
    );
  }
}

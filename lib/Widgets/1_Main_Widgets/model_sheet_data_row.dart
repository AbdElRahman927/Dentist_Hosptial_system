import 'package:flutter/material.dart';

class Data_Row extends StatelessWidget {
  const Data_Row({super.key, this.data, this.value});
  final String? data;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data!, style: TextStyle(fontSize: 18)),
              Text(value!, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Divider(color: Colors.black, thickness: 0, height: 7),
      ],
    );
  }
}

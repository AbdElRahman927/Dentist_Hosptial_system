import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/New_Mansoura_University.png", height: 80),
        const SizedBox(height: 10),
        const Text(
          "NMU Dentistry Hospital",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Create Patient Account",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
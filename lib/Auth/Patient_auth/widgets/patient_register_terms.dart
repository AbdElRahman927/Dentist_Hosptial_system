import 'package:flutter/material.dart';

class RegisterTerms extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const RegisterTerms({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xff941419),
        ),
        const Expanded(
          child: Text(
            "I agree to Terms & Conditions",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}
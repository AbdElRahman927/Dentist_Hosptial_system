import 'package:flutter/material.dart';

class PatientAppointmentsSearch extends StatelessWidget {
  final Function(String) onChanged;

  const PatientAppointmentsSearch({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: TextField(
        onChanged: onChanged,

        decoration: InputDecoration(
          hintText: "Search appointments...",

          prefixIcon: const Icon(Icons.search),

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

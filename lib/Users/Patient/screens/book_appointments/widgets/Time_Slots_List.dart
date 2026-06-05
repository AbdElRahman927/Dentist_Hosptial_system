import 'package:flutter/material.dart';
import 'Time_Slot_Chip.dart';

class TimeSlotsList extends StatelessWidget {
  const TimeSlotsList({
    super.key,
    required this.selectedTime,
    required this.onSelect,
  });

  final String selectedTime;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    final times = [
      "09:00 AM",
      "10:00 AM",
      "11:00 AM",
      "12:00 PM",
      "01:00 PM",
      "02:00 PM",
      "03:00 PM",
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          times.map((time) {
            return TimeSlotChip(
              time: time,
              isSelected: selectedTime == time,
              onTap: () => onSelect(time),
            );
          }).toList(),
    );
  }
}

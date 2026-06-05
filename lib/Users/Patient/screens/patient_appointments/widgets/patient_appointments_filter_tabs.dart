import 'package:flutter/material.dart';

class PatientAppointmentsFilterTabs extends StatelessWidget {
  final List<String> filters;
  final int selectedFilter;
  final Function(int) onSelected;

  const PatientAppointmentsFilterTabs({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),

        itemCount: filters.length,

        itemBuilder: (_, index) {
          final selected = selectedFilter == index;

          return GestureDetector(
            onTap: () => onSelected(index),

            child: Container(
              margin: const EdgeInsets.all(8),

              padding: const EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(
                color: selected ? const Color(0xff931A23) : Colors.white,

                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),

              child: Center(
                child: Text(
                  filters[index],

                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

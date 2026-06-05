import 'package:flutter/material.dart';

class ChatTypingIndicator extends StatelessWidget {
  const ChatTypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dot(),
            const SizedBox(width: 5),
            _dot(delay: 1),
            const SizedBox(width: 5),
            _dot(delay: 2),
          ],
        ),
      ),
    );
  }

  Widget _dot({int delay = 0}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 450 + delay * 150),
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Color(0xff941419),
        shape: BoxShape.circle,
      ),
    );
  }
}
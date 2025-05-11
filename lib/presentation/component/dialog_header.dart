import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const DialogHeader({
    super.key,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Icon(
          icon, // Represents secure connection
          size: 28,
          color: Colors.blueAccent,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TitleHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool dismissible;
  final Function() onDismiss;

  const TitleHeader({
    super.key,
    required this.icon,
    required this.title,
    this.dismissible = false,
    this.onDismiss = _defaultOnDismiss,
  });

  static void _defaultOnDismiss() {}

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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: SizedBox.shrink()
        ),
        if (dismissible)
          IconButton(
            onPressed: onDismiss,
            icon: const Icon(LucideIcons.x),
          )
      ],
    );
  }
}
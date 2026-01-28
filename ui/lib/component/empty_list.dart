import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/app_button.dart';

class EmptyList extends StatelessWidget {
  final String message;
  final Function() onAction;
  
  const EmptyList({
    super.key,
    required this.message,
    required this.onAction
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          spacing: 12,
          children: [
            const Icon(
              LucideIcons.brackets,
              size: 64
            ),
            Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            AppButton(
              onClick: onAction,
              text: "ADD",
              icon: LucideIcons.plus
            )
          ]
        )
      )
    );
  }
  
}
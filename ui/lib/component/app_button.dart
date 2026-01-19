import 'package:flutter/material.dart';

class AppButton extends StatelessWidget  {
  final IconData? icon;
  final String text;
  final Function() onClick;

  const AppButton({
    super.key,
    this.icon,
    required this.text,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 384),
      child: SizedBox(
        height: 40,
        child: FilledButton.icon(
          onPressed: onClick,
          icon: icon != null ? Icon(icon) : null,
          label: Text(text),
        )
      )
    );
  }
}
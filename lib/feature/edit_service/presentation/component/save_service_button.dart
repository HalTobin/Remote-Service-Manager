import 'package:flutter/material.dart';

class SaveServiceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveServiceButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 384),
        child: SizedBox(
          height: 40,
          child: FilledButton.icon(
            onPressed: onPressed,
            icon: Icon(Icons.save),
            label: const Text('SAVE'),
          ),
        ),
      ),
    );
  }
}
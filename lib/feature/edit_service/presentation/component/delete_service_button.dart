import 'package:flutter/material.dart';

class DeleteServiceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteServiceButton({
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
          child: OutlinedButton.icon(
            onPressed: onPressed,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: const Text(
              'DELETE',
              style: TextStyle(color: Colors.red),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red)
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SshConnectButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool loading;

  const SshConnectButton({
    super.key,
    required this.onPressed,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 384),
        child: SizedBox(
          height: 48,
          child: FilledButton.icon(
            onPressed: loading ? null : onPressed,
            icon: loading ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ) : Icon(Icons.public),
            label: const Text('CONNECT'),
          ),
        ),
      ),
    );
  }
}
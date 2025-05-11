import 'package:flutter/material.dart';

class AnimatedGlobalErrorWarning extends StatelessWidget {
  final String error;
  final Function() onClose;

  AnimatedGlobalErrorWarning({
    required this.error,
    required this.onClose
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: error.isNotEmpty
          ? GlobalErrorWarning(
            key: ValueKey(error), // important for AnimatedSwitcher
            error: error,
            onDismiss: () => onClose(),
          )
          : const SizedBox.shrink(), // hidden when there's no error
      ),
    );
  }

}

class GlobalErrorWarning extends StatelessWidget {
  final String error;
  final Function onDismiss;

  const GlobalErrorWarning({
    super.key,
    required this.error,
    required this.onDismiss
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 140, // approx. 7 lines
              ),
              child: SingleChildScrollView(
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () => onDismiss(),
            tooltip: 'Dismiss',
          )
        ],
      ),
    );
  }
}
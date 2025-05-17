import 'package:flutter/material.dart';

class AppDialogLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const AppDialogLayout({
    super.key,
    required this.padding,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: padding,
        child: child,
      )
    );
  }
}
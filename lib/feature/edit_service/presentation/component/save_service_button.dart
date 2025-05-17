import 'package:flutter/material.dart';
import 'package:ls_server_app/presentation/component/app_button.dart';

class SaveServiceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveServiceButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        icon: Icons.save,
        text: "SAVE",
        onClick: onPressed
      ),
    );
  }
}
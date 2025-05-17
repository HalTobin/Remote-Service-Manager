import 'package:flutter/material.dart';
import 'package:ls_server_app/presentation/component/app_button.dart';
import 'package:ls_server_app/presentation/component/dialog_header.dart';

class PasswordRequiredDialog extends StatelessWidget {
  final Function(String) onPasswordEntered;

  PasswordRequiredDialog({
    super.key,
    required this.onPasswordEntered
  });

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 386,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          DialogHeader(
            icon: Icons.key,
            title: "Password necessary"
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
            ),
          ),
          Center(
            child: AppButton(
              icon: Icons.key,
              text: "AUTHENTICATE",
              onClick: () => onPasswordEntered(passwordController.text)
            )
          ),
        ],
      )
    );
  }
}
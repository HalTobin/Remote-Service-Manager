import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ls_server_app/presentation/component/app_button.dart';
import 'package:ls_server_app/presentation/component/dialog_header.dart';

class PasswordRequiredDialog extends StatefulWidget {
  final Function(String) onPasswordEntered;
  final Function() onDismiss;

  const PasswordRequiredDialog({
    super.key,
    required this.onPasswordEntered,
    required this.onDismiss,
  });

  @override
  State<PasswordRequiredDialog> createState() => _PasswordRequiredDialogState();
}

class _PasswordRequiredDialogState extends State<PasswordRequiredDialog> {
  bool obscurePassword = true;
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
            title: "Password required",
            dismissible: true,
            onDismiss: widget.onDismiss
          ),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  obscurePassword = !obscurePassword;
                }),
                icon: FaIcon(
                  obscurePassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash
                )
              )
            ),
          ),
          Center(
            child: AppButton(
              icon: Icons.key,
              text: "AUTHENTICATE",
              onClick: () => widget.onPasswordEntered(passwordController.text)
            )
          ),
        ],
      )
    );
  }
}
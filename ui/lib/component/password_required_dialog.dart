import 'package:flutter/material.dart';
import 'package:ui/component/app_button.dart';
import 'package:ui/component/title_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PasswordRequiredDialog extends StatefulWidget {
  final Function(String) onPasswordEntered;
  final Function() onDismiss;

  final String confirmText;
  final Function()? onBiometricsRequest;

  const PasswordRequiredDialog({
    super.key,
    required this.onPasswordEntered,
    required this.onDismiss,
    this.confirmText = "AUTHENTICATE",
    this.onBiometricsRequest = null,
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
          TitleHeader(
            icon: LucideIcons.lockKeyhole,
            title: "Password required",
            trailingContent: TitleHeaderTrailingContent.dismissable(onDismiss: widget.onDismiss)
          ),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              prefixIcon: (widget.onBiometricsRequest != null)
                ? IconButton(
                  onPressed: widget.onBiometricsRequest,
                  icon: const Icon(LucideIcons.fingerprintPattern)
                )
                : null,
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  obscurePassword = !obscurePassword;
                }),
                icon: Icon(
                  obscurePassword
                    ? LucideIcons.eye
                    : LucideIcons.eyeOff
                )
              )
            ),
          ),
          Center(
            child: AppButton(
              icon: LucideIcons.keyRound,
              text: widget.confirmText,
              onClick: () => widget.onPasswordEntered(passwordController.text)
            )
          ),
        ],
      )
    );
  }
}
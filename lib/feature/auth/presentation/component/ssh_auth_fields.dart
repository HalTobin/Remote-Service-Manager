import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/component/password_text_form_field.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_file_picker_field.dart';

import '../../data/ssh_connect_fields.dart';

class SshAuthFields extends StatelessWidget {
  final bool enabled;

  final TextEditingController userController;
  final TextEditingController urlController;
  final TextEditingController portController;
  final TextEditingController sshController;
  final Function(String) loadSshFile;
  final TextEditingController passwordController;

  final List<SshConnectFields> wrongFields;

  final bool passwordRequired;

  const SshAuthFields({
    super.key,

    required this.enabled,
    required this.userController,
    required this.urlController,
    required this.portController,
    required this.sshController,
    required this.loadSshFile,
    required this.passwordController,

    required this.wrongFields,
    required this.passwordRequired
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 400;

            return Column(
              children: [
                isNarrow
                    ? Column(
                  children: [
                    TextFormField(
                      enabled: enabled,
                      controller: urlController,
                      decoration: InputDecoration(
                        labelText: 'Server URL',
                        errorText: wrongFields.contains(SshConnectFields.url) ? "Required" : null,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        enabled: enabled,
                        controller: portController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: wrongFields.contains(SshConnectFields.port) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: enabled,
                        controller: urlController,
                        decoration: InputDecoration(
                          labelText: 'Server URL',
                          errorText: wrongFields.contains(SshConnectFields.url) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 96,
                      child: TextFormField(
                        enabled: enabled,
                        controller: portController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: wrongFields.contains(SshConnectFields.port) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                isNarrow
                    ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        enabled: enabled,
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: wrongFields.contains(SshConnectFields.user) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SshFilePickerField(
                      enable: enabled,
                      error: wrongFields.contains(SshConnectFields.filePath),
                      controller: sshController,
                      onFilePicked: (path) => loadSshFile(path),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: TextFormField(
                        enabled: enabled,
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: wrongFields.contains(SshConnectFields.user) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SshFilePickerField(
                        enable: enabled,
                        error: wrongFields.contains(SshConnectFields.filePath),
                        controller: sshController,
                        onFilePicked: (path) => loadSshFile(path),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),

        PasswordTextFormField(
            controller: passwordController,
            enabled: passwordRequired && enabled
        )

        /*TextFormField(
          controller: passwordController,
          enabled: passwordRequired && enabled,
          obscureText: widget.state.obscurePassword,
          decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(
                      widget.state.obscurePassword
                          ? LucideIcons.eye
                          : LucideIcons.eyeOff
                  ),
                  onPressed: () => widget.onEvent(ObscurePassword(obscure: !widget.state.obscurePassword))
              )
          ),
        ),*/

        /*Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            SaveProfileCheckbox(
                checked: widget.state.saveProfile,
                onChecked: (value) => widget.onEvent(UpdateSaveProfile(saveProfile: value))
            ),
            if (widget.state.quickConnectAvailable)
              EnableQuickConnectCheckbox(
                  checked: widget.state.enableQuickConnect,
                  enable: widget.state.saveProfile,
                  onChecked: (value) => widget.onEvent(UpdateEnableQuickConnect(enableQuickConnect: value))
              )
          ],
        ),*/
      ],
    );
  }

}
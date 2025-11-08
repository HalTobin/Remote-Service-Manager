import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_event.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_state.dart';
import 'package:ls_server_app/feature/auth/presentation/component/save_profile_checkbox.dart';
import 'package:ls_server_app/presentation/component/global_error_warning.dart';
import 'package:ls_server_app/feature/auth/presentation/component/profiles_dropdown.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_connect_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../data/model/server_profile.dart';
import '../../../presentation/component/dialog_header.dart';
import 'auth_viewmodel.dart';
import 'component/ssh_file_picker_field.dart';

class AuthScreen extends StatefulWidget {
  final AuthState state;
  final Function(AuthEvent event) onEvent;
  final Stream<AuthUiEvent> uiEvent;
  final Future<String?> Function() onPasswordRequest;

  const AuthScreen({
    super.key,
    required this.state,
    required this.onEvent,
    required this.uiEvent,
    required this.onPasswordRequest
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController userController;
  late final TextEditingController urlController;
  late final TextEditingController portController;
  late final TextEditingController sshController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    userController = TextEditingController(text: widget.state.user);
    urlController = TextEditingController(text: widget.state.serverUrl);
    portController = TextEditingController(text: widget.state.serverPort);
    sshController = TextEditingController(text: widget.state.sshFilePath);
    passwordController = TextEditingController(text: widget.state.password);

    widget.uiEvent.listen((event) {
      switch (event) {
        case SelectProfile(): {
          urlController.text = event.profile.url;
          portController.text = event.profile.port;
          userController.text = event.profile.user;
          sshController.text = event.profile.keyPath;
          passwordController.text = "";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        const DialogHeader(
          icon: LucideIcons.lock,
          title: "SSH Connection"
        ),

        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: ProfilesDropdown(
                title: getProfileTitle(),
                currentProfile: widget.state.profile,
                profiles: widget.state.profiles,
                onProfileSelect: (ServerProfile newProfile) { widget.onEvent(LoadProfile(profile: newProfile)); }
              )
            )
          ],
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 400;

            return Column(
              children: [
                isNarrow
                    ? Column(
                  children: [
                    TextFormField(
                      enabled: !widget.state.loading,
                      controller: urlController,
                      decoration: InputDecoration(
                        labelText: 'Server URL',
                        errorText: widget.state.urlError ? "Required" : null,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        enabled: !widget.state.loading,
                        controller: portController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: widget.state.portError ? "Required" : null,
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
                        enabled: !widget.state.loading,
                        controller: urlController,
                        decoration: InputDecoration(
                          labelText: 'Server URL',
                          errorText: widget.state.urlError ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 96,
                      child: TextFormField(
                        enabled: !widget.state.loading,
                        controller: portController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: widget.state.portError ? "Required" : null,
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
                        enabled: !widget.state.loading,
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: widget.state.userError ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SshFilePickerField(
                      enable: !widget.state.loading,
                      error: widget.state.fileError,
                      controller: sshController,
                      onFilePicked: (path) => widget.onEvent(LoadSshFile(sshFilePath: path)),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: TextFormField(
                        enabled: !widget.state.loading,
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: widget.state.userError ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SshFilePickerField(
                        enable: !widget.state.loading,
                        error: widget.state.fileError,
                        controller: sshController,
                        onFilePicked: (path) => widget.onEvent(LoadSshFile(sshFilePath: path)),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),

        TextFormField(
          controller: passwordController,
          enabled: widget.state.passwordRequired && !widget.state.loading,
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
        ),

        SaveProfileCheckbox(
          checked: widget.state.saveProfile,
          onChecked: (value) => widget.onEvent(UpdateSaveProfile(saveProfile: value ?? false))
        ),

        const Spacer(),

        AnimatedGlobalErrorWarning(
          error: widget.state.globalError,
          onClose: () => widget.onEvent(ClearError())
        ),

        SshConnectButton(
          loading: widget.state.loading,
          onPressed: () {
            //widget.onEvent(FakeConnect());
            final event = Connect(
              user: userController.text,
              serverUrl: urlController.text,
              serverPort: portController.text,
              sshFilePath: sshController.text,
              password: widget.state.passwordRequired ? passwordController.text : null,
              saveProfile: widget.state.saveProfile,
              passwordRequestCallback: widget.onPasswordRequest
            );
            widget.onEvent(event);
          },
        ),
      ],
    );
  }

  String getProfileTitle() {
    return "${userController.text}@${urlController.text}:${portController.text}";
  }
}
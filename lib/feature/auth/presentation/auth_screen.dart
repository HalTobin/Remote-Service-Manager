import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_event.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_state.dart';
import 'package:ls_server_app/feature/auth/presentation/component/save_profile_checkbox.dart';
import 'package:ls_server_app/presentation/component/global_error_warning.dart';
import 'package:ls_server_app/feature/auth/presentation/component/profiles_dropdown.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_connect_button.dart';

import '../../../data/model/server_profile.dart';
import '../../../presentation/component/dialog_header.dart';
import 'component/ssh_file_picker_field.dart';

class AuthScreen extends StatefulWidget {
  final AuthState state;
  final Function(AuthEvent event) onEvent;

  const AuthScreen({
    super.key,
    required this.state,
    required this.onEvent,
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
  }

  @override
  void didUpdateWidget(covariant AuthScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state.user != userController.text && userController.text.isEmpty) {
      userController.text = widget.state.user;
    }
    if (widget.state.serverUrl != urlController.text && urlController.text.isEmpty) {
      urlController.text = widget.state.serverUrl;
    }
    if (widget.state.serverPort != portController.text && portController.text.isEmpty) {
      portController.text = widget.state.serverPort;
    }
    if (widget.state.sshFilePath != sshController.text && sshController.text.isEmpty) {
      sshController.text = widget.state.sshFilePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          const DialogHeader(
            icon: Icons.lock_outline,
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

          Flex(
            direction: Axis.horizontal,
            spacing: 12,
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
              SizedBox(
                width: 96, // Approx width for 4 chars
                child: TextFormField(
                  enabled: !widget.state.loading,
                  controller: portController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Port',
                    counterText: '', // hides the character counter
                    errorText: widget.state.portError ? "Required" : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),

          Flex(
            direction: Axis.horizontal,
            spacing: 12,
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
              Expanded(
                child: SshFilePickerField(
                  enable: !widget.state.loading,
                  error: widget.state.fileError,
                  controller: sshController,
                  onFilePicked: (path) => widget.onEvent(LoadSshFile(sshFilePath: path)),
                )
              )
            ]
          ),

          TextFormField(
            controller: passwordController,
            enabled: widget.state.passwordRequired && !widget.state.loading,
            obscureText: widget.state.obscurePassword,
            decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: FaIcon(
                  widget.state.obscurePassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash
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
              widget.onEvent(Connect(
                user: userController.text,
                serverUrl: urlController.text,
                serverPort: portController.text,
                sshFilePath: sshController.text,
                password: widget.state.passwordRequired ? passwordController.text : null,
                saveProfile: widget.state.saveProfile,
              ));
            },
          ),
        ],
      )
    );
  }

  String getProfileTitle() {
    return "${userController.text}@${urlController.text}:${portController.text}";
  }
}
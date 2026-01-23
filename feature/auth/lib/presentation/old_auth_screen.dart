/*import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/old_auth_event.dart';
import 'package:ls_server_app/feature/auth/presentation/old_auth_state.dart';
import 'package:ls_server_app/feature/auth/presentation/component/enable_quick_connect_checkbox.dart';
import 'package:ls_server_app/feature/auth/presentation/component/save_profile_checkbox.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_auth_fields.dart';
import 'package:ls_server_app/presentation/component/global_error_warning.dart';
import 'package:ls_server_app/feature/auth/presentation/component/profiles_dropdown.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_connect_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../data/model/server_profile.dart';
import '../../../presentation/component/title_header.dart';
import 'old_auth_viewmodel.dart';

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
        const TitleHeader(
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

        SshAuthFields(
          enabled: !widget.state.loading,
          userController: userController,
          urlController: urlController,
          portController: portController,
          sshController: sshController,
          loadSshFile: (path) => widget.onEvent(LoadSshFile(sshFilePath: path)),
          passwordController: passwordController,
          wrongFields: widget.state.wrongFields,
          passwordRequired: widget.state.passwordRequired
        ),

        Row(
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
              enableQuickConnect: widget.state.enableQuickConnect,
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
}*/
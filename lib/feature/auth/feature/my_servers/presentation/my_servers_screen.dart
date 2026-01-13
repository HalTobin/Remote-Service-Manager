import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/feature/add_edit_server/di/add_edit_server_provider.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/presentation/component/server_profile_item.dart';
import 'package:ls_server_app/presentation/component/title_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'my_servers_event.dart';
import 'my_servers_state.dart';

class MyServersScreen extends StatefulWidget {
  final MyServersState state;
  final Function(MyServersEvent) onEvent;

  const MyServersScreen({
    super.key,
    required this.state,
    required this.onEvent
  });

  @override
  State<StatefulWidget> createState() => _MyServersScreenState();

}

class _MyServersScreenState extends State<MyServersScreen> {
  final TextEditingController _sshPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [

        TitleHeader(
            icon: LucideIcons.server,
            title: "My Servers",
            trailingContent: TitleHeaderTrailingContent.action(
              title: "Add",
              icon: LucideIcons.plus,
              onPressed: () => showAddEditBottomSheet(null)
            )
        ),

        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: widget.state.servers.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = widget.state.servers[index];

              final MyServersEvent connectEvent = Connect(
                user: profile.user,
                serverUrl: profile.url,
                serverPort: profile.port,
                sshFilePath: profile.keyPath,
                password: _sshPasswordController.text
              );

              return ServerProfileItem(
                profile: profile,
                onClick: () => widget.onEvent(connectEvent),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
        ),

        TextField(
          controller: _sshPasswordController,
          enabled: widget.state.sshPasswordRequired,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: widget.state.passwordError ? "Wrong password" : null,
            border: const OutlineInputBorder(),
          ),
        )
      ],
    );
  }

  void showAddEditBottomSheet(int? serverProfileId) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
          child: AddEditServerProvider(
            serverProfileId: serverProfileId,
            onDismiss: () => Navigator.pop(context),
          )
        );
      }
    );
  }

}
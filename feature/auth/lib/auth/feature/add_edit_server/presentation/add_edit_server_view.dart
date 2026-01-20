import 'package:flutter/material.dart';
import 'package:ui/component/title_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../presentation/component/ssh_auth_fields.dart';
import 'add_edit_server_event.dart';
import 'add_edit_server_state.dart';

class AddEditServerView extends StatefulWidget {
  final int? serverProfileId;
  final AddEditServerState state;
  final Function(AddEditServerEvent) onEvent;
  final Function() onDismiss;

  const AddEditServerView({
    super.key,
    this.serverProfileId,
    required this.state,
    required this.onEvent,
    required this.onDismiss
  });

  @override
  State<StatefulWidget> createState() => AddEditServerViewState();

}

class AddEditServerViewState extends State<AddEditServerView> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController sshController = TextEditingController();

  late bool isNewServer = widget.serverProfileId == null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [

        TitleHeader(
          icon: isNewServer ? LucideIcons.plus : LucideIcons.pen,
          title: isNewServer ? "New server" : "Edit a server",
          trailingContent: TitleHeaderTrailingContent.dismissable(
            onDismiss: widget.onDismiss
          ),
        ),

        SshAuthFields(
          enabled: true,
          userController: userController,
          urlController: urlController,
          portController: portController,
          sshController: sshController,
          loadSshFile: (path) => {},
          wrongFields: [],
        ),

        FilledButton.icon(
          onPressed: () => { /*TODO()*/ },
          icon: const Icon(LucideIcons.save),
          label: const Text('SAVE')
        )
      ],
    );
  }

}
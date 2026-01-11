import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_auth_fields.dart';
import 'package:ls_server_app/presentation/component/title_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AddEditServerView extends StatefulWidget {
  final int? serverProfileId;
  final Function() onDismiss;

  const AddEditServerView({
    super.key,
    this.serverProfileId,
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
  final TextEditingController passwordController = TextEditingController();

  late bool isNewServer = widget.serverProfileId == null;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          passwordController: passwordController,
          wrongFields: [],
          passwordRequired: false
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
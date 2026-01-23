import 'package:feature_auth/feature/my_ssh_keys/presentation/component/ssh_key_item.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ui/component/app_button.dart';
import 'package:ui/component/title_header.dart';

import 'my_ssh_keys_event.dart';
import 'my_ssh_keys_state.dart';

class MySshKeysView extends StatelessWidget {
  final MySshKeysState state;
  final Function(MySshKeysEvent) onEvent;
  final Function(String) onSelect;

  const MySshKeysView({
    super.key,
    required this.state,
    required this.onEvent,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          icon: LucideIcons.folderKey,
          title: "My SSH Keys"
        ),
        Expanded(
          child: ListView.separated(
            itemCount: state.keys.length,
            itemBuilder: (BuildContext context, int index) {
              final key = state.keys[index];

              final MySshKeysEvent selectEvent = SelectKey(keyPath: key.path);

              return SshKeyItem(
                sshKeyFile: key,
                onClick: () => onEvent(selectEvent)
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          ),
        ),
        AppButton(
          onClick: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null && result.files.single.path != null) {
              final String sshFile = result.files.single.path!;
              final event = AddKey(keyPath: sshFile);
              onEvent(event);
            }
          },
          icon: LucideIcons.key,
          text: "ADD"
        )
      ],
    );
  }
}
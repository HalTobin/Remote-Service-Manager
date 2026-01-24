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
  final bool selectionEnable;
  final Function(String) onSelect;
  final Function() onDismiss;

  const MySshKeysView({
    super.key,
    required this.state,
    required this.onEvent,
    required this.selectionEnable,
    required this.onSelect,
    required this.onDismiss
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TitleHeader(
          icon: LucideIcons.folderKey,
          title: "My SSH Keys",
          trailingContent: TitleHeaderTrailingContent.dismissable(onDismiss: onDismiss),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: state.keys.length,
            itemBuilder: (BuildContext context, int index) {
              final key = state.keys[index];
              final MySshKeysEvent selectEvent = SelectKey(keyPath: key.path);

              return SshKeyItem(
                sshKeyFile: key,
                selected: state.selectedKeyPath == key.path,
                onClick: () => onEvent(selectEvent),
                onEdit: (newName) {
                  final MySshKeysEvent editEvent = RenameKey(keyPath: key.path, newName: newName);
                  onEvent(editEvent);
                },
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
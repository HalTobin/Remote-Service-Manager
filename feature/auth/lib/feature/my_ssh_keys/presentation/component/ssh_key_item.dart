import 'package:feature_auth/feature/my_ssh_keys/domain/ssh_key_file.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/selectable.dart';

class SshKeyItem extends StatefulWidget {
  final SshKeyFile sshKeyFile;
  final bool selected;
  final Function() onClick;
  final Function(String newName) onEdit;

  const SshKeyItem({
    super.key,
    required this.sshKeyFile,
    required this.selected,
    required this.onClick,
    required this.onEdit
  });

  @override
  State<StatefulWidget> createState() => _SshKeyItemState();

}

class _SshKeyItemState extends State<SshKeyItem> {

  bool isEditing = false;
  final TextEditingController _nameController = TextEditingController();

  void enableEditMode() {
    setState(() {
      _nameController.text = widget.sshKeyFile.name;
      isEditing = true;
    });
  }

  void disableEditMode() {
    setState(() {
      isEditing = false;
    });
  }

  void confirmEdition() {
    setState(() {
      isEditing = false;
      widget.onEdit(_nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selectable(
      selectionEnable: true,
      selected: widget.selected,
      onSelect: widget.onClick,
      idleChild: Row(
        children: [
          _BaseKeyItem(sshKeyFile: widget.sshKeyFile),
          const Spacer(),
          Icon(LucideIcons.chevronRight)
        ],
      ),
      selectedChild: Row(
        children: [
          _BaseKeyItem(sshKeyFile: widget.sshKeyFile),
          const Spacer(),
          IconButton(
            icon: Icon(LucideIcons.pen),
            onPressed: widget.onClick,
          ),
          IconButton(
            icon: Icon(LucideIcons.x),
            onPressed: widget.onClick,
          )
        ],
      )
    );
  }

}

class _BaseKeyItem extends StatelessWidget {
  final SshKeyFile sshKeyFile;

  const _BaseKeyItem({
    super.key,
    required this.sshKeyFile
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SshKeyFile(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sshKeyFile.name,
              style: Theme.of(context).textTheme.titleSmall
                ?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            if (sshKeyFile.secured)
              Row(
                spacing: 12,
                children: [
                  const Icon(
                    LucideIcons.lock,
                    size: 16
                  ),
                  const Text("This file is protected by a password.")
                ],
              )
          ],
        )
      ],
    );
  }

}

class _SshKeyFile extends StatelessWidget {
  const _SshKeyFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        LucideIcons.fileKey,
        size: 32
      )
    );
  }
}
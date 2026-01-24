import 'package:feature_auth/feature/my_ssh_keys/domain/ssh_key_file.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/selectable.dart';

class SshKeyItem extends StatelessWidget {
  final SshKeyFile sshKeyFile;
  final bool selected;
  final Function() onClick;

  const SshKeyItem({
    super.key,
    required this.sshKeyFile,
    required this.selected,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Selectable(
      selectionEnable: true,
      selected: selected,
      onSelect: onClick,
      idleChild: Row(
        children: [
          _BaseKeyItem(sshKeyFile: sshKeyFile),
          const Spacer(),
          Icon(LucideIcons.chevronRight)
        ],
      ),
      selectedChild: Row(
        children: [
          _BaseKeyItem(sshKeyFile: sshKeyFile),
          const Spacer(),
          IconButton(
            icon: Icon(LucideIcons.pen),
            onPressed: onClick,
          ),
          IconButton(
            icon: Icon(LucideIcons.x),
            onPressed: onClick,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            LucideIcons.fileKey,
            size: 32
          )
        ),

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
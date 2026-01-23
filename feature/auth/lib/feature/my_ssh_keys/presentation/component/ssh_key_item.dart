import 'package:feature_auth/feature/my_ssh_keys/domain/ssh_key_file.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SshKeyItem extends StatelessWidget {
  final SshKeyFile sshKeyFile;
  final Function() onClick;

  const SshKeyItem({
    super.key,
    required this.sshKeyFile,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sshKeyFile.name),
        const Spacer(),
        if (sshKeyFile.secured)
          const Icon(LucideIcons.lock),
      ],
    );
  }

}
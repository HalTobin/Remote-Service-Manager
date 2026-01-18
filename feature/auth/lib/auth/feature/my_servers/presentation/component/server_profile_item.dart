import 'package:domain/model/server_profile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ServerProfileItem extends StatelessWidget {
  final ServerProfile profile;
  final Function() onClick;

  const ServerProfileItem({
    super.key,
    required this.profile,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              profile.name ?? "#${profile.id}",
              style: Theme.of(context).textTheme.titleSmall
                ?.copyWith(
                  fontWeight: FontWeight.bold
                ),
            ),
            Text(profile.getIdentifier()),
            const Divider()
          ],
        ),

        Icon(LucideIcons.chevronRight)
      ]
    );
  }
  
}
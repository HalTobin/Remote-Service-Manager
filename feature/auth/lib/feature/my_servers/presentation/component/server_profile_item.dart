import 'package:domain/model/server_profile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/selectable.dart';

class ServerProfileItem extends StatelessWidget {
  final ServerProfile profile;
  final bool selected;
  final Function() onClick;
  final Function() onEdit;

  const ServerProfileItem({
    super.key,
    required this.profile,
    required this.selected,
    required this.onClick,
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return Selectable(
      selectionEnable: true,
      selected: selected,
      onSelect: onClick,
      idleChild: Row(
        children: [
          _BaseServerProfileItem(profile: profile),
          const Spacer(),
          Icon(LucideIcons.chevronRight)
        ]
      ),
      selectedChild: Row(
        children: [
          _BaseServerProfileItem(profile: profile),
          const Spacer(),
          IconButton(
            icon: Icon(LucideIcons.pen),
            onPressed: onEdit
          ),
          IconButton(
            icon: Icon(LucideIcons.x),
            onPressed: onClick,
          )
        ],
      ),
    );
  }
  
}

class _BaseServerProfileItem extends StatelessWidget {
  final ServerProfile profile;

  const _BaseServerProfileItem({
    super.key,
    required this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Text(
              profile.name ?? "#${profile.id}",
              style: Theme.of(context).textTheme.titleSmall
                ?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(profile.getIdentifier())
          ],
        )
      ]
    );
  }

}
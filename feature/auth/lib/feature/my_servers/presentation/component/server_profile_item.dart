import 'package:domain/model/server_profile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/selectable.dart';

class ServerProfileItem extends StatelessWidget {
  final ServerProfile profile;
  final bool selected;
  final Function() onClick;

  final bool editionMode;
  final Function() onEditionMode;
  final Function() onEdit;

  const ServerProfileItem({
    super.key,
    required this.profile,
    required this.selected,
    required this.onClick,

    required this.editionMode,
    required this.onEditionMode,
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return Selectable(
      selectionEnable: true,
      selected: selected,
      onSelect: onClick,
      child: AnimatedCrossFade(
        crossFadeState: !editionMode ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Row(
          children: [
            _BaseServerProfileItem(profile: profile),
            const Spacer(),
            IconButton(
              onPressed: onEditionMode,
              icon: Icon(LucideIcons.ellipsisVertical)
            )
          ]
        ),
        secondChild: Row(
          children: [
            _BaseServerProfileItem(profile: profile),
            const Spacer(),
            IconButton(
              icon: const Icon(LucideIcons.pen),
              onPressed: onEdit
            ),
            IconButton(
              icon: const Icon(LucideIcons.x),
              onPressed: onClick,
            ),
            IconButton(
              icon: const Icon(LucideIcons.undo),
              onPressed: onEditionMode,
            )
          ],
        ),
        duration: Duration(milliseconds: 300),
        layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  key: bottomChildKey,
                  top: 0,
                  child: bottomChild
              ),
              Positioned(
                  key: topChildKey,
                  child: topChild
              )
            ],
          );
        }
      )
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
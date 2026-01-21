import 'package:domain/model/server_profile.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.blue : Colors.transparent,
            width: 3
          ),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
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
              ),

              AnimatedCrossFade(
                firstChild: Icon(LucideIcons.chevronRight),
                secondChild: Row(
                  children: [
                    IconButton(
                      icon: Icon(LucideIcons.pen),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(LucideIcons.x),
                      onPressed: onClick,
                    )
                  ]
                ),
                crossFadeState: !selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 300),
                layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        key: bottomChildKey,
                        top: 0,
                        child: bottomChild,
                      ),
                      Positioned(
                        key: topChildKey,
                        child: topChild,
                      ),
                    ],
                  );
                }
              )
            ]
          )
        )
      )
    );
  }
  
}
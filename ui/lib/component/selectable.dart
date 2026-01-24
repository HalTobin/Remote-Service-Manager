import 'package:flutter/material.dart';

class Selectable extends StatelessWidget {
  final bool selectionEnable;
  final bool selected;
  final Function() onSelect;
  final Widget idleChild;
  final Widget selectedChild;

  const Selectable({
    super.key,
    required this.selectionEnable,
    required this.selected,
    required this.onSelect,
    required this.idleChild,
    required this.selectedChild
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedCrossFade(
        firstChild: _SelectableDecoration(
          enable: false,
          child: idleChild
        ),
        secondChild: _SelectableDecoration(
          enable: true,
          child: selectedChild
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

class _SelectableDecoration extends StatelessWidget {
  final bool enable;
  final Widget child;

  const _SelectableDecoration({
    super.key,
    required this.enable,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: enable ? Colors.blue : Colors.transparent,
          width: 3
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: child
      )
    );
  }

}
import 'package:flutter/material.dart';

class StatusBarConnectButton extends StatelessWidget {
  final bool connected;
  final Function() onPressed;

  const StatusBarConnectButton({
    super.key,
    required this.connected,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: connected
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return Stack(
              clipBehavior: Clip.none,
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
          },
          firstChild: ConnectionButton(
            connected: true,
            onPressed: onPressed
          ),
          secondChild: ConnectionButton(
            connected: false,
            onPressed: onPressed
          ),
        )
      ),
    );
  }
}

class ConnectionButton extends StatelessWidget {
  final bool connected;
  final Function() onPressed;

  ConnectionButton({
    super.key,
    required this.connected,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            connected ? 'DISCONNECT' : 'CONNECT',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 8), // Spacing between text and icon
          Icon(
            connected ? Icons.logout : Icons.login,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
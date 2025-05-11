import 'package:flutter/material.dart';
import 'package:ls_server_app/presentation/component/status_bar/status_bar_background.dart';
import 'package:ls_server_app/presentation/component/status_bar/status_bar_connect_button.dart';
import 'package:ls_server_app/presentation/component/status_bar/status_bar_leading_icon.dart';
import 'package:ls_server_app/presentation/main_state.dart';

class ConnectionStatusBar extends StatelessWidget implements PreferredSizeWidget {
  final MainState state;
  final Function logIn;
  final Function logOut;

  const ConnectionStatusBar({
    super.key,
    required this.state,
    required this.logIn,
    required this.logOut
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color animation
        StatusBarBackground(connected: state.isConnected),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: StatusBarLeadingIcon(connected: state.isConnected),
          title: Text(
            state.profile.isBlank()
              ? "No current connection"
              : state.profile.getIdentifier(),
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            StatusBarConnectButton(
              connected: state.isConnected,
              onPressed: () {
                if (state.isConnected) { logOut(); } else { logIn(); }
              }
            )
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
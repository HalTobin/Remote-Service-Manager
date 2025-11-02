import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ls_server_app/feature/auth/di/auth_provider.dart';
import 'package:ls_server_app/feature/services_manager/di/service_manager_provider.dart';
import 'package:ls_server_app/presentation/component/app_dialog_layout.dart';
import 'package:ls_server_app/presentation/component/offline_view.dart';
import 'package:ls_server_app/presentation/component/password_required_dialog.dart';
import 'package:ls_server_app/presentation/component/status_bar/connection_status_bar.dart';
import 'package:ls_server_app/presentation/main_event.dart';
import 'package:ls_server_app/presentation/main_state.dart';

class MainScreen extends StatefulWidget {
  final MainState state;
  final Function(MainEvent) onEvent;

  const MainScreen({
    super.key,
    required this.state,
    required this.onEvent,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppLifecycleListener _listener;
  bool _dialogShown = false;
  late AppLifecycleState? _state;

  @override
  void initState() {
    super.initState();

    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      onExitRequested: () => _handleExit(),
    );

    if (!widget.state.isConnected && !_dialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        _showAuthDialog(context);

        final String? password = await _showPasswordDialog(context);
        if (password != null) {
          widget.onEvent(SetOnPasswordRequest(
            onPasswordRequest: () async => password,
          ));
        }
      });
    }
  }

  Future<AppExitResponse> _handleExit() async {
    if (kDebugMode) {
      print('Closing SSH connection');
    }
    widget.onEvent(SshLogOut());
    await Future.delayed(const Duration(seconds: 1));
    if (kDebugMode) {
      print('App is closed');
    }
    return AppExitResponse.exit;
    // you can call AppExitResponse.cancel to cancel the app exit
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.isConnected && _dialogShown) {
      _dialogShown = false;
      Navigator.of(context, rootNavigator: true).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConnectionStatusBar(
        state: widget.state,
        logIn: () => _showAuthDialog(context),
        logOut: () => widget.onEvent(SshLogOut())
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: AnimatedCrossFade(
              firstChild: const OfflineView(),
              secondChild: ServiceManagerProvider(),
              crossFadeState: widget.state.isConnected
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300)
            )
          )
        ]
      ),
    );
  }

  Future<void> _showAuthDialog(BuildContext context) async {
    if (kDebugMode) {
      print("_showAuthDialog()");
    }
    if (!_dialogShown) {
      _dialogShown = true;
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => AppDialogLayout(
          padding: EdgeInsets.all(24),
          child: AuthProvider(),
        ),
      );
    }
  }

  Future<String?> _showPasswordDialog(BuildContext context) async {
    if (kDebugMode) {
      print("_showAuthDialog()");
    }
    final password = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AppDialogLayout(
        padding: EdgeInsets.all(12),
        child: PasswordRequiredDialog(
          onPasswordEntered: (password) => Navigator.of(context).pop(password),
          onDismiss: () => Navigator.of(context).pop(),
        ),
      )
    );
    return password;
  }
}
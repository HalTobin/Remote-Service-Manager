import 'package:feature_auth/presentation/tabs/direct_auth_tab.dart';
import 'package:feature_auth/presentation/tabs/my_servers_tab.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ui/component/modal/auto_modal.dart';

import '../feature/add_edit_server/di/add_edit_server_provider.dart';
import 'component/auth_screen_tab.dart';

class AuthScreen extends StatelessWidget {

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar.secondary(
              tabs: const [
                AuthScreenTab(
                  title: "My Servers",
                  icon: LucideIcons.server
                ),
                AuthScreenTab(
                  title: "Direct Connection",
                  icon: LucideIcons.monitorUp
                )
              ],
            ),
            body: TabBarView(
              children: [
                MyServersTab(
                  onAddEditServer: (serverProfileId) =>
                    _showAddEditModal(
                      context: context,
                      constraints: constraints,
                      serverProfileId: serverProfileId
                    )
                ),
                DirectAuthTab()
              ]
            )
          )
        );
      }
    );
  }

  Future<void> _showAddEditModal({
    required BuildContext context,
    required BoxConstraints constraints,
    int? serverProfileId
  }) async {
    autoModal(
      context: context,
      constraints: constraints,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: AddEditServerProvider(
          serverProfileId: serverProfileId,
          onDismiss: () => Navigator.pop(context),
        )
      )
    );
  }

}
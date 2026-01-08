import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/component/auth_screen_tab.dart';
import 'package:ls_server_app/feature/auth/presentation/tabs/direct_auth_tab.dart';
import 'package:ls_server_app/feature/auth/presentation/tabs/my_servers_tab.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AuthScreen extends StatelessWidget {

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            MyServersTab(),
            DirectAuthTab()
          ]
        )
      )
    );
  }

}
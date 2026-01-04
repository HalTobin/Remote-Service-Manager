import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/component/auth_screen_tab.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../feature/direct_auth/presentation/direct_auth_screen.dart';
import '../feature/direct_auth/presentation/direct_auth_viewmodel.dart';

class AuthScreen extends StatelessWidget {

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar.secondary(
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
          Expanded(
            child: TabBarView(
              children: [
                const Icon(LucideIcons.server),
                Consumer<DirectAuthViewModel>(
                  builder: (context, viewmodel, child) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child:DirectAuthScreen(
                          state: viewmodel.state,
                          onEvent: viewmodel.onEvent
                        )
                      )
                    );
                  },
                )
              ]
            )
          )
        ],
      )
    );
  }

}
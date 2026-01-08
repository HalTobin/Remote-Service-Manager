import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/presentation/my_servers_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../feature/my_servers/presentation/my_servers_screen.dart';
import 'auth_tab_layout.dart';

class MyServersTab extends StatelessWidget {
  const MyServersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyServersViewModel>(
      builder: (context, viewmodel, child) {
        return AuthTabLayout(
          child: MyServersScreen(
            state: viewmodel.state,
            onEvent: viewmodel.onEvent
          )
        );
      }
    );
  }
}
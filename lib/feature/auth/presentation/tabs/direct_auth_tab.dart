import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/feature/direct_auth/presentation/direct_auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../feature/direct_auth/presentation/direct_auth_screen.dart';
import 'auth_tab_layout.dart';

class DirectAuthTab extends StatelessWidget {
  const DirectAuthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectAuthViewModel>(
      builder: (context, viewmodel, child) {
        return AuthTabLayout(
          child: DirectAuthScreen(
            state: viewmodel.state,
            onEvent: viewmodel.onEvent
          )
        );
      }
    );
  }
}
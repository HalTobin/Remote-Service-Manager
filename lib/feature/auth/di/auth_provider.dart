import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_viewmodel.dart';
import 'package:ls_server_app/feature/auth/use_case/auth_use_cases.dart';
import 'package:ls_server_app/feature/auth/use_case/fake_connect_usecase.dart';
import 'package:ls_server_app/feature/auth/use_case/load_auth_preferences_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';
import 'package:provider/provider.dart';

import '../presentation/auth_screen.dart';

class AuthProvider extends StatelessWidget {
  final Future<String?> Function() onPasswordRequest;

  const AuthProvider({
    super.key,
    required this.onPasswordRequest
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => (LoadProfilesUseCase(serverProfileRepository: context.read()))),
        Provider(
          create: (_) => (
            LoadAuthPreferencesUseCase(
              preferenceRepository: context.read(),
              serverProfileRepository: context.read()
            )
          )
        ),
        Provider(create: (_) => (LoadSshFileUseCase())),
        Provider(
          create: (_) => (
            SshConnectUseCase(
              sshService: context.read(),
              serverProfileRepository: context.read()
            )
          )
        ),
        Provider(create: (_) => (FakeConnectUseCase(sshService: context.read()))),
        Provider(
          create: (context) => (
            AuthUseCases(
              loadProfilesUseCase: context.read(),
              loadAuthPreferencesUseCase: context.read(),
              loadSshFileUseCase: context.read(),
              sshConnectUseCase: context.read(),
              fakeConnectUseCase: context.read()
            )
          )
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(
            authUseCases: context.read()
          ),
        )
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, viewmodel, child) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child:AuthScreen(
                state: viewmodel.state,
                onEvent: viewmodel.onEvent,
                uiEvent: viewmodel.uiEvent,
                onPasswordRequest: onPasswordRequest,
              )
            )
          );
        },
      )
    );
  }
}
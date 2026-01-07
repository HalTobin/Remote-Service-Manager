import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/feature/direct_auth/presentation/direct_auth_viewmodel.dart';
import 'package:ls_server_app/feature/auth/feature/direct_auth/use_case/direct_auth_use_cases.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/my_servers_use_cases.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_screen.dart';
import 'package:ls_server_app/feature/auth/use_case/auth_use_cases.dart';
import 'package:ls_server_app/feature/auth/use_case/check_quick_connect_availability_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/check_wrong_fields_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/fake_connect_usecase.dart';
import 'package:ls_server_app/feature/auth/use_case/load_auth_preferences_use_case.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';
import 'package:provider/provider.dart';

import '../feature/my_servers/presentation/my_servers_viewmodel.dart';

class AuthProvider extends StatelessWidget {

  const AuthProvider({super.key});

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
        Provider(create: (_) => (CheckQuickConnectAvailabilityUseCase())),
        Provider(
          create: (_) => (
            SshConnectUseCase(
              sshService: context.read()
            )
          )
        ),
        Provider(create: (_) => (FakeConnectUseCase(sshService: context.read()))),
        Provider(create: (_) => (CheckWrongFieldsUseCase())),
        Provider(
          create: (context) => (
            DirectAuthUseCases(
              loadSshFileUseCase: context.read(),
              checkWrongFieldsUseCase: context.read(),
              sshConnectUseCase: context.read(),
            )
          )
        ),
        Provider(
          create: (context) => (
            AuthUseCases(
              loadProfilesUseCase: context.read(),
              loadAuthPreferencesUseCase: context.read(),
              checkQuickConnectAvailabilityUseCase: context.read(),
              loadSshFileUseCase: context.read(),
              checkWrongFieldsUseCase: context.read(),
              sshConnectUseCase: context.read(),
              fakeConnectUseCase: context.read()
            )
          )
        ),
        Provider(
          create: (context) => (
            MyServersUseCases(
              loadProfilesUseCase: context.read(),
              loadSshFileUseCase: context.read(),
              sshConnectUseCase: context.read()
            )
          )
        ),
        ChangeNotifierProvider(
          create: (context) => DirectAuthViewModel(
            directAuthUseCases: context.read()
          )
        ),
        ChangeNotifierProvider(
          create: (context) => MyServersViewModel(
            myServersUseCases: context.read()
          )
        )
      ],

      child: AuthScreen()

      /*child: Consumer<AuthViewModel>(
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
      )*/
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/check_password_requirement_by_server_profile_id_usecase.dart';
import 'package:ls_server_app/feature/auth/presentation/auth_screen.dart';
import 'package:ls_server_app/feature/auth/use_case/add_edit_server_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/auth_use_cases.dart';
import 'package:ls_server_app/feature/auth/use_case/check_quick_connect_availability_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/check_wrong_fields_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/fake_connect_usecase.dart';
import 'package:ls_server_app/feature/auth/use_case/load_auth_preferences_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';
import 'package:provider/provider.dart';

class AuthProvider extends StatelessWidget {

  const AuthProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
          create: (context) => (
            AddEditServerUseCase(
              serverProfileRepository: context.read()
            )
          )
        ),
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
        Provider(create: (context) => (
          CheckPasswordRequirementByServerProfileIdUseCase(
            serverProfileRepository: context.read(),
            loadSshFileUseCase: context.read()
          )
        )),
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
      ],
      child: AuthScreen()
    );
  }
}
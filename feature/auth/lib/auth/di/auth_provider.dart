import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/my_servers/use_case/check_password_requirement_by_server_profile_id_usecase.dart';
import '../presentation/auth_screen.dart';
import '../use_case/add_edit_server_use_case.dart';
import '../use_case/auth_use_cases.dart';
import '../use_case/check_wrong_fields_use_case.dart';
import '../use_case/fake_connect_usecase.dart';
import '../use_case/load_ssh_file_use_case.dart';
import '../use_case/ssh_connect_use_case.dart';

class AuthProvider extends StatelessWidget {

  const AuthProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => (LoadSshFileUseCase())),
        Provider(
          create: (context) => (
            AddEditServerUseCase(
              serverProfileRepository: context.read()
            )
          )
        ),
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
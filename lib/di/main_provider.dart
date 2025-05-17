import 'package:flutter/cupertino.dart';
import 'package:ls_server_app/presentation/main_screen.dart';
import 'package:ls_server_app/presentation/main_viewmodel.dart';
import 'package:ls_server_app/use_case/get_current_ssh_profile_use_case.dart';
import 'package:ls_server_app/use_case/listen_ssh_connect_usecase.dart';
import 'package:ls_server_app/use_case/main_usecases.dart';
import 'package:ls_server_app/use_case/set_on_password_request_use_case.dart';
import 'package:ls_server_app/use_case/ssh_log_out_usecase.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => (ListenSshConnectUseCase(sshService: context.read()))),
        Provider(create: (context) => (SshLogOutUseCase(sshService: context.read()))),
        Provider(create: (context) => (GetCurrentSshProfileUseCase(sshService: context.read()))),
        Provider(create: (context) => (SetOnPasswordRequestUseCase(sshService: context.read()))),
        Provider(create: (context) => (
          MainUseCases(
            listenSshConnectUseCase: context.read(),
            sshLogOutUseCase: context.read(),
            getCurrentSshProfileUseCase: context.read(),
            setOnPasswordRequestUseCase: context.read()
          )
        )),

        ChangeNotifierProvider(create: (context) => (MainViewModel(mainUseCases: context.read())))
      ],
      child: Consumer<MainViewModel>(
        builder: (context, viewmodel, child) {
          return MainScreen(
            state: viewmodel.state,
            onEvent: viewmodel.onEvent,
          );
        }
      )
    );
  }
}
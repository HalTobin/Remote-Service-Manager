import 'package:flutter/cupertino.dart';
import 'package:ls_server_app/feature/services_manager/presentation/service_manager_screen.dart';
import 'package:ls_server_app/feature/services_manager/use_case/service_manager_usecases.dart';
import 'package:ls_server_app/feature/services_manager/use_case/service_watcher_usecase.dart';
import 'package:provider/provider.dart';

import '../presentation/service_manager_viewmodel.dart';
import '../use_case/run_systemctl_command_usecase.dart';

class ServiceManagerProvider extends StatelessWidget {
  const ServiceManagerProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => (RunSystemctlCommandUseCase(sshService: context.read()))),
        Provider(create: (context) => (
          ServiceWatcherUseCase(
            sshService: context.read(),
            serverProfileRepository: context.read(),
            favoriteServiceRepository: context.read()
          )
        )),
        Provider(create: (context) => (
          ServiceManagerUseCases(
            listenSshConnectUseCase: context.read(),
            runSystemctlCommandUseCase: context.read(),
            serviceWatcherUseCase: context.read()
          )
        )),
        ChangeNotifierProvider(create: (context) => (
          ServiceManagerViewmodel(serviceManagerUseCases: context.read())
        ))
      ],
      child: Consumer<ServiceManagerViewmodel>(
        builder: (builder, viewmodel, child) {
          return ServiceManagerScreen(
            state: viewmodel.state,
            onEvent: viewmodel.onEvent,
          );
        }
      ),
    );
  }
}
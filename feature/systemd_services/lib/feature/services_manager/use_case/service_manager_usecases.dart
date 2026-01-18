import 'package:feature_systemd_services/feature/services_manager/use_case/run_systemctl_command_usecase.dart';
import 'package:feature_systemd_services/feature/services_manager/use_case/service_watcher_usecase.dart';
import 'package:ls_server_app/use_case/listen_ssh_connect_usecase.dart';

class ServiceManagerUseCases {
    final ListenSshConnectUseCase listenSshConnectUseCase;
    final RunSystemctlCommandUseCase runSystemctlCommandUseCase;
    final ServiceWatcherUseCase serviceWatcherUseCase;

    ServiceManagerUseCases({
        required this.listenSshConnectUseCase,
        required this.runSystemctlCommandUseCase,
        required this.serviceWatcherUseCase
    });
}
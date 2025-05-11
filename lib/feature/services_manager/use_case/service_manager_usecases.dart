import 'package:ls_server_app/feature/services_manager/use_case/service_watcher_usecase.dart';
import 'package:ls_server_app/feature/services_manager/use_case/start_service_usecase.dart';
import 'package:ls_server_app/feature/services_manager/use_case/stop_service_usecase.dart';
import 'package:ls_server_app/use_case/listen_ssh_connect_usecase.dart';

class ServiceManagerUseCases {
    final ListenSshConnectUseCase listenSshConnectUseCase;
    final StartServiceUseCase startServiceUseCase;
    final StopServiceUseCase stopServiceUseCase;
    final ServiceWatcherUseCase serviceWatcherUseCase;

    ServiceManagerUseCases({
        required this.listenSshConnectUseCase,
        required this.startServiceUseCase,
        required this.stopServiceUseCase,
        required this.serviceWatcherUseCase
    });
}
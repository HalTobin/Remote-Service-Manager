import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/model/response_result.dart';
import 'package:ls_server_app/data/ssh/model/systemctl_command.dart';
import 'package:ls_server_app/feature/services_manager/data/service_presentation.dart';
import 'package:ls_server_app/feature/services_manager/presentation/service_manager_event.dart';
import 'package:ls_server_app/feature/services_manager/presentation/service_manager_state.dart';

import '../use_case/service_manager_usecases.dart';

class ServiceManagerViewmodel extends ChangeNotifier {

    ServiceManagerViewmodel({required ServiceManagerUseCases serviceManagerUseCases})
      : _useCases = serviceManagerUseCases
    {
        _init();
    }

    final ServiceManagerUseCases _useCases;
    ServiceManagerState _state = ServiceManagerState();
    ServiceManagerState get state => _state;

    ValueListenable<List<ServicePresentation>>? _serviceStatusNotifier;
    VoidCallback? _serviceStatusListener;

    Future<void> _init() async {
        _updateLoadingStatus(true);
        _observeSshConnectionStatus();
    }

    Future<void> onEvent(ServiceManagerEvent event) async {
        switch (event) {
            case RunCtlCommand(): {
                final ResponseResult<bool> response = await _useCases.runSystemctlCommandUseCase
                    .execute(
                        command: event.command,
                        service: event.service
                    );
                switch (response) {
                    case ResponseFailed():
                        _setError(response.error);
                    case ResponseSucceed():
                        _setError("");
                }
            }
            case CloseError():
                _setError("");
        }
    }

    void _setError(String error) {
        _state = _state.copyWith(error: error);
        notifyListeners();
    }

    void _observeSshConnectionStatus() {
        _useCases.listenSshConnectUseCase.execute().addListener(() {
            bool isConnect = _useCases.listenSshConnectUseCase.execute().value;
            if (kDebugMode) {
                print("SSH Connection status: $isConnect");
            }
            if (isConnect && _serviceStatusNotifier == null && _serviceStatusListener == null) {
                _observeServicesStatus();
            }
            else {
                _stopObservingServiceStatuses();
                _state = _state.copyWith(services: []);
            }
            _state = _state.copyWith(isConnected: isConnect);
            notifyListeners();
        });
    }

    Future<void> _observeServicesStatus() async {
        _serviceStatusNotifier?.removeListener(_serviceStatusListener!);
        _serviceStatusNotifier = await _useCases.serviceWatcherUseCase.execute();
        _serviceStatusListener = () {
            final services = _serviceStatusNotifier!.value;
            _state = _state.copyWith(services: services, loading: false);
            notifyListeners();
        };
        _serviceStatusNotifier!.addListener(_serviceStatusListener!);
    }

    void _stopObservingServiceStatuses() {
        if (kDebugMode) { print("stop listening services status"); }
        if (_serviceStatusNotifier != null && _serviceStatusListener != null) {
            _serviceStatusNotifier!.removeListener(_serviceStatusListener!);
            _serviceStatusNotifier = null;
            _serviceStatusListener = null;
        }
    }

    void _updateLoadingStatus(bool status) {
        _state = _state.copyWith(loading: status);
        notifyListeners();
    }

}
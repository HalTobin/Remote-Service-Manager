import 'package:domain/model/ssh/ssh_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:ls_server_app/presentation/main_event.dart';
import 'package:ls_server_app/presentation/main_state.dart';
import 'package:ls_server_app/use_case/main_usecases.dart';

class MainViewModel extends ChangeNotifier {
    MainViewModel({required MainUseCases mainUseCases})
      : _useCases = mainUseCases
    {
      _observeSshConnectionStatus();
    }

    final MainUseCases _useCases;
    MainState _state = MainState();
    MainState get state => _state;

    void onEvent(MainEvent event) {
        switch (event) {
            case SshLogOut():
                _useCases.sshLogOutUseCase.execute();
            case SetOnPasswordRequest():
                _useCases.setOnPasswordRequestUseCase.execute(event.onPasswordRequest);
        }
    }

    void _observeSshConnectionStatus() {
        _useCases.listenSshConnectUseCase.execute().addListener(() {
            bool isConnect = _useCases.listenSshConnectUseCase.execute().value;
            if (kDebugMode) { print("SSH Connection status: $isConnect"); }
            SshProfile currentProfile = _useCases.getCurrentSshProfileUseCase.execute();
            _state = _state.copyWith(isConnected: isConnect, profile: currentProfile);
            notifyListeners();
        });
    }

}
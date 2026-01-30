import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../use_case/my_servers_use_cases.dart';
import 'my_servers_event.dart';
import 'my_servers_state.dart';

class MyServersViewModel extends ChangeNotifier {

    MyServersViewModel({required MyServersUseCases myServersUseCases})
        : _useCases = myServersUseCases
        {
            _init();
        }

    final MyServersUseCases _useCases;
    MyServersState _state = MyServersState();
    MyServersState get state => _state;

    Future<void> _init() async {
        _loadServers();
    }

    Future<void> _selectServer(int serverProfileId) async {
        if (_state.selectedServerId == serverProfileId) {
           _state = _state.copyWith(selectedServerId: null, editionServerId: null);
        }
        else {
            final bool passwordRequired = await _useCases.checkPasswordRequirementByServerProfileIdUseCase.execute(serverProfileId);
            _state = _state.copyWith(
                sshPasswordRequired: passwordRequired,
                selectedServerId: serverProfileId
            );
        }
        notifyListeners();
    }

    Future<void> _editionMode(int? serverProfileId) async {
        if (serverProfileId == _state.editionServerId) {
            _state = _state.copyWith(editionServerId: null);
        } else {
          _state = _state.copyWith(editionServerId: serverProfileId, selectedServerId: null);
        }
        notifyListeners();
    }

    Future<void> _loadServers() async {
        _state = _state.copyWith(loading: true);
        _useCases.watchServerProfilesUseCase.execute().forEach((servers) {
            _state = _state.copyWith(servers: servers);
            if (kDebugMode) {
                print("[MyServersViewModel] Profile found: ${_state.servers.length}");
            }
            notifyListeners();
            _state = _state.copyWith(loading: false);
            notifyListeners();
        });
    }

    Future<void> onEvent(MyServersEvent event) async {
        switch (event) {
            case SelectServer():
              _selectServer(event.serverProfileId);
            case EditionMode():
              _editionMode(event.serverProfileId);
            case Connect():
                // TODO: Handle this case.
                throw UnimplementedError();
        }
    }

}
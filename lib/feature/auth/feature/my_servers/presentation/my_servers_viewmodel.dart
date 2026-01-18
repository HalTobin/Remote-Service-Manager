import 'package:flutter/cupertino.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/my_servers_use_cases.dart';

import '../../../../../domain/model/server_profile.dart';
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
           _state = _state.copyWith(selectedServerId: null);
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

    Future<void> _loadServers() async {
        final List<ServerProfile> profiles = await _useCases.loadProfilesUseCase.execute();
        _state = _state.copyWith(servers: profiles);
        notifyListeners();
    }

    Future<void> onEvent(MyServersEvent event) async {
        switch (event) {
            case SelectServer():
              _selectServer(event.serverProfileId);
            case Connect():
                // TODO: Handle this case.
                throw UnimplementedError();
        }
    }

}
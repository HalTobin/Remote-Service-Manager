import 'package:domain/use_case/add_edit_server_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../use_case/add_edit_server_usecases.dart';
import 'add_edit_server_event.dart';
import 'add_edit_server_state.dart';

class AddEditServerViewModel extends ChangeNotifier {

    AddEditServerViewModel({
        required AddEditServerUseCases addEditServerUseCases,
        required Function(AddEditServerUiEvent) uiEvent
    })
        : _useCases = addEditServerUseCases,
          _uiEvent = uiEvent;

    final AddEditServerUseCases _useCases;

    AddEditServerState _state = AddEditServerState();
    AddEditServerState get state => _state;

    final Function(AddEditServerUiEvent) _uiEvent;

    Future<void> onEvent(AddEditServerEvent event) async {
        switch (event) {
            case SaveEditServer():
                _addEditServer(
                    serverProfileId: event.serverProfileId,
                    name: event.name,
                    user: event.user,
                    url: event.url,
                    port: event.port,
                    sshFilePath: event.sshFilePath
                );
            case LoadSshFile():
                _loadSshFile(event.sshFilePath);
        }
    }

    void _addEditServer({
        required int? serverProfileId,
        required String name,
        required String user,
        required String url,
        required String port,
        required String sshFilePath,
    }) {
        final AddEditServer server = AddEditServer(
            id: serverProfileId,
            name: name.isEmpty ? null : name,
            url: url,
            port: port,
            user: user,
            sshFilePath: sshFilePath,
            securedSshKeyPassword: _state.serverProfile?.securedSshKeyPassword,
            securedSessionPassword: _state.serverProfile?.securedSessionPassword
        );
        _useCases.addEditServerUseCase.execute(server);
        _uiEvent(ExitDialog());
    }

    void _loadSshFile(String filePath) {
        try {
            final bool isPasswordRequired = _useCases.loadSshFileUseCase.execute(filePath);
            _state = _state.copyWith(
                passwordRequired: isPasswordRequired,
                sshFilePath: filePath
            );
            notifyListeners();
        } catch (e) {
            if (kDebugMode) { print("Couldn't load ssh file: $e"); }
        }
    }

}

sealed class AddEditServerUiEvent {}

class ExitDialog extends AddEditServerUiEvent {}
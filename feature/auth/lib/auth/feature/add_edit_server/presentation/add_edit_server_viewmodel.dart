import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../use_case/add_edit_server_usecases.dart';
import 'add_edit_server_event.dart';
import 'add_edit_server_state.dart';

class AddEditServerViewModel extends ChangeNotifier {

    AddEditServerViewModel({required AddEditServerUseCases addEditServerUseCases})
        : _useCases = addEditServerUseCases;

    final AddEditServerUseCases _useCases;

    AddEditServerState _state = AddEditServerState();
    AddEditServerState get state => _state;

    Future<void> onEvent(AddEditServerEvent event) async {

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
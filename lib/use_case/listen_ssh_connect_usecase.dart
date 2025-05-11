import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/ssh/ssh_service.dart';

class ListenSshConnectUseCase {
    ListenSshConnectUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    ValueListenable<bool> execute() {
        return _sshService;
    }
}
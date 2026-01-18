import 'package:domain/service/ssh_service.dart';
import 'package:flutter/foundation.dart';

class ListenSshConnectUseCase {
    ListenSshConnectUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    ValueListenable<bool> execute() {
        return _sshService;
    }
}
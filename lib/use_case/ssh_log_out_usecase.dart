import 'package:ls_server_app/data/ssh/ssh_service.dart';

class SshLogOutUseCase {
    SshLogOutUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    Future<void> execute() async {
        _sshService.logout();
    }
}
import 'package:ls_server_app/data/ssh/ssh_service.dart';

class StartServiceUseCase {
    StartServiceUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    Future<void> execute(String service) async {
        return _sshService.startService(service);
    }
}
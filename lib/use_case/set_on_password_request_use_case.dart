import 'package:ls_server_app/data/ssh/ssh_service.dart';

class SetOnPasswordRequestUseCase {
    final SshService sshService;

    const SetOnPasswordRequestUseCase({required this.sshService});

    void execute(Future<String> Function() callback) {
        sshService.onPasswordRequest = callback;
    }
}
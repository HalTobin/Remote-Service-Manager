import 'package:domain/service/ssh_service.dart';


class FakeConnectUseCase {
    FakeConnectUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    void execute() {
        _sshService.fakeConnect();
    }
}
import 'package:ls_server_app/data/model/response_result.dart';
import 'package:ls_server_app/data/ssh/model/systemctl_command.dart';
import 'package:ls_server_app/data/ssh/ssh_service.dart';

class RunSystemctlCommandUseCase {
    RunSystemctlCommandUseCase({required SshService sshService})
      : _sshService = sshService;

    final SshService _sshService;

    Future<ResponseResult<bool>> execute({
        required SystemctlCommand command,
        required String service
    }) async {
        return _sshService.systemCtlCommand(command: command, service: service);
    }
}
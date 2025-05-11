import 'package:ls_server_app/data/ssh/model/ssh_profile.dart';

import '../data/ssh/ssh_service.dart';

class GetCurrentSshProfileUseCase {
  GetCurrentSshProfileUseCase({required SshService sshService})
      : _sshService = sshService;

  final SshService _sshService;

  SshProfile execute() {
    return _sshService.getCurrentProfile() ?? SshProfile.blank;
  }
}
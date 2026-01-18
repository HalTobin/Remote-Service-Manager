import 'package:domain/model/ssh/ssh_profile.dart';
import 'package:domain/service/ssh_service.dart';

class GetCurrentSshProfileUseCase {
  GetCurrentSshProfileUseCase({required SshService sshService})
      : _sshService = sshService;

  final SshService _sshService;

  SshProfile execute() {
    return _sshService.getCurrentProfile() ?? SshProfile.blank;
  }
}
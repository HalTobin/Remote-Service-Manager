import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';

import '../../../../../data/model/server_profile.dart';
import '../../../../../data/repository/server_profile_repository.dart';

class CheckPasswordRequirementByServerProfileIdUseCase {
    CheckPasswordRequirementByServerProfileIdUseCase({
        required ServerProfileRepository serverProfileRepository,
        required LoadSshFileUseCase loadSshFileUseCase
    })
      : _serverProfileRepository = serverProfileRepository,
        _loadSshFileUseCase = loadSshFileUseCase;

    final ServerProfileRepository _serverProfileRepository;
    final LoadSshFileUseCase _loadSshFileUseCase;

    Future<bool> execute(int serverProfileId) async {
        final ServerProfile? profile = await _serverProfileRepository.getProfileById(serverProfileId);

        if (profile != null) {
            return _loadSshFileUseCase.execute(profile.keyPath);
        }
        return false;
    }

}
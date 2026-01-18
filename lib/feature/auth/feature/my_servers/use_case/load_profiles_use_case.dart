import 'package:ls_server_app/data/repository/server_profile_repository.dart';

import '../../../../../domain/model/server_profile.dart';

class LoadProfilesUseCase {
    LoadProfilesUseCase({required ServerProfileRepository serverProfileRepository})
      : _serverProfileRepository = serverProfileRepository;

    final ServerProfileRepository _serverProfileRepository;

    Future<List<ServerProfile>> execute() {
        return _serverProfileRepository.getAllProfiles();
    }
}
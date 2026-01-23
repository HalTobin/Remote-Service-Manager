import 'package:domain/model/server_profile.dart';
import 'package:domain/repository/server_profile_repository.dart';

class WatchServerProfilesUseCase {
    WatchServerProfilesUseCase({
        required ServerProfileRepository serverProfileRepository
    })
        : _serverProfileRepository = serverProfileRepository;

    final ServerProfileRepository _serverProfileRepository;

    Stream<List<ServerProfile>> execute() {
        return _serverProfileRepository.watchAllProfiles();
    }

}
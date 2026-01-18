import 'package:ls_server_app/data/repository/server_profile_repository.dart';

import '../../../../../domain/model/server_profile.dart';

class LoadServerProfileUseCase {
  LoadServerProfileUseCase({
    required ServerProfileRepository serverProfileRepository
  })
      : _serverProfileRepository = serverProfileRepository;

  final ServerProfileRepository _serverProfileRepository;

  Future<ServerProfile?> execute(int serverProfileId) async {
      return await _serverProfileRepository.getProfileById(serverProfileId);
  }

}
import 'package:ls_server_app/data/model/favorite_service.dart';
import 'package:ls_server_app/data/repository/favorite_service_repository.dart';
import 'package:ls_server_app/data/repository/server_profile_repository.dart';
import 'package:ls_server_app/data/ssh/model/ssh_profile.dart';
import 'package:ls_server_app/data/ssh/ssh_service.dart';

class GetServiceUseCase {
    GetServiceUseCase({
        required FavoriteServiceRepository favoriteServiceRepository,
        required ServerProfileRepository serverProfileRepository,
        required SshService sshService
    })
      : _favoriteServiceRepository = favoriteServiceRepository,
        _serverProfileRepository = serverProfileRepository,
        _sshService = sshService;

    final FavoriteServiceRepository _favoriteServiceRepository;
    final ServerProfileRepository _serverProfileRepository;
    final SshService _sshService;

    Future<FavoriteService?> execute({required String serviceName}) async {
        final SshProfile? sshProfile = _sshService.getCurrentProfile();
        if (sshProfile != null) {
            final int? profileId = await _serverProfileRepository.getProfileIdByFields(
                url: sshProfile.url,
                port: sshProfile.port,
                user: sshProfile.user
            );

            if (profileId != null) {
                return _favoriteServiceRepository.getFavoriteServiceByTitleAndProfileId(profileId: profileId, serviceName: serviceName);
            }
            else { return null; }
        }
        else { return null; }
    }
}
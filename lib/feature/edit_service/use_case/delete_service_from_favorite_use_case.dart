import 'package:ls_server_app/data/model/favorite_service.dart';
import 'package:ls_server_app/data/model/response_result.dart';
import 'package:ls_server_app/data/repository/favorite_service_repository.dart';
import 'package:ls_server_app/data/ssh/model/ssh_profile.dart';

import '../../../data/repository/server_profile_repository.dart';
import '../../../data/ssh/ssh_service.dart';

class DeleteServiceFromFavoriteUseCase {
    DeleteServiceFromFavoriteUseCase({
        required FavoriteServiceRepository favoriteServiceRepository
    })
        : _favoriteServiceRepository = favoriteServiceRepository;

    final FavoriteServiceRepository _favoriteServiceRepository;

    void execute({required int serviceId}) async {
        _favoriteServiceRepository.unmarkService(serviceId);
    }
}
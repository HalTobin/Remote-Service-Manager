import 'package:drift/drift.dart';
import 'package:ls_server_app/data/db/dao/favorite_service_dao.dart';
import 'package:ls_server_app/data/db/server_profile_database.dart';

import '../../domain/model/favorite_service.dart';

class FavoriteServiceRepository {
    FavoriteServiceRepository({required FavoriteServiceDao dao})
      : _dao = dao;

    final FavoriteServiceDao _dao;

    Future<int> saveService(NewFavoriteService service) async {
        final FavoriteServicesCompanion serviceEntity = FavoriteServicesCompanion(
            id: Value.absent(),
            profileId: Value(service.profileId),
            serviceName: Value(service.name),
            alias: Value(service.alias),
            iconId: (service.iconId != null) ? Value(service.iconId!) : Value.absent()
        );
        return await _dao.insertService(serviceEntity);
    }

    Future<bool> updateService(UpdateFavoriteService service) async {
        final FavoriteServiceEntity serviceEntity = FavoriteServiceEntity(
            id: service.id,
            profileId: service.profileId,
            serviceName: service.name,
            alias: service.alias,
            iconId: service.iconId
        );
        return await _dao.updateService(serviceEntity);
    }

    Future<int> unmarkService(int id) async {
        return await _dao.deleteService(id);
    }

    Future<List<FavoriteService>> getFavoriteServicesByProfileId(int profileId) async {
        final List<FavoriteServiceEntity> services = await _dao.getServicesForProfile(profileId);
        return services.map((service) {
            return service.toFavoriteService();
        }).toList();
    }

    Future<FavoriteService?> getFavoriteServiceById(int serviceId) async {
        final service = await _dao.getServiceById(serviceId);
        return service?.toFavoriteService();
    }

    Future<FavoriteService?> getFavoriteServiceByTitleAndProfileId({
        required int profileId,
        required String serviceName
    }) async {
        final service = await _dao.getServiceByTitleAndProfile(serviceName, profileId);
        return service?.toFavoriteService();
    }

    Future<FavoriteService?> getFavoriteServiceByName(String name) async {
        final service = await _dao.getServiceByTitle(name);
        return service?.toFavoriteService();
    }

    Stream<List<FavoriteServiceEntity>> watchServicesByProfileId(int profileId) {
        return _dao.getServicesByProfileIdAsStream(profileId);
    }
}

extension ServiceEntityMapper on FavoriteServiceEntity {
    FavoriteService toFavoriteService() {
        return FavoriteService(
            id: id,
            profileId: profileId,
            name: serviceName,
            alias: alias,
            iconId: iconId,
        );
    }
}
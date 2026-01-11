import 'package:drift/drift.dart';
import 'package:ls_server_app/data/db/dao/server_profile_dao.dart';
import 'package:ls_server_app/data/db/server_profile_database.dart';
import 'package:ls_server_app/data/model/server_profile.dart';

class ServerProfileRepository {
    ServerProfileRepository({required ServerProfileDao dao})
      : _dao = dao;

    final ServerProfileDao _dao;

    Future<int> saveProfile(NewServerProfile profile) async {
        final ServerProfilesCompanion profileEntity = ServerProfilesCompanion(
            id: Value.absent(),
            name: Value(profile.name),
            url: Value(profile.url),
            port: Value(profile.port),
            user: Value(profile.user),
            keyPath: Value(profile.keyPath),
            quickConnectEnable: Value(profile.quickConnectEnable)
        );
        return _dao.insertProfile(profileEntity);
    }

    Future<void> deleteProfile(int profileId) async {
        _dao.deleteProfile(profileId);
    }

    Future<List<ServerProfile>> getAllProfiles() async {
        final profiles = await _dao.getAllProfiles();
        return profiles
            .map((profile) => profile.toDomain())
            .toList();
    }

    Future<bool> doesProfileExist({
        required String url,
        required String port,
        required String user
    }) async {
        return _dao.doesProfileExist(url: url, port: port, user: user);
    }

    Future<int?> getProfileIdByFields({
        required String url,
        required String port,
        required String user
    }) async {
        return _dao.getProfileByFields(url: url, port: port, user: user);
    }

    Future<ServerProfile?> getProfileById(int id) async {
       final ServerProfileEntity? entity = await _dao.getProfileById(id);
       return entity?.toDomain();
    }

}

extension on ServerProfileEntity {
    ServerProfile toDomain() =>
        ServerProfile(
            id: this.id,
            name: this.name,
            url: this.url,
            port: this.port,
            user: this.user,
            keyPath: this.keyPath,
            quickConnectEnable: this.quickConnectEnable
        );
}
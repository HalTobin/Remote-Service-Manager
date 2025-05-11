import 'package:drift/drift.dart';
import 'package:ls_server_app/data/db/entity/server_profile_entity.dart';

@DataClassName('FavoriteServiceEntity')
class FavoriteServices extends Table {
    IntColumn get id => integer().autoIncrement()();
    IntColumn get profileId => integer().references(ServerProfiles, #id)();
    TextColumn get serviceName => text()();
    TextColumn get alias => text().nullable()();
    IntColumn get iconId => integer().nullable()();
}
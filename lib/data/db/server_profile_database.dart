import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'entity/favorite_service_entity.dart';
import 'entity/server_profile_entity.dart';

part "server_profile_database.g.dart";

@DriftDatabase(tables: [ServerProfiles, FavoriteServices])
class ServerProfileDatabase extends _$ServerProfileDatabase {
    ServerProfileDatabase() : super(_openConnection());

    @override
    int get schemaVersion => 1;

    static const String DB_FILE = "server_profile_db.db";
}

// SQLite file location
LazyDatabase _openConnection() {
    return LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, ServerProfileDatabase.DB_FILE));
        return NativeDatabase.createInBackground(file);
    });
}
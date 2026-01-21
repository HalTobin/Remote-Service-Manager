import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

@DataClassName('ServerProfileEntity')
class ServerProfiles extends Table {
    IntColumn get id => integer().autoIncrement()();
    TextColumn get serverName => text().nullable()();
    TextColumn get url => text()();
    TextColumn get port => text()();
    TextColumn get sessionUser => text()();
    TextColumn get keyPath => text()();
    BoolColumn get quickConnectEnable => boolean()();
}
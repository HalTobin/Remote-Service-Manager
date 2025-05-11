import 'package:drift/drift.dart';

@DataClassName('ServerProfileEntity')
class ServerProfiles extends Table {
    IntColumn get id => integer().autoIncrement()();
    TextColumn get url => text()();
    TextColumn get port => text()();
    TextColumn get user => text()();
    TextColumn get keyPath => text()();
}
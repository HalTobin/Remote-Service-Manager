import 'package:domain/repository/preference_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
    final FlutterSecureStorage storage = const FlutterSecureStorage();

    static final PreferenceRepositoryImpl _instance = PreferenceRepositoryImpl._internal();
    factory PreferenceRepositoryImpl() => _instance;

    PreferenceRepositoryImpl._internal();

    @override
    Future<void> saveDefaultServerId(int serverId) async {
        storage.write(key: _DEFAULT_SERVER_ID, value: serverId.toString());
    }

    @override
    Future<int?> getDefaultServerId() async {
        try {
            return int.parse(await storage.read(key: _DEFAULT_SERVER_ID) ?? "");
        } catch (_) {
            return null;
        }
    }

    static const String _DEFAULT_SERVER_ID = "default_server_id";

}
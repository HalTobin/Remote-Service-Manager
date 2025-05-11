import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferenceRepository {
    final FlutterSecureStorage storage = const FlutterSecureStorage();

    static final PreferenceRepository _instance = PreferenceRepository._internal();
    factory PreferenceRepository() => _instance;

    PreferenceRepository._internal();

    Future<void> saveDefaultServerId(int serverId) async {
        storage.write(key: DEFAULT_SERVER_ID, value: serverId.toString());
    }

    Future<int?> getDefaultServerId() async {
        try {
            return int.parse(await storage.read(key: DEFAULT_SERVER_ID) ?? "");
        } catch (_) {
            return null;
        }
    }

    static const String DEFAULT_SERVER_ID = "default_server_id";

}
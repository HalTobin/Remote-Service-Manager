abstract interface class PreferenceRepository {

    Future<void> saveDefaultServerId(int serverId);

    Future<int?> getDefaultServerId();

}
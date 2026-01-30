sealed class MyServersEvent {}

class SelectServer extends MyServersEvent {
    final int serverProfileId;
    SelectServer({required this.serverProfileId});
}

class EditionMode extends MyServersEvent {
    final int? serverProfileId;
    EditionMode({required this.serverProfileId});
}

class Connect extends MyServersEvent {
    final String user;
    final String serverUrl;
    final String serverPort;
    final String sshFilePath;
    final String? password;
    Connect({
        required this.user,
        required this.serverUrl,
        required this.serverPort,
        required this.sshFilePath,
        required this.password
    });
}
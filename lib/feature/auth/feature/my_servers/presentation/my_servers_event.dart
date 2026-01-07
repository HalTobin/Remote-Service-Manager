sealed class MyServersEvent {}

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
class ServerProfile {
    final int id;
    final String url;
    final String port;
    final String user;
    final String keyPath;

    const ServerProfile({
        required this.id,
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath
    });

    String getIdentifier() {
        return "$user@$url:$port";
    }

    static const ServerProfile empty = ServerProfile(
        id: -1,
        url: "",
        port: "",
        user: "",
        keyPath: ""
    );
}

class NewServerProfile {
    final String url;
    final String port;
    final String user;
    final String keyPath;

    NewServerProfile({
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath
    });
}
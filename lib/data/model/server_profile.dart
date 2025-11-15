class ServerProfile {
    final int id;
    final String url;
    final String port;
    final String user;
    final String keyPath;
    final bool quickConnectEnable;

    const ServerProfile({
        required this.id,
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath,
        required this.quickConnectEnable
    });

    String getIdentifier() {
        return "$user@$url:$port";
    }

    static const ServerProfile empty = ServerProfile(
        id: -1,
        url: "",
        port: "",
        user: "",
        keyPath: "",
        quickConnectEnable: false
    );

    @override
    bool operator ==(Object other) {
        if (identical(this, other)) return true;

        return other is ServerProfile &&
            other.id == id &&
            other.url == url &&
            other.port == port &&
            other.user == user &&
            other.keyPath == keyPath &&
            other.quickConnectEnable == quickConnectEnable;
    }

    @override
    int get hashCode {
        return Object.hash(id, url, port, user, keyPath, quickConnectEnable);
    }
}

class NewServerProfile {
    final String url;
    final String port;
    final String user;
    final String keyPath;
    final bool quickConnectEnable;

    NewServerProfile({
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath,
        required this.quickConnectEnable
    });
}
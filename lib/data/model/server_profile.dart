class ServerProfile {
    final int id;

    final String? name;

    final String url;
    final String port;
    final String user;
    final String keyPath;
    final bool quickConnectEnable;

    const ServerProfile({
        required this.id,
        required this.name,
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
        name: null,
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
            other.name == name &&
            other.url == url &&
            other.port == port &&
            other.user == user &&
            other.keyPath == keyPath &&
            other.quickConnectEnable == quickConnectEnable;
    }

    @override
    int get hashCode {
        return Object.hash(id, name, url, port, user, keyPath, quickConnectEnable);
    }
}

class NewServerProfile {
    final String? name;
    final String url;
    final String port;
    final String user;
    final String keyPath;
    final bool quickConnectEnable;

    NewServerProfile({
        required this.name,
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath,
        required this.quickConnectEnable
    });
}

class EditServerProfile {
    final int id;
    final String? name;
    final String url;
    final String port;
    final String user;
    final String keyPath;
    final bool quickConnectEnable;

    EditServerProfile({
        required this.id,
        required this.name,
        required this.url,
        required this.port,
        required this.user,
        required this.keyPath,
        required this.quickConnectEnable
    });
}
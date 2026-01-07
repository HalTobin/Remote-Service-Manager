import 'package:ls_server_app/data/model/server_profile.dart';

class MyServersState {
    final List<ServerProfile> servers;
    final bool sshPasswordRequired;

    MyServersState({
        this.servers = const [],
        this.sshPasswordRequired = false
    });

    MyServersState copyWith({
        List<ServerProfile>? servers,
        bool? sshPasswordRequired
    }) {
        return MyServersState(
            servers: servers ?? this.servers,
            sshPasswordRequired: sshPasswordRequired ?? this.sshPasswordRequired
        );
    }

}
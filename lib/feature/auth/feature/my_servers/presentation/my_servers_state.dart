import 'package:ls_server_app/data/model/server_profile.dart';
import 'package:ls_server_app/util/omit.dart';

class MyServersState {
    final List<ServerProfile> servers;
    final bool sshPasswordRequired;
    final int? selectedServerId;

    MyServersState({
        this.servers = const [],
        this.sshPasswordRequired = false,
        this.selectedServerId = null
    });

    MyServersState copyWith({
        Defaulted<List<ServerProfile>>? servers = const Omit(),
        Defaulted<bool>? sshPasswordRequired = const Omit(),
        Defaulted<int?>? selectedServerId = const Omit()
    }) {
        return MyServersState(
            servers: servers is Omit ? this.servers : servers as List<ServerProfile>,
            sshPasswordRequired: sshPasswordRequired is Omit ? this.sshPasswordRequired : sshPasswordRequired as bool,
            selectedServerId: selectedServerId is Omit ? this.selectedServerId : selectedServerId as int?
        );
    }

}
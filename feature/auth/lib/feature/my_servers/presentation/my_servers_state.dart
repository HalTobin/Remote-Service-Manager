import 'package:domain/model/server_profile.dart';
import 'package:ui/state/omit.dart';

class MyServersState {
    final bool loading;
    final List<ServerProfile> servers;
    final bool sshPasswordRequired;
    final bool passwordError;
    final int? selectedServerId;
    final int? editionServerId;

    MyServersState({
        this.loading = true,
        this.servers = const [],
        this.sshPasswordRequired = false,
        this.passwordError = false,
        this.selectedServerId = null,
        this.editionServerId = null
    });

    MyServersState copyWith({
        Defaulted<bool>? loading = const Omit(),
        Defaulted<List<ServerProfile>>? servers = const Omit(),
        Defaulted<bool>? sshPasswordRequired = const Omit(),
        Defaulted<bool>? passwordError = const Omit(),
        Defaulted<int?>? selectedServerId = const Omit(),
        Defaulted<int?>? editionServerId = const Omit()
    }) {
        return MyServersState(
            loading: loading is Omit ? this.loading : loading as bool,
            servers: servers is Omit ? this.servers : servers as List<ServerProfile>,
            sshPasswordRequired: sshPasswordRequired is Omit ? this.sshPasswordRequired : sshPasswordRequired as bool,
            passwordError: passwordError is Omit ? this.passwordError : passwordError as bool,
            selectedServerId: selectedServerId is Omit ? this.selectedServerId : selectedServerId as int?,
            editionServerId: editionServerId is Omit ? this.editionServerId : editionServerId as int?
        );
    }

}
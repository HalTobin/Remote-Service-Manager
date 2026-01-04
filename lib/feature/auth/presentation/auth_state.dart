import 'package:ls_server_app/data/model/server_profile.dart';

import '../data/ssh_connect_fields.dart';

class AuthState {
    final ServerProfile profile;
    final List<ServerProfile> profiles;

    final bool quickConnectAvailable;

    final String user;
    final String serverUrl;
    final String serverPort;
    final String sshFilePath;
    final bool saveProfile;
    final bool enableQuickConnect;

    final bool passwordRequired;
    final String password;

    final String globalError;

    final List<SshConnectFields> wrongFields;

    final bool loading;

    AuthState({
        this.profile = ServerProfile.empty,
        this.profiles = const [],
        this.quickConnectAvailable = false,
        this.user = "",
        this.serverUrl = "",
        this.serverPort = "",
        this.sshFilePath = "",
        this.saveProfile = true,
        this.enableQuickConnect = false,
        this.passwordRequired = false,
        this.password = "",
        this.globalError = "",
        this.wrongFields = const [],
        this.loading = false
    });

    AuthState copyWith({
        ServerProfile? profile,
        List<ServerProfile>? profiles,
        bool? quickConnectAvailable,
        String? user,
        String? serverUrl,
        String? serverPort,
        String? sshFilePath,
        bool? saveProfile,
        bool? enableQuickConnect,
        bool? passwordRequired,
        String? globalError,
        String? password,
        List<SshConnectFields>? wrongFields,
        bool? loading
    }) {
        return AuthState(
            profile: profile ?? this.profile,
            profiles: profiles ?? this.profiles,
            quickConnectAvailable: quickConnectAvailable ?? this.quickConnectAvailable,
            user: user ?? this.user,
            serverUrl: serverUrl ?? this.serverUrl,
            serverPort: serverPort ?? this.serverPort,
            sshFilePath: sshFilePath ?? this.sshFilePath,
            saveProfile: saveProfile ?? this.saveProfile,
            enableQuickConnect: enableQuickConnect ?? this.enableQuickConnect,
            passwordRequired: passwordRequired ?? this.passwordRequired,
            password: password ?? this.password,
            globalError: globalError ?? this.globalError,
            wrongFields: wrongFields ?? this.wrongFields,
            loading: loading ?? this.loading
        );
    }
}
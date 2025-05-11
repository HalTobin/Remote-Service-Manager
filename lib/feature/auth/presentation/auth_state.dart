import 'package:ls_server_app/data/model/server_profile.dart';

class AuthState {
    final ServerProfile profile;
    final List<ServerProfile> profiles;

    final String user;
    final String serverUrl;
    final String serverPort;
    final String sshFilePath;
    final bool saveProfile;

    final bool passwordRequired;
    final bool obscurePassword;
    final String password;

    final String globalError;

    final bool userError;
    final bool urlError;
    final bool portError;
    final bool fileError;
    final bool passwordError;

    final bool loading;

    AuthState({
        this.profile = ServerProfile.empty,
        this.profiles = const [],
        this.user = "",
        this.serverUrl = "",
        this.serverPort = "",
        this.sshFilePath = "",
        this.saveProfile = true,
        this.passwordRequired = false,
        this.obscurePassword = true,
        this.password = "",
        this.globalError = "",
        this.userError = false,
        this.urlError = false,
        this.portError = false,
        this.fileError = false,
        this.passwordError = false,
        this.loading = false
    });

    AuthState copyWith({
        ServerProfile? profile,
        List<ServerProfile>? profiles,
        String? user,
        String? serverUrl,
        String? serverPort,
        String? sshFilePath,
        bool? saveProfile,
        bool? passwordRequired,
        bool? obscurePassword,
        String? globalError,
        String? password,
        bool? userError,
        bool? urlError,
        bool? portError,
        bool? fileError,
        bool? passwordError,
        bool? loading
    }) {
        return AuthState(
            profile: profile ?? this.profile,
            profiles: profiles ?? this.profiles,
            user: user ?? this.user,
            serverUrl: serverUrl ?? this.serverUrl,
            serverPort: serverPort ?? this.serverPort,
            sshFilePath: sshFilePath ?? this.sshFilePath,
            saveProfile: saveProfile ?? this.saveProfile,
            passwordRequired: passwordRequired ?? this.passwordRequired,
            obscurePassword: obscurePassword ?? this.obscurePassword,
            password: password ?? this.password,
            globalError: globalError ?? this.globalError,
            userError: userError ?? this.userError,
            urlError: urlError ?? this.urlError,
            portError: portError ?? this.portError,
            fileError: fileError ?? this.fileError,
            passwordError: passwordError ?? this.passwordError,
            loading: loading ?? this.loading
        );
    }
}
import 'package:ls_server_app/feature/auth/data/ssh_connect_fields.dart';

class DirectAuthState {
    final bool loading;
    final String sshFilePath;
    final bool passwordRequired;
    final List<SshConnectFields> wrongFields;

    DirectAuthState({
        this.loading = false,
        this.sshFilePath = "",
        this.passwordRequired = false,
        this.wrongFields = const []
    });

    DirectAuthState copyWith({
        bool? loading,
        String? sshFilePath,
        bool? passwordRequired,
        List<SshConnectFields>? wrongFields
    }) {
        return DirectAuthState(
            loading: loading ?? this.loading,
            sshFilePath: sshFilePath ?? this.sshFilePath,
            passwordRequired: passwordRequired ?? this.passwordRequired,
            wrongFields: wrongFields ?? this.wrongFields
        );
    }

}
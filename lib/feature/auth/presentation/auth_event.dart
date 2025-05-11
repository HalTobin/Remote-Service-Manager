import 'package:ls_server_app/data/model/server_profile.dart';

sealed class AuthEvent {}

class LoadProfile extends AuthEvent {
    final ServerProfile profile;
    LoadProfile({required this.profile});
}

class LoadSshFile extends AuthEvent {
    final String sshFilePath;
    LoadSshFile({required this.sshFilePath});
}

class UpdateSaveProfile extends AuthEvent {
    final bool saveProfile;
    UpdateSaveProfile({required this.saveProfile});
}

class Connect extends AuthEvent {
    final String user;
    final String serverUrl;
    final String serverPort;
    final String sshFilePath;
    final String? password;
    final bool saveProfile;
    Connect({
        required this.user,
        required this.serverUrl,
        required this.serverPort,
        required this.sshFilePath,
        required this.password,
        required this.saveProfile
    });
}

class ObscurePassword extends AuthEvent {
    final bool obscure;
    ObscurePassword({required this.obscure});
}

class ClearError extends AuthEvent {}

class FakeConnect extends AuthEvent {}
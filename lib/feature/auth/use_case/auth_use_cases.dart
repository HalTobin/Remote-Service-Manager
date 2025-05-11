import 'package:ls_server_app/feature/auth/use_case/fake_connect_usecase.dart';
import 'package:ls_server_app/feature/auth/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

import 'load_auth_preferences_use_case.dart';
import 'load_ssh_file_use_case.dart';

class AuthUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final LoadAuthPreferencesUseCase loadAuthPreferencesUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;
    final SshConnectUseCase sshConnectUseCase;
    final FakeConnectUseCase fakeConnectUseCase;

    AuthUseCases({
        required this.loadProfilesUseCase,
        required this.loadAuthPreferencesUseCase,
        required this.loadSshFileUseCase,
        required this.sshConnectUseCase,
        required this.fakeConnectUseCase
    });
}
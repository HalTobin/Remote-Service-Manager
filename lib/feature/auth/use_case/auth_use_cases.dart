import 'package:ls_server_app/feature/auth/use_case/check_wrong_fields_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/fake_connect_usecase.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

import 'load_ssh_file_use_case.dart';

class AuthUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;
    final CheckWrongFieldsUseCase checkWrongFieldsUseCase;
    final SshConnectUseCase sshConnectUseCase;
    final FakeConnectUseCase fakeConnectUseCase;

    AuthUseCases({
        required this.loadProfilesUseCase,
        required this.loadSshFileUseCase,
        required this.checkWrongFieldsUseCase,
        required this.sshConnectUseCase,
        required this.fakeConnectUseCase
    });
}
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

class MyServersUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;
    final SshConnectUseCase sshConnectUseCase;

    MyServersUseCases({
        required this.loadProfilesUseCase,
        required this.loadSshFileUseCase,
        required this.sshConnectUseCase
    });
}
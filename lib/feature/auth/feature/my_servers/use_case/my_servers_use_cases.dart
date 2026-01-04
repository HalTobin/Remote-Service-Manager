import 'package:ls_server_app/feature/auth/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

class MyServersUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final SshConnectUseCase sshConnectUseCase;

    MyServersUseCases({
        required this.loadProfilesUseCase,
        required this.sshConnectUseCase
    });
}
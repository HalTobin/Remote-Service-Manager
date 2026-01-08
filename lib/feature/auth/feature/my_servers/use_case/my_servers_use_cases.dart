import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/check_password_requirement_by_server_profile_id_usecase.dart';
import 'package:ls_server_app/feature/auth/feature/my_servers/use_case/load_profiles_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

class MyServersUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;
    final SshConnectUseCase sshConnectUseCase;
    final CheckPasswordRequirementByServerProfileIdUseCase checkPasswordRequirementByServerProfileIdUseCase;

    MyServersUseCases({
        required this.loadProfilesUseCase,
        required this.loadSshFileUseCase,
        required this.sshConnectUseCase,
        required this.checkPasswordRequirementByServerProfileIdUseCase
    });
}
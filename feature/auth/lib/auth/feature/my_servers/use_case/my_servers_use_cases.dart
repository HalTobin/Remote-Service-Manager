import 'package:domain/use_case/load_ssh_file_use_case.dart';
import 'package:domain/use_case/ssh_connect_use_case.dart';

import 'check_password_requirement_by_server_profile_id_usecase.dart';
import 'check_quick_connect_availability_use_case.dart';
import 'load_profiles_use_case.dart';

class MyServersUseCases {
    final LoadProfilesUseCase loadProfilesUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;
    final SshConnectUseCase sshConnectUseCase;
    final CheckPasswordRequirementByServerProfileIdUseCase checkPasswordRequirementByServerProfileIdUseCase;
    final CheckQuickConnectAvailabilityUseCase checkQuickConnectAvailabilityUseCase;

    MyServersUseCases({
        required this.loadProfilesUseCase,
        required this.loadSshFileUseCase,
        required this.sshConnectUseCase,
        required this.checkPasswordRequirementByServerProfileIdUseCase,
        required this.checkQuickConnectAvailabilityUseCase
    });
}
import 'package:ls_server_app/use_case/get_current_ssh_profile_use_case.dart';
import 'package:ls_server_app/use_case/listen_ssh_connect_usecase.dart';
import 'package:ls_server_app/use_case/ssh_log_out_usecase.dart';

class MainUseCases {
    final ListenSshConnectUseCase listenSshConnectUseCase;
    final SshLogOutUseCase sshLogOutUseCase;
    final GetCurrentSshProfileUseCase getCurrentSshProfileUseCase;

    MainUseCases({
        required this.listenSshConnectUseCase,
        required this.sshLogOutUseCase,
        required this.getCurrentSshProfileUseCase
    });
}
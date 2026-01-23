import 'package:domain/use_case/check_wrong_fields_use_case.dart';
import 'package:domain/use_case/load_ssh_file_use_case.dart';
import 'package:domain/use_case/ssh_connect_use_case.dart';
import 'fake_connect_use_case.dart';

class AuthUseCases {
    final LoadSshFileUseCase loadSshFileUseCase;
    final CheckWrongFieldsUseCase checkWrongFieldsUseCase;
    final SshConnectUseCase sshConnectUseCase;
    final FakeConnectUseCase fakeConnectUseCase;

    AuthUseCases({
        required this.loadSshFileUseCase,
        required this.checkWrongFieldsUseCase,
        required this.sshConnectUseCase,
        required this.fakeConnectUseCase
    });
}
import '../../../use_case/add_edit_server_use_case.dart';
import '../../../use_case/load_ssh_file_use_case.dart';
import 'load_server_profile_usecase.dart';

class AddEditServerUseCases {
    final LoadServerProfileUseCase loadServerProfileUseCase;
    final AddEditServerUseCase addEditServerUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;

    AddEditServerUseCases({
        required this.loadServerProfileUseCase,
        required this.addEditServerUseCase,
        required this.loadSshFileUseCase
    });
}
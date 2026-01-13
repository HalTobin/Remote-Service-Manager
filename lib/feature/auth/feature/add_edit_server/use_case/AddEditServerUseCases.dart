import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';

import '../../../use_case/add_edit_server_use_case.dart';

class AddEditServerUseCases {
    final AddEditServerUseCase addEditServerUseCase;
    final LoadSshFileUseCase loadSshFileUseCase;

    AddEditServerUseCases({
        required this.addEditServerUseCase,
        required this.loadSshFileUseCase
    });
}
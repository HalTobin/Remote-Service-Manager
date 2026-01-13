import 'package:ls_server_app/feature/auth/feature/add_edit_server/use_case/load_server_profile_usecase.dart';
import 'package:ls_server_app/feature/auth/use_case/load_ssh_file_use_case.dart';

import '../../../use_case/add_edit_server_use_case.dart';

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
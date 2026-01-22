import 'package:feature_auth/auth/feature/my_ssh_keys/use_case/add_key_use_case.dart';
import 'package:feature_auth/auth/feature/my_ssh_keys/use_case/delete_key_use_case.dart';
import 'package:feature_auth/auth/feature/my_ssh_keys/use_case/rename_key_use_case.dart';

import 'list_ssh_keys_use_case.dart';

class MySshKeysUseCases {
    final AddKeyUseCase addKeyUseCase;
    final DeleteKeyUseCase deleteKeyUseCase;
    final ListSshKeysUseCase listSshKeysUseCase;
    final RenameKeyUseCase renameKeyUseCase;

    MySshKeysUseCases({
        required this.addKeyUseCase,
        required this.deleteKeyUseCase,
        required this.listSshKeysUseCase,
        required this.renameKeyUseCase
    });
}
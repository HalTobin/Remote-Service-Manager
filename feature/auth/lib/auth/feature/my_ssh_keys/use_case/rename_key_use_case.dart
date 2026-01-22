import 'package:domain/model/server_profile.dart';
import 'package:domain/repository/file_repository.dart';
import 'package:domain/repository/server_profile_repository.dart';
import 'package:domain/use_case/load_ssh_file_use_case.dart';
import 'package:feature_auth/auth/feature/my_ssh_keys/domain/ssh_key_folder.dart';

class RenameKeyUseCase {
    RenameKeyUseCase({
        required FileRepository fileRepository
    })
      : _fileRepository = fileRepository;

    final FileRepository _fileRepository;

    Future<String?> execute(String sshKeyFilePath, String newName) async {
        final file = await _fileRepository.rename(sshKeyFilePath, newName);
        return file?.path;
    }

}
import 'package:ls_server_app/data/io/load_ssh_file.dart';

class LoadSshFileUseCase {

    bool execute(String filePath) {
        return LoadSshFile.isKeyProtected(filePath);
    }

}
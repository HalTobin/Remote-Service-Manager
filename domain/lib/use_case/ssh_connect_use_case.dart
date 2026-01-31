import 'package:domain/model/ssh/connection_status.dart';
import 'package:domain/service/ssh_service.dart';

class SshConnectUseCase {
    SshConnectUseCase({
      required SshService sshService
    })
        : _sshService = sshService;

    final SshService _sshService;

    Future<ConnectionStatus> execute(SshConnectRequest request) async {
        final String serverUrl = request.url;
        final String serverPort = request.port;
        final String user = request.user;
        final String sshFilePath = request.filePath;
        final String? password = request.password;

        return await _sshService.connect(
            user: user,
            serverUrl: serverUrl,
            serverPort: serverPort,
            sshFilePath: sshFilePath,
            password: password
        );
    }
}

class SshConnectRequest {
    final String user;
    final String url;
    final String port;
    final String filePath;
    final String? password;

    SshConnectRequest({
        required this.user,
        required this.url,
        required this.port,
        required this.filePath,
        required this.password
    });
}

/*
class SshConnectUseCase {
    SshConnectUseCase({
        required ServerProfileRepository serverProfileRepository,
        required SshService sshService
    })
        : _serverProfileRepository = serverProfileRepository,
          _sshService = sshService;

    final SshService _sshService;
    final ServerProfileRepository _serverProfileRepository;

    Future<ConnectionStatus> execute(SshConnectDto connectDto) async {
        final String serverUrl = connectDto.url;
        final String serverPort = connectDto.port;
        final String user = connectDto.user;
        final String sshFilePath = connectDto.filePath;
        final String? password = connectDto.password;
        final bool saveProfile = connectDto.saveProfile;
        final Future<String?> Function() passwordRequestCallback = connectDto.passwordRequestCallback;

        final connectionStatus = await _sshService.connect(
            user: user,
            serverUrl: serverUrl,
            serverPort: serverPort,
            sshFilePath: sshFilePath,
            password: password,
            passwordRequestCallback: passwordRequestCallback
        );
        if (connectionStatus is ConnectionSucceed && saveProfile) {
            final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

            if (!sshFilePath.contains(appDocumentsDir.path)) {
                final File sshFile = File(sshFilePath);
                final String fileName = sshFile.uri.pathSegments.last;

                final String internalTargetPath = "${appDocumentsDir.path}/keys/$fileName";
                final File internalTargetFile = File(internalTargetPath);

                if (!await internalTargetFile.exists()) {
                    await internalTargetFile.create(recursive: true);
                    await sshFile.copy(internalTargetFile.path);
                }

                final bool profileExist = await _serverProfileRepository.doesProfileExist(url: serverUrl, port: serverPort, user: user);
                if (!profileExist) {
                    final profile = NewServerProfile(
                        url: serverUrl,
                        port: serverPort,
                        user: user,
                        keyPath: internalTargetPath,
                        quickConnectEnable: connectDto.enableQuickConnect
                    );
                    _serverProfileRepository.saveProfile(profile);
                }

            }

        }
        return connectionStatus;
    }

}

class SshConnectDto {
    final String user;
    final String url;
    final String port;
    final String filePath;
    final String? password;
    final bool saveProfile;
    final bool enableQuickConnect;
    final Future<String?> Function() passwordRequestCallback;

    SshConnectDto({
        required this.user,
        required this.url,
        required this.port,
        required this.filePath,
        required this.password,
        required this.saveProfile,
        required this.enableQuickConnect,
        required this.passwordRequestCallback
    });
}
*/
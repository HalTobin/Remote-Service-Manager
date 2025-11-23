import 'dart:convert';

import 'package:biometric_storage/biometric_storage.dart';
import 'package:ls_server_app/data/biometrics/model/secret_entry_dto.dart';
import 'package:ls_server_app/data/biometrics/model/ssh_secrets_dto.dart';
import 'package:ls_server_app/data/model/ssh_entry.dart';

class SshSecretsRepository {
    SshSecretsRepository();

    final Future<BiometricStorageFile> store = BiometricStorage().getStorage('ssh_secrets');

    Future<SshEntry?> getSecretsByIdentifier(String identifier) async {
        if (!await _canAuthenticate()) return null;

        final BiometricStorageFile storageFile = await store;
        final String? data = await storageFile.read();

        if (data == null) return null;

        final Map<String, dynamic> json = jsonDecode(data);
        final SshSecretsDto secrets = SshSecretsDto.fromJson(json);

        final SecretEntryDto? secret = secrets.secrets.firstOrNull((secret) => secret.identifier == identifier);
    }

    Future<bool> _canAuthenticate() async {
        final response = await BiometricStorage().canAuthenticate();
        return (response == CanAuthenticateResponse.success);
    }

}
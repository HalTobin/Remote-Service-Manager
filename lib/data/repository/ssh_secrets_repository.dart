import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/biometrics/model/secret_entry_dto.dart';
import 'package:ls_server_app/data/biometrics/model/ssh_secrets_dto.dart';
import 'package:ls_server_app/data/model/ssh_secret_entry.dart';

class SshSecretsRepository {
    SshSecretsRepository();

    final Future<BiometricStorageFile> _store = BiometricStorage().getStorage('ssh_secrets');
    BiometricStorageFile? _storageFile;

    Future<SshSecretEntry?> getSecretsByIdentifier(String identifier) async {
        final SshSecretsDto? secrets = await _getStorageFileContent();

        if (secrets == null) {
            return null;
        }

        final SecretEntryDto? secret = secrets.secrets
            .firstWhereOrNull((entry) => entry.identifier == identifier );

        if (secret != null) {
            return SshSecretEntry(
                identifier: secret.identifier,
                sshKeyPassword: secret.sshKeyPassword,
                userPassword: secret.userPassword
            );
        }
        else {
            return null;
        }
    }

    Future<bool> _canAuthenticate() async {
        final response = await BiometricStorage().canAuthenticate();
        return (response == CanAuthenticateResponse.success);
    }

    Future<SshSecretsDto?> _getStorageFileContent() async {
        if (!await _canAuthenticate()) return null;
        _storageFile ??= await _store;
        final String? data = await _storageFile?.read();

        if (data == null) return null;

        final Map<String, dynamic> json = jsonDecode(data);
        try {
            final secrets = SshSecretsDto.fromJson(json);
            return secrets;
        } catch(e) {
            if (kDebugMode) {
                print("Couldn't parse ssh secrets file: $e");
            }
            return null;
        }
    }

}
import 'package:domain/repository/ssh_secrets_repository.dart';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:biometric_storage/biometric_storage.dart';
import 'package:domain/model/ssh_secret_entry.dart';
import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/biometrics/model/secret_entry_dto.dart';
import 'package:ls_server_app/data/biometrics/model/ssh_secrets_dto.dart';

class SshSecretsRepositoryImpl implements SshSecretsRepository {

    final Future<BiometricStorageFile> _store = BiometricStorage().getStorage('ssh_secrets');
    BiometricStorageFile? _storageFile;

    static final SshSecretsRepositoryImpl _instance = SshSecretsRepositoryImpl._internal();
    factory SshSecretsRepositoryImpl() => _instance;

    SshSecretsRepositoryImpl._internal();

    @override
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

    @override
    Future<void> addSecret(SshSecretEntry secret) async {
        final SshSecretsDto? secrets = await _getStorageFileContent();
        if (secrets == null) return;

        secrets.secrets.add(
            SecretEntryDto(
                identifier: secret.identifier,
                sshKeyPassword: secret.sshKeyPassword,
                userPassword: secret.userPassword
            )
        );

        await _saveSecrets(secrets.secrets);
    }

    @override
    Future<void> deleteSecretsByIdentifier(String identifier) async {
        if (!await _canAuthenticate()) return;

        final SshSecretsDto? secrets = await _getStorageFileContent();
        if (secrets == null) return;

        secrets.secrets.removeWhere((secret) => secret.identifier == identifier);
        _saveSecrets(secrets.secrets);
    }

    Future<void> _saveSecrets(List<SecretEntryDto> secrets) async {
        if (!await _canAuthenticate()) return;
        final SshSecretsDto sshSecrets = SshSecretsDto(secrets: secrets);
        final BiometricStorageFile? storageFile = await _getStorageFile();
        if (storageFile == null) return;

        final String secretsDto = sshSecrets.toString();
        await storageFile.write(secretsDto);
    }

    Future<bool> _canAuthenticate() async {
        final response = await BiometricStorage().canAuthenticate();
        return (response == CanAuthenticateResponse.success);
    }

    Future<BiometricStorageFile?> _getStorageFile() async {
        if (!await _canAuthenticate()) return null;
        _storageFile ??= await _store;
        return _storageFile;
    }

    Future<SshSecretsDto?> _getStorageFileContent() async {
        if (!await _canAuthenticate()) return null;
        final BiometricStorageFile? storageFile = await _getStorageFile();
        final String? data = await storageFile?.read();

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
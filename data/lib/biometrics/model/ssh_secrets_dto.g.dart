// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_secrets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SshSecretsDto _$SshSecretsDtoFromJson(Map<String, dynamic> json) =>
    SshSecretsDto(
      secrets: (json['secrets'] as List<dynamic>)
          .map((e) => SecretEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SshSecretsDtoToJson(SshSecretsDto instance) =>
    <String, dynamic>{'secrets': instance.secrets};

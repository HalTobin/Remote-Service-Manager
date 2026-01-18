// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretEntryDto _$SecretEntryDtoFromJson(Map<String, dynamic> json) =>
    SecretEntryDto(
      identifier: json['identifier'] as String,
      sshKeyPassword: json['sshKeyPassword'] as String,
      userPassword: json['userPassword'] as String?,
    );

Map<String, dynamic> _$SecretEntryDtoToJson(SecretEntryDto instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'sshKeyPassword': instance.sshKeyPassword,
      'userPassword': instance.userPassword,
    };

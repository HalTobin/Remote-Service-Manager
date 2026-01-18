import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'secret_entry_dto.g.dart';

@internal
@JsonSerializable()
class SecretEntryDto {
  final String identifier;
  final String sshKeyPassword;
  final String? userPassword;

  SecretEntryDto({
    required this.identifier,
    required this.sshKeyPassword,
    this.userPassword
  });

  factory SecretEntryDto.fromJson(Map<String, dynamic> json) => _$SecretEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SecretEntryDtoToJson(this);
}
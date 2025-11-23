import 'package:json_annotation/json_annotation.dart';
import 'package:ls_server_app/data/biometrics/model/secret_entry_dto.dart';

part 'ssh_secrets_dto.g.dart';

@JsonSerializable()
class SshSecretsDto {
    final List<SecretEntryDto> secrets;

    SshSecretsDto({
        required this.secrets
    });

    factory SshSecretsDto.fromJson(Map<String, dynamic> json) => _$SshSecretsDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SshSecretsDtoToJson(this);
}
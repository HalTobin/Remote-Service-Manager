sealed class MainEvent {}

class SshLogOut extends MainEvent {}

class SetOnPasswordRequest extends MainEvent {
    final Future<String?> Function() onPasswordRequest;
    SetOnPasswordRequest({required this.onPasswordRequest});
}
import 'package:domain/model/ssh/ssh_profile.dart';

class MainState {
    final bool isConnected;
    final SshProfile profile;

    MainState({
        this.isConnected = false,
        this.profile = SshProfile.blank
    });

    MainState copyWith({
        bool? isConnected,
        SshProfile? profile
    }) {
        return MainState(
            isConnected: isConnected ?? this.isConnected,
            profile: profile ?? this.profile
        );
    }
}
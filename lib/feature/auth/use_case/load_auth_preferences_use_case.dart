import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/model/server_profile.dart';
import 'package:ls_server_app/data/repository/server_profile_repository.dart';

import '../../../data/preferences/preference_repository.dart';

class LoadAuthPreferencesUseCase {
    LoadAuthPreferencesUseCase({
        required ServerProfileRepository serverProfileRepository,
        required PreferenceRepository preferenceRepository
    })
      : _serverProfileRepository = serverProfileRepository,
        _preferenceRepository = preferenceRepository;

    final ServerProfileRepository _serverProfileRepository;
    final PreferenceRepository _preferenceRepository;

    Future<ServerProfile?> execute() async {
        final List<ServerProfile> profiles = await _serverProfileRepository.getAllProfiles();

        if (profiles.isNotEmpty) {
            try {
                return _getDefaultServerProfile(profiles);
            } catch (e) {
                if (kDebugMode) { print("Couldn't load a default server profile: $e"); }
                return null;
            }
        } else {
            return null;
        }
    }

    Future<ServerProfile?> _getDefaultServerProfile(List<ServerProfile> profiles) async {
        if (profiles.length > 1) {
            final favoriteServerProfileId = await _preferenceRepository.getDefaultServerId();
            return (favoriteServerProfileId != null)
                ? profiles.firstWhere((profile) => profile.id == favoriteServerProfileId)
                : profiles.first;
        } else {
            return profiles.first;
        }
    }

}
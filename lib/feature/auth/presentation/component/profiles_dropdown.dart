import 'package:flutter/material.dart';
import 'package:ls_server_app/data/model/server_profile.dart';

class ProfilesDropdown extends StatelessWidget {
  final String title;
  final ServerProfile currentProfile;
  final List<ServerProfile> profiles;
  final Function(ServerProfile) onProfileSelect;

  const ProfilesDropdown({
    super.key,
    required this.title,
    required this.currentProfile,
    required this.profiles,
    required this.onProfileSelect
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 386),
        child: (profiles.isNotEmpty && profiles.contains(currentProfile))
          ? DropdownButton<ServerProfile>(
            isExpanded: true,
            value: currentProfile,
            onChanged: (ServerProfile? newProfile) {
              if (newProfile != null) {
                onProfileSelect(newProfile);
              }
            },
            items: profiles.map((profile) {
              return DropdownMenuItem<ServerProfile>(
                value: profile,
                child: Text(
                  profile.getIdentifier(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }).toList(),
          )
          : Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
      ),
    );
  }
}
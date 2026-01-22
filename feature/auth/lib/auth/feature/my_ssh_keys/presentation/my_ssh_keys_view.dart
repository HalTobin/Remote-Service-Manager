import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:feature_auth/auth/feature/my_ssh_keys/presentation/my_ssh_keys_event.dart';
import 'package:feature_auth/auth/feature/my_ssh_keys/presentation/my_ssh_keys_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui/component/title_header.dart';

class MySshKeysView extends StatelessWidget {
  final MySshKeysState state;
  final Function(MySshKeysEvent) onEvent;
  final Function(String) onSelect;

  const MySshKeysView({
    super.key,
    required this.state,
    required this.onEvent,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          icon: LucideIcons.folderKey,
          title: "My SSH Keys"
        ),
        Row(
          children: [

          ],
        )
      ],
    );
  }
}
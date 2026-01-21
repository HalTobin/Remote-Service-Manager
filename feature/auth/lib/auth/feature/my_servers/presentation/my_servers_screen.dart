import 'package:flutter/material.dart';
import 'package:ui/component/title_header.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'component/server_profile_item.dart';
import 'my_servers_event.dart';
import 'my_servers_state.dart';

class MyServersScreen extends StatefulWidget {
  final MyServersState state;
  final Function(MyServersEvent) onEvent;
  final Function(int?) onAddEditServer;

  const MyServersScreen({
    super.key,
    required this.state,
    required this.onEvent,
    required this.onAddEditServer
  });

  @override
  State<StatefulWidget> createState() => _MyServersScreenState();

}

class _MyServersScreenState extends State<MyServersScreen> {
  final TextEditingController _sshPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [

        TitleHeader(
            icon: LucideIcons.server,
            title: "My Servers",
            trailingContent: TitleHeaderTrailingContent.action(
              title: "Add",
              icon: LucideIcons.plus,
              onPressed: () => widget.onAddEditServer(null)
            )
        ),

        Expanded(
          child: ListView.separated(
            //padding: const EdgeInsets.all(16),
            itemCount: widget.state.servers.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = widget.state.servers[index];

              final MyServersEvent selectEvent = SelectServer(serverProfileId: profile.id);

              return ServerProfileItem(
                profile: profile,
                selected: (widget.state.selectedServerId == profile.id),
                onClick: () => widget.onEvent(selectEvent),
                onEdit: () => widget.onAddEditServer(profile.id)
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
        ),


      ],
    );
  }

}
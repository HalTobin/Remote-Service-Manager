import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/services_manager/data/service_presentation.dart';
import 'package:ls_server_app/feature/services_manager/presentation/component/service_controller/service_action_button.dart';
import 'package:ls_server_app/feature/services_manager/presentation/component/service_controller/status_indicator.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ServiceController extends StatelessWidget {
  final ServicePresentation service;
  final Function() onStart;
  final Function() onStop;
  final Function() onRestart;
  final Function() onEdit;

  const ServiceController({
    super.key,
    required this.service,
    required this.onStart,
    required this.onStop,
    required this.onRestart,
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Flexible(
            child: StatusIndicator(
              service: service,
              active: service.active
            ),
          ),
          if (service.active)
            AnimatedServiceActionButton(
              enable: service.active,
              icon: LucideIcons.square,
              color: Colors.red,
              onPressed: service.active ? onStop : null,
            ),
          if (service.active)
            AnimatedServiceActionButton(
              enable: service.active,
              icon: LucideIcons.rotateCcw,
              color: Colors.orange,
              onPressed: service.active ? onRestart : null,
            ),
          if (!service.active)
            AnimatedServiceActionButton(
              enable: !service.active,
              icon: LucideIcons.play,
              color: Colors.green,
              onPressed: service.active ? null : onStart,
            ),
          IconButton(
              onPressed: onEdit,
              icon: Icon(LucideIcons.pencil)
          ),
        ],
      ),
    );
  }
}
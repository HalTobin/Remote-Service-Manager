import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/services_manager/data/service_presentation.dart';
import 'package:ls_server_app/feature/services_manager/presentation/component/service_controller/service_action_button.dart';
import 'package:ls_server_app/feature/services_manager/presentation/component/service_controller/status_indicator.dart';

class ServiceController extends StatelessWidget {
  final ServicePresentation service;
  final Function() onStart;
  final Function() onStop;
  final Function() onEdit;

  const ServiceController({
    super.key,
    required this.service,
    required this.onStart,
    required this.onStop,
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
          IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit)
          ),
          AnimatedServiceActionButton(
            enable: service.active,
            icon: Icons.stop,
            color: Colors.red,
            onPressed: service.active ? onStop : null,
          ),
          AnimatedServiceActionButton(
            enable: !service.active,
            icon: Icons.play_arrow,
            color: Colors.green,
            onPressed: service.active ? null : onStart,
          )
        ],
      ),
    );
  }
}
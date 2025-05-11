import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/edit_service/di/edit_service_provider.dart';
import 'package:ls_server_app/feature/services_manager/presentation/component/service_manager_loading.dart';
import 'package:ls_server_app/feature/services_manager/presentation/service_manager_event.dart';
import 'package:ls_server_app/feature/services_manager/presentation/service_manager_state.dart';
import 'package:ls_server_app/presentation/component/global_error_warning.dart';

import 'component/service_controller/service_controller.dart';

class ServiceManagerScreen extends StatelessWidget {
  final ServiceManagerState state;
  final Function(ServiceManagerEvent event) onEvent;

  const ServiceManagerScreen({
    super.key,
    required this.state,
    required this.onEvent
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: state.loading
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond,
      firstChild: ServiceManagerLoading(),
      secondChild: Stack(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 128), // to avoid being hidden by error
                  child: Column(
                    children: [
                      if (state.services.any((s) => s.favorite)) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              const Icon(Icons.star),
                              Text(
                                "Favorites",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                        ...state.services
                            .where((s) => s.favorite)
                            .map((service) => ServiceController(
                              service: service,
                              onStart: () => onEvent(StartService(service: service.title)),
                              onStop: () => onEvent(StopService(service: service.title)),
                              onEdit: () => _showEditServiceDialog(context: context, serviceName: service.title),
                            )),
                        ],

                      // Others section
                      if (state.services.any((s) => !s.favorite)) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              const Icon(Icons.miscellaneous_services),
                              Text(
                                "Others",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                      ),
                      ...state.services
                          .where((s) => !s.favorite)
                          .map((service) => ServiceController(
                            service: service,
                            onStart: () => onEvent(StartService(service: service.title)),
                            onStop: () => onEvent(StopService(service: service.title)),
                            onEdit: () => _showEditServiceDialog(context: context, serviceName: service.title),
                          )),
                      ]
                    ]
                    /*state.services.map((service) {
                      return ServiceController(
                        service: service,
                        onStart: () => onEvent(StartService(service: service.title)),
                        onStop: () => onEvent(StopService(service: service.title)),
                        onEdit: () => _showEditServiceDialog(context: context, serviceName: service.title),
                      );
                    }).toList()*/,
                  ),
                )
              )
            ],
          ),
          if (state.error.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: AnimatedGlobalErrorWarning(
                  error: state.error,
                  onClose: () => onEvent(CloseError()),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showEditServiceDialog({
    required BuildContext context,
    required String serviceName
  }) async {
    if (kDebugMode) {
      print("_showEditServiceDialog()");
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: EditServiceProvider(
          serviceName: serviceName,
        ),
      ),
    );
  }
}
sealed class ServiceManagerEvent {}

class StartService extends ServiceManagerEvent {
    final String service;
    StartService({required this.service});
}

class StopService extends ServiceManagerEvent {
    final String service;
    StopService({required this.service});
}

class CloseError extends ServiceManagerEvent {}
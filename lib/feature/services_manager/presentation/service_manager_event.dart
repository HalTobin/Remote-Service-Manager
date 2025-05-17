import 'package:ls_server_app/data/ssh/model/systemctl_command.dart';

sealed class ServiceManagerEvent {}

class RunCtlCommand extends ServiceManagerEvent {
    final SystemctlCommand command;
    final String service;
    RunCtlCommand({
        required this.command,
        required this.service
    });
}

class CloseError extends ServiceManagerEvent {}
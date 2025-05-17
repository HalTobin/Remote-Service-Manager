import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/ssh/model/ssh_profile.dart';
import 'package:ls_server_app/data/ssh/model/connection_status.dart';
import 'package:ls_server_app/data/model/response_result.dart';
import 'package:ls_server_app/data/ssh/model/systemctl_command.dart';
import 'package:ls_server_app/data/ssh/utils/byte_decoder.dart';

class SshService extends ChangeNotifier implements ValueListenable<bool> {
    SSHClient? _client;
    SshProfile? _profile;

    static final SshService _instance = SshService._internal();
    factory SshService() => _instance;

    SshService._internal();

    bool _isConnected = false;

    @override
    bool get value => _isConnected;

    Future<String> Function()? onPasswordRequest;

    Future<ConnectionStatus> connect({
        required String user,
        required String serverUrl,
        required String serverPort,
        required String sshFilePath,
        required String? password
    }) async {
        try {
            if (kDebugMode) {
                print('SSH connecting to: $user@$serverUrl:$serverPort');
            }
            // Step 1: Parse port
            final port = int.tryParse(serverPort) ?? 22;

            // Step 2: Load private key file
            final key = File(sshFilePath).readAsStringSync();

            // Step 3: Create socket and client
            final socket = await SSHSocket.connect(serverUrl, port);
            _client = SSHClient(
                socket,
                username: user,
                identities: [
                    // A single private key file may contain multiple keys.
                    ...SSHKeyPair.fromPem(key, password)
                ],
                onPasswordRequest: () async {
                    if (kDebugMode) {
                        print("Password request emitted");
                    }
                    if (onPasswordRequest != null) {
                        final password = await onPasswordRequest!();
                        return password;
                    } else {
                        throw Exception('No password request handler set.');
                    }
                }
            );

            _profile = SshProfile(
                url: serverUrl,
                port: serverPort,
                user: user
            );

            _updateConnectionState(true);
            return ConnectionSucceed();
        } catch (e) {
            if (kDebugMode) {
                print('SSH connection failed: $e');
            }
            _updateConnectionState(false);
            return ConnectionFailed(error: e.toString());
        }
    }

    Future<ResponseResult<bool>> systemCtlCommand({
        required SystemctlCommand command,
        required String service
    }) async {
        final String fullCommand = "sudo systemctl ${command.command} $service";
        if (kDebugMode) {
            if (_client == null) { print("_client is null"); }
            print("Run: $fullCommand");
        }
        final SSHSession? session = await _client?.execute(fullCommand);
        await session?.done;
        if (session != null) {
            final int? exitCode = session.exitCode;
            final SSHSessionExitSignal? exitSignal = session.exitSignal;
            final stdoutStr = await session.stdout.decodeUtf8();
            final stderrStr = await session.stderr.decodeUtf8();

            if (kDebugMode) {
                print("stdout: $stdoutStr");
                print("stderr: $stderrStr");
                print("Command exited with code: $exitCode");
                print("Command exited with signal: ${exitSignal?.signalName}, message: ${exitSignal?.errorMessage}");
            }

            switch (exitCode) {
                case 0:
                    return ResponseSucceed(true);
                case 1: {
                    try {
                        final String password = await onPasswordRequest!();
                        return await _runSudoCommand(password, fullCommand);
                    } catch (error) {
                        return ResponseFailed(error: error.toString());
                    }
                }
                default:
                    return ResponseFailed(error: stderrStr);
            }
        }
        else {
            return ResponseFailed(error: "Session is null");
        }
    }

    Future<ResponseResult<bool>> _runSudoCommand(String password, String command) async {
        final process = await Process.start(
            'sudo',
            ['-S', command],
            runInShell: true,
        );

        // Capture stdout
        final outputPostCommand = await process.stdout.decodeUtf8();
        if (kDebugMode) { print('Output post command: $outputPostCommand'); }

        // Send the password followed by a newline
        process.stdin.writeln(password);

        // Optionally close stdin if no further input needed
        await process.stdin.close();

        // Capture stdout
        final outputPostPassword = await process.stdout.decodeUtf8();
        if (kDebugMode) { print('Output post password: $outputPostPassword'); }

        // Capture stderr
        final errors = await process.stderr.decodeUtf8();
        if (kDebugMode) { print('Errors: $errors'); }

        final exitCode = await process.exitCode;
        if (kDebugMode) { print('Exit code: $exitCode'); }

        if (exitCode == 0) { return ResponseSucceed(true); }
        else { return ResponseFailed(error: errors); }
    }

    Future<bool> isServiceRunning(String service) async {
        final session = await _client?.execute('systemctl is-active $service');
        if (session != null) {
            final output = await session.stdout.decodeUtf8();
            final status = output.trim();
            //if (kDebugMode) { print('Service: $service, status: $status'); }
            return status == 'active';
        }
        if (kDebugMode) { print("session is null"); }
        return false;
    }

    Future<ResponseResult<List<String>>> getServiceList() async {
        try {
            final session = await _client?.execute('ls /etc/systemd/system');
            if (session != null) {
                final output = <int>[];

                // Collect stdout data
                await for (final data in session.stdout) {
                    output.addAll(data);
                }

                // Wait for the session to complete
                await session.done;

                // Convert byte data to string
                final result = String.fromCharCodes(output);

                // Parse and return lines, filtering out empty ones
                final services = result
                    .split('\n')
                    .map((line) => line.trim())
                    .where((line) => line.isNotEmpty)
                    .toList();

                if (kDebugMode) {
                    print("services found: $services");
                }

                return ResponseSucceed<List<String>>(services);
            }
            else {
                return ResponseFailed(error: 'session is null!');
            }
        } catch (e) {
            if (kDebugMode) { print('Error executing command: $e'); }
            return ResponseFailed(error: 'SSH command failed: $e');
        }
    }

    Future<void> logout() async {
        _profile = null;
        _client?.close();
        _client = null;
        _updateConnectionState(false);
    }

    void _updateConnectionState(bool state) {
        if (state != _isConnected) {
            if (kDebugMode) {
                print("Connection state: $state");
            }
            _isConnected = state;
            notifyListeners();
        }
    }

    void fakeConnect() async {
        _updateConnectionState(true);
    }

    SshProfile? getCurrentProfile() { return _profile; }

}
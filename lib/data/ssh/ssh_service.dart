import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/ssh/model/ssh_profile.dart';
import 'package:ls_server_app/data/ssh/model/connection_status.dart';
import 'package:ls_server_app/data/model/response_result.dart';

class SshService extends ChangeNotifier implements ValueListenable<bool> {
    SSHClient? _client;
    SshProfile? _profile;

    static final SshService _instance = SshService._internal();
    factory SshService() => _instance;

    SshService._internal();

    bool _isConnected = false;

    @override
    bool get value => _isConnected;

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
            ]);

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

    Future<void> startService(String service) async {
        _client?.execute("sudo systemctl start $service");
    }

    Future<void> stopService(String service) async {
        _client?.execute("sudo systemctl stop $service");
    }

    Future<bool> isServiceRunning(String service) async {
        final session = await _client?.execute('systemctl is-active $service');
        if (session != null) {
            final outputBytes = await session.stdout.fold<BytesBuilder>(
                BytesBuilder(),
                    (builder, data) => builder..add(data),
            );
            final output = utf8.decode(outputBytes.takeBytes()).trim();
            final status = output.trim();
            if (kDebugMode) { print('Service: $service, status: $status'); }
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
/*import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ls_server_app/data/model/server_profile.dart';
import 'package:ls_server_app/data/ssh/model/connection_status.dart';
import 'package:ls_server_app/feature/auth/presentation/old_auth_event.dart';
import 'package:ls_server_app/feature/auth/presentation/old_auth_state.dart';
import 'package:ls_server_app/feature/auth/use_case/auth_use_cases.dart';
import 'package:ls_server_app/feature/auth/use_case/ssh_connect_use_case.dart';

import '../data/ssh_connect_fields.dart';

class AuthViewModel extends ChangeNotifier {

    AuthViewModel({required AuthUseCases authUseCases})
        : _useCases = authUseCases
        {
            _init();
        }

    final AuthUseCases _useCases;
    AuthState _state = AuthState();
    AuthState get state => _state;

    final _uiEvent = StreamController<AuthUiEvent>();
    Stream<AuthUiEvent> get uiEvent => _uiEvent.stream;

    Future<void> _init() async {
        await _loadProfiles();
        await _loadPreferences();
        await _checkQuickConnectAvailability();
    }

    Future<void> onEvent(AuthEvent event) async {
        switch (event) {
            case LoadProfile():
                _loadProfile(event.profile);
            case LoadSshFile():
                _loadSshFile(event.sshFilePath);
            case UpdateSaveProfile():
                _state = _state.copyWith(saveProfile: event.saveProfile);
                notifyListeners();
            case UpdateEnableQuickConnect():
                _state = _state.copyWith(enableQuickConnect: event.enableQuickConnect);
                notifyListeners();
            case Connect(): {
                _setLoadingState(true);
                _resetErrors();
                final bool fieldsValid = _checkFields(
                    user: event.user,
                    url: event.serverUrl,
                    port: event.serverPort,
                    filePath: event.sshFilePath,
                    password: event.password
                );
                if (fieldsValid) {
                    _connect(
                        user: event.user,
                        url: event.serverUrl,
                        port: event.serverPort,
                        filePath: event.sshFilePath,
                        password: event.password,
                        saveProfile: event.saveProfile,
                        enableQuickConnect: event.saveProfile ? event.enableQuickConnect : false,
                        passwordRequestCallback: event.passwordRequestCallback
                    );
                }
                _setLoadingState(false);
            }
            case ClearError():
                _setError("");
            case FakeConnect():
                _useCases.fakeConnectUseCase.execute();
        }
    }

    Future<void> _loadProfiles() async {
        final List<ServerProfile> profiles = await _useCases.loadProfilesUseCase.execute();
        _state = _state.copyWith(profiles: profiles);
    }

    Future<void> _loadProfile(ServerProfile profile) async {
        _state = _state.copyWith(
            profile: profile,
            serverUrl: profile.url,
            serverPort: profile.port,
            user: profile.user,
            sshFilePath: profile.keyPath,
        );
        _loadSshFile(profile.keyPath);
        _uiEvent.add(SelectProfile(profile: profile));
    }

    Future<void> _loadPreferences() async {
        final ServerProfile? profile = await _useCases.loadAuthPreferencesUseCase.execute();
        if (profile != null) {
            if (kDebugMode) { print("preferences found for: ${profile.getIdentifier()}"); }
            _loadProfile(profile);
        }
    }

    Future<void> _checkQuickConnectAvailability() async {
        final bool available = await _useCases.checkQuickConnectAvailabilityUseCase.execute();
        _state = _state.copyWith(quickConnectAvailable: available);
        notifyListeners();
    }

    void _setError(String error) {
        _state = _state.copyWith(globalError: error);
        notifyListeners();
    }

    void _loadSshFile(String filePath) {
        try {
            final bool isPasswordRequired = _useCases.loadSshFileUseCase.execute(filePath);
            _state = _state.copyWith(
                passwordRequired: isPasswordRequired,
                sshFilePath: filePath
            );
            notifyListeners();
        } catch (e) {
            if (kDebugMode) { print("Couldn't load ssh file: $e"); }
        }
    }

    void _setLoadingState(bool loadingState) {
        _state = _state.copyWith(loading: loadingState);
        notifyListeners();
    }

    void _resetErrors() {
        _state = _state.copyWith(wrongFields: []);
        notifyListeners();
    }

    bool _checkFields({
        required String user,
        required String url,
        required String port,
        required String filePath,
        required String? password
    }) {
        final List<SshConnectFields> wrongFields = _useCases.checkWrongFieldsUseCase.execute(
            user: user,
            url: url,
            port: port,
            filePath: filePath,
            password: password,
            passwordRequired: _state.passwordRequired
        );

        _state = _state.copyWith(
            wrongFields: wrongFields
        );
        notifyListeners();

        return wrongFields.isEmpty;
    }

    Future<void> _connect({
        required String user,
        required String url,
        required String port,
        required String filePath,
        required String? password,
        required bool saveProfile,
        required bool enableQuickConnect,
        required Future<String?> Function() passwordRequestCallback
    }) async {
        final SshConnectDto dto = SshConnectDto(
            url: url,
            port: port,
            user: user,
            filePath: filePath,
            password: password,
            saveProfile: saveProfile,
            enableQuickConnect: enableQuickConnect,
            passwordRequestCallback: passwordRequestCallback
        );
        ConnectionStatus connectionStatus = await _useCases.sshConnectUseCase.execute(dto);
        switch (connectionStatus) {
            case ConnectionSucceed():
                _setError("");
            case ConnectionFailed():
                _setError(connectionStatus.error);
        }
    }
}

sealed class AuthUiEvent {}

class SelectProfile extends AuthUiEvent {
    final ServerProfile profile;
    SelectProfile({required this.profile});
}*/
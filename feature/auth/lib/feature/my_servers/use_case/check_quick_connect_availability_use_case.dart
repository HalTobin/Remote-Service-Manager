import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/foundation.dart';

class CheckQuickConnectAvailabilityUseCase {
    Future<bool> execute() async {
        final response = await BiometricStorage().canAuthenticate();
        if (kDebugMode) {
            print('Quick authentication status: $response');
        }
        return response == CanAuthenticateResponse.success;
    }
}
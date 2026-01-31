sealed class MyServersEvent {}

class SelectServer extends MyServersEvent {
    final int serverProfileId;
    SelectServer({required this.serverProfileId});
}

class EditionMode extends MyServersEvent {
    final int? serverProfileId;
    EditionMode({required this.serverProfileId});
}

class ConnectWithProfile extends MyServersEvent {
    final ConnectWithProfilePasswordMethod method;
    ConnectWithProfile({required this.method});
}

sealed class ConnectWithProfilePasswordMethod {
    static ConnectWithProfilePasswordMethod none() {
        return None();
    }
    static ConnectWithProfilePasswordMethod password(String password) {
        return Password(password: password);
    }
    static ConnectWithProfilePasswordMethod biometric() {
        return Biometrics();
    }
}

class None extends ConnectWithProfilePasswordMethod {}

class Password extends ConnectWithProfilePasswordMethod {
    final String password;
    Password({required this.password});
}

class Biometrics extends ConnectWithProfilePasswordMethod {}
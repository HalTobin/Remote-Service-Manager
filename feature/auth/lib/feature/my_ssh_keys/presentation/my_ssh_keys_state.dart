import 'package:ui/state/omit.dart';
import '../domain/ssh_key_file.dart';

class MySshKeysState {
    final List<SshKeyFile> keys;
    final bool loading;
    final String? selectedKeyPath;

    const MySshKeysState({
        this.keys = const [],
        this.loading = false,
        this.selectedKeyPath = null
    });

    MySshKeysState copyWith({
        Defaulted<List<SshKeyFile>> keys = const Omit(),
        Defaulted<bool> loading = const Omit(),
        Defaulted<String?> selectedKeyPath = const Omit()
    }) {
        return MySshKeysState(
            keys: keys is Omit ? this.keys : keys as List<SshKeyFile>,
            loading: loading is Omit ? this.loading : loading as bool,
            selectedKeyPath: selectedKeyPath is Omit ? this.selectedKeyPath : selectedKeyPath as String?
        );
    }
}
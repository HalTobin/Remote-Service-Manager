import 'package:flutter/cupertino.dart';
import 'package:ls_server_app/di/data_provider.dart';

class EntryPointProvider extends StatelessWidget {
  final Widget child;

  const EntryPointProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DataProvider(
      child: child
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:ls_server_app/feature/auth/feature/add_edit_server/presentation/add_edit_server_view.dart';
import 'package:provider/provider.dart';

import '../presentation/add_edit_server_viewmodel.dart';

class AddEditServerProvider extends StatelessWidget {
  final int? serverProfileId;
  final Function() onDismiss;

  const AddEditServerProvider({
    super.key,
    this.serverProfileId,
    required this.onDismiss
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: Consumer<AddEditServerViewModel>(
        builder: (context, viewmodel, child) {
          return AddEditServerView(
            serverProfileId: serverProfileId,
            state: viewmodel.state,
            onEvent: viewmodel.onEvent,
            onDismiss: onDismiss
          );
        }
      ),
    );
  }

}
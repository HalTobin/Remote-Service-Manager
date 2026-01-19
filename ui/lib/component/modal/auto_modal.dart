import 'package:flutter/material.dart';
import 'package:ui/screen_format/screen_format_helper.dart';

import '../app_dialog_layout.dart';

Future<void> autoModal({
  required BuildContext context,
  required BoxConstraints constraints,
  required Widget child
}) async {
  ScreenFormatHelper.isNarrow(constraints) ?
    showModalBottomSheet(
      context: context,
      builder: (_) => (child)
    )
    : showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AppDialogLayout(
        padding: EdgeInsets.zero,
        child: child
      )
    );
}
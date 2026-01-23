import 'package:flutter/material.dart';
import 'package:ui/navigation/esc_to_close.dart';
import 'package:ui/screen_format/screen_format_helper.dart';

import '../component/app_dialog_layout.dart';

Future<void> autoModal({
  required BuildContext context,
  required BoxConstraints constraints,
  required Widget child,
  bool dismissable = true
}) async {
  ScreenFormatHelper.isNarrow(constraints) ?
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => dismissable 
          ? EscToClose(child: Wrap(children: [child]))
          : Wrap(children: [child]),
    )
    : showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => dismissable
        ? EscToClose(child: AppDialogLayout(padding: EdgeInsets.zero, child: child))
        : AppDialogLayout(padding: EdgeInsets.zero, child: child)
    );
}
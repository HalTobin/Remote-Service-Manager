import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SshFilePickerField extends StatelessWidget {
  final bool enable;
  final bool error;
  final TextEditingController controller;
  final void Function(String path) onFilePicked;

  const SshFilePickerField({
    super.key,
    required this.enable,
    required this.error,
    required this.controller,
    required this.onFilePicked,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'SSH File Path',
        errorText: error ? "Select a valid SSH key" : null,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(LucideIcons.folder),
          onPressed: () async {
            if (enable) {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.single.path != null) {
                final String sshFile = result.files.single.path!;
                controller.text = sshFile;
                onFilePicked(sshFile);
              }
            }
          }
        ),
      ),
    );
  }
}
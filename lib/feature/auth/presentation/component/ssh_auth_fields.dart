import 'package:flutter/material.dart';
import 'package:ls_server_app/feature/auth/presentation/component/ssh_file_picker_field.dart';

import '../../data/ssh_connect_fields.dart';
import '../../util/profile_title_util.dart';

class SshAuthFields extends StatefulWidget {
  final bool enabled;

  final TextEditingController userController;
  final TextEditingController urlController;
  final TextEditingController portController;
  final TextEditingController sshController;
  final Function(String) loadSshFile;

  final List<SshConnectFields> wrongFields;

  const SshAuthFields({
    super.key,

    required this.enabled,
    required this.userController,
    required this.urlController,
    required this.portController,
    required this.sshController,
    required this.loadSshFile,

    required this.wrongFields
  });

  @override
  State<StatefulWidget> createState() => SshAuthFieldsState();

}

class SshAuthFieldsState extends State<SshAuthFields> {

  late String profileTitle = getProfileTitle(
      user: widget.userController.text,
      url: widget.urlController.text,
      port: widget.portController.text
  );

  void updateProfileTitle() {
    setState(() {
      profileTitle = getProfileTitle(
        user: widget.userController.text,
        url: widget.urlController.text,
        port: widget.portController.text
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              profileTitle,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 400;

            return Column(
              children: [

                isNarrow
                    ? Column(
                  children: [
                    TextFormField(
                      enabled: widget.enabled,
                      controller: widget.urlController,
                      onChanged: (_) => updateProfileTitle(),
                      decoration: InputDecoration(
                        labelText: 'Server URL',
                        errorText: widget.wrongFields.contains(SshConnectFields.url) ? "Required" : null,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        enabled: widget.enabled,
                        controller: widget.portController,
                        onChanged: (_) => updateProfileTitle(),
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: widget.wrongFields.contains(SshConnectFields.port) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: widget.enabled,
                        controller: widget.urlController,
                        onChanged: (_) => updateProfileTitle(),
                        decoration: InputDecoration(
                          labelText: 'Server URL',
                          errorText: widget.wrongFields.contains(SshConnectFields.url) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 96,
                      child: TextFormField(
                        enabled: widget.enabled,
                        controller: widget.portController,
                        onChanged: (_) => updateProfileTitle(),
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          counterText: '',
                          errorText: widget.wrongFields.contains(SshConnectFields.port) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                isNarrow
                    ? Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        enabled: widget.enabled,
                        controller: widget.userController,
                        onChanged: (_) => updateProfileTitle(),
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: widget.wrongFields.contains(SshConnectFields.user) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SshFilePickerField(
                      enable: widget.enabled,
                      error: widget.wrongFields.contains(SshConnectFields.filePath),
                      controller: widget.sshController,
                      onFilePicked: (path) => widget.loadSshFile(path),
                    ),
                  ],
                )
                    : Row(
                  children: [
                    SizedBox(
                      width: 128,
                      child: TextFormField(
                        enabled: widget.enabled,
                        controller: widget.userController,
                        onChanged: (_) => updateProfileTitle(),
                        decoration: InputDecoration(
                          labelText: 'User',
                          errorText: widget.wrongFields.contains(SshConnectFields.user) ? "Required" : null,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SshFilePickerField(
                        enable: widget.enabled,
                        error: widget.wrongFields.contains(SshConnectFields.filePath),
                        controller: widget.sshController,
                        onFilePicked: (path) => widget.loadSshFile(path),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )

      ],
    );
  }

}
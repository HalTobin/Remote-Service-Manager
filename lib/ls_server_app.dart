import 'package:flutter/material.dart';
import 'package:ls_server_app/di/main_provider.dart';

class LsServerApp extends StatelessWidget {
  const LsServerApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MainProvider(),
    );

  }
}
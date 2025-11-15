import 'package:flutter/material.dart';
import 'package:ls_server_app/di/entry_point_provider.dart';
import 'package:ls_server_app/ls_server_app.dart';

void main() {
  runApp(
    EntryPointProvider(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moino Service Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
          seedColor: Color(0xFF181933)
        ),
      ),
      home: const LsServerApp(),
    );

  }
}

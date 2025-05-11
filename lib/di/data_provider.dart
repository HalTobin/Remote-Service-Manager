import 'package:flutter/material.dart';
import 'package:ls_server_app/data/preferences/preference_repository.dart';
import 'package:ls_server_app/data/repository/server_profile_repository.dart';
import 'package:ls_server_app/data/ssh/ssh_service.dart';
import 'package:ls_server_app/data/db/dao/favorite_service_dao.dart';
import 'package:ls_server_app/data/db/dao/server_profile_dao.dart';
import 'package:ls_server_app/data/db/server_profile_database.dart';
import 'package:provider/provider.dart';

import '../data/repository/favorite_service_repository.dart';

class DataProvider extends StatelessWidget {
  final Widget child;

  const DataProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => (PreferenceRepository())),

        Provider(
          create: (context) => (ServerProfileDatabase()),
          dispose: (context, db) => db.close(),
        ),
        Provider(create: (context) => (ServerProfileDao(context.read()))),
        Provider(create: (context) => (FavoriteServiceDao(context.read()))),

        Provider(create: (context) => (ServerProfileRepository(dao: context.read()))),
        Provider(create: (context) => (FavoriteServiceRepository(dao: context.read()))),
        ChangeNotifierProvider(create: (_) => (SshService())),
      ],
      child: child
    );
  }
}
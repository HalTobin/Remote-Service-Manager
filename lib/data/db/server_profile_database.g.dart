// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_profile_database.dart';

// ignore_for_file: type=lint
class $ServerProfilesTable extends ServerProfiles
    with TableInfo<$ServerProfilesTable, ServerProfileEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServerProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<String> port = GeneratedColumn<String>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyPathMeta = const VerificationMeta(
    'keyPath',
  );
  @override
  late final GeneratedColumn<String> keyPath = GeneratedColumn<String>(
    'key_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quickConnectEnableMeta =
      const VerificationMeta('quickConnectEnable');
  @override
  late final GeneratedColumn<bool> quickConnectEnable = GeneratedColumn<bool>(
    'quick_connect_enable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("quick_connect_enable" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    url,
    port,
    user,
    keyPath,
    quickConnectEnable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'server_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServerProfileEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('key_path')) {
      context.handle(
        _keyPathMeta,
        keyPath.isAcceptableOrUnknown(data['key_path']!, _keyPathMeta),
      );
    } else if (isInserting) {
      context.missing(_keyPathMeta);
    }
    if (data.containsKey('quick_connect_enable')) {
      context.handle(
        _quickConnectEnableMeta,
        quickConnectEnable.isAcceptableOrUnknown(
          data['quick_connect_enable']!,
          _quickConnectEnableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quickConnectEnableMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServerProfileEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServerProfileEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      port:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}port'],
          )!,
      user:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user'],
          )!,
      keyPath:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}key_path'],
          )!,
      quickConnectEnable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}quick_connect_enable'],
          )!,
    );
  }

  @override
  $ServerProfilesTable createAlias(String alias) {
    return $ServerProfilesTable(attachedDatabase, alias);
  }
}

class ServerProfileEntity extends DataClass
    implements Insertable<ServerProfileEntity> {
  final int id;
  final String url;
  final String port;
  final String user;
  final String keyPath;
  final bool quickConnectEnable;
  const ServerProfileEntity({
    required this.id,
    required this.url,
    required this.port,
    required this.user,
    required this.keyPath,
    required this.quickConnectEnable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['port'] = Variable<String>(port);
    map['user'] = Variable<String>(user);
    map['key_path'] = Variable<String>(keyPath);
    map['quick_connect_enable'] = Variable<bool>(quickConnectEnable);
    return map;
  }

  ServerProfilesCompanion toCompanion(bool nullToAbsent) {
    return ServerProfilesCompanion(
      id: Value(id),
      url: Value(url),
      port: Value(port),
      user: Value(user),
      keyPath: Value(keyPath),
      quickConnectEnable: Value(quickConnectEnable),
    );
  }

  factory ServerProfileEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServerProfileEntity(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      port: serializer.fromJson<String>(json['port']),
      user: serializer.fromJson<String>(json['user']),
      keyPath: serializer.fromJson<String>(json['keyPath']),
      quickConnectEnable: serializer.fromJson<bool>(json['quickConnectEnable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'port': serializer.toJson<String>(port),
      'user': serializer.toJson<String>(user),
      'keyPath': serializer.toJson<String>(keyPath),
      'quickConnectEnable': serializer.toJson<bool>(quickConnectEnable),
    };
  }

  ServerProfileEntity copyWith({
    int? id,
    String? url,
    String? port,
    String? user,
    String? keyPath,
    bool? quickConnectEnable,
  }) => ServerProfileEntity(
    id: id ?? this.id,
    url: url ?? this.url,
    port: port ?? this.port,
    user: user ?? this.user,
    keyPath: keyPath ?? this.keyPath,
    quickConnectEnable: quickConnectEnable ?? this.quickConnectEnable,
  );
  ServerProfileEntity copyWithCompanion(ServerProfilesCompanion data) {
    return ServerProfileEntity(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      port: data.port.present ? data.port.value : this.port,
      user: data.user.present ? data.user.value : this.user,
      keyPath: data.keyPath.present ? data.keyPath.value : this.keyPath,
      quickConnectEnable:
          data.quickConnectEnable.present
              ? data.quickConnectEnable.value
              : this.quickConnectEnable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServerProfileEntity(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('port: $port, ')
          ..write('user: $user, ')
          ..write('keyPath: $keyPath, ')
          ..write('quickConnectEnable: $quickConnectEnable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, url, port, user, keyPath, quickConnectEnable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServerProfileEntity &&
          other.id == this.id &&
          other.url == this.url &&
          other.port == this.port &&
          other.user == this.user &&
          other.keyPath == this.keyPath &&
          other.quickConnectEnable == this.quickConnectEnable);
}

class ServerProfilesCompanion extends UpdateCompanion<ServerProfileEntity> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> port;
  final Value<String> user;
  final Value<String> keyPath;
  final Value<bool> quickConnectEnable;
  const ServerProfilesCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.port = const Value.absent(),
    this.user = const Value.absent(),
    this.keyPath = const Value.absent(),
    this.quickConnectEnable = const Value.absent(),
  });
  ServerProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String port,
    required String user,
    required String keyPath,
    required bool quickConnectEnable,
  }) : url = Value(url),
       port = Value(port),
       user = Value(user),
       keyPath = Value(keyPath),
       quickConnectEnable = Value(quickConnectEnable);
  static Insertable<ServerProfileEntity> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? port,
    Expression<String>? user,
    Expression<String>? keyPath,
    Expression<bool>? quickConnectEnable,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (port != null) 'port': port,
      if (user != null) 'user': user,
      if (keyPath != null) 'key_path': keyPath,
      if (quickConnectEnable != null)
        'quick_connect_enable': quickConnectEnable,
    });
  }

  ServerProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? url,
    Value<String>? port,
    Value<String>? user,
    Value<String>? keyPath,
    Value<bool>? quickConnectEnable,
  }) {
    return ServerProfilesCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      port: port ?? this.port,
      user: user ?? this.user,
      keyPath: keyPath ?? this.keyPath,
      quickConnectEnable: quickConnectEnable ?? this.quickConnectEnable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (port.present) {
      map['port'] = Variable<String>(port.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (keyPath.present) {
      map['key_path'] = Variable<String>(keyPath.value);
    }
    if (quickConnectEnable.present) {
      map['quick_connect_enable'] = Variable<bool>(quickConnectEnable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServerProfilesCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('port: $port, ')
          ..write('user: $user, ')
          ..write('keyPath: $keyPath, ')
          ..write('quickConnectEnable: $quickConnectEnable')
          ..write(')'))
        .toString();
  }
}

class $FavoriteServicesTable extends FavoriteServices
    with TableInfo<$FavoriteServicesTable, FavoriteServiceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteServicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES server_profiles (id)',
    ),
  );
  static const VerificationMeta _serviceNameMeta = const VerificationMeta(
    'serviceName',
  );
  @override
  late final GeneratedColumn<String> serviceName = GeneratedColumn<String>(
    'service_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String> alias = GeneratedColumn<String>(
    'alias',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconIdMeta = const VerificationMeta('iconId');
  @override
  late final GeneratedColumn<int> iconId = GeneratedColumn<int>(
    'icon_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    serviceName,
    alias,
    iconId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_services';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteServiceEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('service_name')) {
      context.handle(
        _serviceNameMeta,
        serviceName.isAcceptableOrUnknown(
          data['service_name']!,
          _serviceNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceNameMeta);
    }
    if (data.containsKey('alias')) {
      context.handle(
        _aliasMeta,
        alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta),
      );
    }
    if (data.containsKey('icon_id')) {
      context.handle(
        _iconIdMeta,
        iconId.isAcceptableOrUnknown(data['icon_id']!, _iconIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteServiceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteServiceEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      profileId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}profile_id'],
          )!,
      serviceName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}service_name'],
          )!,
      alias: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alias'],
      ),
      iconId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_id'],
      ),
    );
  }

  @override
  $FavoriteServicesTable createAlias(String alias) {
    return $FavoriteServicesTable(attachedDatabase, alias);
  }
}

class FavoriteServiceEntity extends DataClass
    implements Insertable<FavoriteServiceEntity> {
  final int id;
  final int profileId;
  final String serviceName;
  final String? alias;
  final int? iconId;
  const FavoriteServiceEntity({
    required this.id,
    required this.profileId,
    required this.serviceName,
    this.alias,
    this.iconId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['service_name'] = Variable<String>(serviceName);
    if (!nullToAbsent || alias != null) {
      map['alias'] = Variable<String>(alias);
    }
    if (!nullToAbsent || iconId != null) {
      map['icon_id'] = Variable<int>(iconId);
    }
    return map;
  }

  FavoriteServicesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteServicesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      serviceName: Value(serviceName),
      alias:
          alias == null && nullToAbsent ? const Value.absent() : Value(alias),
      iconId:
          iconId == null && nullToAbsent ? const Value.absent() : Value(iconId),
    );
  }

  factory FavoriteServiceEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteServiceEntity(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      serviceName: serializer.fromJson<String>(json['serviceName']),
      alias: serializer.fromJson<String?>(json['alias']),
      iconId: serializer.fromJson<int?>(json['iconId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'serviceName': serializer.toJson<String>(serviceName),
      'alias': serializer.toJson<String?>(alias),
      'iconId': serializer.toJson<int?>(iconId),
    };
  }

  FavoriteServiceEntity copyWith({
    int? id,
    int? profileId,
    String? serviceName,
    Value<String?> alias = const Value.absent(),
    Value<int?> iconId = const Value.absent(),
  }) => FavoriteServiceEntity(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    serviceName: serviceName ?? this.serviceName,
    alias: alias.present ? alias.value : this.alias,
    iconId: iconId.present ? iconId.value : this.iconId,
  );
  FavoriteServiceEntity copyWithCompanion(FavoriteServicesCompanion data) {
    return FavoriteServiceEntity(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      serviceName:
          data.serviceName.present ? data.serviceName.value : this.serviceName,
      alias: data.alias.present ? data.alias.value : this.alias,
      iconId: data.iconId.present ? data.iconId.value : this.iconId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteServiceEntity(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('serviceName: $serviceName, ')
          ..write('alias: $alias, ')
          ..write('iconId: $iconId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, serviceName, alias, iconId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteServiceEntity &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.serviceName == this.serviceName &&
          other.alias == this.alias &&
          other.iconId == this.iconId);
}

class FavoriteServicesCompanion extends UpdateCompanion<FavoriteServiceEntity> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> serviceName;
  final Value<String?> alias;
  final Value<int?> iconId;
  const FavoriteServicesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.serviceName = const Value.absent(),
    this.alias = const Value.absent(),
    this.iconId = const Value.absent(),
  });
  FavoriteServicesCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String serviceName,
    this.alias = const Value.absent(),
    this.iconId = const Value.absent(),
  }) : profileId = Value(profileId),
       serviceName = Value(serviceName);
  static Insertable<FavoriteServiceEntity> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? serviceName,
    Expression<String>? alias,
    Expression<int>? iconId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (serviceName != null) 'service_name': serviceName,
      if (alias != null) 'alias': alias,
      if (iconId != null) 'icon_id': iconId,
    });
  }

  FavoriteServicesCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? serviceName,
    Value<String?>? alias,
    Value<int?>? iconId,
  }) {
    return FavoriteServicesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      serviceName: serviceName ?? this.serviceName,
      alias: alias ?? this.alias,
      iconId: iconId ?? this.iconId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (serviceName.present) {
      map['service_name'] = Variable<String>(serviceName.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (iconId.present) {
      map['icon_id'] = Variable<int>(iconId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteServicesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('serviceName: $serviceName, ')
          ..write('alias: $alias, ')
          ..write('iconId: $iconId')
          ..write(')'))
        .toString();
  }
}

abstract class _$ServerProfileDatabase extends GeneratedDatabase {
  _$ServerProfileDatabase(QueryExecutor e) : super(e);
  $ServerProfileDatabaseManager get managers =>
      $ServerProfileDatabaseManager(this);
  late final $ServerProfilesTable serverProfiles = $ServerProfilesTable(this);
  late final $FavoriteServicesTable favoriteServices = $FavoriteServicesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    serverProfiles,
    favoriteServices,
  ];
}

typedef $$ServerProfilesTableCreateCompanionBuilder =
    ServerProfilesCompanion Function({
      Value<int> id,
      required String url,
      required String port,
      required String user,
      required String keyPath,
      required bool quickConnectEnable,
    });
typedef $$ServerProfilesTableUpdateCompanionBuilder =
    ServerProfilesCompanion Function({
      Value<int> id,
      Value<String> url,
      Value<String> port,
      Value<String> user,
      Value<String> keyPath,
      Value<bool> quickConnectEnable,
    });

final class $$ServerProfilesTableReferences
    extends
        BaseReferences<
          _$ServerProfileDatabase,
          $ServerProfilesTable,
          ServerProfileEntity
        > {
  $$ServerProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $FavoriteServicesTable,
    List<FavoriteServiceEntity>
  >
  _favoriteServicesRefsTable(_$ServerProfileDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.favoriteServices,
        aliasName: $_aliasNameGenerator(
          db.serverProfiles.id,
          db.favoriteServices.profileId,
        ),
      );

  $$FavoriteServicesTableProcessedTableManager get favoriteServicesRefs {
    final manager = $$FavoriteServicesTableTableManager(
      $_db,
      $_db.favoriteServices,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _favoriteServicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServerProfilesTableFilterComposer
    extends Composer<_$ServerProfileDatabase, $ServerProfilesTable> {
  $$ServerProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyPath => $composableBuilder(
    column: $table.keyPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get quickConnectEnable => $composableBuilder(
    column: $table.quickConnectEnable,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> favoriteServicesRefs(
    Expression<bool> Function($$FavoriteServicesTableFilterComposer f) f,
  ) {
    final $$FavoriteServicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoriteServices,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoriteServicesTableFilterComposer(
            $db: $db,
            $table: $db.favoriteServices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServerProfilesTableOrderingComposer
    extends Composer<_$ServerProfileDatabase, $ServerProfilesTable> {
  $$ServerProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get user => $composableBuilder(
    column: $table.user,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyPath => $composableBuilder(
    column: $table.keyPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get quickConnectEnable => $composableBuilder(
    column: $table.quickConnectEnable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServerProfilesTableAnnotationComposer
    extends Composer<_$ServerProfileDatabase, $ServerProfilesTable> {
  $$ServerProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<String> get user =>
      $composableBuilder(column: $table.user, builder: (column) => column);

  GeneratedColumn<String> get keyPath =>
      $composableBuilder(column: $table.keyPath, builder: (column) => column);

  GeneratedColumn<bool> get quickConnectEnable => $composableBuilder(
    column: $table.quickConnectEnable,
    builder: (column) => column,
  );

  Expression<T> favoriteServicesRefs<T extends Object>(
    Expression<T> Function($$FavoriteServicesTableAnnotationComposer a) f,
  ) {
    final $$FavoriteServicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoriteServices,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoriteServicesTableAnnotationComposer(
            $db: $db,
            $table: $db.favoriteServices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServerProfilesTableTableManager
    extends
        RootTableManager<
          _$ServerProfileDatabase,
          $ServerProfilesTable,
          ServerProfileEntity,
          $$ServerProfilesTableFilterComposer,
          $$ServerProfilesTableOrderingComposer,
          $$ServerProfilesTableAnnotationComposer,
          $$ServerProfilesTableCreateCompanionBuilder,
          $$ServerProfilesTableUpdateCompanionBuilder,
          (ServerProfileEntity, $$ServerProfilesTableReferences),
          ServerProfileEntity,
          PrefetchHooks Function({bool favoriteServicesRefs})
        > {
  $$ServerProfilesTableTableManager(
    _$ServerProfileDatabase db,
    $ServerProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ServerProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ServerProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ServerProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> port = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<String> keyPath = const Value.absent(),
                Value<bool> quickConnectEnable = const Value.absent(),
              }) => ServerProfilesCompanion(
                id: id,
                url: url,
                port: port,
                user: user,
                keyPath: keyPath,
                quickConnectEnable: quickConnectEnable,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String url,
                required String port,
                required String user,
                required String keyPath,
                required bool quickConnectEnable,
              }) => ServerProfilesCompanion.insert(
                id: id,
                url: url,
                port: port,
                user: user,
                keyPath: keyPath,
                quickConnectEnable: quickConnectEnable,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ServerProfilesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({favoriteServicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (favoriteServicesRefs) db.favoriteServices,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (favoriteServicesRefs)
                    await $_getPrefetchedData<
                      ServerProfileEntity,
                      $ServerProfilesTable,
                      FavoriteServiceEntity
                    >(
                      currentTable: table,
                      referencedTable: $$ServerProfilesTableReferences
                          ._favoriteServicesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ServerProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).favoriteServicesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.profileId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ServerProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$ServerProfileDatabase,
      $ServerProfilesTable,
      ServerProfileEntity,
      $$ServerProfilesTableFilterComposer,
      $$ServerProfilesTableOrderingComposer,
      $$ServerProfilesTableAnnotationComposer,
      $$ServerProfilesTableCreateCompanionBuilder,
      $$ServerProfilesTableUpdateCompanionBuilder,
      (ServerProfileEntity, $$ServerProfilesTableReferences),
      ServerProfileEntity,
      PrefetchHooks Function({bool favoriteServicesRefs})
    >;
typedef $$FavoriteServicesTableCreateCompanionBuilder =
    FavoriteServicesCompanion Function({
      Value<int> id,
      required int profileId,
      required String serviceName,
      Value<String?> alias,
      Value<int?> iconId,
    });
typedef $$FavoriteServicesTableUpdateCompanionBuilder =
    FavoriteServicesCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> serviceName,
      Value<String?> alias,
      Value<int?> iconId,
    });

final class $$FavoriteServicesTableReferences
    extends
        BaseReferences<
          _$ServerProfileDatabase,
          $FavoriteServicesTable,
          FavoriteServiceEntity
        > {
  $$FavoriteServicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ServerProfilesTable _profileIdTable(_$ServerProfileDatabase db) =>
      db.serverProfiles.createAlias(
        $_aliasNameGenerator(
          db.favoriteServices.profileId,
          db.serverProfiles.id,
        ),
      );

  $$ServerProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ServerProfilesTableTableManager(
      $_db,
      $_db.serverProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoriteServicesTableFilterComposer
    extends Composer<_$ServerProfileDatabase, $FavoriteServicesTable> {
  $$FavoriteServicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnFilters(column),
  );

  $$ServerProfilesTableFilterComposer get profileId {
    final $$ServerProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.serverProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServerProfilesTableFilterComposer(
            $db: $db,
            $table: $db.serverProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteServicesTableOrderingComposer
    extends Composer<_$ServerProfileDatabase, $FavoriteServicesTable> {
  $$FavoriteServicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconId => $composableBuilder(
    column: $table.iconId,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServerProfilesTableOrderingComposer get profileId {
    final $$ServerProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.serverProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServerProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.serverProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteServicesTableAnnotationComposer
    extends Composer<_$ServerProfileDatabase, $FavoriteServicesTable> {
  $$FavoriteServicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alias =>
      $composableBuilder(column: $table.alias, builder: (column) => column);

  GeneratedColumn<int> get iconId =>
      $composableBuilder(column: $table.iconId, builder: (column) => column);

  $$ServerProfilesTableAnnotationComposer get profileId {
    final $$ServerProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.serverProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServerProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.serverProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteServicesTableTableManager
    extends
        RootTableManager<
          _$ServerProfileDatabase,
          $FavoriteServicesTable,
          FavoriteServiceEntity,
          $$FavoriteServicesTableFilterComposer,
          $$FavoriteServicesTableOrderingComposer,
          $$FavoriteServicesTableAnnotationComposer,
          $$FavoriteServicesTableCreateCompanionBuilder,
          $$FavoriteServicesTableUpdateCompanionBuilder,
          (FavoriteServiceEntity, $$FavoriteServicesTableReferences),
          FavoriteServiceEntity,
          PrefetchHooks Function({bool profileId})
        > {
  $$FavoriteServicesTableTableManager(
    _$ServerProfileDatabase db,
    $FavoriteServicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$FavoriteServicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FavoriteServicesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FavoriteServicesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> serviceName = const Value.absent(),
                Value<String?> alias = const Value.absent(),
                Value<int?> iconId = const Value.absent(),
              }) => FavoriteServicesCompanion(
                id: id,
                profileId: profileId,
                serviceName: serviceName,
                alias: alias,
                iconId: iconId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String serviceName,
                Value<String?> alias = const Value.absent(),
                Value<int?> iconId = const Value.absent(),
              }) => FavoriteServicesCompanion.insert(
                id: id,
                profileId: profileId,
                serviceName: serviceName,
                alias: alias,
                iconId: iconId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$FavoriteServicesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (profileId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.profileId,
                            referencedTable: $$FavoriteServicesTableReferences
                                ._profileIdTable(db),
                            referencedColumn:
                                $$FavoriteServicesTableReferences
                                    ._profileIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoriteServicesTableProcessedTableManager =
    ProcessedTableManager<
      _$ServerProfileDatabase,
      $FavoriteServicesTable,
      FavoriteServiceEntity,
      $$FavoriteServicesTableFilterComposer,
      $$FavoriteServicesTableOrderingComposer,
      $$FavoriteServicesTableAnnotationComposer,
      $$FavoriteServicesTableCreateCompanionBuilder,
      $$FavoriteServicesTableUpdateCompanionBuilder,
      (FavoriteServiceEntity, $$FavoriteServicesTableReferences),
      FavoriteServiceEntity,
      PrefetchHooks Function({bool profileId})
    >;

class $ServerProfileDatabaseManager {
  final _$ServerProfileDatabase _db;
  $ServerProfileDatabaseManager(this._db);
  $$ServerProfilesTableTableManager get serverProfiles =>
      $$ServerProfilesTableTableManager(_db, _db.serverProfiles);
  $$FavoriteServicesTableTableManager get favoriteServices =>
      $$FavoriteServicesTableTableManager(_db, _db.favoriteServices);
}

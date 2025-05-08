// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, DUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'createdAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updatedAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    image,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<DUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('createdAt')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DUser(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}createdAt'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updatedAt'],
          )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class DUser extends DataClass implements Insertable<DUser> {
  final String id;
  final String name;
  final String email;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DUser({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['createdAt'] = Variable<DateTime>(createdAt);
    map['updatedAt'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DUser(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      image: serializer.fromJson<String?>(json['image']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'image': serializer.toJson<String?>(image),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DUser copyWith({
    String? id,
    String? name,
    String? email,
    Value<String?> image = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DUser(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    image: image.present ? image.value : this.image,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DUser copyWithCompanion(UsersCompanion data) {
    return DUser(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      image: data.image.present ? data.image.value : this.image,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DUser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, image, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DUser &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.image == this.image &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<DUser> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String?> image;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.image = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String name,
    required String email,
    this.image = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       email = Value(email),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DUser> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? image,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (image != null) 'image': image,
      if (createdAt != null) 'createdAt': createdAt,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String?>? image,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('image: $image, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, DSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expiresAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'createdAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updatedAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipAddressMeta = const VerificationMeta(
    'ipAddress',
  );
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ipAddress',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceNameMeta = const VerificationMeta(
    'deviceName',
  );
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
    'deviceName',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DeviceType, String> deviceType =
      GeneratedColumn<String>(
        'deviceType',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DeviceType>($SessionsTable.$converterdeviceType);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    expiresAt,
    token,
    createdAt,
    updatedAt,
    ipAddress,
    deviceName,
    deviceType,
    user,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<DSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('expiresAt')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expiresAt']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('ipAddress')) {
      context.handle(
        _ipAddressMeta,
        ipAddress.isAcceptableOrUnknown(data['ipAddress']!, _ipAddressMeta),
      );
    }
    if (data.containsKey('deviceName')) {
      context.handle(
        _deviceNameMeta,
        deviceName.isAcceptableOrUnknown(data['deviceName']!, _deviceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DSession(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      expiresAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}expiresAt'],
          )!,
      token:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}token'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}createdAt'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updatedAt'],
          )!,
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ipAddress'],
      ),
      deviceName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}deviceName'],
          )!,
      deviceType: $SessionsTable.$converterdeviceType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}deviceType'],
        )!,
      ),
      user:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user'],
          )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DeviceType, String, String> $converterdeviceType =
      const EnumNameConverter<DeviceType>(DeviceType.values);
}

class DSession extends DataClass implements Insertable<DSession> {
  final String id;
  final DateTime expiresAt;
  final String token;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? ipAddress;
  final String deviceName;
  final DeviceType deviceType;
  final String user;
  const DSession({
    required this.id,
    required this.expiresAt,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    this.ipAddress,
    required this.deviceName,
    required this.deviceType,
    required this.user,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['expiresAt'] = Variable<DateTime>(expiresAt);
    map['token'] = Variable<String>(token);
    map['createdAt'] = Variable<DateTime>(createdAt);
    map['updatedAt'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || ipAddress != null) {
      map['ipAddress'] = Variable<String>(ipAddress);
    }
    map['deviceName'] = Variable<String>(deviceName);
    {
      map['deviceType'] = Variable<String>(
        $SessionsTable.$converterdeviceType.toSql(deviceType),
      );
    }
    map['user'] = Variable<String>(user);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      expiresAt: Value(expiresAt),
      token: Value(token),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      ipAddress:
          ipAddress == null && nullToAbsent
              ? const Value.absent()
              : Value(ipAddress),
      deviceName: Value(deviceName),
      deviceType: Value(deviceType),
      user: Value(user),
    );
  }

  factory DSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DSession(
      id: serializer.fromJson<String>(json['id']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
      token: serializer.fromJson<String>(json['token']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
      deviceType: $SessionsTable.$converterdeviceType.fromJson(
        serializer.fromJson<String>(json['deviceType']),
      ),
      user: serializer.fromJson<String>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
      'token': serializer.toJson<String>(token),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'deviceName': serializer.toJson<String>(deviceName),
      'deviceType': serializer.toJson<String>(
        $SessionsTable.$converterdeviceType.toJson(deviceType),
      ),
      'user': serializer.toJson<String>(user),
    };
  }

  DSession copyWith({
    String? id,
    DateTime? expiresAt,
    String? token,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> ipAddress = const Value.absent(),
    String? deviceName,
    DeviceType? deviceType,
    String? user,
  }) => DSession(
    id: id ?? this.id,
    expiresAt: expiresAt ?? this.expiresAt,
    token: token ?? this.token,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
    deviceName: deviceName ?? this.deviceName,
    deviceType: deviceType ?? this.deviceType,
    user: user ?? this.user,
  );
  DSession copyWithCompanion(SessionsCompanion data) {
    return DSession(
      id: data.id.present ? data.id.value : this.id,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      token: data.token.present ? data.token.value : this.token,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      deviceName:
          data.deviceName.present ? data.deviceName.value : this.deviceName,
      deviceType:
          data.deviceType.present ? data.deviceType.value : this.deviceType,
      user: data.user.present ? data.user.value : this.user,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DSession(')
          ..write('id: $id, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('token: $token, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('deviceName: $deviceName, ')
          ..write('deviceType: $deviceType, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    expiresAt,
    token,
    createdAt,
    updatedAt,
    ipAddress,
    deviceName,
    deviceType,
    user,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DSession &&
          other.id == this.id &&
          other.expiresAt == this.expiresAt &&
          other.token == this.token &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.ipAddress == this.ipAddress &&
          other.deviceName == this.deviceName &&
          other.deviceType == this.deviceType &&
          other.user == this.user);
}

class SessionsCompanion extends UpdateCompanion<DSession> {
  final Value<String> id;
  final Value<DateTime> expiresAt;
  final Value<String> token;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> ipAddress;
  final Value<String> deviceName;
  final Value<DeviceType> deviceType;
  final Value<String> user;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.token = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.deviceType = const Value.absent(),
    this.user = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    required DateTime expiresAt,
    required String token,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.ipAddress = const Value.absent(),
    required String deviceName,
    required DeviceType deviceType,
    required String user,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       expiresAt = Value(expiresAt),
       token = Value(token),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       deviceName = Value(deviceName),
       deviceType = Value(deviceType),
       user = Value(user);
  static Insertable<DSession> custom({
    Expression<String>? id,
    Expression<DateTime>? expiresAt,
    Expression<String>? token,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? ipAddress,
    Expression<String>? deviceName,
    Expression<String>? deviceType,
    Expression<String>? user,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (expiresAt != null) 'expiresAt': expiresAt,
      if (token != null) 'token': token,
      if (createdAt != null) 'createdAt': createdAt,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (deviceName != null) 'deviceName': deviceName,
      if (deviceType != null) 'deviceType': deviceType,
      if (user != null) 'user': user,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? expiresAt,
    Value<String>? token,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? ipAddress,
    Value<String>? deviceName,
    Value<DeviceType>? deviceType,
    Value<String>? user,
    Value<int>? rowid,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      expiresAt: expiresAt ?? this.expiresAt,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ipAddress: ipAddress ?? this.ipAddress,
      deviceName: deviceName ?? this.deviceName,
      deviceType: deviceType ?? this.deviceType,
      user: user ?? this.user,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (expiresAt.present) {
      map['expiresAt'] = Variable<DateTime>(expiresAt.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<DateTime>(updatedAt.value);
    }
    if (ipAddress.present) {
      map['ipAddress'] = Variable<String>(ipAddress.value);
    }
    if (deviceName.present) {
      map['deviceName'] = Variable<String>(deviceName.value);
    }
    if (deviceType.present) {
      map['deviceType'] = Variable<String>(
        $SessionsTable.$converterdeviceType.toSql(deviceType.value),
      );
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('token: $token, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('deviceName: $deviceName, ')
          ..write('deviceType: $deviceType, ')
          ..write('user: $user, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, DBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbn10Meta = const VerificationMeta('isbn10');
  @override
  late final GeneratedColumn<String> isbn10 = GeneratedColumn<String>(
    'isbn10',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> genres =
      GeneratedColumn<String>(
        'genres',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($BooksTable.$convertergenres);
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<int> pages = GeneratedColumn<int>(
    'pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readersMeta = const VerificationMeta(
    'readers',
  );
  @override
  late final GeneratedColumn<int> readers = GeneratedColumn<int>(
    'readers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
    'releaseDate',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<Author>, String> authors =
      GeneratedColumn<String>(
        'authors',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<Author>>($BooksTable.$converterauthors);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    image,
    isbn10,
    isbn13,
    genres,
    pages,
    readers,
    releaseDate,
    authors,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<DBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('isbn10')) {
      context.handle(
        _isbn10Meta,
        isbn10.isAcceptableOrUnknown(data['isbn10']!, _isbn10Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn10Meta);
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn13Meta);
    }
    if (data.containsKey('pages')) {
      context.handle(
        _pagesMeta,
        pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta),
      );
    } else if (isInserting) {
      context.missing(_pagesMeta);
    }
    if (data.containsKey('readers')) {
      context.handle(
        _readersMeta,
        readers.isAcceptableOrUnknown(data['readers']!, _readersMeta),
      );
    } else if (isInserting) {
      context.missing(_readersMeta);
    }
    if (data.containsKey('releaseDate')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['releaseDate']!,
          _releaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {isbn13};
  @override
  DBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBook(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
      isbn10:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}isbn10'],
          )!,
      isbn13:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}isbn13'],
          )!,
      genres: $BooksTable.$convertergenres.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}genres'],
        )!,
      ),
      pages:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}pages'],
          )!,
      readers:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}readers'],
          )!,
      releaseDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}releaseDate'],
          )!,
      authors: $BooksTable.$converterauthors.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}authors'],
        )!,
      ),
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertergenres =
      StringListConverter();
  static TypeConverter<List<Author>, String> $converterauthors =
      AuthorListConverter();
}

class DBook extends DataClass implements Insertable<DBook> {
  final int id;
  final String title;
  final String description;
  final String image;
  final String isbn10;
  final String isbn13;
  final List<String> genres;
  final int pages;
  final int readers;
  final DateTime releaseDate;
  final List<Author> authors;
  const DBook({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.isbn10,
    required this.isbn13,
    required this.genres,
    required this.pages,
    required this.readers,
    required this.releaseDate,
    required this.authors,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['isbn10'] = Variable<String>(isbn10);
    map['isbn13'] = Variable<String>(isbn13);
    {
      map['genres'] = Variable<String>(
        $BooksTable.$convertergenres.toSql(genres),
      );
    }
    map['pages'] = Variable<int>(pages);
    map['readers'] = Variable<int>(readers);
    map['releaseDate'] = Variable<DateTime>(releaseDate);
    {
      map['authors'] = Variable<String>(
        $BooksTable.$converterauthors.toSql(authors),
      );
    }
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      image: Value(image),
      isbn10: Value(isbn10),
      isbn13: Value(isbn13),
      genres: Value(genres),
      pages: Value(pages),
      readers: Value(readers),
      releaseDate: Value(releaseDate),
      authors: Value(authors),
    );
  }

  factory DBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBook(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      isbn10: serializer.fromJson<String>(json['isbn10']),
      isbn13: serializer.fromJson<String>(json['isbn13']),
      genres: serializer.fromJson<List<String>>(json['genres']),
      pages: serializer.fromJson<int>(json['pages']),
      readers: serializer.fromJson<int>(json['readers']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
      authors: serializer.fromJson<List<Author>>(json['authors']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'isbn10': serializer.toJson<String>(isbn10),
      'isbn13': serializer.toJson<String>(isbn13),
      'genres': serializer.toJson<List<String>>(genres),
      'pages': serializer.toJson<int>(pages),
      'readers': serializer.toJson<int>(readers),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
      'authors': serializer.toJson<List<Author>>(authors),
    };
  }

  DBook copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    String? isbn10,
    String? isbn13,
    List<String>? genres,
    int? pages,
    int? readers,
    DateTime? releaseDate,
    List<Author>? authors,
  }) => DBook(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    image: image ?? this.image,
    isbn10: isbn10 ?? this.isbn10,
    isbn13: isbn13 ?? this.isbn13,
    genres: genres ?? this.genres,
    pages: pages ?? this.pages,
    readers: readers ?? this.readers,
    releaseDate: releaseDate ?? this.releaseDate,
    authors: authors ?? this.authors,
  );
  DBook copyWithCompanion(BooksCompanion data) {
    return DBook(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      isbn10: data.isbn10.present ? data.isbn10.value : this.isbn10,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      genres: data.genres.present ? data.genres.value : this.genres,
      pages: data.pages.present ? data.pages.value : this.pages,
      readers: data.readers.present ? data.readers.value : this.readers,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      authors: data.authors.present ? data.authors.value : this.authors,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DBook(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('genres: $genres, ')
          ..write('pages: $pages, ')
          ..write('readers: $readers, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('authors: $authors')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    image,
    isbn10,
    isbn13,
    genres,
    pages,
    readers,
    releaseDate,
    authors,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBook &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.isbn10 == this.isbn10 &&
          other.isbn13 == this.isbn13 &&
          other.genres == this.genres &&
          other.pages == this.pages &&
          other.readers == this.readers &&
          other.releaseDate == this.releaseDate &&
          other.authors == this.authors);
}

class BooksCompanion extends UpdateCompanion<DBook> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> image;
  final Value<String> isbn10;
  final Value<String> isbn13;
  final Value<List<String>> genres;
  final Value<int> pages;
  final Value<int> readers;
  final Value<DateTime> releaseDate;
  final Value<List<Author>> authors;
  final Value<int> rowid;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.isbn10 = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.genres = const Value.absent(),
    this.pages = const Value.absent(),
    this.readers = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.authors = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required int id,
    required String title,
    required String description,
    required String image,
    required String isbn10,
    required String isbn13,
    required List<String> genres,
    required int pages,
    required int readers,
    required DateTime releaseDate,
    required List<Author> authors,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       image = Value(image),
       isbn10 = Value(isbn10),
       isbn13 = Value(isbn13),
       genres = Value(genres),
       pages = Value(pages),
       readers = Value(readers),
       releaseDate = Value(releaseDate),
       authors = Value(authors);
  static Insertable<DBook> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? isbn10,
    Expression<String>? isbn13,
    Expression<String>? genres,
    Expression<int>? pages,
    Expression<int>? readers,
    Expression<DateTime>? releaseDate,
    Expression<String>? authors,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (isbn10 != null) 'isbn10': isbn10,
      if (isbn13 != null) 'isbn13': isbn13,
      if (genres != null) 'genres': genres,
      if (pages != null) 'pages': pages,
      if (readers != null) 'readers': readers,
      if (releaseDate != null) 'releaseDate': releaseDate,
      if (authors != null) 'authors': authors,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? image,
    Value<String>? isbn10,
    Value<String>? isbn13,
    Value<List<String>>? genres,
    Value<int>? pages,
    Value<int>? readers,
    Value<DateTime>? releaseDate,
    Value<List<Author>>? authors,
    Value<int>? rowid,
  }) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
      genres: genres ?? this.genres,
      pages: pages ?? this.pages,
      readers: readers ?? this.readers,
      releaseDate: releaseDate ?? this.releaseDate,
      authors: authors ?? this.authors,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isbn10.present) {
      map['isbn10'] = Variable<String>(isbn10.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(
        $BooksTable.$convertergenres.toSql(genres.value),
      );
    }
    if (pages.present) {
      map['pages'] = Variable<int>(pages.value);
    }
    if (readers.present) {
      map['readers'] = Variable<int>(readers.value);
    }
    if (releaseDate.present) {
      map['releaseDate'] = Variable<DateTime>(releaseDate.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(
        $BooksTable.$converterauthors.toSql(authors.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('genres: $genres, ')
          ..write('pages: $pages, ')
          ..write('readers: $readers, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('authors: $authors, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LibraryBooksTable extends LibraryBooks
    with TableInfo<$LibraryBooksTable, DLibraryBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LibraryBooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbn10Meta = const VerificationMeta('isbn10');
  @override
  late final GeneratedColumn<String> isbn10 = GeneratedColumn<String>(
    'isbn10',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<BookStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<BookStatus>($LibraryBooksTable.$converterstatus);
  static const VerificationMeta _finishedOnMeta = const VerificationMeta(
    'finishedOn',
  );
  @override
  late final GeneratedColumn<DateTime> finishedOn = GeneratedColumn<DateTime>(
    'finishedOn',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'createdAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updatedAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    progress,
    isbn10,
    isbn13,
    status,
    finishedOn,
    path,
    user,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'libraryBooks';
  @override
  VerificationContext validateIntegrity(
    Insertable<DLibraryBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('isbn10')) {
      context.handle(
        _isbn10Meta,
        isbn10.isAcceptableOrUnknown(data['isbn10']!, _isbn10Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn10Meta);
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn13Meta);
    }
    if (data.containsKey('finishedOn')) {
      context.handle(
        _finishedOnMeta,
        finishedOn.isAcceptableOrUnknown(data['finishedOn']!, _finishedOnMeta),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    }
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DLibraryBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DLibraryBook(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      progress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}progress'],
          )!,
      isbn10:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}isbn10'],
          )!,
      isbn13:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}isbn13'],
          )!,
      status: $LibraryBooksTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      finishedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finishedOn'],
      ),
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      ),
      user:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}createdAt'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updatedAt'],
          )!,
    );
  }

  @override
  $LibraryBooksTable createAlias(String alias) {
    return $LibraryBooksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BookStatus, String, String> $converterstatus =
      const EnumNameConverter<BookStatus>(BookStatus.values);
}

class DLibraryBook extends DataClass implements Insertable<DLibraryBook> {
  final String id;
  final double progress;
  final String isbn10;
  final String isbn13;
  final BookStatus status;
  final DateTime? finishedOn;
  final String? path;
  final String user;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DLibraryBook({
    required this.id,
    required this.progress,
    required this.isbn10,
    required this.isbn13,
    required this.status,
    this.finishedOn,
    this.path,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['progress'] = Variable<double>(progress);
    map['isbn10'] = Variable<String>(isbn10);
    map['isbn13'] = Variable<String>(isbn13);
    {
      map['status'] = Variable<String>(
        $LibraryBooksTable.$converterstatus.toSql(status),
      );
    }
    if (!nullToAbsent || finishedOn != null) {
      map['finishedOn'] = Variable<DateTime>(finishedOn);
    }
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    map['user'] = Variable<String>(user);
    map['createdAt'] = Variable<DateTime>(createdAt);
    map['updatedAt'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LibraryBooksCompanion toCompanion(bool nullToAbsent) {
    return LibraryBooksCompanion(
      id: Value(id),
      progress: Value(progress),
      isbn10: Value(isbn10),
      isbn13: Value(isbn13),
      status: Value(status),
      finishedOn:
          finishedOn == null && nullToAbsent
              ? const Value.absent()
              : Value(finishedOn),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      user: Value(user),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DLibraryBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DLibraryBook(
      id: serializer.fromJson<String>(json['id']),
      progress: serializer.fromJson<double>(json['progress']),
      isbn10: serializer.fromJson<String>(json['isbn10']),
      isbn13: serializer.fromJson<String>(json['isbn13']),
      status: $LibraryBooksTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      finishedOn: serializer.fromJson<DateTime?>(json['finishedOn']),
      path: serializer.fromJson<String?>(json['path']),
      user: serializer.fromJson<String>(json['user']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'progress': serializer.toJson<double>(progress),
      'isbn10': serializer.toJson<String>(isbn10),
      'isbn13': serializer.toJson<String>(isbn13),
      'status': serializer.toJson<String>(
        $LibraryBooksTable.$converterstatus.toJson(status),
      ),
      'finishedOn': serializer.toJson<DateTime?>(finishedOn),
      'path': serializer.toJson<String?>(path),
      'user': serializer.toJson<String>(user),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DLibraryBook copyWith({
    String? id,
    double? progress,
    String? isbn10,
    String? isbn13,
    BookStatus? status,
    Value<DateTime?> finishedOn = const Value.absent(),
    Value<String?> path = const Value.absent(),
    String? user,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DLibraryBook(
    id: id ?? this.id,
    progress: progress ?? this.progress,
    isbn10: isbn10 ?? this.isbn10,
    isbn13: isbn13 ?? this.isbn13,
    status: status ?? this.status,
    finishedOn: finishedOn.present ? finishedOn.value : this.finishedOn,
    path: path.present ? path.value : this.path,
    user: user ?? this.user,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DLibraryBook copyWithCompanion(LibraryBooksCompanion data) {
    return DLibraryBook(
      id: data.id.present ? data.id.value : this.id,
      progress: data.progress.present ? data.progress.value : this.progress,
      isbn10: data.isbn10.present ? data.isbn10.value : this.isbn10,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      status: data.status.present ? data.status.value : this.status,
      finishedOn:
          data.finishedOn.present ? data.finishedOn.value : this.finishedOn,
      path: data.path.present ? data.path.value : this.path,
      user: data.user.present ? data.user.value : this.user,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DLibraryBook(')
          ..write('id: $id, ')
          ..write('progress: $progress, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('status: $status, ')
          ..write('finishedOn: $finishedOn, ')
          ..write('path: $path, ')
          ..write('user: $user, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    progress,
    isbn10,
    isbn13,
    status,
    finishedOn,
    path,
    user,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DLibraryBook &&
          other.id == this.id &&
          other.progress == this.progress &&
          other.isbn10 == this.isbn10 &&
          other.isbn13 == this.isbn13 &&
          other.status == this.status &&
          other.finishedOn == this.finishedOn &&
          other.path == this.path &&
          other.user == this.user &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LibraryBooksCompanion extends UpdateCompanion<DLibraryBook> {
  final Value<String> id;
  final Value<double> progress;
  final Value<String> isbn10;
  final Value<String> isbn13;
  final Value<BookStatus> status;
  final Value<DateTime?> finishedOn;
  final Value<String?> path;
  final Value<String> user;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LibraryBooksCompanion({
    this.id = const Value.absent(),
    this.progress = const Value.absent(),
    this.isbn10 = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.status = const Value.absent(),
    this.finishedOn = const Value.absent(),
    this.path = const Value.absent(),
    this.user = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LibraryBooksCompanion.insert({
    required String id,
    required double progress,
    required String isbn10,
    required String isbn13,
    required BookStatus status,
    this.finishedOn = const Value.absent(),
    this.path = const Value.absent(),
    required String user,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       progress = Value(progress),
       isbn10 = Value(isbn10),
       isbn13 = Value(isbn13),
       status = Value(status),
       user = Value(user),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DLibraryBook> custom({
    Expression<String>? id,
    Expression<double>? progress,
    Expression<String>? isbn10,
    Expression<String>? isbn13,
    Expression<String>? status,
    Expression<DateTime>? finishedOn,
    Expression<String>? path,
    Expression<String>? user,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (progress != null) 'progress': progress,
      if (isbn10 != null) 'isbn10': isbn10,
      if (isbn13 != null) 'isbn13': isbn13,
      if (status != null) 'status': status,
      if (finishedOn != null) 'finishedOn': finishedOn,
      if (path != null) 'path': path,
      if (user != null) 'user': user,
      if (createdAt != null) 'createdAt': createdAt,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LibraryBooksCompanion copyWith({
    Value<String>? id,
    Value<double>? progress,
    Value<String>? isbn10,
    Value<String>? isbn13,
    Value<BookStatus>? status,
    Value<DateTime?>? finishedOn,
    Value<String?>? path,
    Value<String>? user,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LibraryBooksCompanion(
      id: id ?? this.id,
      progress: progress ?? this.progress,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
      status: status ?? this.status,
      finishedOn: finishedOn ?? this.finishedOn,
      path: path ?? this.path,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (isbn10.present) {
      map['isbn10'] = Variable<String>(isbn10.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $LibraryBooksTable.$converterstatus.toSql(status.value),
      );
    }
    if (finishedOn.present) {
      map['finishedOn'] = Variable<DateTime>(finishedOn.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LibraryBooksCompanion(')
          ..write('id: $id, ')
          ..write('progress: $progress, ')
          ..write('isbn10: $isbn10, ')
          ..write('isbn13: $isbn13, ')
          ..write('status: $status, ')
          ..write('finishedOn: $finishedOn, ')
          ..write('path: $path, ')
          ..write('user: $user, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BookStatsTable extends BookStats
    with TableInfo<$BookStatsTable, DBookStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<String> book = GeneratedColumn<String>(
    'book',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES libraryBooks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<String> user = GeneratedColumn<String>(
    'user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'createdAt',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, book, user, progress, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookStats';
  @override
  VerificationContext validateIntegrity(
    Insertable<DBookStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('book')) {
      context.handle(
        _bookMeta,
        book.isAcceptableOrUnknown(data['book']!, _bookMeta),
      );
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
        _userMeta,
        user.isAcceptableOrUnknown(data['user']!, _userMeta),
      );
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBookStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBookStat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      book:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}book'],
          )!,
      user:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user'],
          )!,
      progress:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}progress'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}createdAt'],
          )!,
    );
  }

  @override
  $BookStatsTable createAlias(String alias) {
    return $BookStatsTable(attachedDatabase, alias);
  }
}

class DBookStat extends DataClass implements Insertable<DBookStat> {
  final String id;
  final String book;
  final String user;
  final double progress;
  final DateTime createdAt;
  const DBookStat({
    required this.id,
    required this.book,
    required this.user,
    required this.progress,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['book'] = Variable<String>(book);
    map['user'] = Variable<String>(user);
    map['progress'] = Variable<double>(progress);
    map['createdAt'] = Variable<DateTime>(createdAt);
    return map;
  }

  BookStatsCompanion toCompanion(bool nullToAbsent) {
    return BookStatsCompanion(
      id: Value(id),
      book: Value(book),
      user: Value(user),
      progress: Value(progress),
      createdAt: Value(createdAt),
    );
  }

  factory DBookStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBookStat(
      id: serializer.fromJson<String>(json['id']),
      book: serializer.fromJson<String>(json['book']),
      user: serializer.fromJson<String>(json['user']),
      progress: serializer.fromJson<double>(json['progress']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'book': serializer.toJson<String>(book),
      'user': serializer.toJson<String>(user),
      'progress': serializer.toJson<double>(progress),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DBookStat copyWith({
    String? id,
    String? book,
    String? user,
    double? progress,
    DateTime? createdAt,
  }) => DBookStat(
    id: id ?? this.id,
    book: book ?? this.book,
    user: user ?? this.user,
    progress: progress ?? this.progress,
    createdAt: createdAt ?? this.createdAt,
  );
  DBookStat copyWithCompanion(BookStatsCompanion data) {
    return DBookStat(
      id: data.id.present ? data.id.value : this.id,
      book: data.book.present ? data.book.value : this.book,
      user: data.user.present ? data.user.value : this.user,
      progress: data.progress.present ? data.progress.value : this.progress,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DBookStat(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('user: $user, ')
          ..write('progress: $progress, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, book, user, progress, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBookStat &&
          other.id == this.id &&
          other.book == this.book &&
          other.user == this.user &&
          other.progress == this.progress &&
          other.createdAt == this.createdAt);
}

class BookStatsCompanion extends UpdateCompanion<DBookStat> {
  final Value<String> id;
  final Value<String> book;
  final Value<String> user;
  final Value<double> progress;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BookStatsCompanion({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.user = const Value.absent(),
    this.progress = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookStatsCompanion.insert({
    required String id,
    required String book,
    required String user,
    required double progress,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       book = Value(book),
       user = Value(user),
       progress = Value(progress),
       createdAt = Value(createdAt);
  static Insertable<DBookStat> custom({
    Expression<String>? id,
    Expression<String>? book,
    Expression<String>? user,
    Expression<double>? progress,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book != null) 'book': book,
      if (user != null) 'user': user,
      if (progress != null) 'progress': progress,
      if (createdAt != null) 'createdAt': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookStatsCompanion copyWith({
    Value<String>? id,
    Value<String>? book,
    Value<String>? user,
    Value<double>? progress,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BookStatsCompanion(
      id: id ?? this.id,
      book: book ?? this.book,
      user: user ?? this.user,
      progress: progress ?? this.progress,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (book.present) {
      map['book'] = Variable<String>(book.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookStatsCompanion(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('user: $user, ')
          ..write('progress: $progress, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$SagaDatabase extends GeneratedDatabase {
  _$SagaDatabase(QueryExecutor e) : super(e);
  $SagaDatabaseManager get managers => $SagaDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $BooksTable books = $BooksTable(this);
  late final $LibraryBooksTable libraryBooks = $LibraryBooksTable(this);
  late final $BookStatsTable bookStats = $BookStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    sessions,
    books,
    libraryBooks,
    bookStats,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sessions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('libraryBooks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'libraryBooks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bookStats', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bookStats', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String name,
      required String email,
      Value<String?> image,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> email,
      Value<String?> image,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$SagaDatabase, $UsersTable, DUser> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SessionsTable, List<DSession>> _sessionsRefsTable(
    _$SagaDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sessions,
    aliasName: $_aliasNameGenerator(db.users.id, db.sessions.user),
  );

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.user.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LibraryBooksTable, List<DLibraryBook>>
  _libraryBooksRefsTable(_$SagaDatabase db) => MultiTypedResultKey.fromTable(
    db.libraryBooks,
    aliasName: $_aliasNameGenerator(db.users.id, db.libraryBooks.user),
  );

  $$LibraryBooksTableProcessedTableManager get libraryBooksRefs {
    final manager = $$LibraryBooksTableTableManager(
      $_db,
      $_db.libraryBooks,
    ).filter((f) => f.user.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_libraryBooksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BookStatsTable, List<DBookStat>>
  _bookStatsRefsTable(_$SagaDatabase db) => MultiTypedResultKey.fromTable(
    db.bookStats,
    aliasName: $_aliasNameGenerator(db.users.id, db.bookStats.user),
  );

  $$BookStatsTableProcessedTableManager get bookStatsRefs {
    final manager = $$BookStatsTableTableManager(
      $_db,
      $_db.bookStats,
    ).filter((f) => f.user.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookStatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$SagaDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> sessionsRefs(
    Expression<bool> Function($$SessionsTableFilterComposer f) f,
  ) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> libraryBooksRefs(
    Expression<bool> Function($$LibraryBooksTableFilterComposer f) f,
  ) {
    final $$LibraryBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.libraryBooks,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibraryBooksTableFilterComposer(
            $db: $db,
            $table: $db.libraryBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> bookStatsRefs(
    Expression<bool> Function($$BookStatsTableFilterComposer f) f,
  ) {
    final $$BookStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookStats,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookStatsTableFilterComposer(
            $db: $db,
            $table: $db.bookStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$SagaDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$SagaDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> sessionsRefs<T extends Object>(
    Expression<T> Function($$SessionsTableAnnotationComposer a) f,
  ) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> libraryBooksRefs<T extends Object>(
    Expression<T> Function($$LibraryBooksTableAnnotationComposer a) f,
  ) {
    final $$LibraryBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.libraryBooks,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibraryBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.libraryBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> bookStatsRefs<T extends Object>(
    Expression<T> Function($$BookStatsTableAnnotationComposer a) f,
  ) {
    final $$BookStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookStats,
      getReferencedColumn: (t) => t.user,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.bookStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$SagaDatabase,
          $UsersTable,
          DUser,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (DUser, $$UsersTableReferences),
          DUser,
          PrefetchHooks Function({
            bool sessionsRefs,
            bool libraryBooksRefs,
            bool bookStatsRefs,
          })
        > {
  $$UsersTableTableManager(_$SagaDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                email: email,
                image: image,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String email,
                Value<String?> image = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                email: email,
                image: image,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UsersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            sessionsRefs = false,
            libraryBooksRefs = false,
            bookStatsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (sessionsRefs) db.sessions,
                if (libraryBooksRefs) db.libraryBooks,
                if (bookStatsRefs) db.bookStats,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sessionsRefs)
                    await $_getPrefetchedData<DUser, $UsersTable, DSession>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._sessionsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.user == item.id),
                      typedResults: items,
                    ),
                  if (libraryBooksRefs)
                    await $_getPrefetchedData<DUser, $UsersTable, DLibraryBook>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._libraryBooksRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).libraryBooksRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.user == item.id),
                      typedResults: items,
                    ),
                  if (bookStatsRefs)
                    await $_getPrefetchedData<DUser, $UsersTable, DBookStat>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._bookStatsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).bookStatsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.user == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$SagaDatabase,
      $UsersTable,
      DUser,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (DUser, $$UsersTableReferences),
      DUser,
      PrefetchHooks Function({
        bool sessionsRefs,
        bool libraryBooksRefs,
        bool bookStatsRefs,
      })
    >;
typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({
      required String id,
      required DateTime expiresAt,
      required String token,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> ipAddress,
      required String deviceName,
      required DeviceType deviceType,
      required String user,
      Value<int> rowid,
    });
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({
      Value<String> id,
      Value<DateTime> expiresAt,
      Value<String> token,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> ipAddress,
      Value<String> deviceName,
      Value<DeviceType> deviceType,
      Value<String> user,
      Value<int> rowid,
    });

final class $$SessionsTableReferences
    extends BaseReferences<_$SagaDatabase, $SessionsTable, DSession> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userTable(_$SagaDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.sessions.user, db.users.id));

  $$UsersTableProcessedTableManager get user {
    final $_column = $_itemColumn<String>('user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$SagaDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DeviceType, DeviceType, String>
  get deviceType => $composableBuilder(
    column: $table.deviceType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$UsersTableFilterComposer get user {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$SagaDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceType => $composableBuilder(
    column: $table.deviceType,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get user {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$SagaDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  GeneratedColumn<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DeviceType, String> get deviceType =>
      $composableBuilder(
        column: $table.deviceType,
        builder: (column) => column,
      );

  $$UsersTableAnnotationComposer get user {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$SagaDatabase,
          $SessionsTable,
          DSession,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (DSession, $$SessionsTableReferences),
          DSession,
          PrefetchHooks Function({bool user})
        > {
  $$SessionsTableTableManager(_$SagaDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<String> deviceName = const Value.absent(),
                Value<DeviceType> deviceType = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                expiresAt: expiresAt,
                token: token,
                createdAt: createdAt,
                updatedAt: updatedAt,
                ipAddress: ipAddress,
                deviceName: deviceName,
                deviceType: deviceType,
                user: user,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime expiresAt,
                required String token,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> ipAddress = const Value.absent(),
                required String deviceName,
                required DeviceType deviceType,
                required String user,
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                expiresAt: expiresAt,
                token: token,
                createdAt: createdAt,
                updatedAt: updatedAt,
                ipAddress: ipAddress,
                deviceName: deviceName,
                deviceType: deviceType,
                user: user,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SessionsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({user = false}) {
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
                if (user) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.user,
                            referencedTable: $$SessionsTableReferences
                                ._userTable(db),
                            referencedColumn:
                                $$SessionsTableReferences._userTable(db).id,
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

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$SagaDatabase,
      $SessionsTable,
      DSession,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (DSession, $$SessionsTableReferences),
      DSession,
      PrefetchHooks Function({bool user})
    >;
typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      required int id,
      required String title,
      required String description,
      required String image,
      required String isbn10,
      required String isbn13,
      required List<String> genres,
      required int pages,
      required int readers,
      required DateTime releaseDate,
      required List<Author> authors,
      Value<int> rowid,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> image,
      Value<String> isbn10,
      Value<String> isbn13,
      Value<List<String>> genres,
      Value<int> pages,
      Value<int> readers,
      Value<DateTime> releaseDate,
      Value<List<Author>> authors,
      Value<int> rowid,
    });

class $$BooksTableFilterComposer extends Composer<_$SagaDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readers => $composableBuilder(
    column: $table.readers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<Author>, List<Author>, String>
  get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$BooksTableOrderingComposer
    extends Composer<_$SagaDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genres => $composableBuilder(
    column: $table.genres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readers => $composableBuilder(
    column: $table.readers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$SagaDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get isbn10 =>
      $composableBuilder(column: $table.isbn10, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<int> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  GeneratedColumn<int> get readers =>
      $composableBuilder(column: $table.readers, builder: (column) => column);

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Author>, String> get authors =>
      $composableBuilder(column: $table.authors, builder: (column) => column);
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$SagaDatabase,
          $BooksTable,
          DBook,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (DBook, BaseReferences<_$SagaDatabase, $BooksTable, DBook>),
          DBook,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$SagaDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<String> isbn10 = const Value.absent(),
                Value<String> isbn13 = const Value.absent(),
                Value<List<String>> genres = const Value.absent(),
                Value<int> pages = const Value.absent(),
                Value<int> readers = const Value.absent(),
                Value<DateTime> releaseDate = const Value.absent(),
                Value<List<Author>> authors = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion(
                id: id,
                title: title,
                description: description,
                image: image,
                isbn10: isbn10,
                isbn13: isbn13,
                genres: genres,
                pages: pages,
                readers: readers,
                releaseDate: releaseDate,
                authors: authors,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String title,
                required String description,
                required String image,
                required String isbn10,
                required String isbn13,
                required List<String> genres,
                required int pages,
                required int readers,
                required DateTime releaseDate,
                required List<Author> authors,
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion.insert(
                id: id,
                title: title,
                description: description,
                image: image,
                isbn10: isbn10,
                isbn13: isbn13,
                genres: genres,
                pages: pages,
                readers: readers,
                releaseDate: releaseDate,
                authors: authors,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$SagaDatabase,
      $BooksTable,
      DBook,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (DBook, BaseReferences<_$SagaDatabase, $BooksTable, DBook>),
      DBook,
      PrefetchHooks Function()
    >;
typedef $$LibraryBooksTableCreateCompanionBuilder =
    LibraryBooksCompanion Function({
      required String id,
      required double progress,
      required String isbn10,
      required String isbn13,
      required BookStatus status,
      Value<DateTime?> finishedOn,
      Value<String?> path,
      required String user,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LibraryBooksTableUpdateCompanionBuilder =
    LibraryBooksCompanion Function({
      Value<String> id,
      Value<double> progress,
      Value<String> isbn10,
      Value<String> isbn13,
      Value<BookStatus> status,
      Value<DateTime?> finishedOn,
      Value<String?> path,
      Value<String> user,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$LibraryBooksTableReferences
    extends BaseReferences<_$SagaDatabase, $LibraryBooksTable, DLibraryBook> {
  $$LibraryBooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userTable(_$SagaDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.libraryBooks.user, db.users.id),
  );

  $$UsersTableProcessedTableManager get user {
    final $_column = $_itemColumn<String>('user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BookStatsTable, List<DBookStat>>
  _bookStatsRefsTable(_$SagaDatabase db) => MultiTypedResultKey.fromTable(
    db.bookStats,
    aliasName: $_aliasNameGenerator(db.libraryBooks.id, db.bookStats.book),
  );

  $$BookStatsTableProcessedTableManager get bookStatsRefs {
    final manager = $$BookStatsTableTableManager(
      $_db,
      $_db.bookStats,
    ).filter((f) => f.book.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_bookStatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LibraryBooksTableFilterComposer
    extends Composer<_$SagaDatabase, $LibraryBooksTable> {
  $$LibraryBooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BookStatus, BookStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get finishedOn => $composableBuilder(
    column: $table.finishedOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get user {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> bookStatsRefs(
    Expression<bool> Function($$BookStatsTableFilterComposer f) f,
  ) {
    final $$BookStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookStats,
      getReferencedColumn: (t) => t.book,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookStatsTableFilterComposer(
            $db: $db,
            $table: $db.bookStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LibraryBooksTableOrderingComposer
    extends Composer<_$SagaDatabase, $LibraryBooksTable> {
  $$LibraryBooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn10 => $composableBuilder(
    column: $table.isbn10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedOn => $composableBuilder(
    column: $table.finishedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get user {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LibraryBooksTableAnnotationComposer
    extends Composer<_$SagaDatabase, $LibraryBooksTable> {
  $$LibraryBooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get isbn10 =>
      $composableBuilder(column: $table.isbn10, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BookStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedOn => $composableBuilder(
    column: $table.finishedOn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get user {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> bookStatsRefs<T extends Object>(
    Expression<T> Function($$BookStatsTableAnnotationComposer a) f,
  ) {
    final $$BookStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bookStats,
      getReferencedColumn: (t) => t.book,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.bookStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LibraryBooksTableTableManager
    extends
        RootTableManager<
          _$SagaDatabase,
          $LibraryBooksTable,
          DLibraryBook,
          $$LibraryBooksTableFilterComposer,
          $$LibraryBooksTableOrderingComposer,
          $$LibraryBooksTableAnnotationComposer,
          $$LibraryBooksTableCreateCompanionBuilder,
          $$LibraryBooksTableUpdateCompanionBuilder,
          (DLibraryBook, $$LibraryBooksTableReferences),
          DLibraryBook,
          PrefetchHooks Function({bool user, bool bookStatsRefs})
        > {
  $$LibraryBooksTableTableManager(_$SagaDatabase db, $LibraryBooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LibraryBooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LibraryBooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$LibraryBooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<String> isbn10 = const Value.absent(),
                Value<String> isbn13 = const Value.absent(),
                Value<BookStatus> status = const Value.absent(),
                Value<DateTime?> finishedOn = const Value.absent(),
                Value<String?> path = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LibraryBooksCompanion(
                id: id,
                progress: progress,
                isbn10: isbn10,
                isbn13: isbn13,
                status: status,
                finishedOn: finishedOn,
                path: path,
                user: user,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double progress,
                required String isbn10,
                required String isbn13,
                required BookStatus status,
                Value<DateTime?> finishedOn = const Value.absent(),
                Value<String?> path = const Value.absent(),
                required String user,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LibraryBooksCompanion.insert(
                id: id,
                progress: progress,
                isbn10: isbn10,
                isbn13: isbn13,
                status: status,
                finishedOn: finishedOn,
                path: path,
                user: user,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$LibraryBooksTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({user = false, bookStatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (bookStatsRefs) db.bookStats],
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
                if (user) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.user,
                            referencedTable: $$LibraryBooksTableReferences
                                ._userTable(db),
                            referencedColumn:
                                $$LibraryBooksTableReferences._userTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bookStatsRefs)
                    await $_getPrefetchedData<
                      DLibraryBook,
                      $LibraryBooksTable,
                      DBookStat
                    >(
                      currentTable: table,
                      referencedTable: $$LibraryBooksTableReferences
                          ._bookStatsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LibraryBooksTableReferences(
                                db,
                                table,
                                p0,
                              ).bookStatsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.book == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LibraryBooksTableProcessedTableManager =
    ProcessedTableManager<
      _$SagaDatabase,
      $LibraryBooksTable,
      DLibraryBook,
      $$LibraryBooksTableFilterComposer,
      $$LibraryBooksTableOrderingComposer,
      $$LibraryBooksTableAnnotationComposer,
      $$LibraryBooksTableCreateCompanionBuilder,
      $$LibraryBooksTableUpdateCompanionBuilder,
      (DLibraryBook, $$LibraryBooksTableReferences),
      DLibraryBook,
      PrefetchHooks Function({bool user, bool bookStatsRefs})
    >;
typedef $$BookStatsTableCreateCompanionBuilder =
    BookStatsCompanion Function({
      required String id,
      required String book,
      required String user,
      required double progress,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$BookStatsTableUpdateCompanionBuilder =
    BookStatsCompanion Function({
      Value<String> id,
      Value<String> book,
      Value<String> user,
      Value<double> progress,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$BookStatsTableReferences
    extends BaseReferences<_$SagaDatabase, $BookStatsTable, DBookStat> {
  $$BookStatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LibraryBooksTable _bookTable(_$SagaDatabase db) => db.libraryBooks
      .createAlias($_aliasNameGenerator(db.bookStats.book, db.libraryBooks.id));

  $$LibraryBooksTableProcessedTableManager get book {
    final $_column = $_itemColumn<String>('book')!;

    final manager = $$LibraryBooksTableTableManager(
      $_db,
      $_db.libraryBooks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userTable(_$SagaDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.bookStats.user, db.users.id),
  );

  $$UsersTableProcessedTableManager get user {
    final $_column = $_itemColumn<String>('user')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BookStatsTableFilterComposer
    extends Composer<_$SagaDatabase, $BookStatsTable> {
  $$BookStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LibraryBooksTableFilterComposer get book {
    final $$LibraryBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.book,
      referencedTable: $db.libraryBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibraryBooksTableFilterComposer(
            $db: $db,
            $table: $db.libraryBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get user {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookStatsTableOrderingComposer
    extends Composer<_$SagaDatabase, $BookStatsTable> {
  $$BookStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LibraryBooksTableOrderingComposer get book {
    final $$LibraryBooksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.book,
      referencedTable: $db.libraryBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibraryBooksTableOrderingComposer(
            $db: $db,
            $table: $db.libraryBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get user {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookStatsTableAnnotationComposer
    extends Composer<_$SagaDatabase, $BookStatsTable> {
  $$BookStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$LibraryBooksTableAnnotationComposer get book {
    final $$LibraryBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.book,
      referencedTable: $db.libraryBooks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LibraryBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.libraryBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get user {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BookStatsTableTableManager
    extends
        RootTableManager<
          _$SagaDatabase,
          $BookStatsTable,
          DBookStat,
          $$BookStatsTableFilterComposer,
          $$BookStatsTableOrderingComposer,
          $$BookStatsTableAnnotationComposer,
          $$BookStatsTableCreateCompanionBuilder,
          $$BookStatsTableUpdateCompanionBuilder,
          (DBookStat, $$BookStatsTableReferences),
          DBookStat,
          PrefetchHooks Function({bool book, bool user})
        > {
  $$BookStatsTableTableManager(_$SagaDatabase db, $BookStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BookStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BookStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$BookStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> book = const Value.absent(),
                Value<String> user = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BookStatsCompanion(
                id: id,
                book: book,
                user: user,
                progress: progress,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String book,
                required String user,
                required double progress,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => BookStatsCompanion.insert(
                id: id,
                book: book,
                user: user,
                progress: progress,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$BookStatsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({book = false, user = false}) {
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
                if (book) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.book,
                            referencedTable: $$BookStatsTableReferences
                                ._bookTable(db),
                            referencedColumn:
                                $$BookStatsTableReferences._bookTable(db).id,
                          )
                          as T;
                }
                if (user) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.user,
                            referencedTable: $$BookStatsTableReferences
                                ._userTable(db),
                            referencedColumn:
                                $$BookStatsTableReferences._userTable(db).id,
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

typedef $$BookStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$SagaDatabase,
      $BookStatsTable,
      DBookStat,
      $$BookStatsTableFilterComposer,
      $$BookStatsTableOrderingComposer,
      $$BookStatsTableAnnotationComposer,
      $$BookStatsTableCreateCompanionBuilder,
      $$BookStatsTableUpdateCompanionBuilder,
      (DBookStat, $$BookStatsTableReferences),
      DBookStat,
      PrefetchHooks Function({bool book, bool user})
    >;

class $SagaDatabaseManager {
  final _$SagaDatabase _db;
  $SagaDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$LibraryBooksTableTableManager get libraryBooks =>
      $$LibraryBooksTableTableManager(_db, _db.libraryBooks);
  $$BookStatsTableTableManager get bookStats =>
      $$BookStatsTableTableManager(_db, _db.bookStats);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'3838dee6e933674412b513e03e32fbb440ab20fe';

/// See also [database].
@ProviderFor(database)
final databaseProvider = Provider<SagaDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = ProviderRef<SagaDatabase>;
String _$dioClientHash() => r'505cb58a592fdaf245d4da3c765c11fafc3d9f98';

/// See also [DioClient].
@ProviderFor(DioClient)
final dioClientProvider = NotifierProvider<DioClient, Dio>.internal(
  DioClient.new,
  name: r'dioClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DioClient = Notifier<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

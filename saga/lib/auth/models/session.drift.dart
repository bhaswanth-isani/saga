import 'package:drift/drift.dart';
import 'package:saga/auth/models/session.dart';
import 'package:saga/auth/models/user.drift.dart';

/// Represents a user's session in the Drift database.
///
/// This class is used to store session information in the Drift database,
/// allowing for efficient querying and persistence of session data.
@DataClassName('DSession')
class Sessions extends Table {
  @override
  String get tableName => 'sessions';

  TextColumn get id => text()();
  DateTimeColumn get expiresAt => dateTime()();
  TextColumn get token => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get ipAddress => text().nullable()();
  TextColumn get deviceName => text()();
  TextColumn get deviceType => textEnum<DeviceType>()();
  TextColumn get user => text().references(Users, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}

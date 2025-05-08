import 'package:drift/drift.dart';
import 'package:saga/auth/models/user.drift.dart';
import 'package:saga/library/models/library_book.drift.dart';

@DataClassName('DBookStat')
class BookStats extends Table {
  @override
  String get tableName => 'bookStats';
  TextColumn get id => text()();
  TextColumn get book => text().references(LibraryBooks, #id, onDelete: KeyAction.cascade)();
  TextColumn get user => text().references(Users, #id, onDelete: KeyAction.cascade)();
  RealColumn get progress => real()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

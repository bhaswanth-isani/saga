import 'package:drift/drift.dart';
import 'package:saga/auth/models/user.drift.dart';
import 'package:saga/library/models/library_book.dart';

@DataClassName('DLibraryBook')
class LibraryBooks extends Table {
  @override
  String get tableName => 'libraryBooks';

  TextColumn get id => text()();
  RealColumn get progress => real()();
  TextColumn get isbn10 => text()();
  TextColumn get isbn13 => text()();
  TextColumn get status => textEnum<BookStatus>()();
  DateTimeColumn? get finishedOn => dateTime().nullable()();
  TextColumn? get path => text().nullable()();
  TextColumn get user => text().references(Users, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

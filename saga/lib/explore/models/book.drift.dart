import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:saga/explore/models/book.dart';

@DataClassName('DBook')
class Books extends Table {
  @override
  String get tableName => 'books';

  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  TextColumn get isbn10 => text()();
  TextColumn get isbn13 => text()();
  TextColumn get genres => text().map(StringListConverter())();
  IntColumn get pages => integer()();
  IntColumn get readers => integer()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get authors => text().map(AuthorListConverter())();

  @override
  Set<Column> get primaryKey => {isbn13};
}

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>).cast<String>();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

class AuthorListConverter extends TypeConverter<List<Author>, String> {
  const AuthorListConverter();

  @override
  List<Author> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => Author.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<Author> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

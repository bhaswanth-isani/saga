import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/auth/models/session.dart';
import 'package:saga/auth/models/session.drift.dart';
import 'package:saga/auth/models/user.drift.dart';
import 'package:saga/explore/models/book.dart';
import 'package:saga/explore/models/book.drift.dart';
import 'package:saga/library/models/library_book.dart';
import 'package:saga/library/models/library_book.drift.dart';
import 'package:saga/profile/models/stat.drift.dart';

part 'database.g.dart';

@Riverpod(keepAlive: true)
class DioClient extends _$DioClient {
  @override
  Dio build() => Dio(BaseOptions(baseUrl: 'https://api.saga.editorstack.com'));

  void setToken(String? token) {
    if (token == null) {
      state.options.headers.remove('Authorization');
      return;
    }
    state.options.headers['Authorization'] = 'Bearer $token';
  }
}

@Riverpod(keepAlive: true)
SagaDatabase database(Ref ref) => SagaDatabase(
  driftDatabase(name: 'saga', native: const DriftNativeOptions(shareAcrossIsolates: true)),
);

/// Local database for Saga.
@DriftDatabase(tables: [Users, Sessions, Books, LibraryBooks, BookStats])
class SagaDatabase extends _$SagaDatabase {
  /// Construct a new instance of [SagaDatabase].
  SagaDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (_) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> clearData() async {
    managers.libraryBooks.delete();
    managers.books.delete();
  }
}

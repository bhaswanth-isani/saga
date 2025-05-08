import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/library/models/library_book.dart';
import 'package:saga/profile/models/stat.dart';

part 'set_stat.g.dart';

@riverpod
Future<void> setStat(Ref ref, {required String isbn13, required double progress}) async {
  final dio = ref.read(dioClientProvider);
  final response = await SagaApi(
    dio,
  ).createOrUpdateBookStat(StatRequest(isbn13: isbn13, progress: progress));

  final db = ref.read(databaseProvider);
  await db.bookStats.insertOnConflictUpdate(response.stat.toDrift());
  await db.libraryBooks.insertOnConflictUpdate(response.book.toDrift());
}

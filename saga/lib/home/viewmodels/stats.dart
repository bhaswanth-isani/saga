import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/profile/models/stat.dart';

part 'stats.g.dart';

@riverpod
Future<List<BookStat>> fetchStats(Ref ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await SagaApi(dio).getBookStats();

  final db = ref.watch(databaseProvider);
  for (final stat in response) {
    await db.bookStats.insertOnConflictUpdate(stat.toDrift());
  }

  return response;
}

@Riverpod(keepAlive: true)
Stream<List<BookStat>> stats(Ref ref) {
  return ref
      .read(databaseProvider)
      .managers
      .bookStats
      .watch()
      .map((e) => e.map((s) => s.toObject()).toList());
}

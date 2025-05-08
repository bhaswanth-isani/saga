import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/explore/models/book.dart';

part 'explore_view_model.g.dart';

@Riverpod(keepAlive: true)
Stream<List<Book>> allBooks(Ref ref) {
  return ref
      .read(databaseProvider)
      .managers
      .books
      .watch()
      .map((e) => e.map((b) => b.toObject()).toList());
}

@Riverpod(keepAlive: true)
Future<List<Book>> trendingBooks(Ref ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await SagaApi(dio).getTrendingBooks();

  final db = ref.watch(databaseProvider);
  for (final book in response) {
    await db.books.insertOnConflictUpdate(book.toDrift());
  }

  return response;
}

@Riverpod(keepAlive: true)
Future<List<Book>> monthNewBooks(Ref ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await SagaApi(dio).getNewBooks('month');

  final db = ref.watch(databaseProvider);
  for (final book in response) {
    await db.books.insertOnConflictUpdate(book.toDrift());
  }

  return response;
}

@Riverpod(keepAlive: true)
Future<List<Book>> yearNewBooks(Ref ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await SagaApi(dio).getNewBooks('year');

  final db = ref.watch(databaseProvider);
  for (final book in response) {
    await db.books.insertOnConflictUpdate(book.toDrift());
  }

  return response;
}

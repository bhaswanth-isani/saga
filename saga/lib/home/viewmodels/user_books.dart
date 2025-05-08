import 'package:drift/drift.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/explore/models/book.dart';
import 'package:saga/library/models/library_book.dart';

part 'user_books.g.dart';

@riverpod
Future<List<UserBookDetails>> fetchLibrary(Ref ref) async {
  final dio = ref.watch(dioClientProvider);
  final response = await SagaApi(dio).getLibraryBooks();

  final db = ref.watch(databaseProvider);
  for (final bookDetails in response) {
    await db.books.insertOnConflictUpdate(bookDetails.details.toDrift());
    await db.libraryBooks.insertOnConflictUpdate(bookDetails.book!.toDrift());
  }

  return response;
}

@Riverpod(keepAlive: true)
Stream<List<UserBookDetails>> library(Ref ref) {
  final books = ref.watch(databaseProvider).managers.books.watch();
  final libraryBooks = ref.watch(databaseProvider).managers.libraryBooks.watch();
  return Rx.combineLatest2(books, libraryBooks, (books, libraryBooks) {
    return libraryBooks
        .map(
          (libraryBook) => UserBookDetails(
            book: libraryBook.toObject(),
            details: books.firstWhere((book) => book.isbn13 == libraryBook.isbn13).toObject(),
          ),
        )
        .toList();
  });
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/explore/models/book.dart';
import 'package:saga/library/models/library_book.dart';

part 'get_book.g.dart';

@riverpod
Stream<UserBookDetails?> getBookDetails(Ref ref, String isbn13) {
  final db = ref.read(databaseProvider);
  final book = db.managers.libraryBooks
      .filter((f) => f.isbn13.equals(isbn13))
      .watch()
      .map((e) => e.firstOrNull?.toObject());
  final details = db.managers.books
      .filter((f) => f.isbn13.equals(isbn13))
      .watch()
      .map((e) => e.firstOrNull?.toObject());

  return Rx.combineLatest2(book, details, (book, details) {
    if (details == null) return null;
    return UserBookDetails(book: book, details: details);
  });
}

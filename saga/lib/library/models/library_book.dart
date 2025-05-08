import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saga/core/database.dart';

part 'library_book.freezed.dart';
part 'library_book.g.dart';

@freezed
abstract class LibraryBook with _$LibraryBook {
  const factory LibraryBook({
    required String id,
    required double progress,
    required String isbn10,
    required String isbn13,
    required BookStatus status,
    required DateTime? finishedOn,
    required String? path,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LibraryBook;

  /// Converts a [LibraryBook] to and from a [Map]
  factory LibraryBook.fromJson(Map<String, dynamic> json) => _$LibraryBookFromJson(json);
}

enum BookStatus { tbr, reading, read, dnf }

/// Extension on [LibraryBook] to provide conversion to [DLibraryBook].
extension LibraryBookConverter on LibraryBook {
  /// Converts an [LibraryBook] instance to an [DLibraryBook] instance.
  ///
  /// Returns a [DLibraryBook] object that can be stored in the Drift database.
  LibraryBooksCompanion toDrift() {
    return DLibraryBook(
      id: id,
      progress: progress,
      isbn10: isbn10,
      isbn13: isbn13,
      status: status,
      finishedOn: finishedOn,
      path: path,
      user: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    ).toCompanion(false);
  }
}

/// Extension on [DLibraryBook] to provide conversion to [LibraryBook].
extension DLibraryBookConverter on DLibraryBook {
  /// Converts a [DLibraryBook] instance to a [LibraryBook] instance.
  ///
  /// This method creates a new [LibraryBook] object using the data
  /// from the current [DLibraryBook] instance.
  ///
  /// Returns a [LibraryBook] object that can be used in the application logic.
  LibraryBook toObject() {
    return LibraryBook(
      id: id,
      progress: progress,
      isbn10: isbn10,
      isbn13: isbn13,
      status: status,
      finishedOn: finishedOn,
      path: path,
      userId: user,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

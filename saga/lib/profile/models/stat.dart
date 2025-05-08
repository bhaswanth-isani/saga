import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saga/core/database.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

@freezed
abstract class BookStat with _$BookStat {
  const factory BookStat({
    required String id,
    required String bookId,
    required String userId,
    required double progress,
    required DateTime createdAt,
  }) = _BookStat;

  /// Converts a [BookStat] to and from a [Map]
  factory BookStat.fromJson(Map<String, dynamic> json) => _$BookStatFromJson(json);
}

/// Extension on [BookStat] to provide conversion to [DBookStat].
extension BookStatConverter on BookStat {
  /// Converts an [BookStat] instance to an [DBookStat] instance.
  ///
  /// Returns a [DBookStat] object that can be stored in the Drift database.
  BookStatsCompanion toDrift() {
    return DBookStat(
      id: id,
      book: bookId,
      user: userId,
      progress: progress,
      createdAt: createdAt,
    ).toCompanion(false);
  }
}

/// Extension on [DBookStat] to provide conversion to [BookStat].
extension DBookStatConverter on DBookStat {
  /// Converts a [DBookStat] instance to a [BookStat] instance.
  ///
  /// This method creates a new [BookStat] object using the data
  /// from the current [DBookStat] instance.
  ///
  /// Returns a [BookStat] object that can be used in the application logic.
  BookStat toObject() {
    return BookStat(id: id, bookId: book, userId: user, progress: progress, createdAt: createdAt);
  }
}

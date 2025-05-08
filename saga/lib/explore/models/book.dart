import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:saga/core/database.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String description,
    required String image,
    required String isbn10,
    required String isbn13,
    required List<String> genres,
    required int pages,
    required int readers,
    required DateTime releaseDate,
    required List<Author> authors,
  }) = _Book;

  /// Converts a [Book] to and from a [Map]
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  const Book._();

  Future<Color> get mainColor async => await PaletteGenerator.fromImageProvider(
    NetworkImage(image),
  ).then((value) => value.dominantColor?.color ?? Future.value(Colors.deepOrangeAccent[300]));
}

@freezed
abstract class Author with _$Author {
  const factory Author({required String name, required String? image}) = _Author;

  /// Converts a [Author] to and from a [Map]
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

/// Extension on [Book] to provide conversion to [DBook].
extension BookConverter on Book {
  /// Converts an [Book] instance to an [DBook] instance.
  ///
  /// Returns a [DBook] object that can be stored in the Drift database.
  BooksCompanion toDrift() {
    return DBook(
      id: id,
      title: title,
      description: description,
      image: image,
      isbn10: isbn10,
      isbn13: isbn13,
      genres: genres,
      pages: pages,
      readers: readers,
      releaseDate: releaseDate,
      authors: authors,
    ).toCompanion(false);
  }
}

/// Extension on [DBook] to provide conversion to [Book].
extension DBookConverter on DBook {
  /// Converts a [DBook] instance to a [Book] instance.
  ///
  /// This method creates a new [Book] object using the data
  /// from the current [DBook] instance.
  ///
  /// Returns a [Book] object that can be used in the application logic.
  Book toObject() {
    return Book(
      id: id,
      title: title,
      description: description,
      image: image,
      isbn10: isbn10,
      isbn13: isbn13,
      genres: genres,
      pages: pages,
      readers: readers,
      releaseDate: releaseDate,
      authors: authors,
    );
  }
}

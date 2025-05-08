// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  isbn10: json['isbn10'] as String,
  isbn13: json['isbn13'] as String,
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
  pages: (json['pages'] as num).toInt(),
  readers: (json['readers'] as num).toInt(),
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  authors:
      (json['authors'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'isbn10': instance.isbn10,
  'isbn13': instance.isbn13,
  'genres': instance.genres,
  'pages': instance.pages,
  'readers': instance.readers,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'authors': instance.authors.map((e) => e.toJson()).toList(),
};

_Author _$AuthorFromJson(Map<String, dynamic> json) =>
    _Author(name: json['name'] as String, image: json['image'] as String?);

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryBook _$LibraryBookFromJson(Map<String, dynamic> json) => _LibraryBook(
  id: json['id'] as String,
  progress: (json['progress'] as num).toDouble(),
  isbn10: json['isbn10'] as String,
  isbn13: json['isbn13'] as String,
  status: $enumDecode(_$BookStatusEnumMap, json['status']),
  finishedOn:
      json['finishedOn'] == null
          ? null
          : DateTime.parse(json['finishedOn'] as String),
  path: json['path'] as String?,
  userId: json['userId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$LibraryBookToJson(_LibraryBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress': instance.progress,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'status': _$BookStatusEnumMap[instance.status]!,
      'finishedOn': instance.finishedOn?.toIso8601String(),
      'path': instance.path,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$BookStatusEnumMap = {
  BookStatus.tbr: 'tbr',
  BookStatus.reading: 'reading',
  BookStatus.read: 'read',
  BookStatus.dnf: 'dnf',
};

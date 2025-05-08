// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookStat _$BookStatFromJson(Map<String, dynamic> json) => _BookStat(
  id: json['id'] as String,
  bookId: json['bookId'] as String,
  userId: json['userId'] as String,
  progress: (json['progress'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$BookStatToJson(_BookStat instance) => <String, dynamic>{
  'id': instance.id,
  'bookId': instance.bookId,
  'userId': instance.userId,
  'progress': instance.progress,
  'createdAt': instance.createdAt.toIso8601String(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpubChapter _$EpubChapterFromJson(Map<String, dynamic> json) => _EpubChapter(
  title: json['title'] as String,
  id: json['id'] as String,
  href: json['href'] as String,
  subitems:
      (json['subitems'] as List<dynamic>)
          .map((e) => EpubChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EpubChapterToJson(_EpubChapter instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'href': instance.href,
      'subitems': instance.subitems.map((e) => e.toJson()).toList(),
    };

_EpubLocation _$EpubLocationFromJson(Map<String, dynamic> json) =>
    _EpubLocation(
      startCfi: json['startCfi'] as String,
      endCfi: json['endCfi'] as String,
      progress: (json['progress'] as num).toDouble(),
    );

Map<String, dynamic> _$EpubLocationToJson(_EpubLocation instance) =>
    <String, dynamic>{
      'startCfi': instance.startCfi,
      'endCfi': instance.endCfi,
      'progress': instance.progress,
    };

_EpubTextExtractRes _$EpubTextExtractResFromJson(Map<String, dynamic> json) =>
    _EpubTextExtractRes(
      text: json['text'] as String?,
      cfiRange: json['cfiRange'] as String?,
    );

Map<String, dynamic> _$EpubTextExtractResToJson(_EpubTextExtractRes instance) =>
    <String, dynamic>{'text': instance.text, 'cfiRange': instance.cfiRange};

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class EpubChapter with _$EpubChapter {
  const factory EpubChapter({
    required String title,
    required String id,
    required String href,
    required List<EpubChapter> subitems,
  }) = _EpubChapter;

  factory EpubChapter.fromJson(Map<String, dynamic> json) => _$EpubChapterFromJson(json);

  const EpubChapter._();

  static Map<String, Object?> json(Map<Object?, Object?> value) {
    return value.map((k, v) {
      if (k == 'subitems') {
        return MapEntry(
          'subitems',
          (v as List<dynamic>).map((e) => EpubChapter.json(e as Map<Object?, Object?>)).toList(),
        );
      }

      return MapEntry(k.toString(), v.toString().trim());
    });
  }
}

@freezed
abstract class EpubLocation with _$EpubLocation {
  const factory EpubLocation({
    required String startCfi,
    required String endCfi,
    required double progress,
  }) = _EpubLocation;

  factory EpubLocation.fromJson(Map<String, dynamic> json) => _$EpubLocationFromJson(json);
}

@freezed
abstract class EpubDisplaySettings with _$EpubDisplaySettings {
  const factory EpubDisplaySettings({
    @Default(15) int fontSize,
    @Default(EpubSpread.auto) EpubSpread spread,
    EpubTheme? theme,
  }) = _EpubDisplaySettings;
}

enum EpubSpread {
  ///Displays a single page in viewer
  none,

  ///Displays two pages in viewer
  always,

  ///Displays single or two pages in viewer depending on the device size
  auto,
}

@freezed
abstract class EpubTheme with _$EpubTheme {
  const factory EpubTheme({
    required Color background,
    required Color foreground,
    required Brightness theme,
  }) = _EpubTheme;

  factory EpubTheme.dark() =>
      EpubTheme(background: Colors.black, foreground: Colors.white, theme: Brightness.dark);

  factory EpubTheme.light() =>
      EpubTheme(background: Colors.white, foreground: Colors.black, theme: Brightness.light);
}

@freezed
abstract class EpubTextExtractRes with _$EpubTextExtractRes {
  const factory EpubTextExtractRes({String? text, String? cfiRange}) = _EpubTextExtractRes;

  /// Converts a [EpubTextExtractRes] to and from a [Map]
  factory EpubTextExtractRes.fromJson(Map<String, dynamic> json) =>
      _$EpubTextExtractResFromJson(json);
}

@freezed
abstract class EpubTextSelection with _$EpubTextSelection {
  const factory EpubTextSelection({required String selectedText, required String selectionCfi}) =
      _EpubTextSelection;
}

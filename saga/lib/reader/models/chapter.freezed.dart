// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpubChapter {

 String get title; String get id; String get href; List<EpubChapter> get subitems;
/// Create a copy of EpubChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubChapterCopyWith<EpubChapter> get copyWith => _$EpubChapterCopyWithImpl<EpubChapter>(this as EpubChapter, _$identity);

  /// Serializes this EpubChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubChapter&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other.subitems, subitems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,id,href,const DeepCollectionEquality().hash(subitems));

@override
String toString() {
  return 'EpubChapter(title: $title, id: $id, href: $href, subitems: $subitems)';
}


}

/// @nodoc
abstract mixin class $EpubChapterCopyWith<$Res>  {
  factory $EpubChapterCopyWith(EpubChapter value, $Res Function(EpubChapter) _then) = _$EpubChapterCopyWithImpl;
@useResult
$Res call({
 String title, String id, String href, List<EpubChapter> subitems
});




}
/// @nodoc
class _$EpubChapterCopyWithImpl<$Res>
    implements $EpubChapterCopyWith<$Res> {
  _$EpubChapterCopyWithImpl(this._self, this._then);

  final EpubChapter _self;
  final $Res Function(EpubChapter) _then;

/// Create a copy of EpubChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? id = null,Object? href = null,Object? subitems = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,subitems: null == subitems ? _self.subitems : subitems // ignore: cast_nullable_to_non_nullable
as List<EpubChapter>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EpubChapter extends EpubChapter {
  const _EpubChapter({required this.title, required this.id, required this.href, required final  List<EpubChapter> subitems}): _subitems = subitems,super._();
  factory _EpubChapter.fromJson(Map<String, dynamic> json) => _$EpubChapterFromJson(json);

@override final  String title;
@override final  String id;
@override final  String href;
 final  List<EpubChapter> _subitems;
@override List<EpubChapter> get subitems {
  if (_subitems is EqualUnmodifiableListView) return _subitems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subitems);
}


/// Create a copy of EpubChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubChapterCopyWith<_EpubChapter> get copyWith => __$EpubChapterCopyWithImpl<_EpubChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubChapter&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id)&&(identical(other.href, href) || other.href == href)&&const DeepCollectionEquality().equals(other._subitems, _subitems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,id,href,const DeepCollectionEquality().hash(_subitems));

@override
String toString() {
  return 'EpubChapter(title: $title, id: $id, href: $href, subitems: $subitems)';
}


}

/// @nodoc
abstract mixin class _$EpubChapterCopyWith<$Res> implements $EpubChapterCopyWith<$Res> {
  factory _$EpubChapterCopyWith(_EpubChapter value, $Res Function(_EpubChapter) _then) = __$EpubChapterCopyWithImpl;
@override @useResult
$Res call({
 String title, String id, String href, List<EpubChapter> subitems
});




}
/// @nodoc
class __$EpubChapterCopyWithImpl<$Res>
    implements _$EpubChapterCopyWith<$Res> {
  __$EpubChapterCopyWithImpl(this._self, this._then);

  final _EpubChapter _self;
  final $Res Function(_EpubChapter) _then;

/// Create a copy of EpubChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? id = null,Object? href = null,Object? subitems = null,}) {
  return _then(_EpubChapter(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,subitems: null == subitems ? _self._subitems : subitems // ignore: cast_nullable_to_non_nullable
as List<EpubChapter>,
  ));
}


}


/// @nodoc
mixin _$EpubLocation {

 String get startCfi; String get endCfi; double get progress;
/// Create a copy of EpubLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubLocationCopyWith<EpubLocation> get copyWith => _$EpubLocationCopyWithImpl<EpubLocation>(this as EpubLocation, _$identity);

  /// Serializes this EpubLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubLocation&&(identical(other.startCfi, startCfi) || other.startCfi == startCfi)&&(identical(other.endCfi, endCfi) || other.endCfi == endCfi)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startCfi,endCfi,progress);

@override
String toString() {
  return 'EpubLocation(startCfi: $startCfi, endCfi: $endCfi, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $EpubLocationCopyWith<$Res>  {
  factory $EpubLocationCopyWith(EpubLocation value, $Res Function(EpubLocation) _then) = _$EpubLocationCopyWithImpl;
@useResult
$Res call({
 String startCfi, String endCfi, double progress
});




}
/// @nodoc
class _$EpubLocationCopyWithImpl<$Res>
    implements $EpubLocationCopyWith<$Res> {
  _$EpubLocationCopyWithImpl(this._self, this._then);

  final EpubLocation _self;
  final $Res Function(EpubLocation) _then;

/// Create a copy of EpubLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startCfi = null,Object? endCfi = null,Object? progress = null,}) {
  return _then(_self.copyWith(
startCfi: null == startCfi ? _self.startCfi : startCfi // ignore: cast_nullable_to_non_nullable
as String,endCfi: null == endCfi ? _self.endCfi : endCfi // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EpubLocation implements EpubLocation {
  const _EpubLocation({required this.startCfi, required this.endCfi, required this.progress});
  factory _EpubLocation.fromJson(Map<String, dynamic> json) => _$EpubLocationFromJson(json);

@override final  String startCfi;
@override final  String endCfi;
@override final  double progress;

/// Create a copy of EpubLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubLocationCopyWith<_EpubLocation> get copyWith => __$EpubLocationCopyWithImpl<_EpubLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubLocation&&(identical(other.startCfi, startCfi) || other.startCfi == startCfi)&&(identical(other.endCfi, endCfi) || other.endCfi == endCfi)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startCfi,endCfi,progress);

@override
String toString() {
  return 'EpubLocation(startCfi: $startCfi, endCfi: $endCfi, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$EpubLocationCopyWith<$Res> implements $EpubLocationCopyWith<$Res> {
  factory _$EpubLocationCopyWith(_EpubLocation value, $Res Function(_EpubLocation) _then) = __$EpubLocationCopyWithImpl;
@override @useResult
$Res call({
 String startCfi, String endCfi, double progress
});




}
/// @nodoc
class __$EpubLocationCopyWithImpl<$Res>
    implements _$EpubLocationCopyWith<$Res> {
  __$EpubLocationCopyWithImpl(this._self, this._then);

  final _EpubLocation _self;
  final $Res Function(_EpubLocation) _then;

/// Create a copy of EpubLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startCfi = null,Object? endCfi = null,Object? progress = null,}) {
  return _then(_EpubLocation(
startCfi: null == startCfi ? _self.startCfi : startCfi // ignore: cast_nullable_to_non_nullable
as String,endCfi: null == endCfi ? _self.endCfi : endCfi // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$EpubDisplaySettings {

 int get fontSize; EpubSpread get spread; EpubTheme? get theme;
/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubDisplaySettingsCopyWith<EpubDisplaySettings> get copyWith => _$EpubDisplaySettingsCopyWithImpl<EpubDisplaySettings>(this as EpubDisplaySettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubDisplaySettings&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.spread, spread) || other.spread == spread)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize,spread,theme);

@override
String toString() {
  return 'EpubDisplaySettings(fontSize: $fontSize, spread: $spread, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $EpubDisplaySettingsCopyWith<$Res>  {
  factory $EpubDisplaySettingsCopyWith(EpubDisplaySettings value, $Res Function(EpubDisplaySettings) _then) = _$EpubDisplaySettingsCopyWithImpl;
@useResult
$Res call({
 int fontSize, EpubSpread spread, EpubTheme? theme
});


$EpubThemeCopyWith<$Res>? get theme;

}
/// @nodoc
class _$EpubDisplaySettingsCopyWithImpl<$Res>
    implements $EpubDisplaySettingsCopyWith<$Res> {
  _$EpubDisplaySettingsCopyWithImpl(this._self, this._then);

  final EpubDisplaySettings _self;
  final $Res Function(EpubDisplaySettings) _then;

/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = null,Object? spread = null,Object? theme = freezed,}) {
  return _then(_self.copyWith(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,spread: null == spread ? _self.spread : spread // ignore: cast_nullable_to_non_nullable
as EpubSpread,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as EpubTheme?,
  ));
}
/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpubThemeCopyWith<$Res>? get theme {
    if (_self.theme == null) {
    return null;
  }

  return $EpubThemeCopyWith<$Res>(_self.theme!, (value) {
    return _then(_self.copyWith(theme: value));
  });
}
}


/// @nodoc


class _EpubDisplaySettings implements EpubDisplaySettings {
  const _EpubDisplaySettings({this.fontSize = 15, this.spread = EpubSpread.auto, this.theme});
  

@override@JsonKey() final  int fontSize;
@override@JsonKey() final  EpubSpread spread;
@override final  EpubTheme? theme;

/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubDisplaySettingsCopyWith<_EpubDisplaySettings> get copyWith => __$EpubDisplaySettingsCopyWithImpl<_EpubDisplaySettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubDisplaySettings&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.spread, spread) || other.spread == spread)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize,spread,theme);

@override
String toString() {
  return 'EpubDisplaySettings(fontSize: $fontSize, spread: $spread, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$EpubDisplaySettingsCopyWith<$Res> implements $EpubDisplaySettingsCopyWith<$Res> {
  factory _$EpubDisplaySettingsCopyWith(_EpubDisplaySettings value, $Res Function(_EpubDisplaySettings) _then) = __$EpubDisplaySettingsCopyWithImpl;
@override @useResult
$Res call({
 int fontSize, EpubSpread spread, EpubTheme? theme
});


@override $EpubThemeCopyWith<$Res>? get theme;

}
/// @nodoc
class __$EpubDisplaySettingsCopyWithImpl<$Res>
    implements _$EpubDisplaySettingsCopyWith<$Res> {
  __$EpubDisplaySettingsCopyWithImpl(this._self, this._then);

  final _EpubDisplaySettings _self;
  final $Res Function(_EpubDisplaySettings) _then;

/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = null,Object? spread = null,Object? theme = freezed,}) {
  return _then(_EpubDisplaySettings(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,spread: null == spread ? _self.spread : spread // ignore: cast_nullable_to_non_nullable
as EpubSpread,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as EpubTheme?,
  ));
}

/// Create a copy of EpubDisplaySettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EpubThemeCopyWith<$Res>? get theme {
    if (_self.theme == null) {
    return null;
  }

  return $EpubThemeCopyWith<$Res>(_self.theme!, (value) {
    return _then(_self.copyWith(theme: value));
  });
}
}

/// @nodoc
mixin _$EpubTheme {

 Color get background; Color get foreground; Brightness get theme;
/// Create a copy of EpubTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubThemeCopyWith<EpubTheme> get copyWith => _$EpubThemeCopyWithImpl<EpubTheme>(this as EpubTheme, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubTheme&&(identical(other.background, background) || other.background == background)&&(identical(other.foreground, foreground) || other.foreground == foreground)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,background,foreground,theme);

@override
String toString() {
  return 'EpubTheme(background: $background, foreground: $foreground, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $EpubThemeCopyWith<$Res>  {
  factory $EpubThemeCopyWith(EpubTheme value, $Res Function(EpubTheme) _then) = _$EpubThemeCopyWithImpl;
@useResult
$Res call({
 Color background, Color foreground, Brightness theme
});




}
/// @nodoc
class _$EpubThemeCopyWithImpl<$Res>
    implements $EpubThemeCopyWith<$Res> {
  _$EpubThemeCopyWithImpl(this._self, this._then);

  final EpubTheme _self;
  final $Res Function(EpubTheme) _then;

/// Create a copy of EpubTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? background = null,Object? foreground = null,Object? theme = null,}) {
  return _then(_self.copyWith(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,foreground: null == foreground ? _self.foreground : foreground // ignore: cast_nullable_to_non_nullable
as Color,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as Brightness,
  ));
}

}


/// @nodoc


class _EpubTheme implements EpubTheme {
  const _EpubTheme({required this.background, required this.foreground, required this.theme});
  

@override final  Color background;
@override final  Color foreground;
@override final  Brightness theme;

/// Create a copy of EpubTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubThemeCopyWith<_EpubTheme> get copyWith => __$EpubThemeCopyWithImpl<_EpubTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubTheme&&(identical(other.background, background) || other.background == background)&&(identical(other.foreground, foreground) || other.foreground == foreground)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,background,foreground,theme);

@override
String toString() {
  return 'EpubTheme(background: $background, foreground: $foreground, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$EpubThemeCopyWith<$Res> implements $EpubThemeCopyWith<$Res> {
  factory _$EpubThemeCopyWith(_EpubTheme value, $Res Function(_EpubTheme) _then) = __$EpubThemeCopyWithImpl;
@override @useResult
$Res call({
 Color background, Color foreground, Brightness theme
});




}
/// @nodoc
class __$EpubThemeCopyWithImpl<$Res>
    implements _$EpubThemeCopyWith<$Res> {
  __$EpubThemeCopyWithImpl(this._self, this._then);

  final _EpubTheme _self;
  final $Res Function(_EpubTheme) _then;

/// Create a copy of EpubTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? background = null,Object? foreground = null,Object? theme = null,}) {
  return _then(_EpubTheme(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as Color,foreground: null == foreground ? _self.foreground : foreground // ignore: cast_nullable_to_non_nullable
as Color,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as Brightness,
  ));
}


}


/// @nodoc
mixin _$EpubTextExtractRes {

 String? get text; String? get cfiRange;
/// Create a copy of EpubTextExtractRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubTextExtractResCopyWith<EpubTextExtractRes> get copyWith => _$EpubTextExtractResCopyWithImpl<EpubTextExtractRes>(this as EpubTextExtractRes, _$identity);

  /// Serializes this EpubTextExtractRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubTextExtractRes&&(identical(other.text, text) || other.text == text)&&(identical(other.cfiRange, cfiRange) || other.cfiRange == cfiRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,cfiRange);

@override
String toString() {
  return 'EpubTextExtractRes(text: $text, cfiRange: $cfiRange)';
}


}

/// @nodoc
abstract mixin class $EpubTextExtractResCopyWith<$Res>  {
  factory $EpubTextExtractResCopyWith(EpubTextExtractRes value, $Res Function(EpubTextExtractRes) _then) = _$EpubTextExtractResCopyWithImpl;
@useResult
$Res call({
 String? text, String? cfiRange
});




}
/// @nodoc
class _$EpubTextExtractResCopyWithImpl<$Res>
    implements $EpubTextExtractResCopyWith<$Res> {
  _$EpubTextExtractResCopyWithImpl(this._self, this._then);

  final EpubTextExtractRes _self;
  final $Res Function(EpubTextExtractRes) _then;

/// Create a copy of EpubTextExtractRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? cfiRange = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,cfiRange: freezed == cfiRange ? _self.cfiRange : cfiRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EpubTextExtractRes implements EpubTextExtractRes {
  const _EpubTextExtractRes({this.text, this.cfiRange});
  factory _EpubTextExtractRes.fromJson(Map<String, dynamic> json) => _$EpubTextExtractResFromJson(json);

@override final  String? text;
@override final  String? cfiRange;

/// Create a copy of EpubTextExtractRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubTextExtractResCopyWith<_EpubTextExtractRes> get copyWith => __$EpubTextExtractResCopyWithImpl<_EpubTextExtractRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpubTextExtractResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubTextExtractRes&&(identical(other.text, text) || other.text == text)&&(identical(other.cfiRange, cfiRange) || other.cfiRange == cfiRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,cfiRange);

@override
String toString() {
  return 'EpubTextExtractRes(text: $text, cfiRange: $cfiRange)';
}


}

/// @nodoc
abstract mixin class _$EpubTextExtractResCopyWith<$Res> implements $EpubTextExtractResCopyWith<$Res> {
  factory _$EpubTextExtractResCopyWith(_EpubTextExtractRes value, $Res Function(_EpubTextExtractRes) _then) = __$EpubTextExtractResCopyWithImpl;
@override @useResult
$Res call({
 String? text, String? cfiRange
});




}
/// @nodoc
class __$EpubTextExtractResCopyWithImpl<$Res>
    implements _$EpubTextExtractResCopyWith<$Res> {
  __$EpubTextExtractResCopyWithImpl(this._self, this._then);

  final _EpubTextExtractRes _self;
  final $Res Function(_EpubTextExtractRes) _then;

/// Create a copy of EpubTextExtractRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? cfiRange = freezed,}) {
  return _then(_EpubTextExtractRes(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,cfiRange: freezed == cfiRange ? _self.cfiRange : cfiRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$EpubTextSelection {

 String get selectedText; String get selectionCfi;
/// Create a copy of EpubTextSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpubTextSelectionCopyWith<EpubTextSelection> get copyWith => _$EpubTextSelectionCopyWithImpl<EpubTextSelection>(this as EpubTextSelection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpubTextSelection&&(identical(other.selectedText, selectedText) || other.selectedText == selectedText)&&(identical(other.selectionCfi, selectionCfi) || other.selectionCfi == selectionCfi));
}


@override
int get hashCode => Object.hash(runtimeType,selectedText,selectionCfi);

@override
String toString() {
  return 'EpubTextSelection(selectedText: $selectedText, selectionCfi: $selectionCfi)';
}


}

/// @nodoc
abstract mixin class $EpubTextSelectionCopyWith<$Res>  {
  factory $EpubTextSelectionCopyWith(EpubTextSelection value, $Res Function(EpubTextSelection) _then) = _$EpubTextSelectionCopyWithImpl;
@useResult
$Res call({
 String selectedText, String selectionCfi
});




}
/// @nodoc
class _$EpubTextSelectionCopyWithImpl<$Res>
    implements $EpubTextSelectionCopyWith<$Res> {
  _$EpubTextSelectionCopyWithImpl(this._self, this._then);

  final EpubTextSelection _self;
  final $Res Function(EpubTextSelection) _then;

/// Create a copy of EpubTextSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedText = null,Object? selectionCfi = null,}) {
  return _then(_self.copyWith(
selectedText: null == selectedText ? _self.selectedText : selectedText // ignore: cast_nullable_to_non_nullable
as String,selectionCfi: null == selectionCfi ? _self.selectionCfi : selectionCfi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _EpubTextSelection implements EpubTextSelection {
  const _EpubTextSelection({required this.selectedText, required this.selectionCfi});
  

@override final  String selectedText;
@override final  String selectionCfi;

/// Create a copy of EpubTextSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpubTextSelectionCopyWith<_EpubTextSelection> get copyWith => __$EpubTextSelectionCopyWithImpl<_EpubTextSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpubTextSelection&&(identical(other.selectedText, selectedText) || other.selectedText == selectedText)&&(identical(other.selectionCfi, selectionCfi) || other.selectionCfi == selectionCfi));
}


@override
int get hashCode => Object.hash(runtimeType,selectedText,selectionCfi);

@override
String toString() {
  return 'EpubTextSelection(selectedText: $selectedText, selectionCfi: $selectionCfi)';
}


}

/// @nodoc
abstract mixin class _$EpubTextSelectionCopyWith<$Res> implements $EpubTextSelectionCopyWith<$Res> {
  factory _$EpubTextSelectionCopyWith(_EpubTextSelection value, $Res Function(_EpubTextSelection) _then) = __$EpubTextSelectionCopyWithImpl;
@override @useResult
$Res call({
 String selectedText, String selectionCfi
});




}
/// @nodoc
class __$EpubTextSelectionCopyWithImpl<$Res>
    implements _$EpubTextSelectionCopyWith<$Res> {
  __$EpubTextSelectionCopyWithImpl(this._self, this._then);

  final _EpubTextSelection _self;
  final $Res Function(_EpubTextSelection) _then;

/// Create a copy of EpubTextSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedText = null,Object? selectionCfi = null,}) {
  return _then(_EpubTextSelection(
selectedText: null == selectedText ? _self.selectedText : selectedText // ignore: cast_nullable_to_non_nullable
as String,selectionCfi: null == selectionCfi ? _self.selectionCfi : selectionCfi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookStat {

 String get id; String get bookId; String get userId; double get progress; DateTime get createdAt;
/// Create a copy of BookStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookStatCopyWith<BookStat> get copyWith => _$BookStatCopyWithImpl<BookStat>(this as BookStat, _$identity);

  /// Serializes this BookStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookStat&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,progress,createdAt);

@override
String toString() {
  return 'BookStat(id: $id, bookId: $bookId, userId: $userId, progress: $progress, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookStatCopyWith<$Res>  {
  factory $BookStatCopyWith(BookStat value, $Res Function(BookStat) _then) = _$BookStatCopyWithImpl;
@useResult
$Res call({
 String id, String bookId, String userId, double progress, DateTime createdAt
});




}
/// @nodoc
class _$BookStatCopyWithImpl<$Res>
    implements $BookStatCopyWith<$Res> {
  _$BookStatCopyWithImpl(this._self, this._then);

  final BookStat _self;
  final $Res Function(BookStat) _then;

/// Create a copy of BookStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? userId = null,Object? progress = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookStat implements BookStat {
  const _BookStat({required this.id, required this.bookId, required this.userId, required this.progress, required this.createdAt});
  factory _BookStat.fromJson(Map<String, dynamic> json) => _$BookStatFromJson(json);

@override final  String id;
@override final  String bookId;
@override final  String userId;
@override final  double progress;
@override final  DateTime createdAt;

/// Create a copy of BookStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookStatCopyWith<_BookStat> get copyWith => __$BookStatCopyWithImpl<_BookStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookStat&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,progress,createdAt);

@override
String toString() {
  return 'BookStat(id: $id, bookId: $bookId, userId: $userId, progress: $progress, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookStatCopyWith<$Res> implements $BookStatCopyWith<$Res> {
  factory _$BookStatCopyWith(_BookStat value, $Res Function(_BookStat) _then) = __$BookStatCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookId, String userId, double progress, DateTime createdAt
});




}
/// @nodoc
class __$BookStatCopyWithImpl<$Res>
    implements _$BookStatCopyWith<$Res> {
  __$BookStatCopyWithImpl(this._self, this._then);

  final _BookStat _self;
  final $Res Function(_BookStat) _then;

/// Create a copy of BookStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? userId = null,Object? progress = null,Object? createdAt = null,}) {
  return _then(_BookStat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

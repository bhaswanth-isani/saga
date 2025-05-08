// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryBook {

 String get id; double get progress; String get isbn10; String get isbn13; BookStatus get status; DateTime? get finishedOn; String? get path; String get userId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of LibraryBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryBookCopyWith<LibraryBook> get copyWith => _$LibraryBookCopyWithImpl<LibraryBook>(this as LibraryBook, _$identity);

  /// Serializes this LibraryBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryBook&&(identical(other.id, id) || other.id == id)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isbn10, isbn10) || other.isbn10 == isbn10)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.status, status) || other.status == status)&&(identical(other.finishedOn, finishedOn) || other.finishedOn == finishedOn)&&(identical(other.path, path) || other.path == path)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,progress,isbn10,isbn13,status,finishedOn,path,userId,createdAt,updatedAt);

@override
String toString() {
  return 'LibraryBook(id: $id, progress: $progress, isbn10: $isbn10, isbn13: $isbn13, status: $status, finishedOn: $finishedOn, path: $path, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LibraryBookCopyWith<$Res>  {
  factory $LibraryBookCopyWith(LibraryBook value, $Res Function(LibraryBook) _then) = _$LibraryBookCopyWithImpl;
@useResult
$Res call({
 String id, double progress, String isbn10, String isbn13, BookStatus status, DateTime? finishedOn, String? path, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$LibraryBookCopyWithImpl<$Res>
    implements $LibraryBookCopyWith<$Res> {
  _$LibraryBookCopyWithImpl(this._self, this._then);

  final LibraryBook _self;
  final $Res Function(LibraryBook) _then;

/// Create a copy of LibraryBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? progress = null,Object? isbn10 = null,Object? isbn13 = null,Object? status = null,Object? finishedOn = freezed,Object? path = freezed,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isbn10: null == isbn10 ? _self.isbn10 : isbn10 // ignore: cast_nullable_to_non_nullable
as String,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookStatus,finishedOn: freezed == finishedOn ? _self.finishedOn : finishedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LibraryBook implements LibraryBook {
  const _LibraryBook({required this.id, required this.progress, required this.isbn10, required this.isbn13, required this.status, required this.finishedOn, required this.path, required this.userId, required this.createdAt, required this.updatedAt});
  factory _LibraryBook.fromJson(Map<String, dynamic> json) => _$LibraryBookFromJson(json);

@override final  String id;
@override final  double progress;
@override final  String isbn10;
@override final  String isbn13;
@override final  BookStatus status;
@override final  DateTime? finishedOn;
@override final  String? path;
@override final  String userId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of LibraryBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryBookCopyWith<_LibraryBook> get copyWith => __$LibraryBookCopyWithImpl<_LibraryBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryBookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryBook&&(identical(other.id, id) || other.id == id)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isbn10, isbn10) || other.isbn10 == isbn10)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.status, status) || other.status == status)&&(identical(other.finishedOn, finishedOn) || other.finishedOn == finishedOn)&&(identical(other.path, path) || other.path == path)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,progress,isbn10,isbn13,status,finishedOn,path,userId,createdAt,updatedAt);

@override
String toString() {
  return 'LibraryBook(id: $id, progress: $progress, isbn10: $isbn10, isbn13: $isbn13, status: $status, finishedOn: $finishedOn, path: $path, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LibraryBookCopyWith<$Res> implements $LibraryBookCopyWith<$Res> {
  factory _$LibraryBookCopyWith(_LibraryBook value, $Res Function(_LibraryBook) _then) = __$LibraryBookCopyWithImpl;
@override @useResult
$Res call({
 String id, double progress, String isbn10, String isbn13, BookStatus status, DateTime? finishedOn, String? path, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$LibraryBookCopyWithImpl<$Res>
    implements _$LibraryBookCopyWith<$Res> {
  __$LibraryBookCopyWithImpl(this._self, this._then);

  final _LibraryBook _self;
  final $Res Function(_LibraryBook) _then;

/// Create a copy of LibraryBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? progress = null,Object? isbn10 = null,Object? isbn13 = null,Object? status = null,Object? finishedOn = freezed,Object? path = freezed,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_LibraryBook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isbn10: null == isbn10 ? _self.isbn10 : isbn10 // ignore: cast_nullable_to_non_nullable
as String,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookStatus,finishedOn: freezed == finishedOn ? _self.finishedOn : finishedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

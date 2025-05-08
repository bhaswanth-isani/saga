// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialRequest {

 IdToken get idToken; DeviceRequest get device; SocialProvider get provider;
/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialRequestCopyWith<SocialRequest> get copyWith => _$SocialRequestCopyWithImpl<SocialRequest>(this as SocialRequest, _$identity);

  /// Serializes this SocialRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialRequest&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.device, device) || other.device == device)&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken,device,provider);

@override
String toString() {
  return 'SocialRequest(idToken: $idToken, device: $device, provider: $provider)';
}


}

/// @nodoc
abstract mixin class $SocialRequestCopyWith<$Res>  {
  factory $SocialRequestCopyWith(SocialRequest value, $Res Function(SocialRequest) _then) = _$SocialRequestCopyWithImpl;
@useResult
$Res call({
 IdToken idToken, DeviceRequest device, SocialProvider provider
});


$IdTokenCopyWith<$Res> get idToken;$DeviceRequestCopyWith<$Res> get device;

}
/// @nodoc
class _$SocialRequestCopyWithImpl<$Res>
    implements $SocialRequestCopyWith<$Res> {
  _$SocialRequestCopyWithImpl(this._self, this._then);

  final SocialRequest _self;
  final $Res Function(SocialRequest) _then;

/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? device = null,Object? provider = null,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as IdToken,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceRequest,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as SocialProvider,
  ));
}
/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdTokenCopyWith<$Res> get idToken {
  
  return $IdTokenCopyWith<$Res>(_self.idToken, (value) {
    return _then(_self.copyWith(idToken: value));
  });
}/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceRequestCopyWith<$Res> get device {
  
  return $DeviceRequestCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _SocialRequest implements SocialRequest {
  const _SocialRequest({required this.idToken, required this.device, required this.provider});
  factory _SocialRequest.fromJson(Map<String, dynamic> json) => _$SocialRequestFromJson(json);

@override final  IdToken idToken;
@override final  DeviceRequest device;
@override final  SocialProvider provider;

/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialRequestCopyWith<_SocialRequest> get copyWith => __$SocialRequestCopyWithImpl<_SocialRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialRequest&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.device, device) || other.device == device)&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken,device,provider);

@override
String toString() {
  return 'SocialRequest(idToken: $idToken, device: $device, provider: $provider)';
}


}

/// @nodoc
abstract mixin class _$SocialRequestCopyWith<$Res> implements $SocialRequestCopyWith<$Res> {
  factory _$SocialRequestCopyWith(_SocialRequest value, $Res Function(_SocialRequest) _then) = __$SocialRequestCopyWithImpl;
@override @useResult
$Res call({
 IdToken idToken, DeviceRequest device, SocialProvider provider
});


@override $IdTokenCopyWith<$Res> get idToken;@override $DeviceRequestCopyWith<$Res> get device;

}
/// @nodoc
class __$SocialRequestCopyWithImpl<$Res>
    implements _$SocialRequestCopyWith<$Res> {
  __$SocialRequestCopyWithImpl(this._self, this._then);

  final _SocialRequest _self;
  final $Res Function(_SocialRequest) _then;

/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? device = null,Object? provider = null,}) {
  return _then(_SocialRequest(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as IdToken,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceRequest,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as SocialProvider,
  ));
}

/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdTokenCopyWith<$Res> get idToken {
  
  return $IdTokenCopyWith<$Res>(_self.idToken, (value) {
    return _then(_self.copyWith(idToken: value));
  });
}/// Create a copy of SocialRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceRequestCopyWith<$Res> get device {
  
  return $DeviceRequestCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}


/// @nodoc
mixin _$IdToken {

 String get token; String? get accessToken; String? get refreshToken; DateTime? get expiresAt;
/// Create a copy of IdToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdTokenCopyWith<IdToken> get copyWith => _$IdTokenCopyWithImpl<IdToken>(this as IdToken, _$identity);

  /// Serializes this IdToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdToken&&(identical(other.token, token) || other.token == token)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'IdToken(token: $token, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $IdTokenCopyWith<$Res>  {
  factory $IdTokenCopyWith(IdToken value, $Res Function(IdToken) _then) = _$IdTokenCopyWithImpl;
@useResult
$Res call({
 String token, String? accessToken, String? refreshToken, DateTime? expiresAt
});




}
/// @nodoc
class _$IdTokenCopyWithImpl<$Res>
    implements $IdTokenCopyWith<$Res> {
  _$IdTokenCopyWithImpl(this._self, this._then);

  final IdToken _self;
  final $Res Function(IdToken) _then;

/// Create a copy of IdToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IdToken implements IdToken {
  const _IdToken({required this.token, required this.accessToken, required this.refreshToken, required this.expiresAt});
  factory _IdToken.fromJson(Map<String, dynamic> json) => _$IdTokenFromJson(json);

@override final  String token;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  DateTime? expiresAt;

/// Create a copy of IdToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdTokenCopyWith<_IdToken> get copyWith => __$IdTokenCopyWithImpl<_IdToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdToken&&(identical(other.token, token) || other.token == token)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'IdToken(token: $token, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$IdTokenCopyWith<$Res> implements $IdTokenCopyWith<$Res> {
  factory _$IdTokenCopyWith(_IdToken value, $Res Function(_IdToken) _then) = __$IdTokenCopyWithImpl;
@override @useResult
$Res call({
 String token, String? accessToken, String? refreshToken, DateTime? expiresAt
});




}
/// @nodoc
class __$IdTokenCopyWithImpl<$Res>
    implements _$IdTokenCopyWith<$Res> {
  __$IdTokenCopyWithImpl(this._self, this._then);

  final _IdToken _self;
  final $Res Function(_IdToken) _then;

/// Create a copy of IdToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_IdToken(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DeviceRequest {

 String get name; DeviceType get type;
/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRequestCopyWith<DeviceRequest> get copyWith => _$DeviceRequestCopyWithImpl<DeviceRequest>(this as DeviceRequest, _$identity);

  /// Serializes this DeviceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'DeviceRequest(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $DeviceRequestCopyWith<$Res>  {
  factory $DeviceRequestCopyWith(DeviceRequest value, $Res Function(DeviceRequest) _then) = _$DeviceRequestCopyWithImpl;
@useResult
$Res call({
 String name, DeviceType type
});




}
/// @nodoc
class _$DeviceRequestCopyWithImpl<$Res>
    implements $DeviceRequestCopyWith<$Res> {
  _$DeviceRequestCopyWithImpl(this._self, this._then);

  final DeviceRequest _self;
  final $Res Function(DeviceRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeviceRequest implements DeviceRequest {
  const _DeviceRequest({required this.name, required this.type});
  factory _DeviceRequest.fromJson(Map<String, dynamic> json) => _$DeviceRequestFromJson(json);

@override final  String name;
@override final  DeviceType type;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceRequestCopyWith<_DeviceRequest> get copyWith => __$DeviceRequestCopyWithImpl<_DeviceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'DeviceRequest(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$DeviceRequestCopyWith<$Res> implements $DeviceRequestCopyWith<$Res> {
  factory _$DeviceRequestCopyWith(_DeviceRequest value, $Res Function(_DeviceRequest) _then) = __$DeviceRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, DeviceType type
});




}
/// @nodoc
class __$DeviceRequestCopyWithImpl<$Res>
    implements _$DeviceRequestCopyWith<$Res> {
  __$DeviceRequestCopyWithImpl(this._self, this._then);

  final _DeviceRequest _self;
  final $Res Function(_DeviceRequest) _then;

/// Create a copy of DeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,}) {
  return _then(_DeviceRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,
  ));
}


}


/// @nodoc
mixin _$StatRequest {

 String get isbn13; double get progress;
/// Create a copy of StatRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatRequestCopyWith<StatRequest> get copyWith => _$StatRequestCopyWithImpl<StatRequest>(this as StatRequest, _$identity);

  /// Serializes this StatRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatRequest&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isbn13,progress);

@override
String toString() {
  return 'StatRequest(isbn13: $isbn13, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $StatRequestCopyWith<$Res>  {
  factory $StatRequestCopyWith(StatRequest value, $Res Function(StatRequest) _then) = _$StatRequestCopyWithImpl;
@useResult
$Res call({
 String isbn13, double progress
});




}
/// @nodoc
class _$StatRequestCopyWithImpl<$Res>
    implements $StatRequestCopyWith<$Res> {
  _$StatRequestCopyWithImpl(this._self, this._then);

  final StatRequest _self;
  final $Res Function(StatRequest) _then;

/// Create a copy of StatRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isbn13 = null,Object? progress = null,}) {
  return _then(_self.copyWith(
isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StatRequest implements StatRequest {
  const _StatRequest({required this.isbn13, required this.progress});
  factory _StatRequest.fromJson(Map<String, dynamic> json) => _$StatRequestFromJson(json);

@override final  String isbn13;
@override final  double progress;

/// Create a copy of StatRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatRequestCopyWith<_StatRequest> get copyWith => __$StatRequestCopyWithImpl<_StatRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatRequest&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isbn13,progress);

@override
String toString() {
  return 'StatRequest(isbn13: $isbn13, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$StatRequestCopyWith<$Res> implements $StatRequestCopyWith<$Res> {
  factory _$StatRequestCopyWith(_StatRequest value, $Res Function(_StatRequest) _then) = __$StatRequestCopyWithImpl;
@override @useResult
$Res call({
 String isbn13, double progress
});




}
/// @nodoc
class __$StatRequestCopyWithImpl<$Res>
    implements _$StatRequestCopyWith<$Res> {
  __$StatRequestCopyWithImpl(this._self, this._then);

  final _StatRequest _self;
  final $Res Function(_StatRequest) _then;

/// Create a copy of StatRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isbn13 = null,Object? progress = null,}) {
  return _then(_StatRequest(
isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$UploadBookRequest {

 int get length; String get isbn13;
/// Create a copy of UploadBookRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadBookRequestCopyWith<UploadBookRequest> get copyWith => _$UploadBookRequestCopyWithImpl<UploadBookRequest>(this as UploadBookRequest, _$identity);

  /// Serializes this UploadBookRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadBookRequest&&(identical(other.length, length) || other.length == length)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,isbn13);

@override
String toString() {
  return 'UploadBookRequest(length: $length, isbn13: $isbn13)';
}


}

/// @nodoc
abstract mixin class $UploadBookRequestCopyWith<$Res>  {
  factory $UploadBookRequestCopyWith(UploadBookRequest value, $Res Function(UploadBookRequest) _then) = _$UploadBookRequestCopyWithImpl;
@useResult
$Res call({
 int length, String isbn13
});




}
/// @nodoc
class _$UploadBookRequestCopyWithImpl<$Res>
    implements $UploadBookRequestCopyWith<$Res> {
  _$UploadBookRequestCopyWithImpl(this._self, this._then);

  final UploadBookRequest _self;
  final $Res Function(UploadBookRequest) _then;

/// Create a copy of UploadBookRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? length = null,Object? isbn13 = null,}) {
  return _then(_self.copyWith(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UploadBookRequest implements UploadBookRequest {
  const _UploadBookRequest({required this.length, required this.isbn13});
  factory _UploadBookRequest.fromJson(Map<String, dynamic> json) => _$UploadBookRequestFromJson(json);

@override final  int length;
@override final  String isbn13;

/// Create a copy of UploadBookRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadBookRequestCopyWith<_UploadBookRequest> get copyWith => __$UploadBookRequestCopyWithImpl<_UploadBookRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadBookRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadBookRequest&&(identical(other.length, length) || other.length == length)&&(identical(other.isbn13, isbn13) || other.isbn13 == isbn13));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,isbn13);

@override
String toString() {
  return 'UploadBookRequest(length: $length, isbn13: $isbn13)';
}


}

/// @nodoc
abstract mixin class _$UploadBookRequestCopyWith<$Res> implements $UploadBookRequestCopyWith<$Res> {
  factory _$UploadBookRequestCopyWith(_UploadBookRequest value, $Res Function(_UploadBookRequest) _then) = __$UploadBookRequestCopyWithImpl;
@override @useResult
$Res call({
 int length, String isbn13
});




}
/// @nodoc
class __$UploadBookRequestCopyWithImpl<$Res>
    implements _$UploadBookRequestCopyWith<$Res> {
  __$UploadBookRequestCopyWithImpl(this._self, this._then);

  final _UploadBookRequest _self;
  final $Res Function(_UploadBookRequest) _then;

/// Create a copy of UploadBookRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? length = null,Object? isbn13 = null,}) {
  return _then(_UploadBookRequest(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,isbn13: null == isbn13 ? _self.isbn13 : isbn13 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SuccessResponse {

 bool get success;
/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessResponseCopyWith<SuccessResponse> get copyWith => _$SuccessResponseCopyWithImpl<SuccessResponse>(this as SuccessResponse, _$identity);

  /// Serializes this SuccessResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'SuccessResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $SuccessResponseCopyWith<$Res>  {
  factory $SuccessResponseCopyWith(SuccessResponse value, $Res Function(SuccessResponse) _then) = _$SuccessResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$SuccessResponseCopyWithImpl<$Res>
    implements $SuccessResponseCopyWith<$Res> {
  _$SuccessResponseCopyWithImpl(this._self, this._then);

  final SuccessResponse _self;
  final $Res Function(SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SuccessResponse implements SuccessResponse {
  const _SuccessResponse(this.success);
  factory _SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);

@override final  bool success;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessResponseCopyWith<_SuccessResponse> get copyWith => __$SuccessResponseCopyWithImpl<_SuccessResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuccessResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'SuccessResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$SuccessResponseCopyWith<$Res> implements $SuccessResponseCopyWith<$Res> {
  factory _$SuccessResponseCopyWith(_SuccessResponse value, $Res Function(_SuccessResponse) _then) = __$SuccessResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$SuccessResponseCopyWithImpl<$Res>
    implements _$SuccessResponseCopyWith<$Res> {
  __$SuccessResponseCopyWithImpl(this._self, this._then);

  final _SuccessResponse _self;
  final $Res Function(_SuccessResponse) _then;

/// Create a copy of SuccessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_SuccessResponse(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserSession {

 Session get session; User get user;
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionCopyWith<UserSession> get copyWith => _$UserSessionCopyWithImpl<UserSession>(this as UserSession, _$identity);

  /// Serializes this UserSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSession&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user);

@override
String toString() {
  return 'UserSession(session: $session, user: $user)';
}


}

/// @nodoc
abstract mixin class $UserSessionCopyWith<$Res>  {
  factory $UserSessionCopyWith(UserSession value, $Res Function(UserSession) _then) = _$UserSessionCopyWithImpl;
@useResult
$Res call({
 Session session, User user
});


$SessionCopyWith<$Res> get session;$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserSessionCopyWithImpl<$Res>
    implements $UserSessionCopyWith<$Res> {
  _$UserSessionCopyWithImpl(this._self, this._then);

  final UserSession _self;
  final $Res Function(UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? user = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserSession implements UserSession {
  const _UserSession({required this.session, required this.user});
  factory _UserSession.fromJson(Map<String, dynamic> json) => _$UserSessionFromJson(json);

@override final  Session session;
@override final  User user;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionCopyWith<_UserSession> get copyWith => __$UserSessionCopyWithImpl<_UserSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSession&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user);

@override
String toString() {
  return 'UserSession(session: $session, user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserSessionCopyWith<$Res> implements $UserSessionCopyWith<$Res> {
  factory _$UserSessionCopyWith(_UserSession value, $Res Function(_UserSession) _then) = __$UserSessionCopyWithImpl;
@override @useResult
$Res call({
 Session session, User user
});


@override $SessionCopyWith<$Res> get session;@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UserSessionCopyWithImpl<$Res>
    implements _$UserSessionCopyWith<$Res> {
  __$UserSessionCopyWithImpl(this._self, this._then);

  final _UserSession _self;
  final $Res Function(_UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? user = null,}) {
  return _then(_UserSession(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UserBookDetails {

 LibraryBook? get book; Book get details;
/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBookDetailsCopyWith<UserBookDetails> get copyWith => _$UserBookDetailsCopyWithImpl<UserBookDetails>(this as UserBookDetails, _$identity);

  /// Serializes this UserBookDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBookDetails&&(identical(other.book, book) || other.book == book)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,details);

@override
String toString() {
  return 'UserBookDetails(book: $book, details: $details)';
}


}

/// @nodoc
abstract mixin class $UserBookDetailsCopyWith<$Res>  {
  factory $UserBookDetailsCopyWith(UserBookDetails value, $Res Function(UserBookDetails) _then) = _$UserBookDetailsCopyWithImpl;
@useResult
$Res call({
 LibraryBook? book, Book details
});


$LibraryBookCopyWith<$Res>? get book;$BookCopyWith<$Res> get details;

}
/// @nodoc
class _$UserBookDetailsCopyWithImpl<$Res>
    implements $UserBookDetailsCopyWith<$Res> {
  _$UserBookDetailsCopyWithImpl(this._self, this._then);

  final UserBookDetails _self;
  final $Res Function(UserBookDetails) _then;

/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? details = null,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as LibraryBook?,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}
/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryBookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $LibraryBookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get details {
  
  return $BookCopyWith<$Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserBookDetails implements UserBookDetails {
  const _UserBookDetails({required this.book, required this.details});
  factory _UserBookDetails.fromJson(Map<String, dynamic> json) => _$UserBookDetailsFromJson(json);

@override final  LibraryBook? book;
@override final  Book details;

/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBookDetailsCopyWith<_UserBookDetails> get copyWith => __$UserBookDetailsCopyWithImpl<_UserBookDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBookDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBookDetails&&(identical(other.book, book) || other.book == book)&&(identical(other.details, details) || other.details == details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,details);

@override
String toString() {
  return 'UserBookDetails(book: $book, details: $details)';
}


}

/// @nodoc
abstract mixin class _$UserBookDetailsCopyWith<$Res> implements $UserBookDetailsCopyWith<$Res> {
  factory _$UserBookDetailsCopyWith(_UserBookDetails value, $Res Function(_UserBookDetails) _then) = __$UserBookDetailsCopyWithImpl;
@override @useResult
$Res call({
 LibraryBook? book, Book details
});


@override $LibraryBookCopyWith<$Res>? get book;@override $BookCopyWith<$Res> get details;

}
/// @nodoc
class __$UserBookDetailsCopyWithImpl<$Res>
    implements _$UserBookDetailsCopyWith<$Res> {
  __$UserBookDetailsCopyWithImpl(this._self, this._then);

  final _UserBookDetails _self;
  final $Res Function(_UserBookDetails) _then;

/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? details = null,}) {
  return _then(_UserBookDetails(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as LibraryBook?,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryBookCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $LibraryBookCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of UserBookDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get details {
  
  return $BookCopyWith<$Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// @nodoc
mixin _$BookStatResponse {

 LibraryBook get book; BookStat get stat;
/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookStatResponseCopyWith<BookStatResponse> get copyWith => _$BookStatResponseCopyWithImpl<BookStatResponse>(this as BookStatResponse, _$identity);

  /// Serializes this BookStatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookStatResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,stat);

@override
String toString() {
  return 'BookStatResponse(book: $book, stat: $stat)';
}


}

/// @nodoc
abstract mixin class $BookStatResponseCopyWith<$Res>  {
  factory $BookStatResponseCopyWith(BookStatResponse value, $Res Function(BookStatResponse) _then) = _$BookStatResponseCopyWithImpl;
@useResult
$Res call({
 LibraryBook book, BookStat stat
});


$LibraryBookCopyWith<$Res> get book;$BookStatCopyWith<$Res> get stat;

}
/// @nodoc
class _$BookStatResponseCopyWithImpl<$Res>
    implements $BookStatResponseCopyWith<$Res> {
  _$BookStatResponseCopyWithImpl(this._self, this._then);

  final BookStatResponse _self;
  final $Res Function(BookStatResponse) _then;

/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = null,Object? stat = null,}) {
  return _then(_self.copyWith(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as LibraryBook,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as BookStat,
  ));
}
/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryBookCopyWith<$Res> get book {
  
  return $LibraryBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookStatCopyWith<$Res> get stat {
  
  return $BookStatCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookStatResponse implements BookStatResponse {
  const _BookStatResponse({required this.book, required this.stat});
  factory _BookStatResponse.fromJson(Map<String, dynamic> json) => _$BookStatResponseFromJson(json);

@override final  LibraryBook book;
@override final  BookStat stat;

/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookStatResponseCopyWith<_BookStatResponse> get copyWith => __$BookStatResponseCopyWithImpl<_BookStatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookStatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookStatResponse&&(identical(other.book, book) || other.book == book)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,book,stat);

@override
String toString() {
  return 'BookStatResponse(book: $book, stat: $stat)';
}


}

/// @nodoc
abstract mixin class _$BookStatResponseCopyWith<$Res> implements $BookStatResponseCopyWith<$Res> {
  factory _$BookStatResponseCopyWith(_BookStatResponse value, $Res Function(_BookStatResponse) _then) = __$BookStatResponseCopyWithImpl;
@override @useResult
$Res call({
 LibraryBook book, BookStat stat
});


@override $LibraryBookCopyWith<$Res> get book;@override $BookStatCopyWith<$Res> get stat;

}
/// @nodoc
class __$BookStatResponseCopyWithImpl<$Res>
    implements _$BookStatResponseCopyWith<$Res> {
  __$BookStatResponseCopyWithImpl(this._self, this._then);

  final _BookStatResponse _self;
  final $Res Function(_BookStatResponse) _then;

/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = null,Object? stat = null,}) {
  return _then(_BookStatResponse(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as LibraryBook,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as BookStat,
  ));
}

/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryBookCopyWith<$Res> get book {
  
  return $LibraryBookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of BookStatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookStatCopyWith<$Res> get stat {
  
  return $BookStatCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}

// dart format on

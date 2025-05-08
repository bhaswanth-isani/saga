part of 'api.dart';

/// Body for signing in with a social.
@freezed
abstract class SocialRequest with _$SocialRequest {
  /// Body for signing in with a social.
  const factory SocialRequest({
    required IdToken idToken,
    required DeviceRequest device,
    required SocialProvider provider,
  }) = _SocialRequest;

  /// Converts a [SocialRequest] to and from a [Map]
  factory SocialRequest.fromJson(Map<String, dynamic> json) => _$SocialRequestFromJson(json);
}

@freezed
abstract class IdToken with _$IdToken {
  const factory IdToken({
    required String token,
    required String? accessToken,
    required String? refreshToken,
    required DateTime? expiresAt,
  }) = _IdToken;

  /// Converts a [IdToken] to and from a [Map]
  factory IdToken.fromJson(Map<String, dynamic> json) => _$IdTokenFromJson(json);
}

/// Provider for signing in with a social.
enum SocialProvider {
  /// Google provider.
  google,
}

/// Device information for the request.
@freezed
abstract class DeviceRequest with _$DeviceRequest {
  /// Device information for the request.
  const factory DeviceRequest({required String name, required DeviceType type}) = _DeviceRequest;

  /// Converts a [DeviceRequest] to and from a [Map]
  factory DeviceRequest.fromJson(Map<String, dynamic> json) => _$DeviceRequestFromJson(json);
}

/// New stat body
@freezed
abstract class StatRequest with _$StatRequest {
  const factory StatRequest({required String isbn13, required double progress}) = _StatRequest;

  /// Converts a [StatRequest] to and from a [Map]
  factory StatRequest.fromJson(Map<String, dynamic> json) => _$StatRequestFromJson(json);
}

@freezed
abstract class UploadBookRequest with _$UploadBookRequest {
  const factory UploadBookRequest({required int length, required String isbn13}) =
      _UploadBookRequest;

  /// Converts a [UploadBookRequest] to and from a [Map]
  factory UploadBookRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadBookRequestFromJson(json);
}

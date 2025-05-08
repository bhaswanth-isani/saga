part of 'api.dart';

/// Represents a successful response from the API.
@freezed
abstract class SuccessResponse with _$SuccessResponse {
  /// Represents a successful response from the API.
  const factory SuccessResponse(bool success) = _SuccessResponse;

  /// Converts a [SuccessResponse] to and from a [Map]
  factory SuccessResponse.fromJson(Map<String, dynamic> json) => _$SuccessResponseFromJson(json);
}

/// Represents a user session in the API.
@freezed
abstract class UserSession with _$UserSession {
  /// Represents a user session in the API.
  const factory UserSession({required Session session, required User user}) = _UserSession;

  /// Converts a [UserSession] to and from a [Map]
  factory UserSession.fromJson(Map<String, dynamic> json) => _$UserSessionFromJson(json);
}

@freezed
abstract class UserBookDetails with _$UserBookDetails {
  const factory UserBookDetails({required LibraryBook? book, required Book details}) =
      _UserBookDetails;

  /// Converts a [UserBookDetails] to and from a [Map]
  factory UserBookDetails.fromJson(Map<String, dynamic> json) => _$UserBookDetailsFromJson(json);
}

@freezed
abstract class BookStatResponse with _$BookStatResponse {
  const factory BookStatResponse({required LibraryBook book, required BookStat stat}) =
      _BookStatResponse;

  /// Converts a [BookStatResponse] to and from a [Map]
  factory BookStatResponse.fromJson(Map<String, dynamic> json) => _$BookStatResponseFromJson(json);
}

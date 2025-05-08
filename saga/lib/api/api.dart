import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:saga/auth/models/session.dart';
import 'package:saga/auth/models/user.dart';
import 'package:saga/explore/models/book.dart';
import 'package:saga/library/models/library_book.dart';
import 'package:saga/profile/models/stat.dart';

part 'api.freezed.dart';
part 'api.g.dart';

part 'request.dart';
part 'response.dart';

/// Provides an interface for authentication and user management in saga.
@RestApi()
abstract class SagaApi {
  /// Creates an instance of [SagaApi] with the given Dio client and optional base
  /// URL.
  factory SagaApi(Dio dio, {String? baseUrl}) = _SagaApi;

  /// Gets the current user's information
  @GET('/auth/user/current-user')
  @Headers({'Content-Type': 'application/json'})
  Future<User> getCurrentUser();

  /// Verify deleting user's account
  @POST('/auth/user/delete-user')
  @Headers({'Content-Type': 'application/json'})
  Future<SuccessResponse> deleteUser();

  /// Sign in using social provider
  @POST('/auth/social/')
  @Headers({'Content-Type': 'application/json'})
  Future<UserSession> social(@Body() SocialRequest body);

  /// Gets the current session
  @GET('/auth/session/current-session')
  @Headers({'Content-Type': 'application/json'})
  Future<Session> currentSession();

  /// Revokes a session
  @POST('/auth/session/revoke-session')
  @Headers({'Content-Type': 'application/json'})
  Future<SuccessResponse> revokeSession();

  /// Gets users books
  @GET('/books/library')
  @Headers({'Content-Type': 'application/json'})
  Future<List<UserBookDetails>> getLibraryBooks();

  /// Get newly released books
  @GET('/books/new')
  @Headers({'Content-Type': 'application/json'})
  Future<List<Book>> getNewBooks(@Query('cycle') String cycle);

  /// Get trending books
  @GET('/books/trending')
  @Headers({'Content-Type': 'application/json'})
  Future<List<Book>> getTrendingBooks();

  /// Returns URL to upload the file
  @POST('/books/upload')
  @Headers({'Content-Type': 'application/json'})
  Future<String> uploadBook(@Body() UploadBookRequest body);

  /// Gets all the book stats
  @GET('/books/stats')
  @Headers({'Content-Type': 'application/json'})
  Future<List<BookStat>> getBookStats();

  /// Creates or updates a book stat
  @POST('/books/stats')
  @Headers({'Content-Type': 'application/json'})
  Future<BookStatResponse> createOrUpdateBookStat(@Body() StatRequest body);
}

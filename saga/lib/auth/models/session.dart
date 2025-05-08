import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saga/core/database.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required DateTime expiresAt,
    required String token,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String? ipAddress,
    required String deviceName,
    required DeviceType deviceType,
    required String userId,
  }) = _Session;

  /// Converts a [Session] to and from a [Map]
  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

enum DeviceType { android, ios, web, macos, windows, linux }

/// Extension on [Session] to provide conversion to [DSession].
extension SessionConverter on Session {
  /// Converts a [Session] instance to an [DSession] instance.
  ///
  /// This method creates a new [DSession] object and populates it with
  /// the data from the current [Session] instance.
  ///
  /// Returns an [DSession] object that can be stored in the Drift
  /// database.
  SessionsCompanion toDrift() {
    return DSession(
      id: id,
      expiresAt: expiresAt,
      token: token,
      createdAt: createdAt,
      updatedAt: updatedAt,
      ipAddress: ipAddress,
      deviceName: deviceName,
      deviceType: deviceType,
      user: userId,
    ).toCompanion(false);
  }
}

/// Extension on [DSession] to provide conversion to [Session].
extension DSessionConverter on DSession {
  /// Converts an [DSession] instance to a [Session] instance.
  ///
  /// This method creates a new [Session] object using the data
  /// from the current [DSession] instance.
  ///
  /// Returns a [Session] object that can be used in the application
  /// logic.
  Session toObject() {
    return Session(
      id: id,
      expiresAt: expiresAt,
      token: token,
      createdAt: createdAt,
      updatedAt: updatedAt,
      ipAddress: ipAddress,
      deviceName: deviceName,
      deviceType: deviceType,
      userId: user,
    );
  }
}

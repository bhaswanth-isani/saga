import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saga/core/database.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required String? image,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  /// Converts a [User] to and from a [Map]
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Extension on [User] to provide conversion to [DUser].
extension UserConverter on User {
  /// Converts an [User] instance to an [DUser] instance.
  ///
  /// Returns an [DUser] object that can be stored in the Drift database.
  UsersCompanion toDrift() {
    return DUser(
      id: id,
      name: name,
      email: email,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    ).toCompanion(false);
  }
}

/// Extension on [DUser] to provide conversion to [User].
extension DUserConverter on DUser {
  /// Converts an [DUser] instance to an [User] instance.
  ///
  /// This method creates a new [User] object using the data
  /// from the current [DUser] instance.
  ///
  /// Returns an [User] object that can be used in the application logic.
  User toObject() {
    return User(
      id: id,
      name: name,
      email: email,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

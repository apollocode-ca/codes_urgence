import 'dart:convert';
import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:collection/collection.dart';
import 'package:mongo_dart/mongo_dart.dart';

class User extends Entity {
  String email;
  String firebaseId;
  String firstName;
  String lastName;
  String role;

  String? language;
  String? timezone;
  Map<String, String>? fcmTokens;

  String get displayName => '$firstName $lastName';

  String get partialDisplayName {
    return '$firstName ${lastName[0]}.}';
  }

  User({
    super.id,
    required this.email,
    required this.firebaseId,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.language,
    this.timezone,
    this.fcmTokens,
  });

  User copyWith({
    String? id,
    String? email,
    String? firebaseId,
    String? firstName,
    String? lastName,
    String? role,
    String? language,
    String? timezone,
    Map<String, String>? fcmTokens,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firebaseId: firebaseId ?? this.firebaseId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      language: language ?? this.language,
      timezone: timezone ?? this.timezone,
      fcmTokens: fcmTokens ?? this.fcmTokens,
    );
  }

  @override
  Map<String, dynamic> toMap({
    bool withId = true,
  }) {
    return {
      if (withId) '_id': id,
      'email': email,
      'firebase_id': firebaseId,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'language': language,
      'timezone': timezone,
      'fcm_tokens': fcmTokens,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] is ObjectId
          ? map['_id'].toHexString()
          : map['_id'].toString(),
      email: map['email'] ?? '',
      firebaseId: map['firebase_id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      role: map['role'],
      language: map['language'],
      timezone: map['timezone'],
      fcmTokens: map['fcm_tokens'],
    );
  }

  @override
  Map<String, dynamic> toJson() => toMap();

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, role: $role, language: $language, timezone: $timezone, fcmTokens: $fcmTokens)';
  }

  @override
  User clone() {
    return copyWith();
  }

  @override
  bool operator ==(covariant User other) {
    final mapEquals = const MapEquality().equals;

    if (identical(this, other)) {
      return true;
    }

    return super == other &&
        other.email == email &&
        other.firebaseId == firebaseId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.role == role &&
        other.language == language &&
        other.timezone == timezone &&
        mapEquals(other.fcmTokens, fcmTokens);
  }

  @override
  int get hashCode {
    return super.hashCode ^
        Object.hash(email, firebaseId, firstName, lastName, role);
  }
}

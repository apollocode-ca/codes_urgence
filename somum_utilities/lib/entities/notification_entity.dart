import 'dart:convert';

import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:collection/collection.dart';
import 'package:mongo_dart/mongo_dart.dart';

class NotificationEntity extends Entity {
  TranslatedString title;
  TranslatedString body;
  String? imageUrl;
  String? openInAppUrl;
  DateTime? timeToSend;
  List<String>? users;
  NotificationEntity({
    super.id,
    required this.title,
    required this.body,
    this.imageUrl,
    this.openInAppUrl,
    this.timeToSend,
    this.users,
  });

  NotificationEntity copyWith({
    String? id,
    TranslatedString? title,
    TranslatedString? body,
    String? imageUrl,
    String? openInAppUrl,
    DateTime? timeToSend,
    List<String>? users,
  }) {
    return NotificationEntity(
      id: id ?? id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      openInAppUrl: openInAppUrl ?? this.openInAppUrl,
      timeToSend: timeToSend ?? this.timeToSend,
      users: users ?? this.users,
    );
  }

  @override
  Map<String, dynamic> toMap({bool withId = true}) {
    return {
      'title': title.toJson(),
      'body': body.toJson(),
      'image_url': imageUrl,
      'open_in_app_url': openInAppUrl,
      'time_to_send': timeToSend?.millisecondsSinceEpoch,
      'users': users,
      ...super.toMap(withId: withId),
    };
  }

  @override
  Cloneable clone() => copyWith();

  factory NotificationEntity.fromMap(Map<String, dynamic> map) {
    return NotificationEntity(
      id: map['_id'] is ObjectId
          ? map['_id'].toHexString()
          : map['_id'].toString(),
      title: TranslatedString.fromJson(jsonDecode(map['title'])),
      body: TranslatedString.fromJson(jsonDecode(map['body'])),
      imageUrl: map['image_url'],
      openInAppUrl: map['open_in_app_url'],
      timeToSend: DateHelper.fromMap(map['time_to_send']),
      users:
          map['users'] != null ? List<String>.from(map['users'] ?? []) : null,
    );
  }

  factory NotificationEntity.fromJson(String source) =>
      NotificationEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'Notification(title: $title, body: $body, imageUrl: $imageUrl, openInAppUrl: $openInAppUrl, '
      'timeToSend: $timeToSend, users: $users)';

  @override
  bool operator ==(Object? other) {
    final listEquals = const DeepCollectionEquality().equals;

    if (identical(this, other)) return true;

    return other is NotificationEntity &&
        other.title == title &&
        other.body == body &&
        other.imageUrl == imageUrl &&
        other.openInAppUrl == openInAppUrl &&
        other.timeToSend == timeToSend &&
        listEquals(other.users, users);
  }

  @override
  int get hashCode =>
      title.hashCode ^
      body.hashCode ^
      imageUrl.hashCode ^
      openInAppUrl.hashCode ^
      timeToSend.hashCode ^
      users.hashCode;
}

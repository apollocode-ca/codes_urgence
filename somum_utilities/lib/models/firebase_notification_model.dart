import 'dart:convert';

import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';

class FirebaseNotification extends Entity {
  String title;
  String? body;
  String? contentAvailable;
  String? androidChannelId;
  String? clickAction;
  String? image;
  String? sound;
  String? icon;
  FirebaseNotification({
    super.id,
    required this.title,
    this.body,
    this.contentAvailable,
    this.androidChannelId,
    this.clickAction,
    this.image,
    this.sound,
    this.icon,
  });

  FirebaseNotification copyWith({
    String? id,
    String? title,
    String? body,
    String? contentAvailable,
    String? androidChannelId,
    String? clickAction,
    String? image,
    String? sound,
    String? icon,
  }) {
    return FirebaseNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      contentAvailable: contentAvailable ?? this.contentAvailable,
      androidChannelId: androidChannelId ?? this.androidChannelId,
      clickAction: clickAction ?? this.clickAction,
      image: image ?? this.image,
      sound: sound ?? this.sound,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, dynamic> toMap({bool withId = false}) {
    return {
      if (withId) 'id': id,
      'title': title,
      'body': body,
      // 'content_available': contentAvailable,
      // 'android_channel_id': androidChannelId,
      // 'click_action': clickAction,
      'image': image,
      // 'sound': sound,
      // 'icon': icon,
    };
  }

  factory FirebaseNotification.fromMap(Map<String, dynamic> map) {
    return FirebaseNotification(
      id: map['id'],
      title: map['title'] ?? '',
      body: map['body'],
      contentAvailable: map['content_available'],
      androidChannelId: map['android_channel_id'],
      clickAction: map['click_action'],
      image: map['image'],
      sound: map['sound'],
      icon: map['icon'],
    );
  }

  @override
  Cloneable clone() => copyWith();

  factory FirebaseNotification.fromJson(String source) =>
      FirebaseNotification.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseNotification(id: $id, title: $title, body: $body, contentAvailable: $contentAvailable, androidChannelId: $androidChannelId, clickAction: $clickAction, image: $image, sound: $sound)';
  }

  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;

    return other is FirebaseNotification &&
        other.title == title &&
        other.body == body &&
        other.contentAvailable == contentAvailable &&
        other.androidChannelId == androidChannelId &&
        other.clickAction == clickAction &&
        other.image == image &&
        other.sound == sound;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        body.hashCode ^
        contentAvailable.hashCode ^
        androidChannelId.hashCode ^
        clickAction.hashCode ^
        image.hashCode ^
        sound.hashCode;
  }
}

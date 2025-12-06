import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_notification_response.freezed.dart';
part 'athlete_notification_response.g.dart';

@freezed
class AthleteNotificationResponse with _$AthleteNotificationResponse {
  const factory AthleteNotificationResponse({
    required String status,
    required String message,
    required AthleteNotificationData data,
  }) = _AthleteNotificationResponse;

  factory AthleteNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$AthleteNotificationResponseFromJson(json);
}

@freezed
class AthleteNotificationData with _$AthleteNotificationData {
  const factory AthleteNotificationData({
    required List<NotificationItem> items,
    required Meta meta,
  }) = _AthleteNotificationData;

  factory AthleteNotificationData.fromJson(Map<String, dynamic> json) =>
      _$AthleteNotificationDataFromJson(json);
}

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String type,
    String? message, // API sends: message: null reacted to your comment
    required bool isRead,
    String? readAt, // API returns: null
    required String createdAt,
    required Actor actor,
    required Channel channel,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}

@freezed
class Actor with _$Actor {
  const factory Actor({
    required String id,
    required String name,
    String? username, // API returns: null
    String? profilePicture, // API returns broken/missing URL → nullable
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}

@freezed
class Channel with _$Channel {
  const factory Channel({
    required String id,
    required String title,
    String? thumbnailUrl,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

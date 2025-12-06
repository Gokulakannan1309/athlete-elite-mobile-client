import 'package:freezed_annotation/freezed_annotation.dart';

part 'fan_notification_response_model.freezed.dart';
part 'fan_notification_response_model.g.dart';

@freezed
class FanNotificationResponseModel with _$FanNotificationResponseModel {
  const factory FanNotificationResponseModel({
    required bool status,
    required int statusCode,
    required String message,
    required FanNotificationData data,
  }) = _FanNotificationResponseModel;

  factory FanNotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FanNotificationResponseModelFromJson(json);
}

@freezed
class FanNotificationData with _$FanNotificationData {
  const factory FanNotificationData({
    String? message,
    @Default([]) List<FanNotificationItem> notifications,
    Pagination? pagination,
    @Default(0) int unreadCount,
  }) = _FanNotificationData;

  factory FanNotificationData.fromJson(Map<String, dynamic> json) =>
      _$FanNotificationDataFromJson(json);
}

@freezed
class FanNotificationItem with _$FanNotificationItem {
  const factory FanNotificationItem({
    required String id,
    required String type,
    required String message,
    required bool isRead,
    String? createdAt,
    Actor? actor,
    Athlete? athlete,
    Channel? channel,
  }) = _FanNotificationItem;

  factory FanNotificationItem.fromJson(Map<String, dynamic> json) =>
      _$FanNotificationItemFromJson(json);
}

@freezed
class Actor with _$Actor {
  const factory Actor({
    required String id,
    required String name,
    String? profilePicture,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}

@freezed
class Athlete with _$Athlete {
  const factory Athlete({
    required String id,
    String? name,
    String? profilePicture,
  }) = _Athlete;

  factory Athlete.fromJson(Map<String, dynamic> json) =>
      _$AthleteFromJson(json);
}

@freezed
class Channel with _$Channel {
  const factory Channel({
    required String id,
    required String title,
    String? thumbnailUrl,
    String? mediaUrl,
    String? type,
    String? status,
    String? publishedAt,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    required bool hasMore,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

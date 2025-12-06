// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fan_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FanNotificationResponseModelImpl _$$FanNotificationResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FanNotificationResponseModelImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: FanNotificationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FanNotificationResponseModelImplToJson(
        _$FanNotificationResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$FanNotificationDataImpl _$$FanNotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$FanNotificationDataImpl(
      message: json['message'] as String?,
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) =>
                  FanNotificationItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FanNotificationDataImplToJson(
        _$FanNotificationDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'notifications': instance.notifications,
      'pagination': instance.pagination,
      'unreadCount': instance.unreadCount,
    };

_$FanNotificationItemImpl _$$FanNotificationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$FanNotificationItemImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] as String?,
      actor: json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      athlete: json['athlete'] == null
          ? null
          : Athlete.fromJson(json['athlete'] as Map<String, dynamic>),
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FanNotificationItemImplToJson(
        _$FanNotificationItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'actor': instance.actor,
      'athlete': instance.athlete,
      'channel': instance.channel,
    };

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$AthleteImpl _$$AthleteImplFromJson(Map<String, dynamic> json) =>
    _$AthleteImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$AthleteImplToJson(_$AthleteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$ChannelImpl _$$ChannelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaUrl': instance.mediaUrl,
      'type': instance.type,
      'status': instance.status,
      'publishedAt': instance.publishedAt,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasMore': instance.hasMore,
    };

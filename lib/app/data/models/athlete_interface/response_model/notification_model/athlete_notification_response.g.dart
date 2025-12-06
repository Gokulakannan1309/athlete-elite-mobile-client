// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AthleteNotificationResponseImpl _$$AthleteNotificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AthleteNotificationResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      data: AthleteNotificationData.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthleteNotificationResponseImplToJson(
        _$AthleteNotificationResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$AthleteNotificationDataImpl _$$AthleteNotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AthleteNotificationDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthleteNotificationDataImplToJson(
        _$AthleteNotificationDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$NotificationItemImpl _$$NotificationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationItemImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      message: json['message'] as String?,
      isRead: json['isRead'] as bool,
      readAt: json['readAt'] as String?,
      createdAt: json['createdAt'] as String,
      actor: Actor.fromJson(json['actor'] as Map<String, dynamic>),
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationItemImplToJson(
        _$NotificationItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
      'isRead': instance.isRead,
      'readAt': instance.readAt,
      'createdAt': instance.createdAt,
      'actor': instance.actor,
      'channel': instance.channel,
    };

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
    };

_$ChannelImpl _$$ChannelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$$ChannelImplToJson(_$ChannelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnailUrl': instance.thumbnailUrl,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

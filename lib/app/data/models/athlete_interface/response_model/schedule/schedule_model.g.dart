// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleResponseImpl _$$ScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: ScheduleData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleResponseImplToJson(
        _$ScheduleResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$ScheduleDataImpl _$$ScheduleDataImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => ScheduleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : ScheduleMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleDataImplToJson(_$ScheduleDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$ScheduleItemImpl _$$ScheduleItemImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleItemImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      category: json['category'] as String?,
      brand: json['brand'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      isArchived: json['isArchived'] as bool?,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => ScheduleMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScheduleItemImplToJson(_$ScheduleItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'category': instance.category,
      'brand': instance.brand,
      'status': instance.status,
      'type': instance.type,
      'isArchived': instance.isArchived,
      'scheduledAt': instance.scheduledAt,
      'publishedAt': instance.publishedAt,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'commentsCount': instance.commentsCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'media': instance.media,
    };

_$ScheduleMediaImpl _$$ScheduleMediaImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleMediaImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ScheduleMediaImplToJson(_$ScheduleMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$ScheduleMetaImpl _$$ScheduleMetaImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleMetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$ScheduleMetaImplToJson(_$ScheduleMetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

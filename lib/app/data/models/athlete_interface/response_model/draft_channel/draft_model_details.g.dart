// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_model_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DraftResponseImpl _$$DraftResponseImplFromJson(Map<String, dynamic> json) =>
    _$DraftResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: DraftData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DraftResponseImplToJson(_$DraftResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$DraftDataImpl _$$DraftDataImplFromJson(Map<String, dynamic> json) =>
    _$DraftDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => DraftCategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: DraftMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DraftDataImplToJson(_$DraftDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$DraftCategoryItemImpl _$$DraftCategoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$DraftCategoryItemImpl(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      channels: (json['channels'] as List<dynamic>)
          .map((e) => DraftChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DraftCategoryItemImplToJson(
        _$DraftCategoryItemImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'channels': instance.channels,
    };

_$DraftChannelImpl _$$DraftChannelImplFromJson(Map<String, dynamic> json) =>
    _$DraftChannelImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      isArchived: json['isArchived'] as bool?,
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => DraftMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DraftChannelImplToJson(_$DraftChannelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'status': instance.status,
      'type': instance.type,
      'isArchived': instance.isArchived,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'scheduledAt': instance.scheduledAt,
      'publishedAt': instance.publishedAt,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'commentsCount': instance.commentsCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'media': instance.media,
    };

_$DraftMediaImpl _$$DraftMediaImplFromJson(Map<String, dynamic> json) =>
    _$DraftMediaImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DraftMediaImplToJson(_$DraftMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$DraftMetaImpl _$$DraftMetaImplFromJson(Map<String, dynamic> json) =>
    _$DraftMetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$DraftMetaImplToJson(_$DraftMetaImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

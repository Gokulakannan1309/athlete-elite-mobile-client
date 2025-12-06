// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_library_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentLibrarySummaryResponseImpl
    _$$ContentLibrarySummaryResponseImplFromJson(Map<String, dynamic> json) =>
        _$ContentLibrarySummaryResponseImpl(
          status: json['status'] as bool,
          statusCode: (json['statusCode'] as num).toInt(),
          message: json['message'] as String,
          data: ContentLibrarySummaryData.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ContentLibrarySummaryResponseImplToJson(
        _$ContentLibrarySummaryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$ContentLibrarySummaryDataImpl _$$ContentLibrarySummaryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentLibrarySummaryDataImpl(
      totalCategories: (json['totalCategories'] as num).toInt(),
      totalChannels: (json['totalChannels'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentLibrarySummaryDataImplToJson(
        _$ContentLibrarySummaryDataImpl instance) =>
    <String, dynamic>{
      'totalCategories': instance.totalCategories,
      'totalChannels': instance.totalChannels,
      'categories': instance.categories,
    };

_$CategoryItemImpl _$$CategoryItemImplFromJson(Map<String, dynamic> json) =>
    _$CategoryItemImpl(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String?,
      totalItems: (json['totalItems'] as num).toInt(),
      preview: (json['preview'] as List<dynamic>)
          .map((e) => PreviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryItemImplToJson(_$CategoryItemImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'totalItems': instance.totalItems,
      'preview': instance.preview,
    };

_$PreviewItemImpl _$$PreviewItemImplFromJson(Map<String, dynamic> json) =>
    _$PreviewItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String?,
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      status: json['status'] as String,
      type: json['type'] as String,
      isArchived: json['isArchived'] as bool,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String,
      likesCount: (json['likesCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      media: (json['media'] as List<dynamic>)
          .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PreviewItemImplToJson(_$PreviewItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
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

_$MediaItemImpl _$$MediaItemImplFromJson(Map<String, dynamic> json) =>
    _$MediaItemImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$MediaItemImplToJson(_$MediaItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

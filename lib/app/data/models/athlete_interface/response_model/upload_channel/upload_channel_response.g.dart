// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadChannelResponseImpl _$$UploadChannelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadChannelResponseImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: (json['brands'] as List<dynamic>)
          .map((e) => BrandGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UploadChannelResponseImplToJson(
        _$UploadChannelResponseImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'brands': instance.brands,
    };

_$CategoryGroupImpl _$$CategoryGroupImplFromJson(Map<String, dynamic> json) =>
    _$CategoryGroupImpl(
      id: json['categoryId'] as String,
      name: json['categoryName'] as String?,
      totalItems: (json['totalItems'] as num).toInt(),
      preview: (json['preview'] as List<dynamic>)
          .map((e) => PreviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryGroupImplToJson(_$CategoryGroupImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.id,
      'categoryName': instance.name,
      'totalItems': instance.totalItems,
      'preview': instance.preview,
    };

_$BrandGroupImpl _$$BrandGroupImplFromJson(Map<String, dynamic> json) =>
    _$BrandGroupImpl(
      id: json['brandId'] as String,
      name: json['brandName'] as String,
      totalItems: (json['totalItems'] as num).toInt(),
      preview: (json['preview'] as List<dynamic>)
          .map((e) => PreviewItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BrandGroupImplToJson(_$BrandGroupImpl instance) =>
    <String, dynamic>{
      'brandId': instance.id,
      'brandName': instance.name,
      'totalItems': instance.totalItems,
      'preview': instance.preview,
    };

_$PreviewItemImpl _$$PreviewItemImplFromJson(Map<String, dynamic> json) =>
    _$PreviewItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      category: json['category'] as String?,
      brand: json['brand'] as String?,
      status: json['status'] as String,
      type: json['type'] as String,
      isArchived: json['isArchived'] as bool?,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => PreviewMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PreviewItemImplToJson(_$PreviewItemImpl instance) =>
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

_$PreviewMediaImpl _$$PreviewMediaImplFromJson(Map<String, dynamic> json) =>
    _$PreviewMediaImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num).toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$PreviewMediaImplToJson(_$PreviewMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

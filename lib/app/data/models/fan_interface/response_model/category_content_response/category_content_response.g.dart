// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryContentResponseImpl _$$CategoryContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryContentResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: CategoryContentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryContentResponseImplToJson(
        _$CategoryContentResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$CategoryContentDataImpl _$$CategoryContentDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryContentDataImpl(
      message: json['message'] as String,
      category: CategoryInfo.fromJson(json['category'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>)
          .map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryContentDataImplToJson(
        _$CategoryContentDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'category': instance.category,
      'content': instance.content,
      'pagination': instance.pagination,
    };

_$CategoryInfoImpl _$$CategoryInfoImplFromJson(Map<String, dynamic> json) =>
    _$CategoryInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageData: json['imageData'] as String,
    );

Map<String, dynamic> _$$CategoryInfoImplToJson(_$CategoryInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

_$ContentItemImpl _$$ContentItemImplFromJson(Map<String, dynamic> json) =>
    _$ContentItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      publishedAt: json['publishedAt'] as String,
      athlete: json['athlete'] == null
          ? null
          : AthleteData.fromJson(json['athlete'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandData.fromJson(json['brand'] as Map<String, dynamic>),
      likesCount: (json['likesCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$ContentItemImplToJson(_$ContentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaType': instance.mediaType,
      'publishedAt': instance.publishedAt,
      'athlete': instance.athlete,
      'brand': instance.brand,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
    };

_$AthleteDataImpl _$$AthleteDataImplFromJson(Map<String, dynamic> json) =>
    _$AthleteDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$AthleteDataImplToJson(_$AthleteDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$BrandDataImpl _$$BrandDataImplFromJson(Map<String, dynamic> json) =>
    _$BrandDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      imageData: json['imageData'] as String?,
    );

Map<String, dynamic> _$$BrandDataImplToJson(_$BrandDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'limit': instance.limit,
    };

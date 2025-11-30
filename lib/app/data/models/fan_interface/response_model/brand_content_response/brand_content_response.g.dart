// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandContentResponseImpl _$$BrandContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandContentResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: BrandContentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrandContentResponseImplToJson(
        _$BrandContentResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$BrandContentDataImpl _$$BrandContentDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandContentDataImpl(
      message: json['message'] as String,
      brand: BrandInfo.fromJson(json['brand'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>)
          .map((e) => BrandContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrandContentDataImplToJson(
        _$BrandContentDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'brand': instance.brand,
      'content': instance.content,
      'pagination': instance.pagination,
    };

_$BrandInfoImpl _$$BrandInfoImplFromJson(Map<String, dynamic> json) =>
    _$BrandInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageData: json['imageData'] as String,
    );

Map<String, dynamic> _$$BrandInfoImplToJson(_$BrandInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

_$BrandContentItemImpl _$$BrandContentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandContentItemImpl(
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
      sportsAthlete: json['sportsAthlete'] == null
          ? null
          : AthleteData.fromJson(json['sportsAthlete'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryInfo.fromJson(json['category'] as Map<String, dynamic>),
      likesCount: (json['likesCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BrandContentItemImplToJson(
        _$BrandContentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaType': instance.mediaType,
      'publishedAt': instance.publishedAt,
      'athlete': instance.athlete,
      'sportsAthlete': instance.sportsAthlete,
      'category': instance.category,
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

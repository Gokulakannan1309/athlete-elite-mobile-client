// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infinite_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfiniteContentResponseImpl _$$InfiniteContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InfiniteContentResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: InfiniteContentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InfiniteContentResponseImplToJson(
        _$InfiniteContentResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$InfiniteContentDataImpl _$$InfiniteContentDataImplFromJson(
        Map<String, dynamic> json) =>
    _$InfiniteContentDataImpl(
      message: json['message'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => InfiniteContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InfiniteContentDataImplToJson(
        _$InfiniteContentDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'content': instance.content,
    };

_$InfiniteContentItemImpl _$$InfiniteContentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$InfiniteContentItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      publishedAt: json['publishedAt'] as String?,
      athlete: json['athlete'] == null
          ? null
          : AthleteInfinite.fromJson(json['athlete'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryInfinite.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandInfinite.fromJson(json['brand'] as Map<String, dynamic>),
      likesCount: (json['likesCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$$InfiniteContentItemImplToJson(
        _$InfiniteContentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaType': instance.mediaType,
      'publishedAt': instance.publishedAt,
      'athlete': instance.athlete,
      'category': instance.category,
      'brand': instance.brand,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'isLiked': instance.isLiked,
    };

_$AthleteInfiniteImpl _$$AthleteInfiniteImplFromJson(
        Map<String, dynamic> json) =>
    _$AthleteInfiniteImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$AthleteInfiniteImplToJson(
        _$AthleteInfiniteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$CategoryInfiniteImpl _$$CategoryInfiniteImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryInfiniteImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageData: json['imageData'] as String?,
    );

Map<String, dynamic> _$$CategoryInfiniteImplToJson(
        _$CategoryInfiniteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

_$BrandInfiniteImpl _$$BrandInfiniteImplFromJson(Map<String, dynamic> json) =>
    _$BrandInfiniteImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageData: json['imageData'] as String?,
    );

Map<String, dynamic> _$$BrandInfiniteImplToJson(_$BrandInfiniteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

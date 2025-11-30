// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestChannelResponseImpl _$$LatestChannelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestChannelResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: LatestChannelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LatestChannelResponseImplToJson(
        _$LatestChannelResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$LatestChannelDataImpl _$$LatestChannelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestChannelDataImpl(
      message: json['message'] as String,
      channels: (json['channels'] as List<dynamic>)
          .map((e) => LatestChannelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LatestChannelDataImplToJson(
        _$LatestChannelDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'channels': instance.channels,
      'pagination': instance.pagination,
    };

_$LatestChannelItemImpl _$$LatestChannelItemImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestChannelItemImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      publishedAt: json['publishedAt'] as String,
      athlete: AthleteRes.fromJson(json['athlete'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryRes.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandRes.fromJson(json['brand'] as Map<String, dynamic>),
      likesCount: (json['likesCount'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$LatestChannelItemImplToJson(
        _$LatestChannelItemImpl instance) =>
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
    };

_$AthleteResImpl _$$AthleteResImplFromJson(Map<String, dynamic> json) =>
    _$AthleteResImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$AthleteResImplToJson(_$AthleteResImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$CategoryResImpl _$$CategoryResImplFromJson(Map<String, dynamic> json) =>
    _$CategoryResImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      imageData: json['imageData'] as String?,
    );

Map<String, dynamic> _$$CategoryResImplToJson(_$CategoryResImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.imageData,
    };

_$BrandResImpl _$$BrandResImplFromJson(Map<String, dynamic> json) =>
    _$BrandResImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      imageData: json['imageData'] as String?,
    );

Map<String, dynamic> _$$BrandResImplToJson(_$BrandResImpl instance) =>
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

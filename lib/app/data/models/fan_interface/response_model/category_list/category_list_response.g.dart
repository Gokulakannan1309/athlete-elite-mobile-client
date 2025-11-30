// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryListResponseImpl _$$CategoryListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryListResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: CategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryListResponseImplToJson(
        _$CategoryListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      message: json['message'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'categories': instance.categories,
    };

_$CategoryItemImpl _$$CategoryItemImplFromJson(Map<String, dynamic> json) =>
    _$CategoryItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      posterUrl: json['imageData'] as String,
      contentCount: (json['contentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryItemImplToJson(_$CategoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.posterUrl,
      'contentCount': instance.contentCount,
    };

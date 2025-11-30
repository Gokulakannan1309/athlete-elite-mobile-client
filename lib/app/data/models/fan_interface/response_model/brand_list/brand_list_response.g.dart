// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandListResponseImpl _$$BrandListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandListResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: BrandData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrandListResponseImplToJson(
        _$BrandListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$BrandDataImpl _$$BrandDataImplFromJson(Map<String, dynamic> json) =>
    _$BrandDataImpl(
      message: json['message'] as String,
      brands: (json['brands'] as List<dynamic>)
          .map((e) => BrandItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BrandDataImplToJson(_$BrandDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'brands': instance.brands,
    };

_$BrandItemImpl _$$BrandItemImplFromJson(Map<String, dynamic> json) =>
    _$BrandItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      posterUrl: json['imageData'] as String,
      contentCount: (json['contentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BrandItemImplToJson(_$BrandItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageData': instance.posterUrl,
      'contentCount': instance.contentCount,
    };

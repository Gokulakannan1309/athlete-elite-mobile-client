// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athletes_response_fan_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AthletesResponseFanViewImpl _$$AthletesResponseFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$AthletesResponseFanViewImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: AthletesDataFanView.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthletesResponseFanViewImplToJson(
        _$AthletesResponseFanViewImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$AthletesDataFanViewImpl _$$AthletesDataFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$AthletesDataFanViewImpl(
      formatted: (json['formatted'] as List<dynamic>)
          .map((e) => AthleteFanView.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationFanView.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthletesDataFanViewImplToJson(
        _$AthletesDataFanViewImpl instance) =>
    <String, dynamic>{
      'formatted': instance.formatted,
      'pagination': instance.pagination,
    };

_$AthleteFanViewImpl _$$AthleteFanViewImplFromJson(Map<String, dynamic> json) =>
    _$AthleteFanViewImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      country: json['country'] as String?,
      sports: json['sports'] as String?,
      league: json['league'] as String?,
      ranking: json['ranking'] as String?,
    );

Map<String, dynamic> _$$AthleteFanViewImplToJson(
        _$AthleteFanViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'country': instance.country,
      'sports': instance.sports,
      'league': instance.league,
      'ranking': instance.ranking,
    };

_$PaginationFanViewImpl _$$PaginationFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationFanViewImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationFanViewImplToJson(
        _$PaginationFanViewImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'limit': instance.limit,
    };

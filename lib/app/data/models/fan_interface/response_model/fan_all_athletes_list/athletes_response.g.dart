// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athletes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AthletesResponseImpl _$$AthletesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AthletesResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: AthletesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthletesResponseImplToJson(
        _$AthletesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$AthletesDataImpl _$$AthletesDataImplFromJson(Map<String, dynamic> json) =>
    _$AthletesDataImpl(
      athletes: (json['data'] as List<dynamic>?)
              ?.map((e) => Athlete.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AthletesDataImplToJson(_$AthletesDataImpl instance) =>
    <String, dynamic>{
      'data': instance.athletes,
      'pagination': instance.pagination,
    };

_$AthleteImpl _$$AthleteImplFromJson(Map<String, dynamic> json) =>
    _$AthleteImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String?,
      country: json['country'] as String?,
      sports: json['sports'] as String?,
      league: json['league'] as String?,
      ranking: json['ranking'] as String?,
      isTracked:
          json['isTracked'] == null ? false : _boolFromJson(json['isTracked']),
    );

Map<String, dynamic> _$$AthleteImplToJson(_$AthleteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'country': instance.country,
      'sports': instance.sports,
      'league': instance.league,
      'ranking': instance.ranking,
      'isTracked': _boolToJson(instance.isTracked),
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasMore': instance.hasMore,
    };

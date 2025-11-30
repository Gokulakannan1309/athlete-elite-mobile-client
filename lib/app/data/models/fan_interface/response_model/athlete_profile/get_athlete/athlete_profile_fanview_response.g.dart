// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'athlete_profile_fanview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AthleteProfileFanviewResponseImpl
    _$$AthleteProfileFanviewResponseImplFromJson(Map<String, dynamic> json) =>
        _$AthleteProfileFanviewResponseImpl(
          status: json['status'] as bool,
          statusCode: (json['statusCode'] as num).toInt(),
          message: json['message'] as String,
          data: AthleteProfileDataFanview.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$AthleteProfileFanviewResponseImplToJson(
        _$AthleteProfileFanviewResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$AthleteProfileDataFanviewImpl _$$AthleteProfileDataFanviewImplFromJson(
        Map<String, dynamic> json) =>
    _$AthleteProfileDataFanviewImpl(
      athlete: AthleteFanview.fromJson(json['athlete'] as Map<String, dynamic>),
      isTracked: json['isTracked'] as bool,
      followerCount: (json['followerCount'] as num).toInt(),
    );

Map<String, dynamic> _$$AthleteProfileDataFanviewImplToJson(
        _$AthleteProfileDataFanviewImpl instance) =>
    <String, dynamic>{
      'athlete': instance.athlete,
      'isTracked': instance.isTracked,
      'followerCount': instance.followerCount,
    };

_$AthleteFanviewImpl _$$AthleteFanviewImplFromJson(Map<String, dynamic> json) =>
    _$AthleteFanviewImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
      bio: json['bio'] as String,
      country: json['country'] as String,
      sports: json['sports'] as String,
      league: json['league'] as String,
      ranking: json['ranking'] as String,
    );

Map<String, dynamic> _$$AthleteFanviewImplToJson(
        _$AthleteFanviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'bio': instance.bio,
      'country': instance.country,
      'sports': instance.sports,
      'league': instance.league,
      'ranking': instance.ranking,
    };

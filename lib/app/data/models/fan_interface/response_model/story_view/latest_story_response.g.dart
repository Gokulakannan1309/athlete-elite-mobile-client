// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestStoryResponseImpl _$$LatestStoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestStoryResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: StoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LatestStoryResponseImplToJson(
        _$LatestStoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$StoryDataImpl _$$StoryDataImplFromJson(Map<String, dynamic> json) =>
    _$StoryDataImpl(
      message: json['message'] as String,
      stories: (json['stories'] as List<dynamic>?)
              ?.map((e) => StoryChannel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoryDataImplToJson(_$StoryDataImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'stories': instance.stories,
    };

_$StoryChannelImpl _$$StoryChannelImplFromJson(Map<String, dynamic> json) =>
    _$StoryChannelImpl(
      athlete: Athlete.fromJson(json['athlete'] as Map<String, dynamic>),
      stories: (json['stories'] as List<dynamic>?)
              ?.map((e) => StoryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoryChannelImplToJson(_$StoryChannelImpl instance) =>
    <String, dynamic>{
      'athlete': instance.athlete,
      'stories': instance.stories,
    };

_$AthleteImpl _$$AthleteImplFromJson(Map<String, dynamic> json) =>
    _$AthleteImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$AthleteImplToJson(_$AthleteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
    };

_$StoryItemImpl _$$StoryItemImplFromJson(Map<String, dynamic> json) =>
    _$StoryItemImpl(
      id: json['id'] as String,
      mediaUrl: json['mediaUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      duration: (json['duration'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      publishedAt: json['publishedAt'] as String,
      expiresAt: json['expiresAt'] as String,
      isViewed: json['isViewed'] as bool,
      caption: json['caption'] as String?,
    );

Map<String, dynamic> _$$StoryItemImplToJson(_$StoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'mediaType': instance.mediaType,
      'duration': instance.duration,
      'createdAt': instance.createdAt,
      'publishedAt': instance.publishedAt,
      'expiresAt': instance.expiresAt,
      'isViewed': instance.isViewed,
      'caption': instance.caption,
    };

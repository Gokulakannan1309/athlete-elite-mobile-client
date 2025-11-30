import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_story_response.freezed.dart';
part 'latest_story_response.g.dart';

@freezed
class LatestStoryResponse with _$LatestStoryResponse {
  const factory LatestStoryResponse({
    required bool status,
    required int statusCode,
    required String message,
    required StoryData data,
  }) = _LatestStoryResponse;

  factory LatestStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestStoryResponseFromJson(json);
}

@freezed
class StoryData with _$StoryData {
  const factory StoryData({
    required String message,
    @Default([]) List<StoryChannel> stories,
  }) = _StoryData;

  factory StoryData.fromJson(Map<String, dynamic> json) =>
      _$StoryDataFromJson(json);
}

@freezed
class StoryChannel with _$StoryChannel {
  const factory StoryChannel({
    required Athlete athlete,
    @Default([]) List<StoryItem> stories,
  }) = _StoryChannel;

  factory StoryChannel.fromJson(Map<String, dynamic> json) =>
      _$StoryChannelFromJson(json);
}

@freezed
class Athlete with _$Athlete {
  const factory Athlete({
    required String id,
    required String name,
    required String profilePicture,
  }) = _Athlete;

  factory Athlete.fromJson(Map<String, dynamic> json) =>
      _$AthleteFromJson(json);
}

@freezed
class StoryItem with _$StoryItem {
  const factory StoryItem({
    required String id,
    required String mediaUrl,
    String? thumbnailUrl,
    String? mediaType,
    required int duration,
    required String createdAt,
    required String publishedAt,
    required String expiresAt,
    required bool isViewed,
    required String? caption,
  }) = _StoryItem;

  factory StoryItem.fromJson(Map<String, dynamic> json) =>
      _$StoryItemFromJson(json);
}

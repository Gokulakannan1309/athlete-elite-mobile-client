import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_profile_fanview_response.freezed.dart';
part 'athlete_profile_fanview_response.g.dart';

@freezed
class AthleteProfileFanviewResponse with _$AthleteProfileFanviewResponse {
  const factory AthleteProfileFanviewResponse({
    required bool status,
    required int statusCode,
    required String message,
    required AthleteProfileDataFanview data,
  }) = _AthleteProfileFanviewResponse;

  factory AthleteProfileFanviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AthleteProfileFanviewResponseFromJson(json);
}

@freezed
class AthleteProfileDataFanview with _$AthleteProfileDataFanview {
  const factory AthleteProfileDataFanview({
    required AthleteFanview athlete,
    required bool isTracked,
    required int followerCount,
  }) = _AthleteProfileDataFanview;

  factory AthleteProfileDataFanview.fromJson(Map<String, dynamic> json) =>
      _$AthleteProfileDataFanviewFromJson(json);
}

@freezed
class AthleteFanview with _$AthleteFanview {
  const factory AthleteFanview({
    required String id,
    required String name,
    @JsonKey(name: "profilePicture") String? profilePicture,
    required String? bio,
    required String? country,
    required String? sports,
    required String? league,
    required String? ranking,
  }) = _AthleteFanview;

  factory AthleteFanview.fromJson(Map<String, dynamic> json) =>
      _$AthleteFanviewFromJson(json);
}

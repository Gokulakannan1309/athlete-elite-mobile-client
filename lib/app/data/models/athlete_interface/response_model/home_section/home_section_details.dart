import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_section_details.freezed.dart';
part 'home_section_details.g.dart';

@freezed
class HomeSectionResponse with _$HomeSectionResponse {
  const factory HomeSectionResponse({
    required bool status,
    required int statusCode,
    required String message,
    required HomeData data,
  }) = _HomeSectionResponse;

  factory HomeSectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionResponseFromJson(json);
}

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    String? profilePicture,
    String? bio,
    required int fansCount,
    required String heading,
    IntroData? intro,
    List<String>? aboutMe,
    required List<FavSportsMoment> favSportsMoments,
    FindAthlete? findAthlete,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}

@freezed
class IntroData with _$IntroData {
  const factory IntroData({
    String? id,
    String? title,
    String? caption,
    String? mediaUrl,
    String? thumbnailUrl,
    String? categoryId,
    String? categoryName,
    String? brandId,
    String? brandName,
    String? status,
    String? type,
    bool? isArchived,
    String? scheduledAt,
    String? publishedAt,
    int? likesCount,
    bool? isLiked,
    int? commentsCount,
    String? createdAt,
    String? updatedAt,
    required List<MediaItem> media,
  }) = _IntroData;

  factory IntroData.fromJson(Map<String, dynamic> json) =>
      _$IntroDataFromJson(json);
}

@freezed
class FavSportsMoment with _$FavSportsMoment {
  const factory FavSportsMoment({
    String? id,
    String? title,
    String? caption,
    String? mediaUrl,
    String? thumbnailUrl,
    String? categoryId,
    String? categoryName,
    String? brandId,
    String? brandName,
    String? status,
    String? type,
    bool? isArchived,
    String? scheduledAt,
    String? publishedAt,
    int? likesCount,
    bool? isLiked,
    int? commentsCount,
    String? createdAt,
    String? updatedAt,
    required List<MediaItem> media,
  }) = _FavSportsMoment;

  factory FavSportsMoment.fromJson(Map<String, dynamic> json) =>
      _$FavSportsMomentFromJson(json);
}

@freezed
class MediaItem with _$MediaItem {
  const factory MediaItem({
    required String id,
    required String url,
    String? thumbnailUrl,
    int? duration,
    required int sortOrder,
    required String createdAt,
    required String updatedAt,
  }) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);
}

@freezed
class FindAthlete with _$FindAthlete {
  const factory FindAthlete({
    String? spotify,
    String? youtube,
    String? instagram,
    String? fameMe,
    String? facebook,
    String? tiktok,
    String? twitter,
  }) = _FindAthlete;

  factory FindAthlete.fromJson(Map<String, dynamic> json) =>
      _$FindAthleteFromJson(json);
}

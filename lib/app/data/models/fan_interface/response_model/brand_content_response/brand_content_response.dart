import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_content_response.freezed.dart';
part 'brand_content_response.g.dart';

@freezed
class BrandContentResponse with _$BrandContentResponse {
  const factory BrandContentResponse({
    required bool status,
    required int statusCode,
    required String message,
    required BrandContentData data,
  }) = _BrandContentResponse;

  factory BrandContentResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandContentResponseFromJson(json);
}

@freezed
class BrandContentData with _$BrandContentData {
  const factory BrandContentData({
    required String message,
    @JsonKey(name: "brand") required BrandInfo brand,
    required List<BrandContentItem> content,
    required Pagination pagination,
  }) = _BrandContentData;

  factory BrandContentData.fromJson(Map<String, dynamic> json) =>
      _$BrandContentDataFromJson(json);
}

@freezed
class BrandInfo with _$BrandInfo {
  const factory BrandInfo({
    required String id,
    required String name,
    @JsonKey(name: "imageData") required String imageData,
  }) = _BrandInfo;

  factory BrandInfo.fromJson(Map<String, dynamic> json) =>
      _$BrandInfoFromJson(json);
}

@freezed
class BrandContentItem with _$BrandContentItem {
  const factory BrandContentItem({
    required String id,
    required String title,
    required String caption,
    required String mediaUrl,
    String? thumbnailUrl,
    String? mediaType,
    required String publishedAt,

    // athlete object
    @JsonKey(name: "athlete") AthleteData? athlete,

    // NEW: sportsAthlete (as requested)
    @JsonKey(name: "sportsAthlete") AthleteData? sportsAthlete,

    // category object inside content
    @JsonKey(name: "category") CategoryInfo? category,
    required int likesCount,
    required int commentsCount,
  }) = _BrandContentItem;

  factory BrandContentItem.fromJson(Map<String, dynamic> json) =>
      _$BrandContentItemFromJson(json);
}

@freezed
class AthleteData with _$AthleteData {
  const factory AthleteData({
    required String id,
    required String name,
    required String profilePicture,
  }) = _AthleteData;

  factory AthleteData.fromJson(Map<String, dynamic> json) =>
      _$AthleteDataFromJson(json);
}

@freezed
class CategoryInfo with _$CategoryInfo {
  const factory CategoryInfo({
    required String id,
    required String name,
    @JsonKey(name: "imageData") required String imageData,
  }) = _CategoryInfo;

  factory CategoryInfo.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int totalCount,
    required int totalPages,
    required int currentPage,
    required int limit,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

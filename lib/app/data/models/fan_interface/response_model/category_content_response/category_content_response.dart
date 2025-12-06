import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_content_response.freezed.dart';
part 'category_content_response.g.dart';

@freezed
class CategoryContentResponse with _$CategoryContentResponse {
  const factory CategoryContentResponse({
    required bool status,
    required int statusCode,
    required String message,
    required CategoryContentData data,
  }) = _CategoryContentResponse;

  factory CategoryContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryContentResponseFromJson(json);
}

@freezed
class CategoryContentData with _$CategoryContentData {
  const factory CategoryContentData({
    required String message,
    required CategoryInfo category,
    required List<ContentItem> content,
    required Pagination pagination,
  }) = _CategoryContentData;

  factory CategoryContentData.fromJson(Map<String, dynamic> json) =>
      _$CategoryContentDataFromJson(json);
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
class ContentItem with _$ContentItem {
  const factory ContentItem({
    required String id,
    required String title,
    required String caption,
    required String mediaUrl,
    String? thumbnailUrl,
    String? mediaType,
    required String publishedAt,

    // MATCH THE API EXACTLY
    @JsonKey(name: "athlete") AthleteData? athlete,
    @JsonKey(name: "brand") BrandData? brand,
    required int likesCount,
    required bool isLiked,
    required int commentsCount,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
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
class BrandData with _$BrandData {
  const factory BrandData({
    String? id,
    required String name,
    String? imageData,
  }) = _BrandData;

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);
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

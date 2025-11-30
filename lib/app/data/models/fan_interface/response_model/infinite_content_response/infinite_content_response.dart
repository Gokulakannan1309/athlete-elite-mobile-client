import 'package:freezed_annotation/freezed_annotation.dart';

part 'infinite_content_response.freezed.dart';
part 'infinite_content_response.g.dart';

@freezed
class InfiniteContentResponse with _$InfiniteContentResponse {
  const factory InfiniteContentResponse({
    required bool status,
    required int statusCode,
    required String message,
    required InfiniteContentData data,
  }) = _InfiniteContentResponse;

  factory InfiniteContentResponse.fromJson(Map<String, dynamic> json) =>
      _$InfiniteContentResponseFromJson(json);
}

@freezed
class InfiniteContentData with _$InfiniteContentData {
  const factory InfiniteContentData({
    required String message,
    required List<InfiniteContentItem> content,
  }) = _InfiniteContentData;

  factory InfiniteContentData.fromJson(Map<String, dynamic> json) =>
      _$InfiniteContentDataFromJson(json);
}

@freezed
class InfiniteContentItem with _$InfiniteContentItem {
  const factory InfiniteContentItem({
    required String id,
    required String title,
    required String caption,
    required String mediaUrl,
    String? thumbnailUrl,
    String? mediaType,
    String? publishedAt,
    AthleteInfinite? athlete,
    CategoryInfinite? category,
    BrandInfinite? brand,
    required int likesCount,
    required int commentsCount,
    required bool isLiked,
  }) = _InfiniteContentItem;

  factory InfiniteContentItem.fromJson(Map<String, dynamic> json) =>
      _$InfiniteContentItemFromJson(json);
}

@freezed
class AthleteInfinite with _$AthleteInfinite {
  const factory AthleteInfinite({
    required String id,
    required String name,
    required String profilePicture,
  }) = _AthleteInfinite;

  factory AthleteInfinite.fromJson(Map<String, dynamic> json) =>
      _$AthleteInfiniteFromJson(json);
}

@freezed
class CategoryInfinite with _$CategoryInfinite {
  const factory CategoryInfinite({
    String? id,
    String? name,
    String? imageData,
  }) = _CategoryInfinite;

  factory CategoryInfinite.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfiniteFromJson(json);
}

@freezed
class BrandInfinite with _$BrandInfinite {
  const factory BrandInfinite({
    String? id,
    String? name,
    String? imageData,
  }) = _BrandInfinite;

  factory BrandInfinite.fromJson(Map<String, dynamic> json) =>
      _$BrandInfiniteFromJson(json);
}

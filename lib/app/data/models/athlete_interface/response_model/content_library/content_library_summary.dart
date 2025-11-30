import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_library_summary.freezed.dart';
part 'content_library_summary.g.dart';

@freezed
class ContentLibrarySummaryResponse with _$ContentLibrarySummaryResponse {
  const factory ContentLibrarySummaryResponse({
    required bool status,
    required int statusCode,
    required String message,
    required ContentLibrarySummaryData data,
  }) = _ContentLibrarySummaryResponse;

  factory ContentLibrarySummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentLibrarySummaryResponseFromJson(json);
}

@freezed
class ContentLibrarySummaryData with _$ContentLibrarySummaryData {
  const factory ContentLibrarySummaryData({
    required int totalCategories,
    required int totalChannels,
    required List<CategoryItem> categories,
  }) = _ContentLibrarySummaryData;

  factory ContentLibrarySummaryData.fromJson(Map<String, dynamic> json) =>
      _$ContentLibrarySummaryDataFromJson(json);
}

@freezed
class CategoryItem with _$CategoryItem {
  const factory CategoryItem({
    required String categoryId,
    String? categoryName,
    required int totalItems,
    required List<PreviewItem> preview,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
}

@freezed
class PreviewItem with _$PreviewItem {
  const factory PreviewItem({
    required String id,
    required String title,
    required String caption,
    required String mediaUrl,
    String? thumbnailUrl,

    // Category fields
    required String categoryId,
    String? categoryName,

    // Brand fields
    String? brandId,
    String? brandName,

    // Post fields
    required String status,
    required String type,
    required bool isArchived,
    String? scheduledAt,
    required String publishedAt,

    // Counts
    required int likesCount,
    required int commentsCount,

    // Timestamps
    required String createdAt,
    required String updatedAt,

    // Media list
    required List<MediaItem> media,
  }) = _PreviewItem;

  factory PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewItemFromJson(json);
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

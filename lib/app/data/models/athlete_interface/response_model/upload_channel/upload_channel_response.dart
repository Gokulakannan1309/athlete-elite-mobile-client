import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_channel_response.freezed.dart';
part 'upload_channel_response.g.dart';

@freezed
class UploadChannelResponse with _$UploadChannelResponse {
  const factory UploadChannelResponse({
    required List<CategoryGroup> categories,
    required List<BrandGroup> brands,
  }) = _UploadChannelResponse;

  factory UploadChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadChannelResponseFromJson(json);
}

@freezed
class CategoryGroup with _$CategoryGroup {
  const factory CategoryGroup({
    @JsonKey(name: 'categoryId') required String id,
    @JsonKey(name: 'categoryName') String? name, // FIXED
    required int totalItems,
    required List<PreviewItem> preview,
  }) = _CategoryGroup;

  factory CategoryGroup.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupFromJson(json);
}

@freezed
class BrandGroup with _$BrandGroup {
  const factory BrandGroup({
    @JsonKey(name: 'brandId') required String id,
    @JsonKey(name: 'brandName') required String name,
    required int totalItems,
    required List<PreviewItem> preview,
  }) = _BrandGroup;

  factory BrandGroup.fromJson(Map<String, dynamic> json) =>
      _$BrandGroupFromJson(json);
}

@freezed
class PreviewItem with _$PreviewItem {
  const factory PreviewItem({
    required String id,
    required String title,
    String? caption,
    required String mediaUrl,
    String? thumbnailUrl, // FIXED
    String? category,
    String? brand,
    required String status,
    required String type,
    bool? isArchived,
    String? scheduledAt,
    String? publishedAt,
    int? likesCount,
    bool? isLiked,
    int? commentsCount,
    String? createdAt,
    String? updatedAt,
    required List<PreviewMedia> media,
  }) = _PreviewItem;

  factory PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewItemFromJson(json);
}

@freezed
class PreviewMedia with _$PreviewMedia {
  const factory PreviewMedia({
    required String id,
    required String url,
    String? thumbnailUrl,
    int? duration,
    required int sortOrder,
    String? createdAt,
    String? updatedAt,
  }) = _PreviewMedia;

  factory PreviewMedia.fromJson(Map<String, dynamic> json) =>
      _$PreviewMediaFromJson(json);
}



import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_model_details.freezed.dart';
part 'draft_model_details.g.dart';

@freezed
class DraftResponse with _$DraftResponse {
  const factory DraftResponse({
    required bool status,
    required int statusCode,
    required String message,
    required DraftData data,
  }) = _DraftResponse;

  factory DraftResponse.fromJson(Map<String, dynamic> json) =>
      _$DraftResponseFromJson(json);
}

@freezed
class DraftData with _$DraftData {
  const factory DraftData({
    required List<DraftCategoryItem> items,
    required DraftMeta meta,
  }) = _DraftData;

  factory DraftData.fromJson(Map<String, dynamic> json) =>
      _$DraftDataFromJson(json);
}

@freezed
class DraftCategoryItem with _$DraftCategoryItem {
  const factory DraftCategoryItem({
     String? categoryId,
    String? categoryName,
    required List<DraftChannel> channels,
  }) = _DraftCategoryItem;

  factory DraftCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$DraftCategoryItemFromJson(json);
}

@freezed
class DraftChannel with _$DraftChannel {
  const factory DraftChannel({
    required String id,
    String? title,
    String? caption,
    String? mediaUrl,
    String? thumbnailUrl,
    String? status,
    String? type,
    bool? isArchived,
    String? brandId,
    String? brandName,
    String? scheduledAt,
    String? publishedAt,
    int? likesCount,
    bool? isLiked,
    int? commentsCount,
    String? createdAt,
    String? updatedAt,
    required List<DraftMedia> media,
  }) = _DraftChannel;

  factory DraftChannel.fromJson(Map<String, dynamic> json) =>
      _$DraftChannelFromJson(json);
}

@freezed
class DraftMedia with _$DraftMedia {
  const factory DraftMedia({
    required String id,
    required String url,
    String? thumbnailUrl,
    int? duration,
    int? sortOrder,
    String? createdAt,
    String? updatedAt,
  }) = _DraftMedia;

  factory DraftMedia.fromJson(Map<String, dynamic> json) =>
      _$DraftMediaFromJson(json);
}

@freezed
class DraftMeta with _$DraftMeta {
  const factory DraftMeta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _DraftMeta;

  factory DraftMeta.fromJson(Map<String, dynamic> json) =>
      _$DraftMetaFromJson(json);
}

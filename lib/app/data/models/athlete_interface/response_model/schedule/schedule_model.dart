import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
    required bool status,
    required int statusCode,
    required String message,
    required ScheduleData data,
  }) = _ScheduleResponse;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
}

@freezed
class ScheduleData with _$ScheduleData {
  const factory ScheduleData({
    required List<ScheduleItem> items,
    ScheduleMeta? meta, // <<< FIXED: now nullable
  }) = _ScheduleData;

  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);
}

@freezed
class ScheduleItem with _$ScheduleItem {
  const factory ScheduleItem({
    required String id,
    String? title,
    String? caption,
    String? mediaUrl,
    String? thumbnailUrl,
    String? category,
    String? brand,
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
    required List<ScheduleMedia> media,
  }) = _ScheduleItem;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemFromJson(json);
}

@freezed
class ScheduleMedia with _$ScheduleMedia {
  const factory ScheduleMedia({
    required String id,
    required String url,
    String? thumbnailUrl,
    int? duration,
    int? sortOrder,
    String? createdAt,
    String? updatedAt,
  }) = _ScheduleMedia;

  factory ScheduleMedia.fromJson(Map<String, dynamic> json) =>
      _$ScheduleMediaFromJson(json);
}

@freezed
class ScheduleMeta with _$ScheduleMeta {
  const factory ScheduleMeta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _ScheduleMeta;

  factory ScheduleMeta.fromJson(Map<String, dynamic> json) =>
      _$ScheduleMetaFromJson(json);
}

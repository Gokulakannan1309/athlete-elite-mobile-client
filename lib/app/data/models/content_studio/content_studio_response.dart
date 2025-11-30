import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_studio_response.freezed.dart';
part 'content_studio_response.g.dart';

@freezed
class ContentStudioResponse with _$ContentStudioResponse {
  factory ContentStudioResponse({
    required bool status,
    required int statusCode,
    required String message,
    required ContentStudioData data,
  }) = _ContentStudioResponse;

  factory ContentStudioResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentStudioResponseFromJson(json);
}

@freezed
class ContentStudioData with _$ContentStudioData {
  factory ContentStudioData({
    required List<ContentItem> items,
    required Meta meta,
  }) = _ContentStudioData;

  factory ContentStudioData.fromJson(Map<String, dynamic> json) =>
      _$ContentStudioDataFromJson(json);
}

@freezed
class ContentItem with _$ContentItem {
  factory ContentItem({
    required String id,
    required String status,
    required String description,
    required String uploadedMediaType,
    required List<UploadedMedia> uploadedMedia,
    required bool hasEditedMedia,
    required String createdAt,
    required String updatedAt,
    String? editedAt,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}

@freezed
class UploadedMedia with _$UploadedMedia {
  factory UploadedMedia({
    required String url,
    required String fileName,
    required String filePath,
    required int fileSize,
    required String mimeType,
    required String mediaType,
  }) = _UploadedMedia;

  factory UploadedMedia.fromJson(Map<String, dynamic> json) =>
      _$UploadedMediaFromJson(json);
}

@freezed
class Meta with _$Meta {
  factory Meta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

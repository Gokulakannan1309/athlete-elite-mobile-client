import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_channel_response.freezed.dart';
part 'latest_channel_response.g.dart';

@freezed
class LatestChannelResponse with _$LatestChannelResponse {
  const factory LatestChannelResponse({
    required bool status,
    required int statusCode,
    required String message,
    required LatestChannelData data,
  }) = _LatestChannelResponse;

  factory LatestChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestChannelResponseFromJson(json);
}

@freezed
class LatestChannelData with _$LatestChannelData {
  const factory LatestChannelData({
    required String message,
    required List<LatestChannelItem> channels,
    required Pagination pagination,
  }) = _LatestChannelData;

  factory LatestChannelData.fromJson(Map<String, dynamic> json) =>
      _$LatestChannelDataFromJson(json);
}

@freezed
class LatestChannelItem with _$LatestChannelItem {
  const factory LatestChannelItem({
    required String id,
    required String? title,
    required String? caption,
    required String mediaUrl,
    String? thumbnailUrl, // will not be used
    String? mediaType,
    required String publishedAt,
    required AthleteRes athlete,
    required CategoryRes? category,
    required BrandRes? brand,
    required int likesCount,
    required int commentsCount,
    required bool isLiked,
  }) = _LatestChannelItem;

  factory LatestChannelItem.fromJson(Map<String, dynamic> json) =>
      _$LatestChannelItemFromJson(json);
}

@freezed
class AthleteRes with _$AthleteRes {
  const factory AthleteRes({
    required String id,
    required String name,
    required String profilePicture,
  }) = _AthleteRes;

  factory AthleteRes.fromJson(Map<String, dynamic> json) =>
      _$AthleteResFromJson(json);
}

@freezed
class CategoryRes with _$CategoryRes {
  const factory CategoryRes({
    required String? id,
    required String name,
    required String? imageData,
  }) = _CategoryRes;

  factory CategoryRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryResFromJson(json);
}

@freezed
class BrandRes with _$BrandRes {
  const factory BrandRes({
    required String? id,
    required String name,
    required String? imageData,
  }) = _BrandRes;

  factory BrandRes.fromJson(Map<String, dynamic> json) =>
      _$BrandResFromJson(json);
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

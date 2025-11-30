import 'package:freezed_annotation/freezed_annotation.dart';

part 'private_community_post_list_response.freezed.dart';
part 'private_community_post_list_response.g.dart';

@freezed
class PrivateCommunityPostListResponse with _$PrivateCommunityPostListResponse {
  const factory PrivateCommunityPostListResponse({
    required bool status,
    required int statusCode,
    required String message,
    required PrivateCommunityPostsData data,
  }) = _PrivateCommunityPostListResponse;

  factory PrivateCommunityPostListResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PrivateCommunityPostListResponseFromJson(json);
}

@freezed
class PrivateCommunityPostsData with _$PrivateCommunityPostsData {
  const factory PrivateCommunityPostsData({
    required List<PrivateCommunityPost> items,
    required PrivateCommunityPagination meta,
  }) = _PrivateCommunityPostsData;

  factory PrivateCommunityPostsData.fromJson(Map<String, dynamic> json) =>
      _$PrivateCommunityPostsDataFromJson(json);
}

@freezed
class PrivateCommunityPost with _$PrivateCommunityPost {
  const factory PrivateCommunityPost({
    required String id,
    required String content,
    required String createdAt,
    @JsonKey(name: "reactionsCount") required Map<String, int> reactions,
    String? userReaction,
  }) = _PrivateCommunityPost;

  factory PrivateCommunityPost.fromJson(Map<String, dynamic> json) =>
      _$PrivateCommunityPostFromJson(json);
}

@freezed
class PrivateCommunityPagination with _$PrivateCommunityPagination {
  const factory PrivateCommunityPagination({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _PrivateCommunityPagination;

  factory PrivateCommunityPagination.fromJson(Map<String, dynamic> json) =>
      _$PrivateCommunityPaginationFromJson(json);
}

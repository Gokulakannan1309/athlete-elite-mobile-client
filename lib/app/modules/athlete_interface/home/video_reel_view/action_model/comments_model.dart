import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

@freezed
class CommentsResponse with _$CommentsResponse {
  const factory CommentsResponse({
    required bool status,
    required int statusCode,
    required String message,
    required CommentsData data,
  }) = _CommentsResponse;

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
}

@freezed
class CommentsData with _$CommentsData {
  const factory CommentsData({
    required String channelId,
    required int commentsCount,
    required List<CommentItem> comments,
    required Pagination pagination,
  }) = _CommentsData;

  factory CommentsData.fromJson(Map<String, dynamic> json) =>
      _$CommentsDataFromJson(json);
}

@freezed
class CommentItem with _$CommentItem {
  const factory CommentItem({
    required String id,
    required String content,
    required String createdAt,
    required String updatedAt,
    required User user,
    required int repliesCount,
    required int reactionsCount,
    required Map<String, dynamic> reactionCounts,
    required bool isReacted,
    String? userReaction,
    required List<CommentItem> replies,
  }) = _CommentItem;

  factory CommentItem.fromJson(Map<String, dynamic> json) =>
      _$CommentItemFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    String? username,
    String? profilePicture,
    required String role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    required bool hasMore,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

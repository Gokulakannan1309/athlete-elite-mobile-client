import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_response_fan_view.freezed.dart';
part 'comments_response_fan_view.g.dart';

@freezed
class CommentsResponseFanView with _$CommentsResponseFanView {
  const factory CommentsResponseFanView({
    required bool status,
    required int statusCode,
    required String message,
    required CommentsDataFanView data,
  }) = _CommentsResponseFanView;

  factory CommentsResponseFanView.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFanViewFromJson(json);
}

@freezed
class CommentsDataFanView with _$CommentsDataFanView {
  const factory CommentsDataFanView({
    required List<CommentItemFanView> comments,
    required PaginationFanView pagination,
  }) = _CommentsDataFanView;

  factory CommentsDataFanView.fromJson(Map<String, dynamic> json) =>
      _$CommentsDataFanViewFromJson(json);
}

@freezed
class PaginationFanView with _$PaginationFanView {
  const factory PaginationFanView({
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    required bool hasMore,
  }) = _PaginationFanView;

  factory PaginationFanView.fromJson(Map<String, dynamic> json) =>
      _$PaginationFanViewFromJson(json);
}

@freezed
class CommentItemFanView with _$CommentItemFanView {
  const factory CommentItemFanView({
    required String id,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    required CommentUserFanView user,
    required int repliesCount,
    required int reactionsCount,
    required Map<String, dynamic> reactionCounts,
    String? userReaction,
    required bool isReacted,
    required List<ReplyItemFanView> replies,
  }) = _CommentItemFanView;

  factory CommentItemFanView.fromJson(Map<String, dynamic> json) =>
      _$CommentItemFanViewFromJson(json);
}

@freezed
class CommentUserFanView with _$CommentUserFanView {
  const factory CommentUserFanView({
    required String id,
    required String name,
    String? username,
    String? profilePicture,
  }) = _CommentUserFanView;

  factory CommentUserFanView.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFanViewFromJson(json);
}

@freezed
class ReplyItemFanView with _$ReplyItemFanView {
  const factory ReplyItemFanView({
    required String id,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    required CommentUserFanView user,
  }) = _ReplyItemFanView;

  factory ReplyItemFanView.fromJson(Map<String, dynamic> json) =>
      _$ReplyItemFanViewFromJson(json);
}

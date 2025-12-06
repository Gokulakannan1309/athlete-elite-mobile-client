// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_response_fan_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsResponseFanViewImpl _$$CommentsResponseFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentsResponseFanViewImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: CommentsDataFanView.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentsResponseFanViewImplToJson(
        _$CommentsResponseFanViewImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$CommentsDataFanViewImpl _$$CommentsDataFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentsDataFanViewImpl(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentItemFanView.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationFanView.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentsDataFanViewImplToJson(
        _$CommentsDataFanViewImpl instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'pagination': instance.pagination,
    };

_$PaginationFanViewImpl _$$PaginationFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationFanViewImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$PaginationFanViewImplToJson(
        _$PaginationFanViewImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasMore': instance.hasMore,
    };

_$CommentItemFanViewImpl _$$CommentItemFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentItemFanViewImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: CommentUserFanView.fromJson(json['user'] as Map<String, dynamic>),
      repliesCount: (json['repliesCount'] as num).toInt(),
      reactionsCount: (json['reactionsCount'] as num).toInt(),
      reactionCounts: json['reactionCounts'] as Map<String, dynamic>,
      userReaction: json['userReaction'] as String?,
      isReacted: json['isReacted'] as bool,
      replies: (json['replies'] as List<dynamic>)
          .map((e) => ReplyItemFanView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommentItemFanViewImplToJson(
        _$CommentItemFanViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'user': instance.user,
      'repliesCount': instance.repliesCount,
      'reactionsCount': instance.reactionsCount,
      'reactionCounts': instance.reactionCounts,
      'userReaction': instance.userReaction,
      'isReacted': instance.isReacted,
      'replies': instance.replies,
    };

_$CommentUserFanViewImpl _$$CommentUserFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentUserFanViewImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$CommentUserFanViewImplToJson(
        _$CommentUserFanViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
    };

_$ReplyItemFanViewImpl _$$ReplyItemFanViewImplFromJson(
        Map<String, dynamic> json) =>
    _$ReplyItemFanViewImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      user: CommentUserFanView.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReplyItemFanViewImplToJson(
        _$ReplyItemFanViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };

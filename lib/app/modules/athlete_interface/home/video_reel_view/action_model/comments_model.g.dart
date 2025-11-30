// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsResponseImpl _$$CommentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentsResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: CommentsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentsResponseImplToJson(
        _$CommentsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$CommentsDataImpl _$$CommentsDataImplFromJson(Map<String, dynamic> json) =>
    _$CommentsDataImpl(
      channelId: json['channelId'] as String,
      commentsCount: (json['commentsCount'] as num).toInt(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentsDataImplToJson(_$CommentsDataImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'commentsCount': instance.commentsCount,
      'comments': instance.comments,
      'pagination': instance.pagination,
    };

_$CommentItemImpl _$$CommentItemImplFromJson(Map<String, dynamic> json) =>
    _$CommentItemImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      repliesCount: (json['repliesCount'] as num).toInt(),
      reactionsCount: (json['reactionsCount'] as num).toInt(),
      reactionCounts: json['reactionCounts'] as Map<String, dynamic>,
      userReaction: json['userReaction'] as String?,
      replies: (json['replies'] as List<dynamic>)
          .map((e) => CommentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommentItemImplToJson(_$CommentItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.user,
      'repliesCount': instance.repliesCount,
      'reactionsCount': instance.reactionsCount,
      'reactionCounts': instance.reactionCounts,
      'userReaction': instance.userReaction,
      'replies': instance.replies,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String?,
      profilePicture: json['profilePicture'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
      'role': instance.role,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasMore': instance.hasMore,
    };

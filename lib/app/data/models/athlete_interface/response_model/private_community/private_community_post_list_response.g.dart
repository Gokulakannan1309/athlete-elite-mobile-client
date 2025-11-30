// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_community_post_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivateCommunityPostListResponseImpl
    _$$PrivateCommunityPostListResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$PrivateCommunityPostListResponseImpl(
          status: json['status'] as bool,
          statusCode: (json['statusCode'] as num).toInt(),
          message: json['message'] as String,
          data: PrivateCommunityPostsData.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$PrivateCommunityPostListResponseImplToJson(
        _$PrivateCommunityPostListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$PrivateCommunityPostsDataImpl _$$PrivateCommunityPostsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivateCommunityPostsDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => PrivateCommunityPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PrivateCommunityPagination.fromJson(
          json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrivateCommunityPostsDataImplToJson(
        _$PrivateCommunityPostsDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$PrivateCommunityPostImpl _$$PrivateCommunityPostImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivateCommunityPostImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      reactions: Map<String, int>.from(json['reactionsCount'] as Map),
      userReaction: json['userReaction'] as String?,
    );

Map<String, dynamic> _$$PrivateCommunityPostImplToJson(
        _$PrivateCommunityPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'reactionsCount': instance.reactions,
      'userReaction': instance.userReaction,
    };

_$PrivateCommunityPaginationImpl _$$PrivateCommunityPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivateCommunityPaginationImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$PrivateCommunityPaginationImplToJson(
        _$PrivateCommunityPaginationImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

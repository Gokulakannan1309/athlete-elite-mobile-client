class AthleteCommunityPostsResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteCommunityPostsDataFanView? data;

  AthleteCommunityPostsResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteCommunityPostsResponseFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteCommunityPostsResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteCommunityPostsDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteCommunityPostsDataFanView {
  final bool? isTracked;
  final List<CommunityPostFanView>? posts;
  final PaginationFanView? pagination;

  AthleteCommunityPostsDataFanView(
      {this.isTracked, this.posts, this.pagination});

  factory AthleteCommunityPostsDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteCommunityPostsDataFanView(
      isTracked: json['isTracked'],
      posts: json['posts'] != null
          ? (json['posts'] as List)
              .map((e) => CommunityPostFanView.fromJson(e))
              .toList()
          : [],
      pagination: json['pagination'] != null
          ? PaginationFanView.fromJson(json['pagination'])
          : null,
    );
  }
}

class CommunityPostFanView {
  final String? id;
  final String? content;
  final String? createdAt;
  final Map<String, dynamic>? reactions;
  final String? userReaction;

  CommunityPostFanView({
    this.id,
    this.content,
    this.createdAt,
    this.reactions,
    this.userReaction,
  });

  factory CommunityPostFanView.fromJson(Map<String, dynamic> json) {
    return CommunityPostFanView(
      id: json['id'],
      content: json['content'],
      createdAt: json['createdAt'],
      reactions: json['reactions'] != null
          ? Map<String, dynamic>.from(json['reactions'])
          : {},
      userReaction: json['userReaction'],
    );
  }
}

class PaginationFanView {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;
  final bool? hasMore;

  PaginationFanView(
      {this.page, this.limit, this.total, this.totalPages, this.hasMore});

  factory PaginationFanView.fromJson(Map<String, dynamic> json) {
    return PaginationFanView(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPages: json['totalPages'],
      hasMore: json['hasMore'],
    );
  }
}

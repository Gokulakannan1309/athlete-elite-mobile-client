class AthleteCategoryChannelsResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteCategoryChannelsDataFanView? data;

  AthleteCategoryChannelsResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteCategoryChannelsResponseFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteCategoryChannelsResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteCategoryChannelsDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteCategoryChannelsDataFanView {
  final List<CategoryChannelFanView>? channels;
  final PaginationFanView? pagination;

  AthleteCategoryChannelsDataFanView({
    this.channels,
    this.pagination,
  });

  factory AthleteCategoryChannelsDataFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteCategoryChannelsDataFanView(
      channels: json['channels'] != null
          ? (json['channels'] as List)
              .map((e) => CategoryChannelFanView.fromJson(e))
              .toList()
          : [],
      pagination: json['pagination'] != null
          ? PaginationFanView.fromJson(json['pagination'])
          : null,
    );
  }
}

class CategoryChannelFanView {
  final String? id;
  final String? title;
  final String? caption;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final String? mediaType;
  final int? duration;
  final String? publishedAt;
  final int? likesCount;
  final int? commentsCount;

  CategoryChannelFanView({
    this.id,
    this.title,
    this.caption,
    this.mediaUrl,
    this.thumbnailUrl,
    this.mediaType,
    this.duration,
    this.publishedAt,
    this.likesCount,
    this.commentsCount,
  });

  factory CategoryChannelFanView.fromJson(Map<String, dynamic> json) {
    return CategoryChannelFanView(
      id: json['id'],
      title: json['title'],
      caption: json['caption'],
      mediaUrl: json['mediaUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      mediaType: json['mediaType'],
      duration: json['duration'],
      publishedAt: json['publishedAt'],
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
    );
  }
}

class PaginationFanView {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;
  final bool? hasMore;

  PaginationFanView({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
    this.hasMore,
  });

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

class AthleteBrandChannelsResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteBrandChannelsDataFanView? data;

  AthleteBrandChannelsResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteBrandChannelsResponseFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteBrandChannelsResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteBrandChannelsDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteBrandChannelsDataFanView {
  final List<BrandChannelFanView>? channels;
  final PaginationFanView? pagination;

  AthleteBrandChannelsDataFanView({this.channels, this.pagination});

  factory AthleteBrandChannelsDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteBrandChannelsDataFanView(
      channels: json['channels'] != null
          ? (json['channels'] as List)
              .map((e) => BrandChannelFanView.fromJson(e))
              .toList()
          : [],
      pagination: json['pagination'] != null
          ? PaginationFanView.fromJson(json['pagination'])
          : null,
    );
  }
}

class BrandChannelFanView {
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

  BrandChannelFanView({
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

  factory BrandChannelFanView.fromJson(Map<String, dynamic> json) {
    return BrandChannelFanView(
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

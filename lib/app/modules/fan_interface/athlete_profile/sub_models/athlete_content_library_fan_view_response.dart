class AthleteContentLibraryResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteContentLibraryDataFanView? data;

  AthleteContentLibraryResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteContentLibraryResponseFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteContentLibraryResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteContentLibraryDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteContentLibraryDataFanView {
  final List<ContentCategoryFanView>? categories;
  final List<ContentBrandFanView>? brands;

  AthleteContentLibraryDataFanView({this.categories, this.brands});

  factory AthleteContentLibraryDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteContentLibraryDataFanView(
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => ContentCategoryFanView.fromJson(e))
              .toList()
          : [],
      brands: json['brands'] != null
          ? (json['brands'] as List)
              .map((e) => ContentBrandFanView.fromJson(e))
              .toList()
          : [],
    );
  }
}

class ContentCategoryFanView {
  final String? name;
  final List<ContentChannelFanView>? channels;

  ContentCategoryFanView({this.name, this.channels});

  factory ContentCategoryFanView.fromJson(Map<String, dynamic> json) {
    return ContentCategoryFanView(
      name: json['name'],
      channels: json['channels'] != null
          ? (json['channels'] as List)
              .map((e) => ContentChannelFanView.fromJson(e))
              .toList()
          : [],
    );
  }
}

class ContentBrandFanView {
  final String? name;
  final List<ContentChannelFanView>? channels;

  ContentBrandFanView({this.name, this.channels});

  factory ContentBrandFanView.fromJson(Map<String, dynamic> json) {
    return ContentBrandFanView(
      name: json['name'],
      channels: json['channels'] != null
          ? (json['channels'] as List)
              .map((e) => ContentChannelFanView.fromJson(e))
              .toList()
          : [],
    );
  }
}

class ContentChannelFanView {
  final String? id;
  final String? title;
  final String? caption;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final String? mediaType;
  final int? duration;
  final String? category;
  final String? brand;
  final String? publishedAt;
  final int? likesCount;
  final bool? isLiked;
  final int? commentsCount;

  ContentChannelFanView({
    this.id,
    this.title,
    this.caption,
    this.mediaUrl,
    this.thumbnailUrl,
    this.mediaType,
    this.duration,
    this.category,
    this.brand,
    this.publishedAt,
    this.likesCount,
    this.isLiked,
    this.commentsCount,
  });

  factory ContentChannelFanView.fromJson(Map<String, dynamic> json) {
    return ContentChannelFanView(
      id: json['id'],
      title: json['title'],
      caption: json['caption'],
      mediaUrl: json['mediaUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      mediaType: json['mediaType'],
      duration: json['duration'],
      category: json['category'],
      brand: json['brand'],
      publishedAt: json['publishedAt'],
      likesCount: json['likesCount'],
      isLiked: json['isLiked'],
      commentsCount: json['commentsCount'],
    );
  }
}

class AthleteFavMomentResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteFavMomentDataFanView? data;

  AthleteFavMomentResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteFavMomentResponseFanView.fromJson(Map<String, dynamic> json) {
    return AthleteFavMomentResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteFavMomentDataFanView.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class AthleteFavMomentDataFanView {
  final List<FavMomentFanView>? favoriteMoments;

  AthleteFavMomentDataFanView({this.favoriteMoments});

  factory AthleteFavMomentDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteFavMomentDataFanView(
      favoriteMoments: json['favoriteMoments'] != null
          ? (json['favoriteMoments'] as List)
              .map((e) => FavMomentFanView.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteMoments': favoriteMoments?.map((e) => e.toJson()).toList(),
    };
  }
}

class FavMomentFanView {
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

  FavMomentFanView({
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

  factory FavMomentFanView.fromJson(Map<String, dynamic> json) {
    return FavMomentFanView(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'caption': caption,
      'mediaUrl': mediaUrl,
      'thumbnailUrl': thumbnailUrl,
      'mediaType': mediaType,
      'duration': duration,
      'publishedAt': publishedAt,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
    };
  }
}

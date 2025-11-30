class AthleteIntroResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteIntroDataFanView? data;

  AthleteIntroResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteIntroResponseFanView.fromJson(Map<String, dynamic> json) {
    return AthleteIntroResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteIntroDataFanView.fromJson(json['data'])
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

class AthleteIntroDataFanView {
  final AthleteFanView? athlete;
  final IntroFanView? intro;

  AthleteIntroDataFanView({
    this.athlete,
    this.intro,
  });

  factory AthleteIntroDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteIntroDataFanView(
      athlete: json['athlete'] != null
          ? AthleteFanView.fromJson(json['athlete'])
          : null,
      intro:
          json['intro'] != null ? IntroFanView.fromJson(json['intro']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'athlete': athlete?.toJson(),
      'intro': intro?.toJson(),
    };
  }
}

class AthleteFanView {
  final String? id;
  final String? name;
  final String? bio;
  final String? profilePicture;

  AthleteFanView({
    this.id,
    this.name,
    this.bio,
    this.profilePicture,
  });

  factory AthleteFanView.fromJson(Map<String, dynamic> json) {
    return AthleteFanView(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'profilePicture': profilePicture,
    };
  }
}

class IntroFanView {
  final String? id;
  final String? title;
  final String? caption;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final String? mediaType;
  final int? duration;

  IntroFanView({
    this.id,
    this.title,
    this.caption,
    this.mediaUrl,
    this.thumbnailUrl,
    this.mediaType,
    this.duration,
  });

  factory IntroFanView.fromJson(Map<String, dynamic> json) {
    return IntroFanView(
      id: json['id'],
      title: json['title'],
      caption: json['caption'],
      mediaUrl: json['mediaUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      mediaType: json['mediaType'],
      duration: json['duration'],
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
    };
  }
}

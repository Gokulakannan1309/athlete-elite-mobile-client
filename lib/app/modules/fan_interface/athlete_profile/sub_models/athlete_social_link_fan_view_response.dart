class AthleteSocialLinksResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteSocialLinksDataFanView? data;

  AthleteSocialLinksResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteSocialLinksResponseFanView.fromJson(
      Map<String, dynamic> json) {
    return AthleteSocialLinksResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteSocialLinksDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteSocialLinksDataFanView {
  final SocialLinksFanView? socialLinks;

  AthleteSocialLinksDataFanView({this.socialLinks});

  factory AthleteSocialLinksDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteSocialLinksDataFanView(
      socialLinks: json['socialLinks'] != null
          ? SocialLinksFanView.fromJson(json['socialLinks'])
          : null,
    );
  }
}

class SocialLinksFanView {
  final String? spotify;
  final String? youtube;
  final String? instagram;
  final String? fameMe;
  final String? facebook;
  final String? tiktok;
  final String? twitter;

  SocialLinksFanView({
    this.spotify,
    this.youtube,
    this.instagram,
    this.fameMe,
    this.facebook,
    this.tiktok,
    this.twitter,
  });

  factory SocialLinksFanView.fromJson(Map<String, dynamic> json) {
    return SocialLinksFanView(
      spotify: json['spotify'],
      youtube: json['youtube'],
      instagram: json['instagram'],
      fameMe: json['fameMe'],
      facebook: json['facebook'],
      tiktok: json['tiktok'],
      twitter: json['twitter'],
    );
  }
}

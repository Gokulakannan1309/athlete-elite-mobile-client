class FansListResponse {
  final List<FanItem> items;
  final Meta meta;

  FansListResponse({required this.items, required this.meta});

  factory FansListResponse.fromJson(Map<String, dynamic> json) {
    return FansListResponse(
      items: (json['data']['items'] as List<dynamic>)
          .map((e) => FanItem.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['data']['meta']),
    );
  }
}

class FanItem {
  final String id;
  final String name;
  final String? username;
  final String? email;
  final String? profilePicture;
  final String country;
  final String followedAt;

  FanItem({
    required this.id,
    required this.name,
    this.username,
    this.email,
    this.profilePicture,
    required this.country,
    required this.followedAt,
  });

  factory FanItem.fromJson(Map<String, dynamic> json) {
    return FanItem(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      country: json['country'],
      followedAt: json['followedAt'],
    );
  }
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
      totalPages: json['totalPages'],
    );
  }
}

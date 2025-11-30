class Category {
  final String? id;
  final String name;
  final String posterUrl;

  Category({
    required this.id,
    required this.name,
    required this.posterUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'] ?? "",
      posterUrl: json['posterUrl'] ?? "",
    );
  }
}

class Brand {
  final String id;
  final String name;
  final String posterUrl;

  Brand({required this.id, required this.name, required this.posterUrl});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      posterUrl: json['posterUrl'] ?? "",
    );
  }
}

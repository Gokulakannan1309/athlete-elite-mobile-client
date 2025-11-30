class AthleteCategoriesResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteCategoriesDataFanView? data;

  AthleteCategoriesResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteCategoriesResponseFanView.fromJson(Map<String, dynamic> json) {
    return AthleteCategoriesResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteCategoriesDataFanView.fromJson(json['data'])
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

class AthleteCategoriesDataFanView {
  final List<CategoryFanView>? categories;

  AthleteCategoriesDataFanView({this.categories});

  factory AthleteCategoriesDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteCategoriesDataFanView(
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => CategoryFanView.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories?.map((e) => e.toJson()).toList(),
    };
  }
}

class CategoryFanView {
  final String? name;
  final String? imageData;
  final String? posterUrl;

  CategoryFanView({
    this.name,
    this.imageData,
    this.posterUrl,
  });

  factory CategoryFanView.fromJson(Map<String, dynamic> json) {
    return CategoryFanView(
      name: json['name'],
      imageData: json['imageData'],
      posterUrl: json['posterUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageData': imageData,
      'posterUrl': posterUrl,
    };
  }
}

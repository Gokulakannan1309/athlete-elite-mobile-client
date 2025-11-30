class AthleteBrandsResponseFanView {
  final bool? status;
  final int? statusCode;
  final String? message;
  final AthleteBrandsDataFanView? data;

  AthleteBrandsResponseFanView({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AthleteBrandsResponseFanView.fromJson(Map<String, dynamic> json) {
    return AthleteBrandsResponseFanView(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? AthleteBrandsDataFanView.fromJson(json['data'])
          : null,
    );
  }
}

class AthleteBrandsDataFanView {
  final List<BrandFanView>? brands;

  AthleteBrandsDataFanView({this.brands});

  factory AthleteBrandsDataFanView.fromJson(Map<String, dynamic> json) {
    return AthleteBrandsDataFanView(
      brands: json['brands'] != null
          ? (json['brands'] as List)
              .map((e) => BrandFanView.fromJson(e))
              .toList()
          : [],
    );
  }
}

class BrandFanView {
  final String? name;
  final String? imageData;
  final String? posterUrl;

  BrandFanView({this.name, this.imageData, this.posterUrl});

  factory BrandFanView.fromJson(Map<String, dynamic> json) {
    return BrandFanView(
      name: json['name'],
      imageData: json['imageData'],
      posterUrl: json['posterUrl'],
    );
  }
}

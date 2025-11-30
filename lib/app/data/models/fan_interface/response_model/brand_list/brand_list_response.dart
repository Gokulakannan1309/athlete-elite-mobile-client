import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_list_response.freezed.dart';
part 'brand_list_response.g.dart';

@freezed
class BrandListResponse with _$BrandListResponse {
  const factory BrandListResponse({
    required bool status,
    required int statusCode,
    required String message,
    required BrandData data,
  }) = _BrandListResponse;

  factory BrandListResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandListResponseFromJson(json);
}

@freezed
class BrandData with _$BrandData {
  const factory BrandData({
    required String message,
    required List<BrandItem> brands,
  }) = _BrandData;

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);
}

@freezed
class BrandItem with _$BrandItem {
  const BrandItem._(); // For custom getters

  const factory BrandItem({
    required String id,
    required String name,
    @JsonKey(name: 'imageData') required String posterUrl,
    required int contentCount,
  }) = _BrandItem;

  factory BrandItem.fromJson(Map<String, dynamic> json) =>
      _$BrandItemFromJson(json);
}

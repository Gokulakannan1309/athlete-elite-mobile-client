import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list_response.freezed.dart';
part 'category_list_response.g.dart';

@freezed
class CategoryListResponse with _$CategoryListResponse {
  const factory CategoryListResponse({
    required bool status,
    required int statusCode,
    required String message,
    required CategoryData data,
  }) = _CategoryListResponse;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    required String message,
    required List<CategoryItem> categories,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class CategoryItem with _$CategoryItem {
  const CategoryItem._(); // For custom getters

  const factory CategoryItem({
    required String id,
    required String name,
    @JsonKey(name: 'imageData') required String posterUrl,
    required int contentCount,
  }) = _CategoryItem;

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
}

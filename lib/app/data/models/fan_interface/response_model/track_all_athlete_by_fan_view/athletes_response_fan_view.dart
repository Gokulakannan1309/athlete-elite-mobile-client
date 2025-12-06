import 'package:freezed_annotation/freezed_annotation.dart';

part 'athletes_response_fan_view.freezed.dart';
part 'athletes_response_fan_view.g.dart';

@freezed
class AthletesResponseFanView with _$AthletesResponseFanView {
  const factory AthletesResponseFanView({
    required bool status,
    required int statusCode,
    required String message,
    required AthletesDataFanView data,
  }) = _AthletesResponseFanView;

  factory AthletesResponseFanView.fromJson(Map<String, dynamic> json) =>
      _$AthletesResponseFanViewFromJson(json);
}

@freezed
class AthletesDataFanView with _$AthletesDataFanView {
  const factory AthletesDataFanView({
    required List<AthleteFanView> formatted,
    required PaginationFanView pagination,
  }) = _AthletesDataFanView;

  factory AthletesDataFanView.fromJson(Map<String, dynamic> json) =>
      _$AthletesDataFanViewFromJson(json);
}

@freezed
class AthleteFanView with _$AthleteFanView {
  const factory AthleteFanView({
    required String id,
    required String? name,
    required String? email,
    required String? profilePicture,
    required String? country,
    required String? sports,
    required String? league,
    required String? ranking,
  }) = _AthleteFanView;

  factory AthleteFanView.fromJson(Map<String, dynamic> json) =>
      _$AthleteFanViewFromJson(json);
}

@freezed
class PaginationFanView with _$PaginationFanView {
  const factory PaginationFanView({
    required int totalCount,
    required int totalPages,
    required int currentPage,
    required int limit,
  }) = _PaginationFanView;

  factory PaginationFanView.fromJson(Map<String, dynamic> json) =>
      _$PaginationFanViewFromJson(json);
}

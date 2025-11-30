// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'athletes_response.freezed.dart';
// part 'athletes_response.g.dart';

// @freezed
// class AthletesResponse with _$AthletesResponse {
//   const factory AthletesResponse({
//     required bool status,
//     required int statusCode,
//     required String message,
//     required AthletesData data,
//   }) = _AthletesResponse;

//   factory AthletesResponse.fromJson(Map<String, dynamic> json) =>
//       _$AthletesResponseFromJson(json);
// }

// @freezed
// class AthletesData with _$AthletesData {
//   const factory AthletesData({
//     @Default([]) List<Athlete> formatted,
//     required Pagination pagination,
//   }) = _AthletesData;

//   factory AthletesData.fromJson(Map<String, dynamic> json) =>
//       _$AthletesDataFromJson(json);
// }

// @freezed
// class Athlete with _$Athlete {
//   const factory Athlete({
//     required String id,
//     required String name,
//     required String email,
//     String? profilePicture,
//     String? country,
//     String? sports,
//     String? league,
//     String? ranking,
//   }) = _Athlete;

//   factory Athlete.fromJson(Map<String, dynamic> json) =>
//       _$AthleteFromJson(json);
// }

// @freezed
// class Pagination with _$Pagination {
//   const factory Pagination({
//     @Default(0) int totalCount,
//     @Default(0) int totalPages,
//     @Default(1) int currentPage,
//     @Default(10) int limit,
//   }) = _Pagination;

//   factory Pagination.fromJson(Map<String, dynamic> json) =>
//       _$PaginationFromJson(json);
// }


import 'package:freezed_annotation/freezed_annotation.dart';

part 'athletes_response.freezed.dart';
part 'athletes_response.g.dart';

@freezed
class AthletesResponse with _$AthletesResponse {
  const factory AthletesResponse({
    required bool status,
    required int statusCode,
    required String message,
    required AthletesData data,
  }) = _AthletesResponse;

  factory AthletesResponse.fromJson(Map<String, dynamic> json) =>
      _$AthletesResponseFromJson(json);
}

@freezed
class AthletesData with _$AthletesData {
  const factory AthletesData({
    /// API returns:  data: { data: [ .. ] }
    @JsonKey(name: 'data') @Default([]) List<Athlete> athletes,
    required Pagination pagination,
  }) = _AthletesData;

  factory AthletesData.fromJson(Map<String, dynamic> json) =>
      _$AthletesDataFromJson(json);
}

@freezed
class Athlete with _$Athlete {
  const factory Athlete({
    required String id,
    required String name,
    required String email,
    String? profilePicture,
    String? country,
    String? sports,
    String? league,
    String? ranking,

    /// API sends: isTracked: true/false or null
    @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
    @Default(false)
    bool isTracked,
  }) = _Athlete;

  factory Athlete.fromJson(Map<String, dynamic> json) =>
      _$AthleteFromJson(json);
}

/// Helper function to safely convert null to false
bool _boolFromJson(dynamic value) => value as bool? ?? false;

/// Optional, for serializing back
dynamic _boolToJson(bool value) => value;


@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    /// API fields
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'limit') @Default(10) int limit,
    @JsonKey(name: 'total') @Default(0) int total,
    @JsonKey(name: 'totalPages') @Default(1) int totalPages,
    @JsonKey(name: 'hasMore') @Default(false) bool hasMore,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

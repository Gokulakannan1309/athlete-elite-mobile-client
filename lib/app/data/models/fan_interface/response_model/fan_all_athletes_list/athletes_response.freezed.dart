// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athletes_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AthletesResponse _$AthletesResponseFromJson(Map<String, dynamic> json) {
  return _AthletesResponse.fromJson(json);
}

/// @nodoc
mixin _$AthletesResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AthletesData get data => throw _privateConstructorUsedError;

  /// Serializes this AthletesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthletesResponseCopyWith<AthletesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthletesResponseCopyWith<$Res> {
  factory $AthletesResponseCopyWith(
          AthletesResponse value, $Res Function(AthletesResponse) then) =
      _$AthletesResponseCopyWithImpl<$Res, AthletesResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, AthletesData data});

  $AthletesDataCopyWith<$Res> get data;
}

/// @nodoc
class _$AthletesResponseCopyWithImpl<$Res, $Val extends AthletesResponse>
    implements $AthletesResponseCopyWith<$Res> {
  _$AthletesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AthletesData,
    ) as $Val);
  }

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthletesDataCopyWith<$Res> get data {
    return $AthletesDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthletesResponseImplCopyWith<$Res>
    implements $AthletesResponseCopyWith<$Res> {
  factory _$$AthletesResponseImplCopyWith(_$AthletesResponseImpl value,
          $Res Function(_$AthletesResponseImpl) then) =
      __$$AthletesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, AthletesData data});

  @override
  $AthletesDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AthletesResponseImplCopyWithImpl<$Res>
    extends _$AthletesResponseCopyWithImpl<$Res, _$AthletesResponseImpl>
    implements _$$AthletesResponseImplCopyWith<$Res> {
  __$$AthletesResponseImplCopyWithImpl(_$AthletesResponseImpl _value,
      $Res Function(_$AthletesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AthletesResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AthletesData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthletesResponseImpl implements _AthletesResponse {
  const _$AthletesResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$AthletesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthletesResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final AthletesData data;

  @override
  String toString() {
    return 'AthletesResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthletesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, statusCode, message, data);

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthletesResponseImplCopyWith<_$AthletesResponseImpl> get copyWith =>
      __$$AthletesResponseImplCopyWithImpl<_$AthletesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthletesResponseImplToJson(
      this,
    );
  }
}

abstract class _AthletesResponse implements AthletesResponse {
  const factory _AthletesResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final AthletesData data}) = _$AthletesResponseImpl;

  factory _AthletesResponse.fromJson(Map<String, dynamic> json) =
      _$AthletesResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  AthletesData get data;

  /// Create a copy of AthletesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthletesResponseImplCopyWith<_$AthletesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AthletesData _$AthletesDataFromJson(Map<String, dynamic> json) {
  return _AthletesData.fromJson(json);
}

/// @nodoc
mixin _$AthletesData {
  /// API returns:  data: { data: [ .. ] }
  @JsonKey(name: 'data')
  List<Athlete> get athletes => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this AthletesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthletesDataCopyWith<AthletesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthletesDataCopyWith<$Res> {
  factory $AthletesDataCopyWith(
          AthletesData value, $Res Function(AthletesData) then) =
      _$AthletesDataCopyWithImpl<$Res, AthletesData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<Athlete> athletes, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$AthletesDataCopyWithImpl<$Res, $Val extends AthletesData>
    implements $AthletesDataCopyWith<$Res> {
  _$AthletesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athletes = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      athletes: null == athletes
          ? _value.athletes
          : athletes // ignore: cast_nullable_to_non_nullable
              as List<Athlete>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthletesDataImplCopyWith<$Res>
    implements $AthletesDataCopyWith<$Res> {
  factory _$$AthletesDataImplCopyWith(
          _$AthletesDataImpl value, $Res Function(_$AthletesDataImpl) then) =
      __$$AthletesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<Athlete> athletes, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$AthletesDataImplCopyWithImpl<$Res>
    extends _$AthletesDataCopyWithImpl<$Res, _$AthletesDataImpl>
    implements _$$AthletesDataImplCopyWith<$Res> {
  __$$AthletesDataImplCopyWithImpl(
      _$AthletesDataImpl _value, $Res Function(_$AthletesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athletes = null,
    Object? pagination = null,
  }) {
    return _then(_$AthletesDataImpl(
      athletes: null == athletes
          ? _value._athletes
          : athletes // ignore: cast_nullable_to_non_nullable
              as List<Athlete>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthletesDataImpl implements _AthletesData {
  const _$AthletesDataImpl(
      {@JsonKey(name: 'data') final List<Athlete> athletes = const [],
      required this.pagination})
      : _athletes = athletes;

  factory _$AthletesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthletesDataImplFromJson(json);

  /// API returns:  data: { data: [ .. ] }
  final List<Athlete> _athletes;

  /// API returns:  data: { data: [ .. ] }
  @override
  @JsonKey(name: 'data')
  List<Athlete> get athletes {
    if (_athletes is EqualUnmodifiableListView) return _athletes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_athletes);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'AthletesData(athletes: $athletes, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthletesDataImpl &&
            const DeepCollectionEquality().equals(other._athletes, _athletes) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_athletes), pagination);

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthletesDataImplCopyWith<_$AthletesDataImpl> get copyWith =>
      __$$AthletesDataImplCopyWithImpl<_$AthletesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthletesDataImplToJson(
      this,
    );
  }
}

abstract class _AthletesData implements AthletesData {
  const factory _AthletesData(
      {@JsonKey(name: 'data') final List<Athlete> athletes,
      required final Pagination pagination}) = _$AthletesDataImpl;

  factory _AthletesData.fromJson(Map<String, dynamic> json) =
      _$AthletesDataImpl.fromJson;

  /// API returns:  data: { data: [ .. ] }
  @override
  @JsonKey(name: 'data')
  List<Athlete> get athletes;
  @override
  Pagination get pagination;

  /// Create a copy of AthletesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthletesDataImplCopyWith<_$AthletesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Athlete _$AthleteFromJson(Map<String, dynamic> json) {
  return _Athlete.fromJson(json);
}

/// @nodoc
mixin _$Athlete {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get sports => throw _privateConstructorUsedError;
  String? get league => throw _privateConstructorUsedError;
  String? get ranking => throw _privateConstructorUsedError;

  /// API sends: isTracked: true/false or null
  @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
  bool get isTracked => throw _privateConstructorUsedError;

  /// Serializes this Athlete to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteCopyWith<Athlete> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteCopyWith<$Res> {
  factory $AthleteCopyWith(Athlete value, $Res Function(Athlete) then) =
      _$AthleteCopyWithImpl<$Res, Athlete>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? profilePicture,
      String? country,
      String? sports,
      String? league,
      String? ranking,
      @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson) bool isTracked});
}

/// @nodoc
class _$AthleteCopyWithImpl<$Res, $Val extends Athlete>
    implements $AthleteCopyWith<$Res> {
  _$AthleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profilePicture = freezed,
    Object? country = freezed,
    Object? sports = freezed,
    Object? league = freezed,
    Object? ranking = freezed,
    Object? isTracked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      sports: freezed == sports
          ? _value.sports
          : sports // ignore: cast_nullable_to_non_nullable
              as String?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as String?,
      isTracked: null == isTracked
          ? _value.isTracked
          : isTracked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AthleteImplCopyWith<$Res> implements $AthleteCopyWith<$Res> {
  factory _$$AthleteImplCopyWith(
          _$AthleteImpl value, $Res Function(_$AthleteImpl) then) =
      __$$AthleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? profilePicture,
      String? country,
      String? sports,
      String? league,
      String? ranking,
      @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson) bool isTracked});
}

/// @nodoc
class __$$AthleteImplCopyWithImpl<$Res>
    extends _$AthleteCopyWithImpl<$Res, _$AthleteImpl>
    implements _$$AthleteImplCopyWith<$Res> {
  __$$AthleteImplCopyWithImpl(
      _$AthleteImpl _value, $Res Function(_$AthleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profilePicture = freezed,
    Object? country = freezed,
    Object? sports = freezed,
    Object? league = freezed,
    Object? ranking = freezed,
    Object? isTracked = null,
  }) {
    return _then(_$AthleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      sports: freezed == sports
          ? _value.sports
          : sports // ignore: cast_nullable_to_non_nullable
              as String?,
      league: freezed == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as String?,
      isTracked: null == isTracked
          ? _value.isTracked
          : isTracked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteImpl implements _Athlete {
  const _$AthleteImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.profilePicture,
      this.country,
      this.sports,
      this.league,
      this.ranking,
      @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
      this.isTracked = false});

  factory _$AthleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? profilePicture;
  @override
  final String? country;
  @override
  final String? sports;
  @override
  final String? league;
  @override
  final String? ranking;

  /// API sends: isTracked: true/false or null
  @override
  @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
  final bool isTracked;

  @override
  String toString() {
    return 'Athlete(id: $id, name: $name, email: $email, profilePicture: $profilePicture, country: $country, sports: $sports, league: $league, ranking: $ranking, isTracked: $isTracked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.sports, sports) || other.sports == sports) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.ranking, ranking) || other.ranking == ranking) &&
            (identical(other.isTracked, isTracked) ||
                other.isTracked == isTracked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, profilePicture,
      country, sports, league, ranking, isTracked);

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteImplCopyWith<_$AthleteImpl> get copyWith =>
      __$$AthleteImplCopyWithImpl<_$AthleteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteImplToJson(
      this,
    );
  }
}

abstract class _Athlete implements Athlete {
  const factory _Athlete(
      {required final String id,
      required final String name,
      required final String email,
      final String? profilePicture,
      final String? country,
      final String? sports,
      final String? league,
      final String? ranking,
      @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
      final bool isTracked}) = _$AthleteImpl;

  factory _Athlete.fromJson(Map<String, dynamic> json) = _$AthleteImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get profilePicture;
  @override
  String? get country;
  @override
  String? get sports;
  @override
  String? get league;
  @override
  String? get ranking;

  /// API sends: isTracked: true/false or null
  @override
  @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
  bool get isTracked;

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteImplCopyWith<_$AthleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  /// API fields
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMore')
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'hasMore') bool hasMore});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int page,
      @JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'hasMore') bool hasMore});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(_$PaginationImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {@JsonKey(name: 'page') this.page = 1,
      @JsonKey(name: 'limit') this.limit = 10,
      @JsonKey(name: 'total') this.total = 0,
      @JsonKey(name: 'totalPages') this.totalPages = 1,
      @JsonKey(name: 'hasMore') this.hasMore = false});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  /// API fields
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'limit')
  final int limit;
  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'hasMore')
  final bool hasMore;

  @override
  String toString() {
    return 'Pagination(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, total, totalPages, hasMore);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {@JsonKey(name: 'page') final int page,
      @JsonKey(name: 'limit') final int limit,
      @JsonKey(name: 'total') final int total,
      @JsonKey(name: 'totalPages') final int totalPages,
      @JsonKey(name: 'hasMore') final bool hasMore}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  /// API fields
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'limit')
  int get limit;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'hasMore')
  bool get hasMore;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

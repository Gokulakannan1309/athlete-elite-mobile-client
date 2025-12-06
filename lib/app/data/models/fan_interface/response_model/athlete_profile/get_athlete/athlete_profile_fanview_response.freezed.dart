// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_profile_fanview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AthleteProfileFanviewResponse _$AthleteProfileFanviewResponseFromJson(
    Map<String, dynamic> json) {
  return _AthleteProfileFanviewResponse.fromJson(json);
}

/// @nodoc
mixin _$AthleteProfileFanviewResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AthleteProfileDataFanview get data => throw _privateConstructorUsedError;

  /// Serializes this AthleteProfileFanviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteProfileFanviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteProfileFanviewResponseCopyWith<AthleteProfileFanviewResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteProfileFanviewResponseCopyWith<$Res> {
  factory $AthleteProfileFanviewResponseCopyWith(
          AthleteProfileFanviewResponse value,
          $Res Function(AthleteProfileFanviewResponse) then) =
      _$AthleteProfileFanviewResponseCopyWithImpl<$Res,
          AthleteProfileFanviewResponse>;
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      AthleteProfileDataFanview data});

  $AthleteProfileDataFanviewCopyWith<$Res> get data;
}

/// @nodoc
class _$AthleteProfileFanviewResponseCopyWithImpl<$Res,
        $Val extends AthleteProfileFanviewResponse>
    implements $AthleteProfileFanviewResponseCopyWith<$Res> {
  _$AthleteProfileFanviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteProfileFanviewResponse
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
              as AthleteProfileDataFanview,
    ) as $Val);
  }

  /// Create a copy of AthleteProfileFanviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteProfileDataFanviewCopyWith<$Res> get data {
    return $AthleteProfileDataFanviewCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthleteProfileFanviewResponseImplCopyWith<$Res>
    implements $AthleteProfileFanviewResponseCopyWith<$Res> {
  factory _$$AthleteProfileFanviewResponseImplCopyWith(
          _$AthleteProfileFanviewResponseImpl value,
          $Res Function(_$AthleteProfileFanviewResponseImpl) then) =
      __$$AthleteProfileFanviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      AthleteProfileDataFanview data});

  @override
  $AthleteProfileDataFanviewCopyWith<$Res> get data;
}

/// @nodoc
class __$$AthleteProfileFanviewResponseImplCopyWithImpl<$Res>
    extends _$AthleteProfileFanviewResponseCopyWithImpl<$Res,
        _$AthleteProfileFanviewResponseImpl>
    implements _$$AthleteProfileFanviewResponseImplCopyWith<$Res> {
  __$$AthleteProfileFanviewResponseImplCopyWithImpl(
      _$AthleteProfileFanviewResponseImpl _value,
      $Res Function(_$AthleteProfileFanviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteProfileFanviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AthleteProfileFanviewResponseImpl(
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
              as AthleteProfileDataFanview,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteProfileFanviewResponseImpl
    implements _AthleteProfileFanviewResponse {
  const _$AthleteProfileFanviewResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$AthleteProfileFanviewResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AthleteProfileFanviewResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final AthleteProfileDataFanview data;

  @override
  String toString() {
    return 'AthleteProfileFanviewResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteProfileFanviewResponseImpl &&
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

  /// Create a copy of AthleteProfileFanviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteProfileFanviewResponseImplCopyWith<
          _$AthleteProfileFanviewResponseImpl>
      get copyWith => __$$AthleteProfileFanviewResponseImplCopyWithImpl<
          _$AthleteProfileFanviewResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteProfileFanviewResponseImplToJson(
      this,
    );
  }
}

abstract class _AthleteProfileFanviewResponse
    implements AthleteProfileFanviewResponse {
  const factory _AthleteProfileFanviewResponse(
          {required final bool status,
          required final int statusCode,
          required final String message,
          required final AthleteProfileDataFanview data}) =
      _$AthleteProfileFanviewResponseImpl;

  factory _AthleteProfileFanviewResponse.fromJson(Map<String, dynamic> json) =
      _$AthleteProfileFanviewResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  AthleteProfileDataFanview get data;

  /// Create a copy of AthleteProfileFanviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteProfileFanviewResponseImplCopyWith<
          _$AthleteProfileFanviewResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AthleteProfileDataFanview _$AthleteProfileDataFanviewFromJson(
    Map<String, dynamic> json) {
  return _AthleteProfileDataFanview.fromJson(json);
}

/// @nodoc
mixin _$AthleteProfileDataFanview {
  AthleteFanview get athlete => throw _privateConstructorUsedError;
  bool get isTracked => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;

  /// Serializes this AthleteProfileDataFanview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteProfileDataFanviewCopyWith<AthleteProfileDataFanview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteProfileDataFanviewCopyWith<$Res> {
  factory $AthleteProfileDataFanviewCopyWith(AthleteProfileDataFanview value,
          $Res Function(AthleteProfileDataFanview) then) =
      _$AthleteProfileDataFanviewCopyWithImpl<$Res, AthleteProfileDataFanview>;
  @useResult
  $Res call({AthleteFanview athlete, bool isTracked, int followerCount});

  $AthleteFanviewCopyWith<$Res> get athlete;
}

/// @nodoc
class _$AthleteProfileDataFanviewCopyWithImpl<$Res,
        $Val extends AthleteProfileDataFanview>
    implements $AthleteProfileDataFanviewCopyWith<$Res> {
  _$AthleteProfileDataFanviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athlete = null,
    Object? isTracked = null,
    Object? followerCount = null,
  }) {
    return _then(_value.copyWith(
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteFanview,
      isTracked: null == isTracked
          ? _value.isTracked
          : isTracked // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteFanviewCopyWith<$Res> get athlete {
    return $AthleteFanviewCopyWith<$Res>(_value.athlete, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthleteProfileDataFanviewImplCopyWith<$Res>
    implements $AthleteProfileDataFanviewCopyWith<$Res> {
  factory _$$AthleteProfileDataFanviewImplCopyWith(
          _$AthleteProfileDataFanviewImpl value,
          $Res Function(_$AthleteProfileDataFanviewImpl) then) =
      __$$AthleteProfileDataFanviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AthleteFanview athlete, bool isTracked, int followerCount});

  @override
  $AthleteFanviewCopyWith<$Res> get athlete;
}

/// @nodoc
class __$$AthleteProfileDataFanviewImplCopyWithImpl<$Res>
    extends _$AthleteProfileDataFanviewCopyWithImpl<$Res,
        _$AthleteProfileDataFanviewImpl>
    implements _$$AthleteProfileDataFanviewImplCopyWith<$Res> {
  __$$AthleteProfileDataFanviewImplCopyWithImpl(
      _$AthleteProfileDataFanviewImpl _value,
      $Res Function(_$AthleteProfileDataFanviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athlete = null,
    Object? isTracked = null,
    Object? followerCount = null,
  }) {
    return _then(_$AthleteProfileDataFanviewImpl(
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteFanview,
      isTracked: null == isTracked
          ? _value.isTracked
          : isTracked // ignore: cast_nullable_to_non_nullable
              as bool,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteProfileDataFanviewImpl implements _AthleteProfileDataFanview {
  const _$AthleteProfileDataFanviewImpl(
      {required this.athlete,
      required this.isTracked,
      required this.followerCount});

  factory _$AthleteProfileDataFanviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteProfileDataFanviewImplFromJson(json);

  @override
  final AthleteFanview athlete;
  @override
  final bool isTracked;
  @override
  final int followerCount;

  @override
  String toString() {
    return 'AthleteProfileDataFanview(athlete: $athlete, isTracked: $isTracked, followerCount: $followerCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteProfileDataFanviewImpl &&
            (identical(other.athlete, athlete) || other.athlete == athlete) &&
            (identical(other.isTracked, isTracked) ||
                other.isTracked == isTracked) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, athlete, isTracked, followerCount);

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteProfileDataFanviewImplCopyWith<_$AthleteProfileDataFanviewImpl>
      get copyWith => __$$AthleteProfileDataFanviewImplCopyWithImpl<
          _$AthleteProfileDataFanviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteProfileDataFanviewImplToJson(
      this,
    );
  }
}

abstract class _AthleteProfileDataFanview implements AthleteProfileDataFanview {
  const factory _AthleteProfileDataFanview(
      {required final AthleteFanview athlete,
      required final bool isTracked,
      required final int followerCount}) = _$AthleteProfileDataFanviewImpl;

  factory _AthleteProfileDataFanview.fromJson(Map<String, dynamic> json) =
      _$AthleteProfileDataFanviewImpl.fromJson;

  @override
  AthleteFanview get athlete;
  @override
  bool get isTracked;
  @override
  int get followerCount;

  /// Create a copy of AthleteProfileDataFanview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteProfileDataFanviewImplCopyWith<_$AthleteProfileDataFanviewImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AthleteFanview _$AthleteFanviewFromJson(Map<String, dynamic> json) {
  return _AthleteFanview.fromJson(json);
}

/// @nodoc
mixin _$AthleteFanview {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "profilePicture")
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get sports => throw _privateConstructorUsedError;
  String? get league => throw _privateConstructorUsedError;
  String? get ranking => throw _privateConstructorUsedError;

  /// Serializes this AthleteFanview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteFanview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteFanviewCopyWith<AthleteFanview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteFanviewCopyWith<$Res> {
  factory $AthleteFanviewCopyWith(
          AthleteFanview value, $Res Function(AthleteFanview) then) =
      _$AthleteFanviewCopyWithImpl<$Res, AthleteFanview>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "profilePicture") String? profilePicture,
      String? bio,
      String? country,
      String? sports,
      String? league,
      String? ranking});
}

/// @nodoc
class _$AthleteFanviewCopyWithImpl<$Res, $Val extends AthleteFanview>
    implements $AthleteFanviewCopyWith<$Res> {
  _$AthleteFanviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteFanview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = freezed,
    Object? bio = freezed,
    Object? country = freezed,
    Object? sports = freezed,
    Object? league = freezed,
    Object? ranking = freezed,
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
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AthleteFanviewImplCopyWith<$Res>
    implements $AthleteFanviewCopyWith<$Res> {
  factory _$$AthleteFanviewImplCopyWith(_$AthleteFanviewImpl value,
          $Res Function(_$AthleteFanviewImpl) then) =
      __$$AthleteFanviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "profilePicture") String? profilePicture,
      String? bio,
      String? country,
      String? sports,
      String? league,
      String? ranking});
}

/// @nodoc
class __$$AthleteFanviewImplCopyWithImpl<$Res>
    extends _$AthleteFanviewCopyWithImpl<$Res, _$AthleteFanviewImpl>
    implements _$$AthleteFanviewImplCopyWith<$Res> {
  __$$AthleteFanviewImplCopyWithImpl(
      _$AthleteFanviewImpl _value, $Res Function(_$AthleteFanviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteFanview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = freezed,
    Object? bio = freezed,
    Object? country = freezed,
    Object? sports = freezed,
    Object? league = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_$AthleteFanviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteFanviewImpl implements _AthleteFanview {
  const _$AthleteFanviewImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "profilePicture") this.profilePicture,
      required this.bio,
      required this.country,
      required this.sports,
      required this.league,
      required this.ranking});

  factory _$AthleteFanviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteFanviewImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: "profilePicture")
  final String? profilePicture;
  @override
  final String? bio;
  @override
  final String? country;
  @override
  final String? sports;
  @override
  final String? league;
  @override
  final String? ranking;

  @override
  String toString() {
    return 'AthleteFanview(id: $id, name: $name, profilePicture: $profilePicture, bio: $bio, country: $country, sports: $sports, league: $league, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteFanviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.sports, sports) || other.sports == sports) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture, bio,
      country, sports, league, ranking);

  /// Create a copy of AthleteFanview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteFanviewImplCopyWith<_$AthleteFanviewImpl> get copyWith =>
      __$$AthleteFanviewImplCopyWithImpl<_$AthleteFanviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteFanviewImplToJson(
      this,
    );
  }
}

abstract class _AthleteFanview implements AthleteFanview {
  const factory _AthleteFanview(
      {required final String id,
      required final String name,
      @JsonKey(name: "profilePicture") final String? profilePicture,
      required final String? bio,
      required final String? country,
      required final String? sports,
      required final String? league,
      required final String? ranking}) = _$AthleteFanviewImpl;

  factory _AthleteFanview.fromJson(Map<String, dynamic> json) =
      _$AthleteFanviewImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "profilePicture")
  String? get profilePicture;
  @override
  String? get bio;
  @override
  String? get country;
  @override
  String? get sports;
  @override
  String? get league;
  @override
  String? get ranking;

  /// Create a copy of AthleteFanview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteFanviewImplCopyWith<_$AthleteFanviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athletes_response_fan_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AthletesResponseFanView _$AthletesResponseFanViewFromJson(
    Map<String, dynamic> json) {
  return _AthletesResponseFanView.fromJson(json);
}

/// @nodoc
mixin _$AthletesResponseFanView {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AthletesDataFanView get data => throw _privateConstructorUsedError;

  /// Serializes this AthletesResponseFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthletesResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthletesResponseFanViewCopyWith<AthletesResponseFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthletesResponseFanViewCopyWith<$Res> {
  factory $AthletesResponseFanViewCopyWith(AthletesResponseFanView value,
          $Res Function(AthletesResponseFanView) then) =
      _$AthletesResponseFanViewCopyWithImpl<$Res, AthletesResponseFanView>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, AthletesDataFanView data});

  $AthletesDataFanViewCopyWith<$Res> get data;
}

/// @nodoc
class _$AthletesResponseFanViewCopyWithImpl<$Res,
        $Val extends AthletesResponseFanView>
    implements $AthletesResponseFanViewCopyWith<$Res> {
  _$AthletesResponseFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthletesResponseFanView
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
              as AthletesDataFanView,
    ) as $Val);
  }

  /// Create a copy of AthletesResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthletesDataFanViewCopyWith<$Res> get data {
    return $AthletesDataFanViewCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthletesResponseFanViewImplCopyWith<$Res>
    implements $AthletesResponseFanViewCopyWith<$Res> {
  factory _$$AthletesResponseFanViewImplCopyWith(
          _$AthletesResponseFanViewImpl value,
          $Res Function(_$AthletesResponseFanViewImpl) then) =
      __$$AthletesResponseFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, AthletesDataFanView data});

  @override
  $AthletesDataFanViewCopyWith<$Res> get data;
}

/// @nodoc
class __$$AthletesResponseFanViewImplCopyWithImpl<$Res>
    extends _$AthletesResponseFanViewCopyWithImpl<$Res,
        _$AthletesResponseFanViewImpl>
    implements _$$AthletesResponseFanViewImplCopyWith<$Res> {
  __$$AthletesResponseFanViewImplCopyWithImpl(
      _$AthletesResponseFanViewImpl _value,
      $Res Function(_$AthletesResponseFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthletesResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$AthletesResponseFanViewImpl(
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
              as AthletesDataFanView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthletesResponseFanViewImpl implements _AthletesResponseFanView {
  const _$AthletesResponseFanViewImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$AthletesResponseFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthletesResponseFanViewImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final AthletesDataFanView data;

  @override
  String toString() {
    return 'AthletesResponseFanView(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthletesResponseFanViewImpl &&
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

  /// Create a copy of AthletesResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthletesResponseFanViewImplCopyWith<_$AthletesResponseFanViewImpl>
      get copyWith => __$$AthletesResponseFanViewImplCopyWithImpl<
          _$AthletesResponseFanViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthletesResponseFanViewImplToJson(
      this,
    );
  }
}

abstract class _AthletesResponseFanView implements AthletesResponseFanView {
  const factory _AthletesResponseFanView(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final AthletesDataFanView data}) = _$AthletesResponseFanViewImpl;

  factory _AthletesResponseFanView.fromJson(Map<String, dynamic> json) =
      _$AthletesResponseFanViewImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  AthletesDataFanView get data;

  /// Create a copy of AthletesResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthletesResponseFanViewImplCopyWith<_$AthletesResponseFanViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AthletesDataFanView _$AthletesDataFanViewFromJson(Map<String, dynamic> json) {
  return _AthletesDataFanView.fromJson(json);
}

/// @nodoc
mixin _$AthletesDataFanView {
  List<AthleteFanView> get formatted => throw _privateConstructorUsedError;
  PaginationFanView get pagination => throw _privateConstructorUsedError;

  /// Serializes this AthletesDataFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthletesDataFanViewCopyWith<AthletesDataFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthletesDataFanViewCopyWith<$Res> {
  factory $AthletesDataFanViewCopyWith(
          AthletesDataFanView value, $Res Function(AthletesDataFanView) then) =
      _$AthletesDataFanViewCopyWithImpl<$Res, AthletesDataFanView>;
  @useResult
  $Res call({List<AthleteFanView> formatted, PaginationFanView pagination});

  $PaginationFanViewCopyWith<$Res> get pagination;
}

/// @nodoc
class _$AthletesDataFanViewCopyWithImpl<$Res, $Val extends AthletesDataFanView>
    implements $AthletesDataFanViewCopyWith<$Res> {
  _$AthletesDataFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formatted = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      formatted: null == formatted
          ? _value.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as List<AthleteFanView>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationFanView,
    ) as $Val);
  }

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationFanViewCopyWith<$Res> get pagination {
    return $PaginationFanViewCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AthletesDataFanViewImplCopyWith<$Res>
    implements $AthletesDataFanViewCopyWith<$Res> {
  factory _$$AthletesDataFanViewImplCopyWith(_$AthletesDataFanViewImpl value,
          $Res Function(_$AthletesDataFanViewImpl) then) =
      __$$AthletesDataFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AthleteFanView> formatted, PaginationFanView pagination});

  @override
  $PaginationFanViewCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$AthletesDataFanViewImplCopyWithImpl<$Res>
    extends _$AthletesDataFanViewCopyWithImpl<$Res, _$AthletesDataFanViewImpl>
    implements _$$AthletesDataFanViewImplCopyWith<$Res> {
  __$$AthletesDataFanViewImplCopyWithImpl(_$AthletesDataFanViewImpl _value,
      $Res Function(_$AthletesDataFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formatted = null,
    Object? pagination = null,
  }) {
    return _then(_$AthletesDataFanViewImpl(
      formatted: null == formatted
          ? _value._formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as List<AthleteFanView>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationFanView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthletesDataFanViewImpl implements _AthletesDataFanView {
  const _$AthletesDataFanViewImpl(
      {required final List<AthleteFanView> formatted, required this.pagination})
      : _formatted = formatted;

  factory _$AthletesDataFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthletesDataFanViewImplFromJson(json);

  final List<AthleteFanView> _formatted;
  @override
  List<AthleteFanView> get formatted {
    if (_formatted is EqualUnmodifiableListView) return _formatted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formatted);
  }

  @override
  final PaginationFanView pagination;

  @override
  String toString() {
    return 'AthletesDataFanView(formatted: $formatted, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthletesDataFanViewImpl &&
            const DeepCollectionEquality()
                .equals(other._formatted, _formatted) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_formatted), pagination);

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthletesDataFanViewImplCopyWith<_$AthletesDataFanViewImpl> get copyWith =>
      __$$AthletesDataFanViewImplCopyWithImpl<_$AthletesDataFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthletesDataFanViewImplToJson(
      this,
    );
  }
}

abstract class _AthletesDataFanView implements AthletesDataFanView {
  const factory _AthletesDataFanView(
      {required final List<AthleteFanView> formatted,
      required final PaginationFanView pagination}) = _$AthletesDataFanViewImpl;

  factory _AthletesDataFanView.fromJson(Map<String, dynamic> json) =
      _$AthletesDataFanViewImpl.fromJson;

  @override
  List<AthleteFanView> get formatted;
  @override
  PaginationFanView get pagination;

  /// Create a copy of AthletesDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthletesDataFanViewImplCopyWith<_$AthletesDataFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AthleteFanView _$AthleteFanViewFromJson(Map<String, dynamic> json) {
  return _AthleteFanView.fromJson(json);
}

/// @nodoc
mixin _$AthleteFanView {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get sports => throw _privateConstructorUsedError;
  String? get league => throw _privateConstructorUsedError;
  String? get ranking => throw _privateConstructorUsedError;

  /// Serializes this AthleteFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteFanViewCopyWith<AthleteFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteFanViewCopyWith<$Res> {
  factory $AthleteFanViewCopyWith(
          AthleteFanView value, $Res Function(AthleteFanView) then) =
      _$AthleteFanViewCopyWithImpl<$Res, AthleteFanView>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? email,
      String? profilePicture,
      String? country,
      String? sports,
      String? league,
      String? ranking});
}

/// @nodoc
class _$AthleteFanViewCopyWithImpl<$Res, $Val extends AthleteFanView>
    implements $AthleteFanViewCopyWith<$Res> {
  _$AthleteFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? profilePicture = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AthleteFanViewImplCopyWith<$Res>
    implements $AthleteFanViewCopyWith<$Res> {
  factory _$$AthleteFanViewImplCopyWith(_$AthleteFanViewImpl value,
          $Res Function(_$AthleteFanViewImpl) then) =
      __$$AthleteFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? email,
      String? profilePicture,
      String? country,
      String? sports,
      String? league,
      String? ranking});
}

/// @nodoc
class __$$AthleteFanViewImplCopyWithImpl<$Res>
    extends _$AthleteFanViewCopyWithImpl<$Res, _$AthleteFanViewImpl>
    implements _$$AthleteFanViewImplCopyWith<$Res> {
  __$$AthleteFanViewImplCopyWithImpl(
      _$AthleteFanViewImpl _value, $Res Function(_$AthleteFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = freezed,
    Object? profilePicture = freezed,
    Object? country = freezed,
    Object? sports = freezed,
    Object? league = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_$AthleteFanViewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteFanViewImpl implements _AthleteFanView {
  const _$AthleteFanViewImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.profilePicture,
      required this.country,
      required this.sports,
      required this.league,
      required this.ranking});

  factory _$AthleteFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteFanViewImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? email;
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

  @override
  String toString() {
    return 'AthleteFanView(id: $id, name: $name, email: $email, profilePicture: $profilePicture, country: $country, sports: $sports, league: $league, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteFanViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.sports, sports) || other.sports == sports) &&
            (identical(other.league, league) || other.league == league) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, profilePicture,
      country, sports, league, ranking);

  /// Create a copy of AthleteFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteFanViewImplCopyWith<_$AthleteFanViewImpl> get copyWith =>
      __$$AthleteFanViewImplCopyWithImpl<_$AthleteFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteFanViewImplToJson(
      this,
    );
  }
}

abstract class _AthleteFanView implements AthleteFanView {
  const factory _AthleteFanView(
      {required final String id,
      required final String? name,
      required final String? email,
      required final String? profilePicture,
      required final String? country,
      required final String? sports,
      required final String? league,
      required final String? ranking}) = _$AthleteFanViewImpl;

  factory _AthleteFanView.fromJson(Map<String, dynamic> json) =
      _$AthleteFanViewImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get email;
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

  /// Create a copy of AthleteFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteFanViewImplCopyWith<_$AthleteFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationFanView _$PaginationFanViewFromJson(Map<String, dynamic> json) {
  return _PaginationFanView.fromJson(json);
}

/// @nodoc
mixin _$PaginationFanView {
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this PaginationFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationFanViewCopyWith<PaginationFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationFanViewCopyWith<$Res> {
  factory $PaginationFanViewCopyWith(
          PaginationFanView value, $Res Function(PaginationFanView) then) =
      _$PaginationFanViewCopyWithImpl<$Res, PaginationFanView>;
  @useResult
  $Res call({int totalCount, int totalPages, int currentPage, int limit});
}

/// @nodoc
class _$PaginationFanViewCopyWithImpl<$Res, $Val extends PaginationFanView>
    implements $PaginationFanViewCopyWith<$Res> {
  _$PaginationFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationFanViewImplCopyWith<$Res>
    implements $PaginationFanViewCopyWith<$Res> {
  factory _$$PaginationFanViewImplCopyWith(_$PaginationFanViewImpl value,
          $Res Function(_$PaginationFanViewImpl) then) =
      __$$PaginationFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, int totalPages, int currentPage, int limit});
}

/// @nodoc
class __$$PaginationFanViewImplCopyWithImpl<$Res>
    extends _$PaginationFanViewCopyWithImpl<$Res, _$PaginationFanViewImpl>
    implements _$$PaginationFanViewImplCopyWith<$Res> {
  __$$PaginationFanViewImplCopyWithImpl(_$PaginationFanViewImpl _value,
      $Res Function(_$PaginationFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? limit = null,
  }) {
    return _then(_$PaginationFanViewImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationFanViewImpl implements _PaginationFanView {
  const _$PaginationFanViewImpl(
      {required this.totalCount,
      required this.totalPages,
      required this.currentPage,
      required this.limit});

  factory _$PaginationFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationFanViewImplFromJson(json);

  @override
  final int totalCount;
  @override
  final int totalPages;
  @override
  final int currentPage;
  @override
  final int limit;

  @override
  String toString() {
    return 'PaginationFanView(totalCount: $totalCount, totalPages: $totalPages, currentPage: $currentPage, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationFanViewImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCount, totalPages, currentPage, limit);

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationFanViewImplCopyWith<_$PaginationFanViewImpl> get copyWith =>
      __$$PaginationFanViewImplCopyWithImpl<_$PaginationFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationFanViewImplToJson(
      this,
    );
  }
}

abstract class _PaginationFanView implements PaginationFanView {
  const factory _PaginationFanView(
      {required final int totalCount,
      required final int totalPages,
      required final int currentPage,
      required final int limit}) = _$PaginationFanViewImpl;

  factory _PaginationFanView.fromJson(Map<String, dynamic> json) =
      _$PaginationFanViewImpl.fromJson;

  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  int get currentPage;
  @override
  int get limit;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationFanViewImplCopyWith<_$PaginationFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

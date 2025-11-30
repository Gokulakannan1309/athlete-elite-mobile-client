// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_login_requested.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AthleteLoginRequested _$AthleteLoginRequestedFromJson(
    Map<String, dynamic> json) {
  return _AthleteLoginRequested.fromJson(json);
}

/// @nodoc
mixin _$AthleteLoginRequested {
  String get identifier => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this AthleteLoginRequested to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteLoginRequested
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteLoginRequestedCopyWith<AthleteLoginRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteLoginRequestedCopyWith<$Res> {
  factory $AthleteLoginRequestedCopyWith(AthleteLoginRequested value,
          $Res Function(AthleteLoginRequested) then) =
      _$AthleteLoginRequestedCopyWithImpl<$Res, AthleteLoginRequested>;
  @useResult
  $Res call({String identifier, String password});
}

/// @nodoc
class _$AthleteLoginRequestedCopyWithImpl<$Res,
        $Val extends AthleteLoginRequested>
    implements $AthleteLoginRequestedCopyWith<$Res> {
  _$AthleteLoginRequestedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteLoginRequested
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AthleteLoginRequestedImplCopyWith<$Res>
    implements $AthleteLoginRequestedCopyWith<$Res> {
  factory _$$AthleteLoginRequestedImplCopyWith(
          _$AthleteLoginRequestedImpl value,
          $Res Function(_$AthleteLoginRequestedImpl) then) =
      __$$AthleteLoginRequestedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, String password});
}

/// @nodoc
class __$$AthleteLoginRequestedImplCopyWithImpl<$Res>
    extends _$AthleteLoginRequestedCopyWithImpl<$Res,
        _$AthleteLoginRequestedImpl>
    implements _$$AthleteLoginRequestedImplCopyWith<$Res> {
  __$$AthleteLoginRequestedImplCopyWithImpl(_$AthleteLoginRequestedImpl _value,
      $Res Function(_$AthleteLoginRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteLoginRequested
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? password = null,
  }) {
    return _then(_$AthleteLoginRequestedImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteLoginRequestedImpl implements _AthleteLoginRequested {
  const _$AthleteLoginRequestedImpl(
      {required this.identifier, required this.password});

  factory _$AthleteLoginRequestedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteLoginRequestedImplFromJson(json);

  @override
  final String identifier;
  @override
  final String password;

  @override
  String toString() {
    return 'AthleteLoginRequested(identifier: $identifier, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteLoginRequestedImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, identifier, password);

  /// Create a copy of AthleteLoginRequested
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteLoginRequestedImplCopyWith<_$AthleteLoginRequestedImpl>
      get copyWith => __$$AthleteLoginRequestedImplCopyWithImpl<
          _$AthleteLoginRequestedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteLoginRequestedImplToJson(
      this,
    );
  }
}

abstract class _AthleteLoginRequested implements AthleteLoginRequested {
  const factory _AthleteLoginRequested(
      {required final String identifier,
      required final String password}) = _$AthleteLoginRequestedImpl;

  factory _AthleteLoginRequested.fromJson(Map<String, dynamic> json) =
      _$AthleteLoginRequestedImpl.fromJson;

  @override
  String get identifier;
  @override
  String get password;

  /// Create a copy of AthleteLoginRequested
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteLoginRequestedImplCopyWith<_$AthleteLoginRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

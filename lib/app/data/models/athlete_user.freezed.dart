// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'athlete_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AthleteUser _$AthleteUserFromJson(Map<String, dynamic> json) {
  return _AthleteUser.fromJson(json);
}

/// @nodoc
mixin _$AthleteUser {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email =>
      throw _privateConstructorUsedError; // @HiveField(2) required String userName,
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String get role => throw _privateConstructorUsedError;
  @HiveField(4)
  String get status => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get firstTimeLogin => throw _privateConstructorUsedError;

  /// Serializes this AthleteUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteUserCopyWith<AthleteUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteUserCopyWith<$Res> {
  factory $AthleteUserCopyWith(
          AthleteUser value, $Res Function(AthleteUser) then) =
      _$AthleteUserCopyWithImpl<$Res, AthleteUser>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String name,
      @HiveField(3) String role,
      @HiveField(4) String status,
      @HiveField(5) bool firstTimeLogin});
}

/// @nodoc
class _$AthleteUserCopyWithImpl<$Res, $Val extends AthleteUser>
    implements $AthleteUserCopyWith<$Res> {
  _$AthleteUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
    Object? firstTimeLogin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      firstTimeLogin: null == firstTimeLogin
          ? _value.firstTimeLogin
          : firstTimeLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AthleteUserImplCopyWith<$Res>
    implements $AthleteUserCopyWith<$Res> {
  factory _$$AthleteUserImplCopyWith(
          _$AthleteUserImpl value, $Res Function(_$AthleteUserImpl) then) =
      __$$AthleteUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String name,
      @HiveField(3) String role,
      @HiveField(4) String status,
      @HiveField(5) bool firstTimeLogin});
}

/// @nodoc
class __$$AthleteUserImplCopyWithImpl<$Res>
    extends _$AthleteUserCopyWithImpl<$Res, _$AthleteUserImpl>
    implements _$$AthleteUserImplCopyWith<$Res> {
  __$$AthleteUserImplCopyWithImpl(
      _$AthleteUserImpl _value, $Res Function(_$AthleteUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
    Object? firstTimeLogin = null,
  }) {
    return _then(_$AthleteUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      firstTimeLogin: null == firstTimeLogin
          ? _value.firstTimeLogin
          : firstTimeLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteUserImpl implements _AthleteUser {
  const _$AthleteUserImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.name,
      @HiveField(3) required this.role,
      @HiveField(4) required this.status,
      @HiveField(5) this.firstTimeLogin = false});

  factory _$AthleteUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteUserImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
// @HiveField(2) required String userName,
  @override
  @HiveField(2)
  final String name;
  @override
  @HiveField(3)
  final String role;
  @override
  @HiveField(4)
  final String status;
  @override
  @JsonKey()
  @HiveField(5)
  final bool firstTimeLogin;

  @override
  String toString() {
    return 'AthleteUser(id: $id, email: $email, name: $name, role: $role, status: $status, firstTimeLogin: $firstTimeLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstTimeLogin, firstTimeLogin) ||
                other.firstTimeLogin == firstTimeLogin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, role, status, firstTimeLogin);

  /// Create a copy of AthleteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteUserImplCopyWith<_$AthleteUserImpl> get copyWith =>
      __$$AthleteUserImplCopyWithImpl<_$AthleteUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteUserImplToJson(
      this,
    );
  }
}

abstract class _AthleteUser implements AthleteUser {
  const factory _AthleteUser(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String name,
      @HiveField(3) required final String role,
      @HiveField(4) required final String status,
      @HiveField(5) final bool firstTimeLogin}) = _$AthleteUserImpl;

  factory _AthleteUser.fromJson(Map<String, dynamic> json) =
      _$AthleteUserImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email; // @HiveField(2) required String userName,
  @override
  @HiveField(2)
  String get name;
  @override
  @HiveField(3)
  String get role;
  @override
  @HiveField(4)
  String get status;
  @override
  @HiveField(5)
  bool get firstTimeLogin;

  /// Create a copy of AthleteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteUserImplCopyWith<_$AthleteUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fan_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FanUserModel _$FanUserModelFromJson(Map<String, dynamic> json) {
  return _FanUserModel.fromJson(json);
}

/// @nodoc
mixin _$FanUserModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String get role => throw _privateConstructorUsedError;
  @HiveField(5)
  String get status => throw _privateConstructorUsedError;

  /// Serializes this FanUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FanUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FanUserModelCopyWith<FanUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FanUserModelCopyWith<$Res> {
  factory $FanUserModelCopyWith(
          FanUserModel value, $Res Function(FanUserModel) then) =
      _$FanUserModelCopyWithImpl<$Res, FanUserModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String userName,
      @HiveField(3) String name,
      @HiveField(4) String role,
      @HiveField(5) String status});
}

/// @nodoc
class _$FanUserModelCopyWithImpl<$Res, $Val extends FanUserModel>
    implements $FanUserModelCopyWith<$Res> {
  _$FanUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FanUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
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
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FanUserModelImplCopyWith<$Res>
    implements $FanUserModelCopyWith<$Res> {
  factory _$$FanUserModelImplCopyWith(
          _$FanUserModelImpl value, $Res Function(_$FanUserModelImpl) then) =
      __$$FanUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String userName,
      @HiveField(3) String name,
      @HiveField(4) String role,
      @HiveField(5) String status});
}

/// @nodoc
class __$$FanUserModelImplCopyWithImpl<$Res>
    extends _$FanUserModelCopyWithImpl<$Res, _$FanUserModelImpl>
    implements _$$FanUserModelImplCopyWith<$Res> {
  __$$FanUserModelImplCopyWithImpl(
      _$FanUserModelImpl _value, $Res Function(_$FanUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FanUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? userName = null,
    Object? name = null,
    Object? role = null,
    Object? status = null,
  }) {
    return _then(_$FanUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FanUserModelImpl implements _FanUserModel {
  const _$FanUserModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.userName,
      @HiveField(3) required this.name,
      @HiveField(4) required this.role,
      @HiveField(5) required this.status});

  factory _$FanUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FanUserModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String userName;
  @override
  @HiveField(3)
  final String name;
  @override
  @HiveField(4)
  final String role;
  @override
  @HiveField(5)
  final String status;

  @override
  String toString() {
    return 'FanUserModel(id: $id, email: $email, userName: $userName, name: $name, role: $role, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FanUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, userName, name, role, status);

  /// Create a copy of FanUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FanUserModelImplCopyWith<_$FanUserModelImpl> get copyWith =>
      __$$FanUserModelImplCopyWithImpl<_$FanUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FanUserModelImplToJson(
      this,
    );
  }
}

abstract class _FanUserModel implements FanUserModel {
  const factory _FanUserModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String userName,
      @HiveField(3) required final String name,
      @HiveField(4) required final String role,
      @HiveField(5) required final String status}) = _$FanUserModelImpl;

  factory _FanUserModel.fromJson(Map<String, dynamic> json) =
      _$FanUserModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get userName;
  @override
  @HiveField(3)
  String get name;
  @override
  @HiveField(4)
  String get role;
  @override
  @HiveField(5)
  String get status;

  /// Create a copy of FanUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FanUserModelImplCopyWith<_$FanUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

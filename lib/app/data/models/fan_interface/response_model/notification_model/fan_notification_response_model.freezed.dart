// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fan_notification_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FanNotificationResponseModel _$FanNotificationResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FanNotificationResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FanNotificationResponseModel {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FanNotificationData get data => throw _privateConstructorUsedError;

  /// Serializes this FanNotificationResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FanNotificationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FanNotificationResponseModelCopyWith<FanNotificationResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FanNotificationResponseModelCopyWith<$Res> {
  factory $FanNotificationResponseModelCopyWith(
          FanNotificationResponseModel value,
          $Res Function(FanNotificationResponseModel) then) =
      _$FanNotificationResponseModelCopyWithImpl<$Res,
          FanNotificationResponseModel>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, FanNotificationData data});

  $FanNotificationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$FanNotificationResponseModelCopyWithImpl<$Res,
        $Val extends FanNotificationResponseModel>
    implements $FanNotificationResponseModelCopyWith<$Res> {
  _$FanNotificationResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FanNotificationResponseModel
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
              as FanNotificationData,
    ) as $Val);
  }

  /// Create a copy of FanNotificationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FanNotificationDataCopyWith<$Res> get data {
    return $FanNotificationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FanNotificationResponseModelImplCopyWith<$Res>
    implements $FanNotificationResponseModelCopyWith<$Res> {
  factory _$$FanNotificationResponseModelImplCopyWith(
          _$FanNotificationResponseModelImpl value,
          $Res Function(_$FanNotificationResponseModelImpl) then) =
      __$$FanNotificationResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, FanNotificationData data});

  @override
  $FanNotificationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$FanNotificationResponseModelImplCopyWithImpl<$Res>
    extends _$FanNotificationResponseModelCopyWithImpl<$Res,
        _$FanNotificationResponseModelImpl>
    implements _$$FanNotificationResponseModelImplCopyWith<$Res> {
  __$$FanNotificationResponseModelImplCopyWithImpl(
      _$FanNotificationResponseModelImpl _value,
      $Res Function(_$FanNotificationResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FanNotificationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$FanNotificationResponseModelImpl(
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
              as FanNotificationData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FanNotificationResponseModelImpl
    implements _FanNotificationResponseModel {
  const _$FanNotificationResponseModelImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$FanNotificationResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FanNotificationResponseModelImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final FanNotificationData data;

  @override
  String toString() {
    return 'FanNotificationResponseModel(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FanNotificationResponseModelImpl &&
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

  /// Create a copy of FanNotificationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FanNotificationResponseModelImplCopyWith<
          _$FanNotificationResponseModelImpl>
      get copyWith => __$$FanNotificationResponseModelImplCopyWithImpl<
          _$FanNotificationResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FanNotificationResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FanNotificationResponseModel
    implements FanNotificationResponseModel {
  const factory _FanNotificationResponseModel(
          {required final bool status,
          required final int statusCode,
          required final String message,
          required final FanNotificationData data}) =
      _$FanNotificationResponseModelImpl;

  factory _FanNotificationResponseModel.fromJson(Map<String, dynamic> json) =
      _$FanNotificationResponseModelImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  FanNotificationData get data;

  /// Create a copy of FanNotificationResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FanNotificationResponseModelImplCopyWith<
          _$FanNotificationResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FanNotificationData _$FanNotificationDataFromJson(Map<String, dynamic> json) {
  return _FanNotificationData.fromJson(json);
}

/// @nodoc
mixin _$FanNotificationData {
  String? get message => throw _privateConstructorUsedError;
  List<FanNotificationItem> get notifications =>
      throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this FanNotificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FanNotificationDataCopyWith<FanNotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FanNotificationDataCopyWith<$Res> {
  factory $FanNotificationDataCopyWith(
          FanNotificationData value, $Res Function(FanNotificationData) then) =
      _$FanNotificationDataCopyWithImpl<$Res, FanNotificationData>;
  @useResult
  $Res call(
      {String? message,
      List<FanNotificationItem> notifications,
      Pagination? pagination,
      int unreadCount});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$FanNotificationDataCopyWithImpl<$Res, $Val extends FanNotificationData>
    implements $FanNotificationDataCopyWith<$Res> {
  _$FanNotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? notifications = null,
    Object? pagination = freezed,
    Object? unreadCount = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<FanNotificationItem>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FanNotificationDataImplCopyWith<$Res>
    implements $FanNotificationDataCopyWith<$Res> {
  factory _$$FanNotificationDataImplCopyWith(_$FanNotificationDataImpl value,
          $Res Function(_$FanNotificationDataImpl) then) =
      __$$FanNotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      List<FanNotificationItem> notifications,
      Pagination? pagination,
      int unreadCount});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$FanNotificationDataImplCopyWithImpl<$Res>
    extends _$FanNotificationDataCopyWithImpl<$Res, _$FanNotificationDataImpl>
    implements _$$FanNotificationDataImplCopyWith<$Res> {
  __$$FanNotificationDataImplCopyWithImpl(_$FanNotificationDataImpl _value,
      $Res Function(_$FanNotificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? notifications = null,
    Object? pagination = freezed,
    Object? unreadCount = null,
  }) {
    return _then(_$FanNotificationDataImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<FanNotificationItem>,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FanNotificationDataImpl implements _FanNotificationData {
  const _$FanNotificationDataImpl(
      {this.message,
      final List<FanNotificationItem> notifications = const [],
      this.pagination,
      this.unreadCount = 0})
      : _notifications = notifications;

  factory _$FanNotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FanNotificationDataImplFromJson(json);

  @override
  final String? message;
  final List<FanNotificationItem> _notifications;
  @override
  @JsonKey()
  List<FanNotificationItem> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final Pagination? pagination;
  @override
  @JsonKey()
  final int unreadCount;

  @override
  String toString() {
    return 'FanNotificationData(message: $message, notifications: $notifications, pagination: $pagination, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FanNotificationDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(_notifications),
      pagination,
      unreadCount);

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FanNotificationDataImplCopyWith<_$FanNotificationDataImpl> get copyWith =>
      __$$FanNotificationDataImplCopyWithImpl<_$FanNotificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FanNotificationDataImplToJson(
      this,
    );
  }
}

abstract class _FanNotificationData implements FanNotificationData {
  const factory _FanNotificationData(
      {final String? message,
      final List<FanNotificationItem> notifications,
      final Pagination? pagination,
      final int unreadCount}) = _$FanNotificationDataImpl;

  factory _FanNotificationData.fromJson(Map<String, dynamic> json) =
      _$FanNotificationDataImpl.fromJson;

  @override
  String? get message;
  @override
  List<FanNotificationItem> get notifications;
  @override
  Pagination? get pagination;
  @override
  int get unreadCount;

  /// Create a copy of FanNotificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FanNotificationDataImplCopyWith<_$FanNotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FanNotificationItem _$FanNotificationItemFromJson(Map<String, dynamic> json) {
  return _FanNotificationItem.fromJson(json);
}

/// @nodoc
mixin _$FanNotificationItem {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  Actor? get actor => throw _privateConstructorUsedError;
  Athlete? get athlete => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;

  /// Serializes this FanNotificationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FanNotificationItemCopyWith<FanNotificationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FanNotificationItemCopyWith<$Res> {
  factory $FanNotificationItemCopyWith(
          FanNotificationItem value, $Res Function(FanNotificationItem) then) =
      _$FanNotificationItemCopyWithImpl<$Res, FanNotificationItem>;
  @useResult
  $Res call(
      {String id,
      String type,
      String message,
      bool isRead,
      String? createdAt,
      Actor? actor,
      Athlete? athlete,
      Channel? channel});

  $ActorCopyWith<$Res>? get actor;
  $AthleteCopyWith<$Res>? get athlete;
  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class _$FanNotificationItemCopyWithImpl<$Res, $Val extends FanNotificationItem>
    implements $FanNotificationItemCopyWith<$Res> {
  _$FanNotificationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? message = null,
    Object? isRead = null,
    Object? createdAt = freezed,
    Object? actor = freezed,
    Object? athlete = freezed,
    Object? channel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as Actor?,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as Athlete?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
    ) as $Val);
  }

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $ActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteCopyWith<$Res>? get athlete {
    if (_value.athlete == null) {
      return null;
    }

    return $AthleteCopyWith<$Res>(_value.athlete!, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelCopyWith<$Res>? get channel {
    if (_value.channel == null) {
      return null;
    }

    return $ChannelCopyWith<$Res>(_value.channel!, (value) {
      return _then(_value.copyWith(channel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FanNotificationItemImplCopyWith<$Res>
    implements $FanNotificationItemCopyWith<$Res> {
  factory _$$FanNotificationItemImplCopyWith(_$FanNotificationItemImpl value,
          $Res Function(_$FanNotificationItemImpl) then) =
      __$$FanNotificationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String message,
      bool isRead,
      String? createdAt,
      Actor? actor,
      Athlete? athlete,
      Channel? channel});

  @override
  $ActorCopyWith<$Res>? get actor;
  @override
  $AthleteCopyWith<$Res>? get athlete;
  @override
  $ChannelCopyWith<$Res>? get channel;
}

/// @nodoc
class __$$FanNotificationItemImplCopyWithImpl<$Res>
    extends _$FanNotificationItemCopyWithImpl<$Res, _$FanNotificationItemImpl>
    implements _$$FanNotificationItemImplCopyWith<$Res> {
  __$$FanNotificationItemImplCopyWithImpl(_$FanNotificationItemImpl _value,
      $Res Function(_$FanNotificationItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? message = null,
    Object? isRead = null,
    Object? createdAt = freezed,
    Object? actor = freezed,
    Object? athlete = freezed,
    Object? channel = freezed,
  }) {
    return _then(_$FanNotificationItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as Actor?,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as Athlete?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FanNotificationItemImpl implements _FanNotificationItem {
  const _$FanNotificationItemImpl(
      {required this.id,
      required this.type,
      required this.message,
      required this.isRead,
      this.createdAt,
      this.actor,
      this.athlete,
      this.channel});

  factory _$FanNotificationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FanNotificationItemImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String message;
  @override
  final bool isRead;
  @override
  final String? createdAt;
  @override
  final Actor? actor;
  @override
  final Athlete? athlete;
  @override
  final Channel? channel;

  @override
  String toString() {
    return 'FanNotificationItem(id: $id, type: $type, message: $message, isRead: $isRead, createdAt: $createdAt, actor: $actor, athlete: $athlete, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FanNotificationItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.athlete, athlete) || other.athlete == athlete) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, message, isRead,
      createdAt, actor, athlete, channel);

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FanNotificationItemImplCopyWith<_$FanNotificationItemImpl> get copyWith =>
      __$$FanNotificationItemImplCopyWithImpl<_$FanNotificationItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FanNotificationItemImplToJson(
      this,
    );
  }
}

abstract class _FanNotificationItem implements FanNotificationItem {
  const factory _FanNotificationItem(
      {required final String id,
      required final String type,
      required final String message,
      required final bool isRead,
      final String? createdAt,
      final Actor? actor,
      final Athlete? athlete,
      final Channel? channel}) = _$FanNotificationItemImpl;

  factory _FanNotificationItem.fromJson(Map<String, dynamic> json) =
      _$FanNotificationItemImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get message;
  @override
  bool get isRead;
  @override
  String? get createdAt;
  @override
  Actor? get actor;
  @override
  Athlete? get athlete;
  @override
  Channel? get channel;

  /// Create a copy of FanNotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FanNotificationItemImplCopyWith<_$FanNotificationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return _Actor.fromJson(json);
}

/// @nodoc
mixin _$Actor {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this Actor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActorCopyWith<Actor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorCopyWith<$Res> {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) then) =
      _$ActorCopyWithImpl<$Res, Actor>;
  @useResult
  $Res call({String id, String name, String? profilePicture});
}

/// @nodoc
class _$ActorCopyWithImpl<$Res, $Val extends Actor>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorImplCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$$ActorImplCopyWith(
          _$ActorImpl value, $Res Function(_$ActorImpl) then) =
      __$$ActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? profilePicture});
}

/// @nodoc
class __$$ActorImplCopyWithImpl<$Res>
    extends _$ActorCopyWithImpl<$Res, _$ActorImpl>
    implements _$$ActorImplCopyWith<$Res> {
  __$$ActorImplCopyWithImpl(
      _$ActorImpl _value, $Res Function(_$ActorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = freezed,
  }) {
    return _then(_$ActorImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorImpl implements _Actor {
  const _$ActorImpl(
      {required this.id, required this.name, this.profilePicture});

  factory _$ActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'Actor(id: $id, name: $name, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture);

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      __$$ActorImplCopyWithImpl<_$ActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorImplToJson(
      this,
    );
  }
}

abstract class _Actor implements Actor {
  const factory _Actor(
      {required final String id,
      required final String name,
      final String? profilePicture}) = _$ActorImpl;

  factory _Actor.fromJson(Map<String, dynamic> json) = _$ActorImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profilePicture;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Athlete _$AthleteFromJson(Map<String, dynamic> json) {
  return _Athlete.fromJson(json);
}

/// @nodoc
mixin _$Athlete {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

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
  $Res call({String id, String? name, String? profilePicture});
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
    Object? name = freezed,
    Object? profilePicture = freezed,
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
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String id, String? name, String? profilePicture});
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
    Object? name = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$AthleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteImpl implements _Athlete {
  const _$AthleteImpl({required this.id, this.name, this.profilePicture});

  factory _$AthleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'Athlete(id: $id, name: $name, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture);

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
      final String? name,
      final String? profilePicture}) = _$AthleteImpl;

  factory _Athlete.fromJson(Map<String, dynamic> json) = _$AthleteImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get profilePicture;

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteImplCopyWith<_$AthleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
mixin _$Channel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;

  /// Serializes this Channel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res, Channel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbnailUrl,
      String? mediaUrl,
      String? type,
      String? status,
      String? publishedAt});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res, $Val extends Channel>
    implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = freezed,
    Object? mediaUrl = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelImplCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$$ChannelImplCopyWith(
          _$ChannelImpl value, $Res Function(_$ChannelImpl) then) =
      __$$ChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? thumbnailUrl,
      String? mediaUrl,
      String? type,
      String? status,
      String? publishedAt});
}

/// @nodoc
class __$$ChannelImplCopyWithImpl<$Res>
    extends _$ChannelCopyWithImpl<$Res, _$ChannelImpl>
    implements _$$ChannelImplCopyWith<$Res> {
  __$$ChannelImplCopyWithImpl(
      _$ChannelImpl _value, $Res Function(_$ChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnailUrl = freezed,
    Object? mediaUrl = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? publishedAt = freezed,
  }) {
    return _then(_$ChannelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelImpl implements _Channel {
  const _$ChannelImpl(
      {required this.id,
      required this.title,
      this.thumbnailUrl,
      this.mediaUrl,
      this.type,
      this.status,
      this.publishedAt});

  factory _$ChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? thumbnailUrl;
  @override
  final String? mediaUrl;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final String? publishedAt;

  @override
  String toString() {
    return 'Channel(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, mediaUrl: $mediaUrl, type: $type, status: $status, publishedAt: $publishedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, thumbnailUrl,
      mediaUrl, type, status, publishedAt);

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      __$$ChannelImplCopyWithImpl<_$ChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelImplToJson(
      this,
    );
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {required final String id,
      required final String title,
      final String? thumbnailUrl,
      final String? mediaUrl,
      final String? type,
      final String? status,
      final String? publishedAt}) = _$ChannelImpl;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$ChannelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get thumbnailUrl;
  @override
  String? get mediaUrl;
  @override
  String? get type;
  @override
  String? get status;
  @override
  String? get publishedAt;

  /// Create a copy of Channel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelImplCopyWith<_$ChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
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
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
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
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
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
      {required this.page,
      required this.limit,
      required this.total,
      required this.totalPages,
      required this.hasMore});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int totalPages;
  @override
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
      {required final int page,
      required final int limit,
      required final int total,
      required final int totalPages,
      required final bool hasMore}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get totalPages;
  @override
  bool get hasMore;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LatestStoryResponse _$LatestStoryResponseFromJson(Map<String, dynamic> json) {
  return _LatestStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$LatestStoryResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StoryData get data => throw _privateConstructorUsedError;

  /// Serializes this LatestStoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestStoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestStoryResponseCopyWith<LatestStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestStoryResponseCopyWith<$Res> {
  factory $LatestStoryResponseCopyWith(
          LatestStoryResponse value, $Res Function(LatestStoryResponse) then) =
      _$LatestStoryResponseCopyWithImpl<$Res, LatestStoryResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, StoryData data});

  $StoryDataCopyWith<$Res> get data;
}

/// @nodoc
class _$LatestStoryResponseCopyWithImpl<$Res, $Val extends LatestStoryResponse>
    implements $LatestStoryResponseCopyWith<$Res> {
  _$LatestStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestStoryResponse
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
              as StoryData,
    ) as $Val);
  }

  /// Create a copy of LatestStoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoryDataCopyWith<$Res> get data {
    return $StoryDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LatestStoryResponseImplCopyWith<$Res>
    implements $LatestStoryResponseCopyWith<$Res> {
  factory _$$LatestStoryResponseImplCopyWith(_$LatestStoryResponseImpl value,
          $Res Function(_$LatestStoryResponseImpl) then) =
      __$$LatestStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, StoryData data});

  @override
  $StoryDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LatestStoryResponseImplCopyWithImpl<$Res>
    extends _$LatestStoryResponseCopyWithImpl<$Res, _$LatestStoryResponseImpl>
    implements _$$LatestStoryResponseImplCopyWith<$Res> {
  __$$LatestStoryResponseImplCopyWithImpl(_$LatestStoryResponseImpl _value,
      $Res Function(_$LatestStoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LatestStoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$LatestStoryResponseImpl(
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
              as StoryData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestStoryResponseImpl implements _LatestStoryResponse {
  const _$LatestStoryResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$LatestStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestStoryResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final StoryData data;

  @override
  String toString() {
    return 'LatestStoryResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestStoryResponseImpl &&
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

  /// Create a copy of LatestStoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestStoryResponseImplCopyWith<_$LatestStoryResponseImpl> get copyWith =>
      __$$LatestStoryResponseImplCopyWithImpl<_$LatestStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _LatestStoryResponse implements LatestStoryResponse {
  const factory _LatestStoryResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final StoryData data}) = _$LatestStoryResponseImpl;

  factory _LatestStoryResponse.fromJson(Map<String, dynamic> json) =
      _$LatestStoryResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  StoryData get data;

  /// Create a copy of LatestStoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestStoryResponseImplCopyWith<_$LatestStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryData _$StoryDataFromJson(Map<String, dynamic> json) {
  return _StoryData.fromJson(json);
}

/// @nodoc
mixin _$StoryData {
  String get message => throw _privateConstructorUsedError;
  List<StoryChannel> get stories => throw _privateConstructorUsedError;

  /// Serializes this StoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryDataCopyWith<StoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDataCopyWith<$Res> {
  factory $StoryDataCopyWith(StoryData value, $Res Function(StoryData) then) =
      _$StoryDataCopyWithImpl<$Res, StoryData>;
  @useResult
  $Res call({String message, List<StoryChannel> stories});
}

/// @nodoc
class _$StoryDataCopyWithImpl<$Res, $Val extends StoryData>
    implements $StoryDataCopyWith<$Res> {
  _$StoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryChannel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryDataImplCopyWith<$Res>
    implements $StoryDataCopyWith<$Res> {
  factory _$$StoryDataImplCopyWith(
          _$StoryDataImpl value, $Res Function(_$StoryDataImpl) then) =
      __$$StoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<StoryChannel> stories});
}

/// @nodoc
class __$$StoryDataImplCopyWithImpl<$Res>
    extends _$StoryDataCopyWithImpl<$Res, _$StoryDataImpl>
    implements _$$StoryDataImplCopyWith<$Res> {
  __$$StoryDataImplCopyWithImpl(
      _$StoryDataImpl _value, $Res Function(_$StoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stories = null,
  }) {
    return _then(_$StoryDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryChannel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryDataImpl implements _StoryData {
  const _$StoryDataImpl(
      {required this.message, final List<StoryChannel> stories = const []})
      : _stories = stories;

  factory _$StoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryDataImplFromJson(json);

  @override
  final String message;
  final List<StoryChannel> _stories;
  @override
  @JsonKey()
  List<StoryChannel> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'StoryData(message: $message, stories: $stories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_stories));

  /// Create a copy of StoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryDataImplCopyWith<_$StoryDataImpl> get copyWith =>
      __$$StoryDataImplCopyWithImpl<_$StoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryDataImplToJson(
      this,
    );
  }
}

abstract class _StoryData implements StoryData {
  const factory _StoryData(
      {required final String message,
      final List<StoryChannel> stories}) = _$StoryDataImpl;

  factory _StoryData.fromJson(Map<String, dynamic> json) =
      _$StoryDataImpl.fromJson;

  @override
  String get message;
  @override
  List<StoryChannel> get stories;

  /// Create a copy of StoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryDataImplCopyWith<_$StoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryChannel _$StoryChannelFromJson(Map<String, dynamic> json) {
  return _StoryChannel.fromJson(json);
}

/// @nodoc
mixin _$StoryChannel {
  Athlete get athlete => throw _privateConstructorUsedError;
  List<StoryItem> get stories => throw _privateConstructorUsedError;

  /// Serializes this StoryChannel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryChannelCopyWith<StoryChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryChannelCopyWith<$Res> {
  factory $StoryChannelCopyWith(
          StoryChannel value, $Res Function(StoryChannel) then) =
      _$StoryChannelCopyWithImpl<$Res, StoryChannel>;
  @useResult
  $Res call({Athlete athlete, List<StoryItem> stories});

  $AthleteCopyWith<$Res> get athlete;
}

/// @nodoc
class _$StoryChannelCopyWithImpl<$Res, $Val extends StoryChannel>
    implements $StoryChannelCopyWith<$Res> {
  _$StoryChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athlete = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as Athlete,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryItem>,
    ) as $Val);
  }

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteCopyWith<$Res> get athlete {
    return $AthleteCopyWith<$Res>(_value.athlete, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryChannelImplCopyWith<$Res>
    implements $StoryChannelCopyWith<$Res> {
  factory _$$StoryChannelImplCopyWith(
          _$StoryChannelImpl value, $Res Function(_$StoryChannelImpl) then) =
      __$$StoryChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Athlete athlete, List<StoryItem> stories});

  @override
  $AthleteCopyWith<$Res> get athlete;
}

/// @nodoc
class __$$StoryChannelImplCopyWithImpl<$Res>
    extends _$StoryChannelCopyWithImpl<$Res, _$StoryChannelImpl>
    implements _$$StoryChannelImplCopyWith<$Res> {
  __$$StoryChannelImplCopyWithImpl(
      _$StoryChannelImpl _value, $Res Function(_$StoryChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? athlete = null,
    Object? stories = null,
  }) {
    return _then(_$StoryChannelImpl(
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as Athlete,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryChannelImpl implements _StoryChannel {
  const _$StoryChannelImpl(
      {required this.athlete, final List<StoryItem> stories = const []})
      : _stories = stories;

  factory _$StoryChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryChannelImplFromJson(json);

  @override
  final Athlete athlete;
  final List<StoryItem> _stories;
  @override
  @JsonKey()
  List<StoryItem> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'StoryChannel(athlete: $athlete, stories: $stories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryChannelImpl &&
            (identical(other.athlete, athlete) || other.athlete == athlete) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, athlete, const DeepCollectionEquality().hash(_stories));

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryChannelImplCopyWith<_$StoryChannelImpl> get copyWith =>
      __$$StoryChannelImplCopyWithImpl<_$StoryChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryChannelImplToJson(
      this,
    );
  }
}

abstract class _StoryChannel implements StoryChannel {
  const factory _StoryChannel(
      {required final Athlete athlete,
      final List<StoryItem> stories}) = _$StoryChannelImpl;

  factory _StoryChannel.fromJson(Map<String, dynamic> json) =
      _$StoryChannelImpl.fromJson;

  @override
  Athlete get athlete;
  @override
  List<StoryItem> get stories;

  /// Create a copy of StoryChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryChannelImplCopyWith<_$StoryChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Athlete _$AthleteFromJson(Map<String, dynamic> json) {
  return _Athlete.fromJson(json);
}

/// @nodoc
mixin _$Athlete {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

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
  $Res call({String id, String name, String profilePicture});
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
    Object? profilePicture = null,
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
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String id, String name, String profilePicture});
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
    Object? profilePicture = null,
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
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AthleteImpl implements _Athlete {
  const _$AthleteImpl(
      {required this.id, required this.name, required this.profilePicture});

  factory _$AthleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String profilePicture;

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
      required final String name,
      required final String profilePicture}) = _$AthleteImpl;

  factory _Athlete.fromJson(Map<String, dynamic> json) = _$AthleteImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get profilePicture;

  /// Create a copy of Athlete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteImplCopyWith<_$AthleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryItem _$StoryItemFromJson(Map<String, dynamic> json) {
  return _StoryItem.fromJson(json);
}

/// @nodoc
mixin _$StoryItem {
  String get id => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;
  bool get isViewed => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;

  /// Serializes this StoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryItemCopyWith<StoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryItemCopyWith<$Res> {
  factory $StoryItemCopyWith(StoryItem value, $Res Function(StoryItem) then) =
      _$StoryItemCopyWithImpl<$Res, StoryItem>;
  @useResult
  $Res call(
      {String id,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      int duration,
      String createdAt,
      String publishedAt,
      String expiresAt,
      bool isViewed,
      String? caption});
}

/// @nodoc
class _$StoryItemCopyWithImpl<$Res, $Val extends StoryItem>
    implements $StoryItemCopyWith<$Res> {
  _$StoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? duration = null,
    Object? createdAt = null,
    Object? publishedAt = null,
    Object? expiresAt = null,
    Object? isViewed = null,
    Object? caption = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryItemImplCopyWith<$Res>
    implements $StoryItemCopyWith<$Res> {
  factory _$$StoryItemImplCopyWith(
          _$StoryItemImpl value, $Res Function(_$StoryItemImpl) then) =
      __$$StoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      int duration,
      String createdAt,
      String publishedAt,
      String expiresAt,
      bool isViewed,
      String? caption});
}

/// @nodoc
class __$$StoryItemImplCopyWithImpl<$Res>
    extends _$StoryItemCopyWithImpl<$Res, _$StoryItemImpl>
    implements _$$StoryItemImplCopyWith<$Res> {
  __$$StoryItemImplCopyWithImpl(
      _$StoryItemImpl _value, $Res Function(_$StoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? duration = null,
    Object? createdAt = null,
    Object? publishedAt = null,
    Object? expiresAt = null,
    Object? isViewed = null,
    Object? caption = freezed,
  }) {
    return _then(_$StoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
      isViewed: null == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryItemImpl implements _StoryItem {
  const _$StoryItemImpl(
      {required this.id,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.mediaType,
      required this.duration,
      required this.createdAt,
      required this.publishedAt,
      required this.expiresAt,
      required this.isViewed,
      required this.caption});

  factory _$StoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final String mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? mediaType;
  @override
  final int duration;
  @override
  final String createdAt;
  @override
  final String publishedAt;
  @override
  final String expiresAt;
  @override
  final bool isViewed;
  @override
  final String? caption;

  @override
  String toString() {
    return 'StoryItem(id: $id, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, mediaType: $mediaType, duration: $duration, createdAt: $createdAt, publishedAt: $publishedAt, expiresAt: $expiresAt, isViewed: $isViewed, caption: $caption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mediaUrl,
      thumbnailUrl,
      mediaType,
      duration,
      createdAt,
      publishedAt,
      expiresAt,
      isViewed,
      caption);

  /// Create a copy of StoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      __$$StoryItemImplCopyWithImpl<_$StoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryItemImplToJson(
      this,
    );
  }
}

abstract class _StoryItem implements StoryItem {
  const factory _StoryItem(
      {required final String id,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? mediaType,
      required final int duration,
      required final String createdAt,
      required final String publishedAt,
      required final String expiresAt,
      required final bool isViewed,
      required final String? caption}) = _$StoryItemImpl;

  factory _StoryItem.fromJson(Map<String, dynamic> json) =
      _$StoryItemImpl.fromJson;

  @override
  String get id;
  @override
  String get mediaUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get mediaType;
  @override
  int get duration;
  @override
  String get createdAt;
  @override
  String get publishedAt;
  @override
  String get expiresAt;
  @override
  bool get isViewed;
  @override
  String? get caption;

  /// Create a copy of StoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryItemImplCopyWith<_$StoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

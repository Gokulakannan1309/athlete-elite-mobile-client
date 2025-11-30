// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_channel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LatestChannelResponse _$LatestChannelResponseFromJson(
    Map<String, dynamic> json) {
  return _LatestChannelResponse.fromJson(json);
}

/// @nodoc
mixin _$LatestChannelResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  LatestChannelData get data => throw _privateConstructorUsedError;

  /// Serializes this LatestChannelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestChannelResponseCopyWith<LatestChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestChannelResponseCopyWith<$Res> {
  factory $LatestChannelResponseCopyWith(LatestChannelResponse value,
          $Res Function(LatestChannelResponse) then) =
      _$LatestChannelResponseCopyWithImpl<$Res, LatestChannelResponse>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, LatestChannelData data});

  $LatestChannelDataCopyWith<$Res> get data;
}

/// @nodoc
class _$LatestChannelResponseCopyWithImpl<$Res,
        $Val extends LatestChannelResponse>
    implements $LatestChannelResponseCopyWith<$Res> {
  _$LatestChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestChannelResponse
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
              as LatestChannelData,
    ) as $Val);
  }

  /// Create a copy of LatestChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LatestChannelDataCopyWith<$Res> get data {
    return $LatestChannelDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LatestChannelResponseImplCopyWith<$Res>
    implements $LatestChannelResponseCopyWith<$Res> {
  factory _$$LatestChannelResponseImplCopyWith(
          _$LatestChannelResponseImpl value,
          $Res Function(_$LatestChannelResponseImpl) then) =
      __$$LatestChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, LatestChannelData data});

  @override
  $LatestChannelDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LatestChannelResponseImplCopyWithImpl<$Res>
    extends _$LatestChannelResponseCopyWithImpl<$Res,
        _$LatestChannelResponseImpl>
    implements _$$LatestChannelResponseImplCopyWith<$Res> {
  __$$LatestChannelResponseImplCopyWithImpl(_$LatestChannelResponseImpl _value,
      $Res Function(_$LatestChannelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LatestChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$LatestChannelResponseImpl(
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
              as LatestChannelData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestChannelResponseImpl implements _LatestChannelResponse {
  const _$LatestChannelResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$LatestChannelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestChannelResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final LatestChannelData data;

  @override
  String toString() {
    return 'LatestChannelResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestChannelResponseImpl &&
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

  /// Create a copy of LatestChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestChannelResponseImplCopyWith<_$LatestChannelResponseImpl>
      get copyWith => __$$LatestChannelResponseImplCopyWithImpl<
          _$LatestChannelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestChannelResponseImplToJson(
      this,
    );
  }
}

abstract class _LatestChannelResponse implements LatestChannelResponse {
  const factory _LatestChannelResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final LatestChannelData data}) = _$LatestChannelResponseImpl;

  factory _LatestChannelResponse.fromJson(Map<String, dynamic> json) =
      _$LatestChannelResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  LatestChannelData get data;

  /// Create a copy of LatestChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestChannelResponseImplCopyWith<_$LatestChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LatestChannelData _$LatestChannelDataFromJson(Map<String, dynamic> json) {
  return _LatestChannelData.fromJson(json);
}

/// @nodoc
mixin _$LatestChannelData {
  String get message => throw _privateConstructorUsedError;
  List<LatestChannelItem> get channels => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this LatestChannelData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestChannelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestChannelDataCopyWith<LatestChannelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestChannelDataCopyWith<$Res> {
  factory $LatestChannelDataCopyWith(
          LatestChannelData value, $Res Function(LatestChannelData) then) =
      _$LatestChannelDataCopyWithImpl<$Res, LatestChannelData>;
  @useResult
  $Res call(
      {String message,
      List<LatestChannelItem> channels,
      Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$LatestChannelDataCopyWithImpl<$Res, $Val extends LatestChannelData>
    implements $LatestChannelDataCopyWith<$Res> {
  _$LatestChannelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestChannelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? channels = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<LatestChannelItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of LatestChannelData
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
abstract class _$$LatestChannelDataImplCopyWith<$Res>
    implements $LatestChannelDataCopyWith<$Res> {
  factory _$$LatestChannelDataImplCopyWith(_$LatestChannelDataImpl value,
          $Res Function(_$LatestChannelDataImpl) then) =
      __$$LatestChannelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      List<LatestChannelItem> channels,
      Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$LatestChannelDataImplCopyWithImpl<$Res>
    extends _$LatestChannelDataCopyWithImpl<$Res, _$LatestChannelDataImpl>
    implements _$$LatestChannelDataImplCopyWith<$Res> {
  __$$LatestChannelDataImplCopyWithImpl(_$LatestChannelDataImpl _value,
      $Res Function(_$LatestChannelDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LatestChannelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? channels = null,
    Object? pagination = null,
  }) {
    return _then(_$LatestChannelDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<LatestChannelItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestChannelDataImpl implements _LatestChannelData {
  const _$LatestChannelDataImpl(
      {required this.message,
      required final List<LatestChannelItem> channels,
      required this.pagination})
      : _channels = channels;

  factory _$LatestChannelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestChannelDataImplFromJson(json);

  @override
  final String message;
  final List<LatestChannelItem> _channels;
  @override
  List<LatestChannelItem> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'LatestChannelData(message: $message, channels: $channels, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestChannelDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_channels), pagination);

  /// Create a copy of LatestChannelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestChannelDataImplCopyWith<_$LatestChannelDataImpl> get copyWith =>
      __$$LatestChannelDataImplCopyWithImpl<_$LatestChannelDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestChannelDataImplToJson(
      this,
    );
  }
}

abstract class _LatestChannelData implements LatestChannelData {
  const factory _LatestChannelData(
      {required final String message,
      required final List<LatestChannelItem> channels,
      required final Pagination pagination}) = _$LatestChannelDataImpl;

  factory _LatestChannelData.fromJson(Map<String, dynamic> json) =
      _$LatestChannelDataImpl.fromJson;

  @override
  String get message;
  @override
  List<LatestChannelItem> get channels;
  @override
  Pagination get pagination;

  /// Create a copy of LatestChannelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestChannelDataImplCopyWith<_$LatestChannelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LatestChannelItem _$LatestChannelItemFromJson(Map<String, dynamic> json) {
  return _LatestChannelItem.fromJson(json);
}

/// @nodoc
mixin _$LatestChannelItem {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl =>
      throw _privateConstructorUsedError; // will not be used
  String? get mediaType => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError;
  AthleteRes get athlete => throw _privateConstructorUsedError;
  CategoryRes? get category => throw _privateConstructorUsedError;
  BrandRes? get brand => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this LatestChannelItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestChannelItemCopyWith<LatestChannelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestChannelItemCopyWith<$Res> {
  factory $LatestChannelItemCopyWith(
          LatestChannelItem value, $Res Function(LatestChannelItem) then) =
      _$LatestChannelItemCopyWithImpl<$Res, LatestChannelItem>;
  @useResult
  $Res call(
      {String id,
      String? title,
      String? caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String publishedAt,
      AthleteRes athlete,
      CategoryRes? category,
      BrandRes? brand,
      int likesCount,
      int commentsCount});

  $AthleteResCopyWith<$Res> get athlete;
  $CategoryResCopyWith<$Res>? get category;
  $BrandResCopyWith<$Res>? get brand;
}

/// @nodoc
class _$LatestChannelItemCopyWithImpl<$Res, $Val extends LatestChannelItem>
    implements $LatestChannelItemCopyWith<$Res> {
  _$LatestChannelItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? publishedAt = null,
    Object? athlete = null,
    Object? category = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? commentsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
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
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteRes,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryRes?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandRes?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteResCopyWith<$Res> get athlete {
    return $AthleteResCopyWith<$Res>(_value.athlete, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryResCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryResCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandResCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandResCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LatestChannelItemImplCopyWith<$Res>
    implements $LatestChannelItemCopyWith<$Res> {
  factory _$$LatestChannelItemImplCopyWith(_$LatestChannelItemImpl value,
          $Res Function(_$LatestChannelItemImpl) then) =
      __$$LatestChannelItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? title,
      String? caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String publishedAt,
      AthleteRes athlete,
      CategoryRes? category,
      BrandRes? brand,
      int likesCount,
      int commentsCount});

  @override
  $AthleteResCopyWith<$Res> get athlete;
  @override
  $CategoryResCopyWith<$Res>? get category;
  @override
  $BrandResCopyWith<$Res>? get brand;
}

/// @nodoc
class __$$LatestChannelItemImplCopyWithImpl<$Res>
    extends _$LatestChannelItemCopyWithImpl<$Res, _$LatestChannelItemImpl>
    implements _$$LatestChannelItemImplCopyWith<$Res> {
  __$$LatestChannelItemImplCopyWithImpl(_$LatestChannelItemImpl _value,
      $Res Function(_$LatestChannelItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? publishedAt = null,
    Object? athlete = null,
    Object? category = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? commentsCount = null,
  }) {
    return _then(_$LatestChannelItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
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
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      athlete: null == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteRes,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryRes?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandRes?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestChannelItemImpl implements _LatestChannelItem {
  const _$LatestChannelItemImpl(
      {required this.id,
      required this.title,
      required this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.mediaType,
      required this.publishedAt,
      required this.athlete,
      required this.category,
      required this.brand,
      required this.likesCount,
      required this.commentsCount});

  factory _$LatestChannelItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestChannelItemImplFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final String? caption;
  @override
  final String mediaUrl;
  @override
  final String? thumbnailUrl;
// will not be used
  @override
  final String? mediaType;
  @override
  final String publishedAt;
  @override
  final AthleteRes athlete;
  @override
  final CategoryRes? category;
  @override
  final BrandRes? brand;
  @override
  final int likesCount;
  @override
  final int commentsCount;

  @override
  String toString() {
    return 'LatestChannelItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, mediaType: $mediaType, publishedAt: $publishedAt, athlete: $athlete, category: $category, brand: $brand, likesCount: $likesCount, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestChannelItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.athlete, athlete) || other.athlete == athlete) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      caption,
      mediaUrl,
      thumbnailUrl,
      mediaType,
      publishedAt,
      athlete,
      category,
      brand,
      likesCount,
      commentsCount);

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestChannelItemImplCopyWith<_$LatestChannelItemImpl> get copyWith =>
      __$$LatestChannelItemImplCopyWithImpl<_$LatestChannelItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestChannelItemImplToJson(
      this,
    );
  }
}

abstract class _LatestChannelItem implements LatestChannelItem {
  const factory _LatestChannelItem(
      {required final String id,
      required final String? title,
      required final String? caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? mediaType,
      required final String publishedAt,
      required final AthleteRes athlete,
      required final CategoryRes? category,
      required final BrandRes? brand,
      required final int likesCount,
      required final int commentsCount}) = _$LatestChannelItemImpl;

  factory _LatestChannelItem.fromJson(Map<String, dynamic> json) =
      _$LatestChannelItemImpl.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  String? get caption;
  @override
  String get mediaUrl;
  @override
  String? get thumbnailUrl; // will not be used
  @override
  String? get mediaType;
  @override
  String get publishedAt;
  @override
  AthleteRes get athlete;
  @override
  CategoryRes? get category;
  @override
  BrandRes? get brand;
  @override
  int get likesCount;
  @override
  int get commentsCount;

  /// Create a copy of LatestChannelItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestChannelItemImplCopyWith<_$LatestChannelItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AthleteRes _$AthleteResFromJson(Map<String, dynamic> json) {
  return _AthleteRes.fromJson(json);
}

/// @nodoc
mixin _$AthleteRes {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this AthleteRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteResCopyWith<AthleteRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteResCopyWith<$Res> {
  factory $AthleteResCopyWith(
          AthleteRes value, $Res Function(AthleteRes) then) =
      _$AthleteResCopyWithImpl<$Res, AthleteRes>;
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class _$AthleteResCopyWithImpl<$Res, $Val extends AthleteRes>
    implements $AthleteResCopyWith<$Res> {
  _$AthleteResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteRes
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
abstract class _$$AthleteResImplCopyWith<$Res>
    implements $AthleteResCopyWith<$Res> {
  factory _$$AthleteResImplCopyWith(
          _$AthleteResImpl value, $Res Function(_$AthleteResImpl) then) =
      __$$AthleteResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class __$$AthleteResImplCopyWithImpl<$Res>
    extends _$AthleteResCopyWithImpl<$Res, _$AthleteResImpl>
    implements _$$AthleteResImplCopyWith<$Res> {
  __$$AthleteResImplCopyWithImpl(
      _$AthleteResImpl _value, $Res Function(_$AthleteResImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = null,
  }) {
    return _then(_$AthleteResImpl(
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
class _$AthleteResImpl implements _AthleteRes {
  const _$AthleteResImpl(
      {required this.id, required this.name, required this.profilePicture});

  factory _$AthleteResImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteResImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'AthleteRes(id: $id, name: $name, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteResImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture);

  /// Create a copy of AthleteRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteResImplCopyWith<_$AthleteResImpl> get copyWith =>
      __$$AthleteResImplCopyWithImpl<_$AthleteResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteResImplToJson(
      this,
    );
  }
}

abstract class _AthleteRes implements AthleteRes {
  const factory _AthleteRes(
      {required final String id,
      required final String name,
      required final String profilePicture}) = _$AthleteResImpl;

  factory _AthleteRes.fromJson(Map<String, dynamic> json) =
      _$AthleteResImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get profilePicture;

  /// Create a copy of AthleteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteResImplCopyWith<_$AthleteResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryRes _$CategoryResFromJson(Map<String, dynamic> json) {
  return _CategoryRes.fromJson(json);
}

/// @nodoc
mixin _$CategoryRes {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageData => throw _privateConstructorUsedError;

  /// Serializes this CategoryRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryResCopyWith<CategoryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResCopyWith<$Res> {
  factory $CategoryResCopyWith(
          CategoryRes value, $Res Function(CategoryRes) then) =
      _$CategoryResCopyWithImpl<$Res, CategoryRes>;
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class _$CategoryResCopyWithImpl<$Res, $Val extends CategoryRes>
    implements $CategoryResCopyWith<$Res> {
  _$CategoryResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryResImplCopyWith<$Res>
    implements $CategoryResCopyWith<$Res> {
  factory _$$CategoryResImplCopyWith(
          _$CategoryResImpl value, $Res Function(_$CategoryResImpl) then) =
      __$$CategoryResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class __$$CategoryResImplCopyWithImpl<$Res>
    extends _$CategoryResCopyWithImpl<$Res, _$CategoryResImpl>
    implements _$$CategoryResImplCopyWith<$Res> {
  __$$CategoryResImplCopyWithImpl(
      _$CategoryResImpl _value, $Res Function(_$CategoryResImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageData = freezed,
  }) {
    return _then(_$CategoryResImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryResImpl implements _CategoryRes {
  const _$CategoryResImpl(
      {required this.id, required this.name, required this.imageData});

  factory _$CategoryResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryResImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? imageData;

  @override
  String toString() {
    return 'CategoryRes(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryResImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of CategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryResImplCopyWith<_$CategoryResImpl> get copyWith =>
      __$$CategoryResImplCopyWithImpl<_$CategoryResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryResImplToJson(
      this,
    );
  }
}

abstract class _CategoryRes implements CategoryRes {
  const factory _CategoryRes(
      {required final String? id,
      required final String name,
      required final String? imageData}) = _$CategoryResImpl;

  factory _CategoryRes.fromJson(Map<String, dynamic> json) =
      _$CategoryResImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get imageData;

  /// Create a copy of CategoryRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryResImplCopyWith<_$CategoryResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandRes _$BrandResFromJson(Map<String, dynamic> json) {
  return _BrandRes.fromJson(json);
}

/// @nodoc
mixin _$BrandRes {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageData => throw _privateConstructorUsedError;

  /// Serializes this BrandRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandResCopyWith<BrandRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandResCopyWith<$Res> {
  factory $BrandResCopyWith(BrandRes value, $Res Function(BrandRes) then) =
      _$BrandResCopyWithImpl<$Res, BrandRes>;
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class _$BrandResCopyWithImpl<$Res, $Val extends BrandRes>
    implements $BrandResCopyWith<$Res> {
  _$BrandResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandResImplCopyWith<$Res>
    implements $BrandResCopyWith<$Res> {
  factory _$$BrandResImplCopyWith(
          _$BrandResImpl value, $Res Function(_$BrandResImpl) then) =
      __$$BrandResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class __$$BrandResImplCopyWithImpl<$Res>
    extends _$BrandResCopyWithImpl<$Res, _$BrandResImpl>
    implements _$$BrandResImplCopyWith<$Res> {
  __$$BrandResImplCopyWithImpl(
      _$BrandResImpl _value, $Res Function(_$BrandResImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageData = freezed,
  }) {
    return _then(_$BrandResImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandResImpl implements _BrandRes {
  const _$BrandResImpl(
      {required this.id, required this.name, required this.imageData});

  factory _$BrandResImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandResImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? imageData;

  @override
  String toString() {
    return 'BrandRes(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandResImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of BrandRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandResImplCopyWith<_$BrandResImpl> get copyWith =>
      __$$BrandResImplCopyWithImpl<_$BrandResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandResImplToJson(
      this,
    );
  }
}

abstract class _BrandRes implements BrandRes {
  const factory _BrandRes(
      {required final String? id,
      required final String name,
      required final String? imageData}) = _$BrandResImpl;

  factory _BrandRes.fromJson(Map<String, dynamic> json) =
      _$BrandResImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get imageData;

  /// Create a copy of BrandRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandResImplCopyWith<_$BrandResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

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
  $Res call({int totalCount, int totalPages, int currentPage, int limit});
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
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, int totalPages, int currentPage, int limit});
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
    Object? totalCount = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? limit = null,
  }) {
    return _then(_$PaginationImpl(
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
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {required this.totalCount,
      required this.totalPages,
      required this.currentPage,
      required this.limit});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

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
    return 'Pagination(totalCount: $totalCount, totalPages: $totalPages, currentPage: $currentPage, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
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
      {required final int totalCount,
      required final int totalPages,
      required final int currentPage,
      required final int limit}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

  @override
  int get totalCount;
  @override
  int get totalPages;
  @override
  int get currentPage;
  @override
  int get limit;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

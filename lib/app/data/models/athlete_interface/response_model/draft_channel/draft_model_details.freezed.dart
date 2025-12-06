// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_model_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DraftResponse _$DraftResponseFromJson(Map<String, dynamic> json) {
  return _DraftResponse.fromJson(json);
}

/// @nodoc
mixin _$DraftResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DraftData get data => throw _privateConstructorUsedError;

  /// Serializes this DraftResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftResponseCopyWith<DraftResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftResponseCopyWith<$Res> {
  factory $DraftResponseCopyWith(
          DraftResponse value, $Res Function(DraftResponse) then) =
      _$DraftResponseCopyWithImpl<$Res, DraftResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, DraftData data});

  $DraftDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DraftResponseCopyWithImpl<$Res, $Val extends DraftResponse>
    implements $DraftResponseCopyWith<$Res> {
  _$DraftResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftResponse
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
              as DraftData,
    ) as $Val);
  }

  /// Create a copy of DraftResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DraftDataCopyWith<$Res> get data {
    return $DraftDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DraftResponseImplCopyWith<$Res>
    implements $DraftResponseCopyWith<$Res> {
  factory _$$DraftResponseImplCopyWith(
          _$DraftResponseImpl value, $Res Function(_$DraftResponseImpl) then) =
      __$$DraftResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, DraftData data});

  @override
  $DraftDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DraftResponseImplCopyWithImpl<$Res>
    extends _$DraftResponseCopyWithImpl<$Res, _$DraftResponseImpl>
    implements _$$DraftResponseImplCopyWith<$Res> {
  __$$DraftResponseImplCopyWithImpl(
      _$DraftResponseImpl _value, $Res Function(_$DraftResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$DraftResponseImpl(
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
              as DraftData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftResponseImpl implements _DraftResponse {
  const _$DraftResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$DraftResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final DraftData data;

  @override
  String toString() {
    return 'DraftResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftResponseImpl &&
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

  /// Create a copy of DraftResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftResponseImplCopyWith<_$DraftResponseImpl> get copyWith =>
      __$$DraftResponseImplCopyWithImpl<_$DraftResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftResponseImplToJson(
      this,
    );
  }
}

abstract class _DraftResponse implements DraftResponse {
  const factory _DraftResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final DraftData data}) = _$DraftResponseImpl;

  factory _DraftResponse.fromJson(Map<String, dynamic> json) =
      _$DraftResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  DraftData get data;

  /// Create a copy of DraftResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftResponseImplCopyWith<_$DraftResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DraftData _$DraftDataFromJson(Map<String, dynamic> json) {
  return _DraftData.fromJson(json);
}

/// @nodoc
mixin _$DraftData {
  List<DraftCategoryItem> get items => throw _privateConstructorUsedError;
  DraftMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this DraftData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftDataCopyWith<DraftData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftDataCopyWith<$Res> {
  factory $DraftDataCopyWith(DraftData value, $Res Function(DraftData) then) =
      _$DraftDataCopyWithImpl<$Res, DraftData>;
  @useResult
  $Res call({List<DraftCategoryItem> items, DraftMeta meta});

  $DraftMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$DraftDataCopyWithImpl<$Res, $Val extends DraftData>
    implements $DraftDataCopyWith<$Res> {
  _$DraftDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DraftCategoryItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DraftMeta,
    ) as $Val);
  }

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DraftMetaCopyWith<$Res> get meta {
    return $DraftMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DraftDataImplCopyWith<$Res>
    implements $DraftDataCopyWith<$Res> {
  factory _$$DraftDataImplCopyWith(
          _$DraftDataImpl value, $Res Function(_$DraftDataImpl) then) =
      __$$DraftDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DraftCategoryItem> items, DraftMeta meta});

  @override
  $DraftMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DraftDataImplCopyWithImpl<$Res>
    extends _$DraftDataCopyWithImpl<$Res, _$DraftDataImpl>
    implements _$$DraftDataImplCopyWith<$Res> {
  __$$DraftDataImplCopyWithImpl(
      _$DraftDataImpl _value, $Res Function(_$DraftDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? meta = null,
  }) {
    return _then(_$DraftDataImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DraftCategoryItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DraftMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftDataImpl implements _DraftData {
  const _$DraftDataImpl(
      {required final List<DraftCategoryItem> items, required this.meta})
      : _items = items;

  factory _$DraftDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftDataImplFromJson(json);

  final List<DraftCategoryItem> _items;
  @override
  List<DraftCategoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DraftMeta meta;

  @override
  String toString() {
    return 'DraftData(items: $items, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), meta);

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftDataImplCopyWith<_$DraftDataImpl> get copyWith =>
      __$$DraftDataImplCopyWithImpl<_$DraftDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftDataImplToJson(
      this,
    );
  }
}

abstract class _DraftData implements DraftData {
  const factory _DraftData(
      {required final List<DraftCategoryItem> items,
      required final DraftMeta meta}) = _$DraftDataImpl;

  factory _DraftData.fromJson(Map<String, dynamic> json) =
      _$DraftDataImpl.fromJson;

  @override
  List<DraftCategoryItem> get items;
  @override
  DraftMeta get meta;

  /// Create a copy of DraftData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftDataImplCopyWith<_$DraftDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DraftCategoryItem _$DraftCategoryItemFromJson(Map<String, dynamic> json) {
  return _DraftCategoryItem.fromJson(json);
}

/// @nodoc
mixin _$DraftCategoryItem {
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  List<DraftChannel> get channels => throw _privateConstructorUsedError;

  /// Serializes this DraftCategoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftCategoryItemCopyWith<DraftCategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftCategoryItemCopyWith<$Res> {
  factory $DraftCategoryItemCopyWith(
          DraftCategoryItem value, $Res Function(DraftCategoryItem) then) =
      _$DraftCategoryItemCopyWithImpl<$Res, DraftCategoryItem>;
  @useResult
  $Res call(
      {String? categoryId, String? categoryName, List<DraftChannel> channels});
}

/// @nodoc
class _$DraftCategoryItemCopyWithImpl<$Res, $Val extends DraftCategoryItem>
    implements $DraftCategoryItemCopyWith<$Res> {
  _$DraftCategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? channels = null,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<DraftChannel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftCategoryItemImplCopyWith<$Res>
    implements $DraftCategoryItemCopyWith<$Res> {
  factory _$$DraftCategoryItemImplCopyWith(_$DraftCategoryItemImpl value,
          $Res Function(_$DraftCategoryItemImpl) then) =
      __$$DraftCategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? categoryId, String? categoryName, List<DraftChannel> channels});
}

/// @nodoc
class __$$DraftCategoryItemImplCopyWithImpl<$Res>
    extends _$DraftCategoryItemCopyWithImpl<$Res, _$DraftCategoryItemImpl>
    implements _$$DraftCategoryItemImplCopyWith<$Res> {
  __$$DraftCategoryItemImplCopyWithImpl(_$DraftCategoryItemImpl _value,
      $Res Function(_$DraftCategoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? channels = null,
  }) {
    return _then(_$DraftCategoryItemImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<DraftChannel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftCategoryItemImpl implements _DraftCategoryItem {
  const _$DraftCategoryItemImpl(
      {this.categoryId,
      this.categoryName,
      required final List<DraftChannel> channels})
      : _channels = channels;

  factory _$DraftCategoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftCategoryItemImplFromJson(json);

  @override
  final String? categoryId;
  @override
  final String? categoryName;
  final List<DraftChannel> _channels;
  @override
  List<DraftChannel> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  String toString() {
    return 'DraftCategoryItem(categoryId: $categoryId, categoryName: $categoryName, channels: $channels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftCategoryItemImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      const DeepCollectionEquality().hash(_channels));

  /// Create a copy of DraftCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftCategoryItemImplCopyWith<_$DraftCategoryItemImpl> get copyWith =>
      __$$DraftCategoryItemImplCopyWithImpl<_$DraftCategoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftCategoryItemImplToJson(
      this,
    );
  }
}

abstract class _DraftCategoryItem implements DraftCategoryItem {
  const factory _DraftCategoryItem(
      {final String? categoryId,
      final String? categoryName,
      required final List<DraftChannel> channels}) = _$DraftCategoryItemImpl;

  factory _DraftCategoryItem.fromJson(Map<String, dynamic> json) =
      _$DraftCategoryItemImpl.fromJson;

  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  List<DraftChannel> get channels;

  /// Create a copy of DraftCategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftCategoryItemImplCopyWith<_$DraftCategoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DraftChannel _$DraftChannelFromJson(Map<String, dynamic> json) {
  return _DraftChannel.fromJson(json);
}

/// @nodoc
mixin _$DraftChannel {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  String? get brandId => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<DraftMedia> get media => throw _privateConstructorUsedError;

  /// Serializes this DraftChannel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftChannelCopyWith<DraftChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftChannelCopyWith<$Res> {
  factory $DraftChannelCopyWith(
          DraftChannel value, $Res Function(DraftChannel) then) =
      _$DraftChannelCopyWithImpl<$Res, DraftChannel>;
  @useResult
  $Res call(
      {String id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? status,
      String? type,
      bool? isArchived,
      String? brandId,
      String? brandName,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<DraftMedia> media});
}

/// @nodoc
class _$DraftChannelCopyWithImpl<$Res, $Val extends DraftChannel>
    implements $DraftChannelCopyWith<$Res> {
  _$DraftChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
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
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<DraftMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftChannelImplCopyWith<$Res>
    implements $DraftChannelCopyWith<$Res> {
  factory _$$DraftChannelImplCopyWith(
          _$DraftChannelImpl value, $Res Function(_$DraftChannelImpl) then) =
      __$$DraftChannelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? status,
      String? type,
      bool? isArchived,
      String? brandId,
      String? brandName,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<DraftMedia> media});
}

/// @nodoc
class __$$DraftChannelImplCopyWithImpl<$Res>
    extends _$DraftChannelCopyWithImpl<$Res, _$DraftChannelImpl>
    implements _$$DraftChannelImplCopyWith<$Res> {
  __$$DraftChannelImplCopyWithImpl(
      _$DraftChannelImpl _value, $Res Function(_$DraftChannelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
  }) {
    return _then(_$DraftChannelImpl(
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
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<DraftMedia>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftChannelImpl implements _DraftChannel {
  const _$DraftChannelImpl(
      {required this.id,
      this.title,
      this.caption,
      this.mediaUrl,
      this.thumbnailUrl,
      this.status,
      this.type,
      this.isArchived,
      this.brandId,
      this.brandName,
      this.scheduledAt,
      this.publishedAt,
      this.likesCount,
      this.isLiked,
      this.commentsCount,
      this.createdAt,
      this.updatedAt,
      required final List<DraftMedia> media})
      : _media = media;

  factory _$DraftChannelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftChannelImplFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final String? caption;
  @override
  final String? mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final bool? isArchived;
  @override
  final String? brandId;
  @override
  final String? brandName;
  @override
  final String? scheduledAt;
  @override
  final String? publishedAt;
  @override
  final int? likesCount;
  @override
  final bool? isLiked;
  @override
  final int? commentsCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<DraftMedia> _media;
  @override
  List<DraftMedia> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'DraftChannel(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, status: $status, type: $type, isArchived: $isArchived, brandId: $brandId, brandName: $brandName, scheduledAt: $scheduledAt, publishedAt: $publishedAt, likesCount: $likesCount, isLiked: $isLiked, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftChannelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._media, _media));
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
      status,
      type,
      isArchived,
      brandId,
      brandName,
      scheduledAt,
      publishedAt,
      likesCount,
      isLiked,
      commentsCount,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_media));

  /// Create a copy of DraftChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftChannelImplCopyWith<_$DraftChannelImpl> get copyWith =>
      __$$DraftChannelImplCopyWithImpl<_$DraftChannelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftChannelImplToJson(
      this,
    );
  }
}

abstract class _DraftChannel implements DraftChannel {
  const factory _DraftChannel(
      {required final String id,
      final String? title,
      final String? caption,
      final String? mediaUrl,
      final String? thumbnailUrl,
      final String? status,
      final String? type,
      final bool? isArchived,
      final String? brandId,
      final String? brandName,
      final String? scheduledAt,
      final String? publishedAt,
      final int? likesCount,
      final bool? isLiked,
      final int? commentsCount,
      final String? createdAt,
      final String? updatedAt,
      required final List<DraftMedia> media}) = _$DraftChannelImpl;

  factory _DraftChannel.fromJson(Map<String, dynamic> json) =
      _$DraftChannelImpl.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  String? get caption;
  @override
  String? get mediaUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get status;
  @override
  String? get type;
  @override
  bool? get isArchived;
  @override
  String? get brandId;
  @override
  String? get brandName;
  @override
  String? get scheduledAt;
  @override
  String? get publishedAt;
  @override
  int? get likesCount;
  @override
  bool? get isLiked;
  @override
  int? get commentsCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<DraftMedia> get media;

  /// Create a copy of DraftChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftChannelImplCopyWith<_$DraftChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DraftMedia _$DraftMediaFromJson(Map<String, dynamic> json) {
  return _DraftMedia.fromJson(json);
}

/// @nodoc
mixin _$DraftMedia {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DraftMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftMediaCopyWith<DraftMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftMediaCopyWith<$Res> {
  factory $DraftMediaCopyWith(
          DraftMedia value, $Res Function(DraftMedia) then) =
      _$DraftMediaCopyWithImpl<$Res, DraftMedia>;
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int? sortOrder,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$DraftMediaCopyWithImpl<$Res, $Val extends DraftMedia>
    implements $DraftMediaCopyWith<$Res> {
  _$DraftMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftMediaImplCopyWith<$Res>
    implements $DraftMediaCopyWith<$Res> {
  factory _$$DraftMediaImplCopyWith(
          _$DraftMediaImpl value, $Res Function(_$DraftMediaImpl) then) =
      __$$DraftMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int? sortOrder,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$DraftMediaImplCopyWithImpl<$Res>
    extends _$DraftMediaCopyWithImpl<$Res, _$DraftMediaImpl>
    implements _$$DraftMediaImplCopyWith<$Res> {
  __$$DraftMediaImplCopyWithImpl(
      _$DraftMediaImpl _value, $Res Function(_$DraftMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DraftMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftMediaImpl implements _DraftMedia {
  const _$DraftMediaImpl(
      {required this.id,
      required this.url,
      this.thumbnailUrl,
      this.duration,
      this.sortOrder,
      this.createdAt,
      this.updatedAt});

  factory _$DraftMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftMediaImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final int? duration;
  @override
  final int? sortOrder;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'DraftMedia(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, duration: $duration, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, thumbnailUrl, duration,
      sortOrder, createdAt, updatedAt);

  /// Create a copy of DraftMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftMediaImplCopyWith<_$DraftMediaImpl> get copyWith =>
      __$$DraftMediaImplCopyWithImpl<_$DraftMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftMediaImplToJson(
      this,
    );
  }
}

abstract class _DraftMedia implements DraftMedia {
  const factory _DraftMedia(
      {required final String id,
      required final String url,
      final String? thumbnailUrl,
      final int? duration,
      final int? sortOrder,
      final String? createdAt,
      final String? updatedAt}) = _$DraftMediaImpl;

  factory _DraftMedia.fromJson(Map<String, dynamic> json) =
      _$DraftMediaImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String? get thumbnailUrl;
  @override
  int? get duration;
  @override
  int? get sortOrder;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of DraftMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftMediaImplCopyWith<_$DraftMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DraftMeta _$DraftMetaFromJson(Map<String, dynamic> json) {
  return _DraftMeta.fromJson(json);
}

/// @nodoc
mixin _$DraftMeta {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this DraftMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftMetaCopyWith<DraftMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftMetaCopyWith<$Res> {
  factory $DraftMetaCopyWith(DraftMeta value, $Res Function(DraftMeta) then) =
      _$DraftMetaCopyWithImpl<$Res, DraftMeta>;
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class _$DraftMetaCopyWithImpl<$Res, $Val extends DraftMeta>
    implements $DraftMetaCopyWith<$Res> {
  _$DraftMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftMetaImplCopyWith<$Res>
    implements $DraftMetaCopyWith<$Res> {
  factory _$$DraftMetaImplCopyWith(
          _$DraftMetaImpl value, $Res Function(_$DraftMetaImpl) then) =
      __$$DraftMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class __$$DraftMetaImplCopyWithImpl<$Res>
    extends _$DraftMetaCopyWithImpl<$Res, _$DraftMetaImpl>
    implements _$$DraftMetaImplCopyWith<$Res> {
  __$$DraftMetaImplCopyWithImpl(
      _$DraftMetaImpl _value, $Res Function(_$DraftMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_$DraftMetaImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftMetaImpl implements _DraftMeta {
  const _$DraftMetaImpl(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages});

  factory _$DraftMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftMetaImplFromJson(json);

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'DraftMeta(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftMetaImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, limit, totalPages);

  /// Create a copy of DraftMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftMetaImplCopyWith<_$DraftMetaImpl> get copyWith =>
      __$$DraftMetaImplCopyWithImpl<_$DraftMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftMetaImplToJson(
      this,
    );
  }
}

abstract class _DraftMeta implements DraftMeta {
  const factory _DraftMeta(
      {required final int total,
      required final int page,
      required final int limit,
      required final int totalPages}) = _$DraftMetaImpl;

  factory _DraftMeta.fromJson(Map<String, dynamic> json) =
      _$DraftMetaImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;

  /// Create a copy of DraftMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftMetaImplCopyWith<_$DraftMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

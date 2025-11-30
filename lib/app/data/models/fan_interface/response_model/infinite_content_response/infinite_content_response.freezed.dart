// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infinite_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfiniteContentResponse _$InfiniteContentResponseFromJson(
    Map<String, dynamic> json) {
  return _InfiniteContentResponse.fromJson(json);
}

/// @nodoc
mixin _$InfiniteContentResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  InfiniteContentData get data => throw _privateConstructorUsedError;

  /// Serializes this InfiniteContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfiniteContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfiniteContentResponseCopyWith<InfiniteContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteContentResponseCopyWith<$Res> {
  factory $InfiniteContentResponseCopyWith(InfiniteContentResponse value,
          $Res Function(InfiniteContentResponse) then) =
      _$InfiniteContentResponseCopyWithImpl<$Res, InfiniteContentResponse>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, InfiniteContentData data});

  $InfiniteContentDataCopyWith<$Res> get data;
}

/// @nodoc
class _$InfiniteContentResponseCopyWithImpl<$Res,
        $Val extends InfiniteContentResponse>
    implements $InfiniteContentResponseCopyWith<$Res> {
  _$InfiniteContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfiniteContentResponse
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
              as InfiniteContentData,
    ) as $Val);
  }

  /// Create a copy of InfiniteContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfiniteContentDataCopyWith<$Res> get data {
    return $InfiniteContentDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfiniteContentResponseImplCopyWith<$Res>
    implements $InfiniteContentResponseCopyWith<$Res> {
  factory _$$InfiniteContentResponseImplCopyWith(
          _$InfiniteContentResponseImpl value,
          $Res Function(_$InfiniteContentResponseImpl) then) =
      __$$InfiniteContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, InfiniteContentData data});

  @override
  $InfiniteContentDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$InfiniteContentResponseImplCopyWithImpl<$Res>
    extends _$InfiniteContentResponseCopyWithImpl<$Res,
        _$InfiniteContentResponseImpl>
    implements _$$InfiniteContentResponseImplCopyWith<$Res> {
  __$$InfiniteContentResponseImplCopyWithImpl(
      _$InfiniteContentResponseImpl _value,
      $Res Function(_$InfiniteContentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfiniteContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$InfiniteContentResponseImpl(
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
              as InfiniteContentData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfiniteContentResponseImpl implements _InfiniteContentResponse {
  const _$InfiniteContentResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$InfiniteContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfiniteContentResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final InfiniteContentData data;

  @override
  String toString() {
    return 'InfiniteContentResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteContentResponseImpl &&
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

  /// Create a copy of InfiniteContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteContentResponseImplCopyWith<_$InfiniteContentResponseImpl>
      get copyWith => __$$InfiniteContentResponseImplCopyWithImpl<
          _$InfiniteContentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfiniteContentResponseImplToJson(
      this,
    );
  }
}

abstract class _InfiniteContentResponse implements InfiniteContentResponse {
  const factory _InfiniteContentResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final InfiniteContentData data}) = _$InfiniteContentResponseImpl;

  factory _InfiniteContentResponse.fromJson(Map<String, dynamic> json) =
      _$InfiniteContentResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  InfiniteContentData get data;

  /// Create a copy of InfiniteContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfiniteContentResponseImplCopyWith<_$InfiniteContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InfiniteContentData _$InfiniteContentDataFromJson(Map<String, dynamic> json) {
  return _InfiniteContentData.fromJson(json);
}

/// @nodoc
mixin _$InfiniteContentData {
  String get message => throw _privateConstructorUsedError;
  List<InfiniteContentItem> get content => throw _privateConstructorUsedError;

  /// Serializes this InfiniteContentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfiniteContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfiniteContentDataCopyWith<InfiniteContentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteContentDataCopyWith<$Res> {
  factory $InfiniteContentDataCopyWith(
          InfiniteContentData value, $Res Function(InfiniteContentData) then) =
      _$InfiniteContentDataCopyWithImpl<$Res, InfiniteContentData>;
  @useResult
  $Res call({String message, List<InfiniteContentItem> content});
}

/// @nodoc
class _$InfiniteContentDataCopyWithImpl<$Res, $Val extends InfiniteContentData>
    implements $InfiniteContentDataCopyWith<$Res> {
  _$InfiniteContentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfiniteContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<InfiniteContentItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfiniteContentDataImplCopyWith<$Res>
    implements $InfiniteContentDataCopyWith<$Res> {
  factory _$$InfiniteContentDataImplCopyWith(_$InfiniteContentDataImpl value,
          $Res Function(_$InfiniteContentDataImpl) then) =
      __$$InfiniteContentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<InfiniteContentItem> content});
}

/// @nodoc
class __$$InfiniteContentDataImplCopyWithImpl<$Res>
    extends _$InfiniteContentDataCopyWithImpl<$Res, _$InfiniteContentDataImpl>
    implements _$$InfiniteContentDataImplCopyWith<$Res> {
  __$$InfiniteContentDataImplCopyWithImpl(_$InfiniteContentDataImpl _value,
      $Res Function(_$InfiniteContentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfiniteContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? content = null,
  }) {
    return _then(_$InfiniteContentDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<InfiniteContentItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfiniteContentDataImpl implements _InfiniteContentData {
  const _$InfiniteContentDataImpl(
      {required this.message, required final List<InfiniteContentItem> content})
      : _content = content;

  factory _$InfiniteContentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfiniteContentDataImplFromJson(json);

  @override
  final String message;
  final List<InfiniteContentItem> _content;
  @override
  List<InfiniteContentItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'InfiniteContentData(message: $message, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteContentDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_content));

  /// Create a copy of InfiniteContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteContentDataImplCopyWith<_$InfiniteContentDataImpl> get copyWith =>
      __$$InfiniteContentDataImplCopyWithImpl<_$InfiniteContentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfiniteContentDataImplToJson(
      this,
    );
  }
}

abstract class _InfiniteContentData implements InfiniteContentData {
  const factory _InfiniteContentData(
          {required final String message,
          required final List<InfiniteContentItem> content}) =
      _$InfiniteContentDataImpl;

  factory _InfiniteContentData.fromJson(Map<String, dynamic> json) =
      _$InfiniteContentDataImpl.fromJson;

  @override
  String get message;
  @override
  List<InfiniteContentItem> get content;

  /// Create a copy of InfiniteContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfiniteContentDataImplCopyWith<_$InfiniteContentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfiniteContentItem _$InfiniteContentItemFromJson(Map<String, dynamic> json) {
  return _InfiniteContentItem.fromJson(json);
}

/// @nodoc
mixin _$InfiniteContentItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  AthleteInfinite? get athlete => throw _privateConstructorUsedError;
  CategoryInfinite? get category => throw _privateConstructorUsedError;
  BrandInfinite? get brand => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  /// Serializes this InfiniteContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfiniteContentItemCopyWith<InfiniteContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteContentItemCopyWith<$Res> {
  factory $InfiniteContentItemCopyWith(
          InfiniteContentItem value, $Res Function(InfiniteContentItem) then) =
      _$InfiniteContentItemCopyWithImpl<$Res, InfiniteContentItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String? publishedAt,
      AthleteInfinite? athlete,
      CategoryInfinite? category,
      BrandInfinite? brand,
      int likesCount,
      int commentsCount,
      bool isLiked});

  $AthleteInfiniteCopyWith<$Res>? get athlete;
  $CategoryInfiniteCopyWith<$Res>? get category;
  $BrandInfiniteCopyWith<$Res>? get brand;
}

/// @nodoc
class _$InfiniteContentItemCopyWithImpl<$Res, $Val extends InfiniteContentItem>
    implements $InfiniteContentItemCopyWith<$Res> {
  _$InfiniteContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? caption = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? publishedAt = freezed,
    Object? athlete = freezed,
    Object? category = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
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
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
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
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteInfinite?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfinite?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandInfinite?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteInfiniteCopyWith<$Res>? get athlete {
    if (_value.athlete == null) {
      return null;
    }

    return $AthleteInfiniteCopyWith<$Res>(_value.athlete!, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryInfiniteCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryInfiniteCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandInfiniteCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandInfiniteCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfiniteContentItemImplCopyWith<$Res>
    implements $InfiniteContentItemCopyWith<$Res> {
  factory _$$InfiniteContentItemImplCopyWith(_$InfiniteContentItemImpl value,
          $Res Function(_$InfiniteContentItemImpl) then) =
      __$$InfiniteContentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String? publishedAt,
      AthleteInfinite? athlete,
      CategoryInfinite? category,
      BrandInfinite? brand,
      int likesCount,
      int commentsCount,
      bool isLiked});

  @override
  $AthleteInfiniteCopyWith<$Res>? get athlete;
  @override
  $CategoryInfiniteCopyWith<$Res>? get category;
  @override
  $BrandInfiniteCopyWith<$Res>? get brand;
}

/// @nodoc
class __$$InfiniteContentItemImplCopyWithImpl<$Res>
    extends _$InfiniteContentItemCopyWithImpl<$Res, _$InfiniteContentItemImpl>
    implements _$$InfiniteContentItemImplCopyWith<$Res> {
  __$$InfiniteContentItemImplCopyWithImpl(_$InfiniteContentItemImpl _value,
      $Res Function(_$InfiniteContentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? caption = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? mediaType = freezed,
    Object? publishedAt = freezed,
    Object? athlete = freezed,
    Object? category = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = null,
  }) {
    return _then(_$InfiniteContentItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
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
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteInfinite?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfinite?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandInfinite?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfiniteContentItemImpl implements _InfiniteContentItem {
  const _$InfiniteContentItemImpl(
      {required this.id,
      required this.title,
      required this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.mediaType,
      this.publishedAt,
      this.athlete,
      this.category,
      this.brand,
      required this.likesCount,
      required this.commentsCount,
      required this.isLiked});

  factory _$InfiniteContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfiniteContentItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String caption;
  @override
  final String mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? mediaType;
  @override
  final String? publishedAt;
  @override
  final AthleteInfinite? athlete;
  @override
  final CategoryInfinite? category;
  @override
  final BrandInfinite? brand;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  @override
  final bool isLiked;

  @override
  String toString() {
    return 'InfiniteContentItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, mediaType: $mediaType, publishedAt: $publishedAt, athlete: $athlete, category: $category, brand: $brand, likesCount: $likesCount, commentsCount: $commentsCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteContentItemImpl &&
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
                other.commentsCount == commentsCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
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
      commentsCount,
      isLiked);

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteContentItemImplCopyWith<_$InfiniteContentItemImpl> get copyWith =>
      __$$InfiniteContentItemImplCopyWithImpl<_$InfiniteContentItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfiniteContentItemImplToJson(
      this,
    );
  }
}

abstract class _InfiniteContentItem implements InfiniteContentItem {
  const factory _InfiniteContentItem(
      {required final String id,
      required final String title,
      required final String caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? mediaType,
      final String? publishedAt,
      final AthleteInfinite? athlete,
      final CategoryInfinite? category,
      final BrandInfinite? brand,
      required final int likesCount,
      required final int commentsCount,
      required final bool isLiked}) = _$InfiniteContentItemImpl;

  factory _InfiniteContentItem.fromJson(Map<String, dynamic> json) =
      _$InfiniteContentItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get caption;
  @override
  String get mediaUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get mediaType;
  @override
  String? get publishedAt;
  @override
  AthleteInfinite? get athlete;
  @override
  CategoryInfinite? get category;
  @override
  BrandInfinite? get brand;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  bool get isLiked;

  /// Create a copy of InfiniteContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfiniteContentItemImplCopyWith<_$InfiniteContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AthleteInfinite _$AthleteInfiniteFromJson(Map<String, dynamic> json) {
  return _AthleteInfinite.fromJson(json);
}

/// @nodoc
mixin _$AthleteInfinite {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this AthleteInfinite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteInfiniteCopyWith<AthleteInfinite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteInfiniteCopyWith<$Res> {
  factory $AthleteInfiniteCopyWith(
          AthleteInfinite value, $Res Function(AthleteInfinite) then) =
      _$AthleteInfiniteCopyWithImpl<$Res, AthleteInfinite>;
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class _$AthleteInfiniteCopyWithImpl<$Res, $Val extends AthleteInfinite>
    implements $AthleteInfiniteCopyWith<$Res> {
  _$AthleteInfiniteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteInfinite
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
abstract class _$$AthleteInfiniteImplCopyWith<$Res>
    implements $AthleteInfiniteCopyWith<$Res> {
  factory _$$AthleteInfiniteImplCopyWith(_$AthleteInfiniteImpl value,
          $Res Function(_$AthleteInfiniteImpl) then) =
      __$$AthleteInfiniteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class __$$AthleteInfiniteImplCopyWithImpl<$Res>
    extends _$AthleteInfiniteCopyWithImpl<$Res, _$AthleteInfiniteImpl>
    implements _$$AthleteInfiniteImplCopyWith<$Res> {
  __$$AthleteInfiniteImplCopyWithImpl(
      _$AthleteInfiniteImpl _value, $Res Function(_$AthleteInfiniteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteInfinite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = null,
  }) {
    return _then(_$AthleteInfiniteImpl(
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
class _$AthleteInfiniteImpl implements _AthleteInfinite {
  const _$AthleteInfiniteImpl(
      {required this.id, required this.name, required this.profilePicture});

  factory _$AthleteInfiniteImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteInfiniteImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'AthleteInfinite(id: $id, name: $name, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteInfiniteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture);

  /// Create a copy of AthleteInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteInfiniteImplCopyWith<_$AthleteInfiniteImpl> get copyWith =>
      __$$AthleteInfiniteImplCopyWithImpl<_$AthleteInfiniteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteInfiniteImplToJson(
      this,
    );
  }
}

abstract class _AthleteInfinite implements AthleteInfinite {
  const factory _AthleteInfinite(
      {required final String id,
      required final String name,
      required final String profilePicture}) = _$AthleteInfiniteImpl;

  factory _AthleteInfinite.fromJson(Map<String, dynamic> json) =
      _$AthleteInfiniteImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get profilePicture;

  /// Create a copy of AthleteInfinite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteInfiniteImplCopyWith<_$AthleteInfiniteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryInfinite _$CategoryInfiniteFromJson(Map<String, dynamic> json) {
  return _CategoryInfinite.fromJson(json);
}

/// @nodoc
mixin _$CategoryInfinite {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageData => throw _privateConstructorUsedError;

  /// Serializes this CategoryInfinite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryInfiniteCopyWith<CategoryInfinite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfiniteCopyWith<$Res> {
  factory $CategoryInfiniteCopyWith(
          CategoryInfinite value, $Res Function(CategoryInfinite) then) =
      _$CategoryInfiniteCopyWithImpl<$Res, CategoryInfinite>;
  @useResult
  $Res call({String? id, String? name, String? imageData});
}

/// @nodoc
class _$CategoryInfiniteCopyWithImpl<$Res, $Val extends CategoryInfinite>
    implements $CategoryInfiniteCopyWith<$Res> {
  _$CategoryInfiniteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryInfinite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryInfiniteImplCopyWith<$Res>
    implements $CategoryInfiniteCopyWith<$Res> {
  factory _$$CategoryInfiniteImplCopyWith(_$CategoryInfiniteImpl value,
          $Res Function(_$CategoryInfiniteImpl) then) =
      __$$CategoryInfiniteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? imageData});
}

/// @nodoc
class __$$CategoryInfiniteImplCopyWithImpl<$Res>
    extends _$CategoryInfiniteCopyWithImpl<$Res, _$CategoryInfiniteImpl>
    implements _$$CategoryInfiniteImplCopyWith<$Res> {
  __$$CategoryInfiniteImplCopyWithImpl(_$CategoryInfiniteImpl _value,
      $Res Function(_$CategoryInfiniteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInfinite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_$CategoryInfiniteImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryInfiniteImpl implements _CategoryInfinite {
  const _$CategoryInfiniteImpl({this.id, this.name, this.imageData});

  factory _$CategoryInfiniteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryInfiniteImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? imageData;

  @override
  String toString() {
    return 'CategoryInfinite(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryInfiniteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of CategoryInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryInfiniteImplCopyWith<_$CategoryInfiniteImpl> get copyWith =>
      __$$CategoryInfiniteImplCopyWithImpl<_$CategoryInfiniteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryInfiniteImplToJson(
      this,
    );
  }
}

abstract class _CategoryInfinite implements CategoryInfinite {
  const factory _CategoryInfinite(
      {final String? id,
      final String? name,
      final String? imageData}) = _$CategoryInfiniteImpl;

  factory _CategoryInfinite.fromJson(Map<String, dynamic> json) =
      _$CategoryInfiniteImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get imageData;

  /// Create a copy of CategoryInfinite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryInfiniteImplCopyWith<_$CategoryInfiniteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandInfinite _$BrandInfiniteFromJson(Map<String, dynamic> json) {
  return _BrandInfinite.fromJson(json);
}

/// @nodoc
mixin _$BrandInfinite {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageData => throw _privateConstructorUsedError;

  /// Serializes this BrandInfinite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandInfiniteCopyWith<BrandInfinite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandInfiniteCopyWith<$Res> {
  factory $BrandInfiniteCopyWith(
          BrandInfinite value, $Res Function(BrandInfinite) then) =
      _$BrandInfiniteCopyWithImpl<$Res, BrandInfinite>;
  @useResult
  $Res call({String? id, String? name, String? imageData});
}

/// @nodoc
class _$BrandInfiniteCopyWithImpl<$Res, $Val extends BrandInfinite>
    implements $BrandInfiniteCopyWith<$Res> {
  _$BrandInfiniteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandInfinite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandInfiniteImplCopyWith<$Res>
    implements $BrandInfiniteCopyWith<$Res> {
  factory _$$BrandInfiniteImplCopyWith(
          _$BrandInfiniteImpl value, $Res Function(_$BrandInfiniteImpl) then) =
      __$$BrandInfiniteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? imageData});
}

/// @nodoc
class __$$BrandInfiniteImplCopyWithImpl<$Res>
    extends _$BrandInfiniteCopyWithImpl<$Res, _$BrandInfiniteImpl>
    implements _$$BrandInfiniteImplCopyWith<$Res> {
  __$$BrandInfiniteImplCopyWithImpl(
      _$BrandInfiniteImpl _value, $Res Function(_$BrandInfiniteImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandInfinite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageData = freezed,
  }) {
    return _then(_$BrandInfiniteImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandInfiniteImpl implements _BrandInfinite {
  const _$BrandInfiniteImpl({this.id, this.name, this.imageData});

  factory _$BrandInfiniteImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandInfiniteImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? imageData;

  @override
  String toString() {
    return 'BrandInfinite(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandInfiniteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of BrandInfinite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandInfiniteImplCopyWith<_$BrandInfiniteImpl> get copyWith =>
      __$$BrandInfiniteImplCopyWithImpl<_$BrandInfiniteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandInfiniteImplToJson(
      this,
    );
  }
}

abstract class _BrandInfinite implements BrandInfinite {
  const factory _BrandInfinite(
      {final String? id,
      final String? name,
      final String? imageData}) = _$BrandInfiniteImpl;

  factory _BrandInfinite.fromJson(Map<String, dynamic> json) =
      _$BrandInfiniteImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get imageData;

  /// Create a copy of BrandInfinite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandInfiniteImplCopyWith<_$BrandInfiniteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

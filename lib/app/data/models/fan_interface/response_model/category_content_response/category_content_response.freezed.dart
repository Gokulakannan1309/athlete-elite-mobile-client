// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryContentResponse _$CategoryContentResponseFromJson(
    Map<String, dynamic> json) {
  return _CategoryContentResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryContentResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CategoryContentData get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryContentResponseCopyWith<CategoryContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContentResponseCopyWith<$Res> {
  factory $CategoryContentResponseCopyWith(CategoryContentResponse value,
          $Res Function(CategoryContentResponse) then) =
      _$CategoryContentResponseCopyWithImpl<$Res, CategoryContentResponse>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, CategoryContentData data});

  $CategoryContentDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CategoryContentResponseCopyWithImpl<$Res,
        $Val extends CategoryContentResponse>
    implements $CategoryContentResponseCopyWith<$Res> {
  _$CategoryContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryContentResponse
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
              as CategoryContentData,
    ) as $Val);
  }

  /// Create a copy of CategoryContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryContentDataCopyWith<$Res> get data {
    return $CategoryContentDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryContentResponseImplCopyWith<$Res>
    implements $CategoryContentResponseCopyWith<$Res> {
  factory _$$CategoryContentResponseImplCopyWith(
          _$CategoryContentResponseImpl value,
          $Res Function(_$CategoryContentResponseImpl) then) =
      __$$CategoryContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, CategoryContentData data});

  @override
  $CategoryContentDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CategoryContentResponseImplCopyWithImpl<$Res>
    extends _$CategoryContentResponseCopyWithImpl<$Res,
        _$CategoryContentResponseImpl>
    implements _$$CategoryContentResponseImplCopyWith<$Res> {
  __$$CategoryContentResponseImplCopyWithImpl(
      _$CategoryContentResponseImpl _value,
      $Res Function(_$CategoryContentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CategoryContentResponseImpl(
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
              as CategoryContentData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryContentResponseImpl implements _CategoryContentResponse {
  const _$CategoryContentResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$CategoryContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryContentResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final CategoryContentData data;

  @override
  String toString() {
    return 'CategoryContentResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryContentResponseImpl &&
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

  /// Create a copy of CategoryContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryContentResponseImplCopyWith<_$CategoryContentResponseImpl>
      get copyWith => __$$CategoryContentResponseImplCopyWithImpl<
          _$CategoryContentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryContentResponseImplToJson(
      this,
    );
  }
}

abstract class _CategoryContentResponse implements CategoryContentResponse {
  const factory _CategoryContentResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final CategoryContentData data}) = _$CategoryContentResponseImpl;

  factory _CategoryContentResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryContentResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  CategoryContentData get data;

  /// Create a copy of CategoryContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryContentResponseImplCopyWith<_$CategoryContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryContentData _$CategoryContentDataFromJson(Map<String, dynamic> json) {
  return _CategoryContentData.fromJson(json);
}

/// @nodoc
mixin _$CategoryContentData {
  String get message => throw _privateConstructorUsedError;
  CategoryInfo get category => throw _privateConstructorUsedError;
  List<ContentItem> get content => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this CategoryContentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryContentDataCopyWith<CategoryContentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContentDataCopyWith<$Res> {
  factory $CategoryContentDataCopyWith(
          CategoryContentData value, $Res Function(CategoryContentData) then) =
      _$CategoryContentDataCopyWithImpl<$Res, CategoryContentData>;
  @useResult
  $Res call(
      {String message,
      CategoryInfo category,
      List<ContentItem> content,
      Pagination pagination});

  $CategoryInfoCopyWith<$Res> get category;
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$CategoryContentDataCopyWithImpl<$Res, $Val extends CategoryContentData>
    implements $CategoryContentDataCopyWith<$Res> {
  _$CategoryContentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? category = null,
    Object? content = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfo,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryInfoCopyWith<$Res> get category {
    return $CategoryInfoCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of CategoryContentData
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
abstract class _$$CategoryContentDataImplCopyWith<$Res>
    implements $CategoryContentDataCopyWith<$Res> {
  factory _$$CategoryContentDataImplCopyWith(_$CategoryContentDataImpl value,
          $Res Function(_$CategoryContentDataImpl) then) =
      __$$CategoryContentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      CategoryInfo category,
      List<ContentItem> content,
      Pagination pagination});

  @override
  $CategoryInfoCopyWith<$Res> get category;
  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$CategoryContentDataImplCopyWithImpl<$Res>
    extends _$CategoryContentDataCopyWithImpl<$Res, _$CategoryContentDataImpl>
    implements _$$CategoryContentDataImplCopyWith<$Res> {
  __$$CategoryContentDataImplCopyWithImpl(_$CategoryContentDataImpl _value,
      $Res Function(_$CategoryContentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? category = null,
    Object? content = null,
    Object? pagination = null,
  }) {
    return _then(_$CategoryContentDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfo,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryContentDataImpl implements _CategoryContentData {
  const _$CategoryContentDataImpl(
      {required this.message,
      required this.category,
      required final List<ContentItem> content,
      required this.pagination})
      : _content = content;

  factory _$CategoryContentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryContentDataImplFromJson(json);

  @override
  final String message;
  @override
  final CategoryInfo category;
  final List<ContentItem> _content;
  @override
  List<ContentItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'CategoryContentData(message: $message, category: $category, content: $content, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryContentDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, category,
      const DeepCollectionEquality().hash(_content), pagination);

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryContentDataImplCopyWith<_$CategoryContentDataImpl> get copyWith =>
      __$$CategoryContentDataImplCopyWithImpl<_$CategoryContentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryContentDataImplToJson(
      this,
    );
  }
}

abstract class _CategoryContentData implements CategoryContentData {
  const factory _CategoryContentData(
      {required final String message,
      required final CategoryInfo category,
      required final List<ContentItem> content,
      required final Pagination pagination}) = _$CategoryContentDataImpl;

  factory _CategoryContentData.fromJson(Map<String, dynamic> json) =
      _$CategoryContentDataImpl.fromJson;

  @override
  String get message;
  @override
  CategoryInfo get category;
  @override
  List<ContentItem> get content;
  @override
  Pagination get pagination;

  /// Create a copy of CategoryContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryContentDataImplCopyWith<_$CategoryContentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryInfo _$CategoryInfoFromJson(Map<String, dynamic> json) {
  return _CategoryInfo.fromJson(json);
}

/// @nodoc
mixin _$CategoryInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "imageData")
  String get imageData => throw _privateConstructorUsedError;

  /// Serializes this CategoryInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryInfoCopyWith<CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfoCopyWith<$Res> {
  factory $CategoryInfoCopyWith(
          CategoryInfo value, $Res Function(CategoryInfo) then) =
      _$CategoryInfoCopyWithImpl<$Res, CategoryInfo>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: "imageData") String imageData});
}

/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res, $Val extends CategoryInfo>
    implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageData = null,
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
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryInfoImplCopyWith<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  factory _$$CategoryInfoImplCopyWith(
          _$CategoryInfoImpl value, $Res Function(_$CategoryInfoImpl) then) =
      __$$CategoryInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: "imageData") String imageData});
}

/// @nodoc
class __$$CategoryInfoImplCopyWithImpl<$Res>
    extends _$CategoryInfoCopyWithImpl<$Res, _$CategoryInfoImpl>
    implements _$$CategoryInfoImplCopyWith<$Res> {
  __$$CategoryInfoImplCopyWithImpl(
      _$CategoryInfoImpl _value, $Res Function(_$CategoryInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageData = null,
  }) {
    return _then(_$CategoryInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: null == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryInfoImpl implements _CategoryInfo {
  const _$CategoryInfoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "imageData") required this.imageData});

  factory _$CategoryInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: "imageData")
  final String imageData;

  @override
  String toString() {
    return 'CategoryInfo(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryInfoImplCopyWith<_$CategoryInfoImpl> get copyWith =>
      __$$CategoryInfoImplCopyWithImpl<_$CategoryInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryInfoImplToJson(
      this,
    );
  }
}

abstract class _CategoryInfo implements CategoryInfo {
  const factory _CategoryInfo(
          {required final String id,
          required final String name,
          @JsonKey(name: "imageData") required final String imageData}) =
      _$CategoryInfoImpl;

  factory _CategoryInfo.fromJson(Map<String, dynamic> json) =
      _$CategoryInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "imageData")
  String get imageData;

  /// Create a copy of CategoryInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryInfoImplCopyWith<_$CategoryInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentItem _$ContentItemFromJson(Map<String, dynamic> json) {
  return _ContentItem.fromJson(json);
}

/// @nodoc
mixin _$ContentItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String get publishedAt =>
      throw _privateConstructorUsedError; // MATCH THE API EXACTLY
  @JsonKey(name: "athlete")
  AthleteData? get athlete => throw _privateConstructorUsedError;
  @JsonKey(name: "brand")
  BrandData? get brand => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this ContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentItemCopyWith<ContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentItemCopyWith<$Res> {
  factory $ContentItemCopyWith(
          ContentItem value, $Res Function(ContentItem) then) =
      _$ContentItemCopyWithImpl<$Res, ContentItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String publishedAt,
      @JsonKey(name: "athlete") AthleteData? athlete,
      @JsonKey(name: "brand") BrandData? brand,
      int likesCount,
      bool isLiked,
      int commentsCount});

  $AthleteDataCopyWith<$Res>? get athlete;
  $BrandDataCopyWith<$Res>? get brand;
}

/// @nodoc
class _$ContentItemCopyWithImpl<$Res, $Val extends ContentItem>
    implements $ContentItemCopyWith<$Res> {
  _$ContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentItem
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
    Object? publishedAt = null,
    Object? athlete = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? commentsCount = null,
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
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteData?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandData?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteDataCopyWith<$Res>? get athlete {
    if (_value.athlete == null) {
      return null;
    }

    return $AthleteDataCopyWith<$Res>(_value.athlete!, (value) {
      return _then(_value.copyWith(athlete: value) as $Val);
    });
  }

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandDataCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandDataCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentItemImplCopyWith<$Res>
    implements $ContentItemCopyWith<$Res> {
  factory _$$ContentItemImplCopyWith(
          _$ContentItemImpl value, $Res Function(_$ContentItemImpl) then) =
      __$$ContentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? mediaType,
      String publishedAt,
      @JsonKey(name: "athlete") AthleteData? athlete,
      @JsonKey(name: "brand") BrandData? brand,
      int likesCount,
      bool isLiked,
      int commentsCount});

  @override
  $AthleteDataCopyWith<$Res>? get athlete;
  @override
  $BrandDataCopyWith<$Res>? get brand;
}

/// @nodoc
class __$$ContentItemImplCopyWithImpl<$Res>
    extends _$ContentItemCopyWithImpl<$Res, _$ContentItemImpl>
    implements _$$ContentItemImplCopyWith<$Res> {
  __$$ContentItemImplCopyWithImpl(
      _$ContentItemImpl _value, $Res Function(_$ContentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentItem
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
    Object? publishedAt = null,
    Object? athlete = freezed,
    Object? brand = freezed,
    Object? likesCount = null,
    Object? isLiked = null,
    Object? commentsCount = null,
  }) {
    return _then(_$ContentItemImpl(
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
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      athlete: freezed == athlete
          ? _value.athlete
          : athlete // ignore: cast_nullable_to_non_nullable
              as AthleteData?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandData?,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentItemImpl implements _ContentItem {
  const _$ContentItemImpl(
      {required this.id,
      required this.title,
      required this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.mediaType,
      required this.publishedAt,
      @JsonKey(name: "athlete") this.athlete,
      @JsonKey(name: "brand") this.brand,
      required this.likesCount,
      required this.isLiked,
      required this.commentsCount});

  factory _$ContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentItemImplFromJson(json);

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
  final String publishedAt;
// MATCH THE API EXACTLY
  @override
  @JsonKey(name: "athlete")
  final AthleteData? athlete;
  @override
  @JsonKey(name: "brand")
  final BrandData? brand;
  @override
  final int likesCount;
  @override
  final bool isLiked;
  @override
  final int commentsCount;

  @override
  String toString() {
    return 'ContentItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, mediaType: $mediaType, publishedAt: $publishedAt, athlete: $athlete, brand: $brand, likesCount: $likesCount, isLiked: $isLiked, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentItemImpl &&
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
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
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
      brand,
      likesCount,
      isLiked,
      commentsCount);

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      __$$ContentItemImplCopyWithImpl<_$ContentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentItemImplToJson(
      this,
    );
  }
}

abstract class _ContentItem implements ContentItem {
  const factory _ContentItem(
      {required final String id,
      required final String title,
      required final String caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? mediaType,
      required final String publishedAt,
      @JsonKey(name: "athlete") final AthleteData? athlete,
      @JsonKey(name: "brand") final BrandData? brand,
      required final int likesCount,
      required final bool isLiked,
      required final int commentsCount}) = _$ContentItemImpl;

  factory _ContentItem.fromJson(Map<String, dynamic> json) =
      _$ContentItemImpl.fromJson;

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
  String get publishedAt; // MATCH THE API EXACTLY
  @override
  @JsonKey(name: "athlete")
  AthleteData? get athlete;
  @override
  @JsonKey(name: "brand")
  BrandData? get brand;
  @override
  int get likesCount;
  @override
  bool get isLiked;
  @override
  int get commentsCount;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AthleteData _$AthleteDataFromJson(Map<String, dynamic> json) {
  return _AthleteData.fromJson(json);
}

/// @nodoc
mixin _$AthleteData {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this AthleteData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AthleteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AthleteDataCopyWith<AthleteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AthleteDataCopyWith<$Res> {
  factory $AthleteDataCopyWith(
          AthleteData value, $Res Function(AthleteData) then) =
      _$AthleteDataCopyWithImpl<$Res, AthleteData>;
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class _$AthleteDataCopyWithImpl<$Res, $Val extends AthleteData>
    implements $AthleteDataCopyWith<$Res> {
  _$AthleteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AthleteData
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
abstract class _$$AthleteDataImplCopyWith<$Res>
    implements $AthleteDataCopyWith<$Res> {
  factory _$$AthleteDataImplCopyWith(
          _$AthleteDataImpl value, $Res Function(_$AthleteDataImpl) then) =
      __$$AthleteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String profilePicture});
}

/// @nodoc
class __$$AthleteDataImplCopyWithImpl<$Res>
    extends _$AthleteDataCopyWithImpl<$Res, _$AthleteDataImpl>
    implements _$$AthleteDataImplCopyWith<$Res> {
  __$$AthleteDataImplCopyWithImpl(
      _$AthleteDataImpl _value, $Res Function(_$AthleteDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AthleteData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profilePicture = null,
  }) {
    return _then(_$AthleteDataImpl(
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
class _$AthleteDataImpl implements _AthleteData {
  const _$AthleteDataImpl(
      {required this.id, required this.name, required this.profilePicture});

  factory _$AthleteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AthleteDataImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'AthleteData(id: $id, name: $name, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AthleteDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profilePicture);

  /// Create a copy of AthleteData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AthleteDataImplCopyWith<_$AthleteDataImpl> get copyWith =>
      __$$AthleteDataImplCopyWithImpl<_$AthleteDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AthleteDataImplToJson(
      this,
    );
  }
}

abstract class _AthleteData implements AthleteData {
  const factory _AthleteData(
      {required final String id,
      required final String name,
      required final String profilePicture}) = _$AthleteDataImpl;

  factory _AthleteData.fromJson(Map<String, dynamic> json) =
      _$AthleteDataImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get profilePicture;

  /// Create a copy of AthleteData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AthleteDataImplCopyWith<_$AthleteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandData _$BrandDataFromJson(Map<String, dynamic> json) {
  return _BrandData.fromJson(json);
}

/// @nodoc
mixin _$BrandData {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageData => throw _privateConstructorUsedError;

  /// Serializes this BrandData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandDataCopyWith<BrandData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandDataCopyWith<$Res> {
  factory $BrandDataCopyWith(BrandData value, $Res Function(BrandData) then) =
      _$BrandDataCopyWithImpl<$Res, BrandData>;
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class _$BrandDataCopyWithImpl<$Res, $Val extends BrandData>
    implements $BrandDataCopyWith<$Res> {
  _$BrandDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandData
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
abstract class _$$BrandDataImplCopyWith<$Res>
    implements $BrandDataCopyWith<$Res> {
  factory _$$BrandDataImplCopyWith(
          _$BrandDataImpl value, $Res Function(_$BrandDataImpl) then) =
      __$$BrandDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, String? imageData});
}

/// @nodoc
class __$$BrandDataImplCopyWithImpl<$Res>
    extends _$BrandDataCopyWithImpl<$Res, _$BrandDataImpl>
    implements _$$BrandDataImplCopyWith<$Res> {
  __$$BrandDataImplCopyWithImpl(
      _$BrandDataImpl _value, $Res Function(_$BrandDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageData = freezed,
  }) {
    return _then(_$BrandDataImpl(
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
class _$BrandDataImpl implements _BrandData {
  const _$BrandDataImpl({this.id, required this.name, this.imageData});

  factory _$BrandDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? imageData;

  @override
  String toString() {
    return 'BrandData(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of BrandData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandDataImplCopyWith<_$BrandDataImpl> get copyWith =>
      __$$BrandDataImplCopyWithImpl<_$BrandDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandDataImplToJson(
      this,
    );
  }
}

abstract class _BrandData implements BrandData {
  const factory _BrandData(
      {final String? id,
      required final String name,
      final String? imageData}) = _$BrandDataImpl;

  factory _BrandData.fromJson(Map<String, dynamic> json) =
      _$BrandDataImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get imageData;

  /// Create a copy of BrandData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandDataImplCopyWith<_$BrandDataImpl> get copyWith =>
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

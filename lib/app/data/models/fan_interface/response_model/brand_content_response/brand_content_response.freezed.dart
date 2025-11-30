// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BrandContentResponse _$BrandContentResponseFromJson(Map<String, dynamic> json) {
  return _BrandContentResponse.fromJson(json);
}

/// @nodoc
mixin _$BrandContentResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BrandContentData get data => throw _privateConstructorUsedError;

  /// Serializes this BrandContentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandContentResponseCopyWith<BrandContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandContentResponseCopyWith<$Res> {
  factory $BrandContentResponseCopyWith(BrandContentResponse value,
          $Res Function(BrandContentResponse) then) =
      _$BrandContentResponseCopyWithImpl<$Res, BrandContentResponse>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, BrandContentData data});

  $BrandContentDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BrandContentResponseCopyWithImpl<$Res,
        $Val extends BrandContentResponse>
    implements $BrandContentResponseCopyWith<$Res> {
  _$BrandContentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandContentResponse
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
              as BrandContentData,
    ) as $Val);
  }

  /// Create a copy of BrandContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandContentDataCopyWith<$Res> get data {
    return $BrandContentDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrandContentResponseImplCopyWith<$Res>
    implements $BrandContentResponseCopyWith<$Res> {
  factory _$$BrandContentResponseImplCopyWith(_$BrandContentResponseImpl value,
          $Res Function(_$BrandContentResponseImpl) then) =
      __$$BrandContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, BrandContentData data});

  @override
  $BrandContentDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BrandContentResponseImplCopyWithImpl<$Res>
    extends _$BrandContentResponseCopyWithImpl<$Res, _$BrandContentResponseImpl>
    implements _$$BrandContentResponseImplCopyWith<$Res> {
  __$$BrandContentResponseImplCopyWithImpl(_$BrandContentResponseImpl _value,
      $Res Function(_$BrandContentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$BrandContentResponseImpl(
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
              as BrandContentData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandContentResponseImpl implements _BrandContentResponse {
  const _$BrandContentResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$BrandContentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandContentResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final BrandContentData data;

  @override
  String toString() {
    return 'BrandContentResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandContentResponseImpl &&
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

  /// Create a copy of BrandContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandContentResponseImplCopyWith<_$BrandContentResponseImpl>
      get copyWith =>
          __$$BrandContentResponseImplCopyWithImpl<_$BrandContentResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandContentResponseImplToJson(
      this,
    );
  }
}

abstract class _BrandContentResponse implements BrandContentResponse {
  const factory _BrandContentResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final BrandContentData data}) = _$BrandContentResponseImpl;

  factory _BrandContentResponse.fromJson(Map<String, dynamic> json) =
      _$BrandContentResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  BrandContentData get data;

  /// Create a copy of BrandContentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandContentResponseImplCopyWith<_$BrandContentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BrandContentData _$BrandContentDataFromJson(Map<String, dynamic> json) {
  return _BrandContentData.fromJson(json);
}

/// @nodoc
mixin _$BrandContentData {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "brand")
  BrandInfo get brand => throw _privateConstructorUsedError;
  List<BrandContentItem> get content => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this BrandContentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandContentDataCopyWith<BrandContentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandContentDataCopyWith<$Res> {
  factory $BrandContentDataCopyWith(
          BrandContentData value, $Res Function(BrandContentData) then) =
      _$BrandContentDataCopyWithImpl<$Res, BrandContentData>;
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: "brand") BrandInfo brand,
      List<BrandContentItem> content,
      Pagination pagination});

  $BrandInfoCopyWith<$Res> get brand;
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$BrandContentDataCopyWithImpl<$Res, $Val extends BrandContentData>
    implements $BrandContentDataCopyWith<$Res> {
  _$BrandContentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? brand = null,
    Object? content = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandInfo,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<BrandContentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandInfoCopyWith<$Res> get brand {
    return $BrandInfoCopyWith<$Res>(_value.brand, (value) {
      return _then(_value.copyWith(brand: value) as $Val);
    });
  }

  /// Create a copy of BrandContentData
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
abstract class _$$BrandContentDataImplCopyWith<$Res>
    implements $BrandContentDataCopyWith<$Res> {
  factory _$$BrandContentDataImplCopyWith(_$BrandContentDataImpl value,
          $Res Function(_$BrandContentDataImpl) then) =
      __$$BrandContentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(name: "brand") BrandInfo brand,
      List<BrandContentItem> content,
      Pagination pagination});

  @override
  $BrandInfoCopyWith<$Res> get brand;
  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$BrandContentDataImplCopyWithImpl<$Res>
    extends _$BrandContentDataCopyWithImpl<$Res, _$BrandContentDataImpl>
    implements _$$BrandContentDataImplCopyWith<$Res> {
  __$$BrandContentDataImplCopyWithImpl(_$BrandContentDataImpl _value,
      $Res Function(_$BrandContentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? brand = null,
    Object? content = null,
    Object? pagination = null,
  }) {
    return _then(_$BrandContentDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandInfo,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<BrandContentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandContentDataImpl implements _BrandContentData {
  const _$BrandContentDataImpl(
      {required this.message,
      @JsonKey(name: "brand") required this.brand,
      required final List<BrandContentItem> content,
      required this.pagination})
      : _content = content;

  factory _$BrandContentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandContentDataImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey(name: "brand")
  final BrandInfo brand;
  final List<BrandContentItem> _content;
  @override
  List<BrandContentItem> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'BrandContentData(message: $message, brand: $brand, content: $content, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandContentDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, brand,
      const DeepCollectionEquality().hash(_content), pagination);

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandContentDataImplCopyWith<_$BrandContentDataImpl> get copyWith =>
      __$$BrandContentDataImplCopyWithImpl<_$BrandContentDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandContentDataImplToJson(
      this,
    );
  }
}

abstract class _BrandContentData implements BrandContentData {
  const factory _BrandContentData(
      {required final String message,
      @JsonKey(name: "brand") required final BrandInfo brand,
      required final List<BrandContentItem> content,
      required final Pagination pagination}) = _$BrandContentDataImpl;

  factory _BrandContentData.fromJson(Map<String, dynamic> json) =
      _$BrandContentDataImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: "brand")
  BrandInfo get brand;
  @override
  List<BrandContentItem> get content;
  @override
  Pagination get pagination;

  /// Create a copy of BrandContentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandContentDataImplCopyWith<_$BrandContentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandInfo _$BrandInfoFromJson(Map<String, dynamic> json) {
  return _BrandInfo.fromJson(json);
}

/// @nodoc
mixin _$BrandInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "imageData")
  String get imageData => throw _privateConstructorUsedError;

  /// Serializes this BrandInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandInfoCopyWith<BrandInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandInfoCopyWith<$Res> {
  factory $BrandInfoCopyWith(BrandInfo value, $Res Function(BrandInfo) then) =
      _$BrandInfoCopyWithImpl<$Res, BrandInfo>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: "imageData") String imageData});
}

/// @nodoc
class _$BrandInfoCopyWithImpl<$Res, $Val extends BrandInfo>
    implements $BrandInfoCopyWith<$Res> {
  _$BrandInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandInfo
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
abstract class _$$BrandInfoImplCopyWith<$Res>
    implements $BrandInfoCopyWith<$Res> {
  factory _$$BrandInfoImplCopyWith(
          _$BrandInfoImpl value, $Res Function(_$BrandInfoImpl) then) =
      __$$BrandInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(name: "imageData") String imageData});
}

/// @nodoc
class __$$BrandInfoImplCopyWithImpl<$Res>
    extends _$BrandInfoCopyWithImpl<$Res, _$BrandInfoImpl>
    implements _$$BrandInfoImplCopyWith<$Res> {
  __$$BrandInfoImplCopyWithImpl(
      _$BrandInfoImpl _value, $Res Function(_$BrandInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageData = null,
  }) {
    return _then(_$BrandInfoImpl(
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
class _$BrandInfoImpl implements _BrandInfo {
  const _$BrandInfoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "imageData") required this.imageData});

  factory _$BrandInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: "imageData")
  final String imageData;

  @override
  String toString() {
    return 'BrandInfo(id: $id, name: $name, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageData, imageData) ||
                other.imageData == imageData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageData);

  /// Create a copy of BrandInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandInfoImplCopyWith<_$BrandInfoImpl> get copyWith =>
      __$$BrandInfoImplCopyWithImpl<_$BrandInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandInfoImplToJson(
      this,
    );
  }
}

abstract class _BrandInfo implements BrandInfo {
  const factory _BrandInfo(
          {required final String id,
          required final String name,
          @JsonKey(name: "imageData") required final String imageData}) =
      _$BrandInfoImpl;

  factory _BrandInfo.fromJson(Map<String, dynamic> json) =
      _$BrandInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "imageData")
  String get imageData;

  /// Create a copy of BrandInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandInfoImplCopyWith<_$BrandInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandContentItem _$BrandContentItemFromJson(Map<String, dynamic> json) {
  return _BrandContentItem.fromJson(json);
}

/// @nodoc
mixin _$BrandContentItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String get publishedAt =>
      throw _privateConstructorUsedError; // athlete object
  @JsonKey(name: "athlete")
  AthleteData? get athlete =>
      throw _privateConstructorUsedError; // NEW: sportsAthlete (as requested)
  @JsonKey(name: "sportsAthlete")
  AthleteData? get sportsAthlete =>
      throw _privateConstructorUsedError; // category object inside content
  @JsonKey(name: "category")
  CategoryInfo? get category => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this BrandContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandContentItemCopyWith<BrandContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandContentItemCopyWith<$Res> {
  factory $BrandContentItemCopyWith(
          BrandContentItem value, $Res Function(BrandContentItem) then) =
      _$BrandContentItemCopyWithImpl<$Res, BrandContentItem>;
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
      @JsonKey(name: "sportsAthlete") AthleteData? sportsAthlete,
      @JsonKey(name: "category") CategoryInfo? category,
      int likesCount,
      int commentsCount});

  $AthleteDataCopyWith<$Res>? get athlete;
  $AthleteDataCopyWith<$Res>? get sportsAthlete;
  $CategoryInfoCopyWith<$Res>? get category;
}

/// @nodoc
class _$BrandContentItemCopyWithImpl<$Res, $Val extends BrandContentItem>
    implements $BrandContentItemCopyWith<$Res> {
  _$BrandContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandContentItem
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
    Object? sportsAthlete = freezed,
    Object? category = freezed,
    Object? likesCount = null,
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
      sportsAthlete: freezed == sportsAthlete
          ? _value.sportsAthlete
          : sportsAthlete // ignore: cast_nullable_to_non_nullable
              as AthleteData?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfo?,
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

  /// Create a copy of BrandContentItem
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

  /// Create a copy of BrandContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AthleteDataCopyWith<$Res>? get sportsAthlete {
    if (_value.sportsAthlete == null) {
      return null;
    }

    return $AthleteDataCopyWith<$Res>(_value.sportsAthlete!, (value) {
      return _then(_value.copyWith(sportsAthlete: value) as $Val);
    });
  }

  /// Create a copy of BrandContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryInfoCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryInfoCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrandContentItemImplCopyWith<$Res>
    implements $BrandContentItemCopyWith<$Res> {
  factory _$$BrandContentItemImplCopyWith(_$BrandContentItemImpl value,
          $Res Function(_$BrandContentItemImpl) then) =
      __$$BrandContentItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: "sportsAthlete") AthleteData? sportsAthlete,
      @JsonKey(name: "category") CategoryInfo? category,
      int likesCount,
      int commentsCount});

  @override
  $AthleteDataCopyWith<$Res>? get athlete;
  @override
  $AthleteDataCopyWith<$Res>? get sportsAthlete;
  @override
  $CategoryInfoCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BrandContentItemImplCopyWithImpl<$Res>
    extends _$BrandContentItemCopyWithImpl<$Res, _$BrandContentItemImpl>
    implements _$$BrandContentItemImplCopyWith<$Res> {
  __$$BrandContentItemImplCopyWithImpl(_$BrandContentItemImpl _value,
      $Res Function(_$BrandContentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandContentItem
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
    Object? sportsAthlete = freezed,
    Object? category = freezed,
    Object? likesCount = null,
    Object? commentsCount = null,
  }) {
    return _then(_$BrandContentItemImpl(
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
      sportsAthlete: freezed == sportsAthlete
          ? _value.sportsAthlete
          : sportsAthlete // ignore: cast_nullable_to_non_nullable
              as AthleteData?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryInfo?,
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
class _$BrandContentItemImpl implements _BrandContentItem {
  const _$BrandContentItemImpl(
      {required this.id,
      required this.title,
      required this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.mediaType,
      required this.publishedAt,
      @JsonKey(name: "athlete") this.athlete,
      @JsonKey(name: "sportsAthlete") this.sportsAthlete,
      @JsonKey(name: "category") this.category,
      required this.likesCount,
      required this.commentsCount});

  factory _$BrandContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandContentItemImplFromJson(json);

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
// athlete object
  @override
  @JsonKey(name: "athlete")
  final AthleteData? athlete;
// NEW: sportsAthlete (as requested)
  @override
  @JsonKey(name: "sportsAthlete")
  final AthleteData? sportsAthlete;
// category object inside content
  @override
  @JsonKey(name: "category")
  final CategoryInfo? category;
  @override
  final int likesCount;
  @override
  final int commentsCount;

  @override
  String toString() {
    return 'BrandContentItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, mediaType: $mediaType, publishedAt: $publishedAt, athlete: $athlete, sportsAthlete: $sportsAthlete, category: $category, likesCount: $likesCount, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandContentItemImpl &&
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
            (identical(other.sportsAthlete, sportsAthlete) ||
                other.sportsAthlete == sportsAthlete) &&
            (identical(other.category, category) ||
                other.category == category) &&
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
      sportsAthlete,
      category,
      likesCount,
      commentsCount);

  /// Create a copy of BrandContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandContentItemImplCopyWith<_$BrandContentItemImpl> get copyWith =>
      __$$BrandContentItemImplCopyWithImpl<_$BrandContentItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandContentItemImplToJson(
      this,
    );
  }
}

abstract class _BrandContentItem implements BrandContentItem {
  const factory _BrandContentItem(
      {required final String id,
      required final String title,
      required final String caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? mediaType,
      required final String publishedAt,
      @JsonKey(name: "athlete") final AthleteData? athlete,
      @JsonKey(name: "sportsAthlete") final AthleteData? sportsAthlete,
      @JsonKey(name: "category") final CategoryInfo? category,
      required final int likesCount,
      required final int commentsCount}) = _$BrandContentItemImpl;

  factory _BrandContentItem.fromJson(Map<String, dynamic> json) =
      _$BrandContentItemImpl.fromJson;

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
  String get publishedAt; // athlete object
  @override
  @JsonKey(name: "athlete")
  AthleteData? get athlete; // NEW: sportsAthlete (as requested)
  @override
  @JsonKey(name: "sportsAthlete")
  AthleteData? get sportsAthlete; // category object inside content
  @override
  @JsonKey(name: "category")
  CategoryInfo? get category;
  @override
  int get likesCount;
  @override
  int get commentsCount;

  /// Create a copy of BrandContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandContentItemImplCopyWith<_$BrandContentItemImpl> get copyWith =>
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

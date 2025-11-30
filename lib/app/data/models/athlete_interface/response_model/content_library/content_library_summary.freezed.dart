// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_library_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentLibrarySummaryResponse _$ContentLibrarySummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _ContentLibrarySummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentLibrarySummaryResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ContentLibrarySummaryData get data => throw _privateConstructorUsedError;

  /// Serializes this ContentLibrarySummaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentLibrarySummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentLibrarySummaryResponseCopyWith<ContentLibrarySummaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentLibrarySummaryResponseCopyWith<$Res> {
  factory $ContentLibrarySummaryResponseCopyWith(
          ContentLibrarySummaryResponse value,
          $Res Function(ContentLibrarySummaryResponse) then) =
      _$ContentLibrarySummaryResponseCopyWithImpl<$Res,
          ContentLibrarySummaryResponse>;
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      ContentLibrarySummaryData data});

  $ContentLibrarySummaryDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ContentLibrarySummaryResponseCopyWithImpl<$Res,
        $Val extends ContentLibrarySummaryResponse>
    implements $ContentLibrarySummaryResponseCopyWith<$Res> {
  _$ContentLibrarySummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentLibrarySummaryResponse
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
              as ContentLibrarySummaryData,
    ) as $Val);
  }

  /// Create a copy of ContentLibrarySummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentLibrarySummaryDataCopyWith<$Res> get data {
    return $ContentLibrarySummaryDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentLibrarySummaryResponseImplCopyWith<$Res>
    implements $ContentLibrarySummaryResponseCopyWith<$Res> {
  factory _$$ContentLibrarySummaryResponseImplCopyWith(
          _$ContentLibrarySummaryResponseImpl value,
          $Res Function(_$ContentLibrarySummaryResponseImpl) then) =
      __$$ContentLibrarySummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      ContentLibrarySummaryData data});

  @override
  $ContentLibrarySummaryDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ContentLibrarySummaryResponseImplCopyWithImpl<$Res>
    extends _$ContentLibrarySummaryResponseCopyWithImpl<$Res,
        _$ContentLibrarySummaryResponseImpl>
    implements _$$ContentLibrarySummaryResponseImplCopyWith<$Res> {
  __$$ContentLibrarySummaryResponseImplCopyWithImpl(
      _$ContentLibrarySummaryResponseImpl _value,
      $Res Function(_$ContentLibrarySummaryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentLibrarySummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ContentLibrarySummaryResponseImpl(
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
              as ContentLibrarySummaryData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentLibrarySummaryResponseImpl
    implements _ContentLibrarySummaryResponse {
  const _$ContentLibrarySummaryResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$ContentLibrarySummaryResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ContentLibrarySummaryResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final ContentLibrarySummaryData data;

  @override
  String toString() {
    return 'ContentLibrarySummaryResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentLibrarySummaryResponseImpl &&
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

  /// Create a copy of ContentLibrarySummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentLibrarySummaryResponseImplCopyWith<
          _$ContentLibrarySummaryResponseImpl>
      get copyWith => __$$ContentLibrarySummaryResponseImplCopyWithImpl<
          _$ContentLibrarySummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentLibrarySummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _ContentLibrarySummaryResponse
    implements ContentLibrarySummaryResponse {
  const factory _ContentLibrarySummaryResponse(
          {required final bool status,
          required final int statusCode,
          required final String message,
          required final ContentLibrarySummaryData data}) =
      _$ContentLibrarySummaryResponseImpl;

  factory _ContentLibrarySummaryResponse.fromJson(Map<String, dynamic> json) =
      _$ContentLibrarySummaryResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  ContentLibrarySummaryData get data;

  /// Create a copy of ContentLibrarySummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentLibrarySummaryResponseImplCopyWith<
          _$ContentLibrarySummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContentLibrarySummaryData _$ContentLibrarySummaryDataFromJson(
    Map<String, dynamic> json) {
  return _ContentLibrarySummaryData.fromJson(json);
}

/// @nodoc
mixin _$ContentLibrarySummaryData {
  int get totalCategories => throw _privateConstructorUsedError;
  int get totalChannels => throw _privateConstructorUsedError;
  List<CategoryItem> get categories => throw _privateConstructorUsedError;

  /// Serializes this ContentLibrarySummaryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentLibrarySummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentLibrarySummaryDataCopyWith<ContentLibrarySummaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentLibrarySummaryDataCopyWith<$Res> {
  factory $ContentLibrarySummaryDataCopyWith(ContentLibrarySummaryData value,
          $Res Function(ContentLibrarySummaryData) then) =
      _$ContentLibrarySummaryDataCopyWithImpl<$Res, ContentLibrarySummaryData>;
  @useResult
  $Res call(
      {int totalCategories, int totalChannels, List<CategoryItem> categories});
}

/// @nodoc
class _$ContentLibrarySummaryDataCopyWithImpl<$Res,
        $Val extends ContentLibrarySummaryData>
    implements $ContentLibrarySummaryDataCopyWith<$Res> {
  _$ContentLibrarySummaryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentLibrarySummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCategories = null,
    Object? totalChannels = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      totalCategories: null == totalCategories
          ? _value.totalCategories
          : totalCategories // ignore: cast_nullable_to_non_nullable
              as int,
      totalChannels: null == totalChannels
          ? _value.totalChannels
          : totalChannels // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentLibrarySummaryDataImplCopyWith<$Res>
    implements $ContentLibrarySummaryDataCopyWith<$Res> {
  factory _$$ContentLibrarySummaryDataImplCopyWith(
          _$ContentLibrarySummaryDataImpl value,
          $Res Function(_$ContentLibrarySummaryDataImpl) then) =
      __$$ContentLibrarySummaryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCategories, int totalChannels, List<CategoryItem> categories});
}

/// @nodoc
class __$$ContentLibrarySummaryDataImplCopyWithImpl<$Res>
    extends _$ContentLibrarySummaryDataCopyWithImpl<$Res,
        _$ContentLibrarySummaryDataImpl>
    implements _$$ContentLibrarySummaryDataImplCopyWith<$Res> {
  __$$ContentLibrarySummaryDataImplCopyWithImpl(
      _$ContentLibrarySummaryDataImpl _value,
      $Res Function(_$ContentLibrarySummaryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentLibrarySummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCategories = null,
    Object? totalChannels = null,
    Object? categories = null,
  }) {
    return _then(_$ContentLibrarySummaryDataImpl(
      totalCategories: null == totalCategories
          ? _value.totalCategories
          : totalCategories // ignore: cast_nullable_to_non_nullable
              as int,
      totalChannels: null == totalChannels
          ? _value.totalChannels
          : totalChannels // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentLibrarySummaryDataImpl implements _ContentLibrarySummaryData {
  const _$ContentLibrarySummaryDataImpl(
      {required this.totalCategories,
      required this.totalChannels,
      required final List<CategoryItem> categories})
      : _categories = categories;

  factory _$ContentLibrarySummaryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentLibrarySummaryDataImplFromJson(json);

  @override
  final int totalCategories;
  @override
  final int totalChannels;
  final List<CategoryItem> _categories;
  @override
  List<CategoryItem> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ContentLibrarySummaryData(totalCategories: $totalCategories, totalChannels: $totalChannels, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentLibrarySummaryDataImpl &&
            (identical(other.totalCategories, totalCategories) ||
                other.totalCategories == totalCategories) &&
            (identical(other.totalChannels, totalChannels) ||
                other.totalChannels == totalChannels) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCategories, totalChannels,
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of ContentLibrarySummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentLibrarySummaryDataImplCopyWith<_$ContentLibrarySummaryDataImpl>
      get copyWith => __$$ContentLibrarySummaryDataImplCopyWithImpl<
          _$ContentLibrarySummaryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentLibrarySummaryDataImplToJson(
      this,
    );
  }
}

abstract class _ContentLibrarySummaryData implements ContentLibrarySummaryData {
  const factory _ContentLibrarySummaryData(
          {required final int totalCategories,
          required final int totalChannels,
          required final List<CategoryItem> categories}) =
      _$ContentLibrarySummaryDataImpl;

  factory _ContentLibrarySummaryData.fromJson(Map<String, dynamic> json) =
      _$ContentLibrarySummaryDataImpl.fromJson;

  @override
  int get totalCategories;
  @override
  int get totalChannels;
  @override
  List<CategoryItem> get categories;

  /// Create a copy of ContentLibrarySummaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentLibrarySummaryDataImplCopyWith<_$ContentLibrarySummaryDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return _CategoryItem.fromJson(json);
}

/// @nodoc
mixin _$CategoryItem {
  String get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  List<PreviewItem> get preview => throw _privateConstructorUsedError;

  /// Serializes this CategoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryItemCopyWith<CategoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemCopyWith<$Res> {
  factory $CategoryItemCopyWith(
          CategoryItem value, $Res Function(CategoryItem) then) =
      _$CategoryItemCopyWithImpl<$Res, CategoryItem>;
  @useResult
  $Res call(
      {String categoryId,
      String? categoryName,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class _$CategoryItemCopyWithImpl<$Res, $Val extends CategoryItem>
    implements $CategoryItemCopyWith<$Res> {
  _$CategoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? totalItems = null,
    Object? preview = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as List<PreviewItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryItemImplCopyWith<$Res>
    implements $CategoryItemCopyWith<$Res> {
  factory _$$CategoryItemImplCopyWith(
          _$CategoryItemImpl value, $Res Function(_$CategoryItemImpl) then) =
      __$$CategoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String? categoryName,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class __$$CategoryItemImplCopyWithImpl<$Res>
    extends _$CategoryItemCopyWithImpl<$Res, _$CategoryItemImpl>
    implements _$$CategoryItemImplCopyWith<$Res> {
  __$$CategoryItemImplCopyWithImpl(
      _$CategoryItemImpl _value, $Res Function(_$CategoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? totalItems = null,
    Object? preview = null,
  }) {
    return _then(_$CategoryItemImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value._preview
          : preview // ignore: cast_nullable_to_non_nullable
              as List<PreviewItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryItemImpl implements _CategoryItem {
  const _$CategoryItemImpl(
      {required this.categoryId,
      this.categoryName,
      required this.totalItems,
      required final List<PreviewItem> preview})
      : _preview = preview;

  factory _$CategoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryItemImplFromJson(json);

  @override
  final String categoryId;
  @override
  final String? categoryName;
  @override
  final int totalItems;
  final List<PreviewItem> _preview;
  @override
  List<PreviewItem> get preview {
    if (_preview is EqualUnmodifiableListView) return _preview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preview);
  }

  @override
  String toString() {
    return 'CategoryItem(categoryId: $categoryId, categoryName: $categoryName, totalItems: $totalItems, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryItemImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._preview, _preview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      totalItems, const DeepCollectionEquality().hash(_preview));

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      __$$CategoryItemImplCopyWithImpl<_$CategoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryItemImplToJson(
      this,
    );
  }
}

abstract class _CategoryItem implements CategoryItem {
  const factory _CategoryItem(
      {required final String categoryId,
      final String? categoryName,
      required final int totalItems,
      required final List<PreviewItem> preview}) = _$CategoryItemImpl;

  factory _CategoryItem.fromJson(Map<String, dynamic> json) =
      _$CategoryItemImpl.fromJson;

  @override
  String get categoryId;
  @override
  String? get categoryName;
  @override
  int get totalItems;
  @override
  List<PreviewItem> get preview;

  /// Create a copy of CategoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryItemImplCopyWith<_$CategoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewItem _$PreviewItemFromJson(Map<String, dynamic> json) {
  return _PreviewItem.fromJson(json);
}

/// @nodoc
mixin _$PreviewItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl =>
      throw _privateConstructorUsedError; // Category fields
  String get categoryId => throw _privateConstructorUsedError;
  String? get categoryName =>
      throw _privateConstructorUsedError; // Brand fields
  String? get brandId => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError; // Post fields
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError; // Counts
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError; // Timestamps
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError; // Media list
  List<MediaItem> get media => throw _privateConstructorUsedError;

  /// Serializes this PreviewItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreviewItemCopyWith<PreviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewItemCopyWith<$Res> {
  factory $PreviewItemCopyWith(
          PreviewItem value, $Res Function(PreviewItem) then) =
      _$PreviewItemCopyWithImpl<$Res, PreviewItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String status,
      String type,
      bool isArchived,
      String? scheduledAt,
      String publishedAt,
      int likesCount,
      int commentsCount,
      String createdAt,
      String updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class _$PreviewItemCopyWithImpl<$Res, $Val extends PreviewItem>
    implements $PreviewItemCopyWith<$Res> {
  _$PreviewItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? caption = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = null,
    Object? type = null,
    Object? isArchived = null,
    Object? scheduledAt = freezed,
    Object? publishedAt = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? media = null,
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewItemImplCopyWith<$Res>
    implements $PreviewItemCopyWith<$Res> {
  factory _$$PreviewItemImplCopyWith(
          _$PreviewItemImpl value, $Res Function(_$PreviewItemImpl) then) =
      __$$PreviewItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String caption,
      String mediaUrl,
      String? thumbnailUrl,
      String categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String status,
      String type,
      bool isArchived,
      String? scheduledAt,
      String publishedAt,
      int likesCount,
      int commentsCount,
      String createdAt,
      String updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class __$$PreviewItemImplCopyWithImpl<$Res>
    extends _$PreviewItemCopyWithImpl<$Res, _$PreviewItemImpl>
    implements _$$PreviewItemImplCopyWith<$Res> {
  __$$PreviewItemImplCopyWithImpl(
      _$PreviewItemImpl _value, $Res Function(_$PreviewItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? caption = null,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? categoryId = null,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = null,
    Object? type = null,
    Object? isArchived = null,
    Object? scheduledAt = freezed,
    Object? publishedAt = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? media = null,
  }) {
    return _then(_$PreviewItemImpl(
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
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewItemImpl implements _PreviewItem {
  const _$PreviewItemImpl(
      {required this.id,
      required this.title,
      required this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      required this.categoryId,
      this.categoryName,
      this.brandId,
      this.brandName,
      required this.status,
      required this.type,
      required this.isArchived,
      this.scheduledAt,
      required this.publishedAt,
      required this.likesCount,
      required this.commentsCount,
      required this.createdAt,
      required this.updatedAt,
      required final List<MediaItem> media})
      : _media = media;

  factory _$PreviewItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewItemImplFromJson(json);

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
// Category fields
  @override
  final String categoryId;
  @override
  final String? categoryName;
// Brand fields
  @override
  final String? brandId;
  @override
  final String? brandName;
// Post fields
  @override
  final String status;
  @override
  final String type;
  @override
  final bool isArchived;
  @override
  final String? scheduledAt;
  @override
  final String publishedAt;
// Counts
  @override
  final int likesCount;
  @override
  final int commentsCount;
// Timestamps
  @override
  final String createdAt;
  @override
  final String updatedAt;
// Media list
  final List<MediaItem> _media;
// Media list
  @override
  List<MediaItem> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'PreviewItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, categoryId: $categoryId, categoryName: $categoryName, brandId: $brandId, brandName: $brandName, status: $status, type: $type, isArchived: $isArchived, scheduledAt: $scheduledAt, publishedAt: $publishedAt, likesCount: $likesCount, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        caption,
        mediaUrl,
        thumbnailUrl,
        categoryId,
        categoryName,
        brandId,
        brandName,
        status,
        type,
        isArchived,
        scheduledAt,
        publishedAt,
        likesCount,
        commentsCount,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_media)
      ]);

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewItemImplCopyWith<_$PreviewItemImpl> get copyWith =>
      __$$PreviewItemImplCopyWithImpl<_$PreviewItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewItemImplToJson(
      this,
    );
  }
}

abstract class _PreviewItem implements PreviewItem {
  const factory _PreviewItem(
      {required final String id,
      required final String title,
      required final String caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      required final String categoryId,
      final String? categoryName,
      final String? brandId,
      final String? brandName,
      required final String status,
      required final String type,
      required final bool isArchived,
      final String? scheduledAt,
      required final String publishedAt,
      required final int likesCount,
      required final int commentsCount,
      required final String createdAt,
      required final String updatedAt,
      required final List<MediaItem> media}) = _$PreviewItemImpl;

  factory _PreviewItem.fromJson(Map<String, dynamic> json) =
      _$PreviewItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get caption;
  @override
  String get mediaUrl;
  @override
  String? get thumbnailUrl; // Category fields
  @override
  String get categoryId;
  @override
  String? get categoryName; // Brand fields
  @override
  String? get brandId;
  @override
  String? get brandName; // Post fields
  @override
  String get status;
  @override
  String get type;
  @override
  bool get isArchived;
  @override
  String? get scheduledAt;
  @override
  String get publishedAt; // Counts
  @override
  int get likesCount;
  @override
  int get commentsCount; // Timestamps
  @override
  String get createdAt;
  @override
  String get updatedAt; // Media list
  @override
  List<MediaItem> get media;

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviewItemImplCopyWith<_$PreviewItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return _MediaItem.fromJson(json);
}

/// @nodoc
mixin _$MediaItem {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MediaItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaItemCopyWith<MediaItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaItemCopyWith<$Res> {
  factory $MediaItemCopyWith(MediaItem value, $Res Function(MediaItem) then) =
      _$MediaItemCopyWithImpl<$Res, MediaItem>;
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int sortOrder,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$MediaItemCopyWithImpl<$Res, $Val extends MediaItem>
    implements $MediaItemCopyWith<$Res> {
  _$MediaItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaItemImplCopyWith<$Res>
    implements $MediaItemCopyWith<$Res> {
  factory _$$MediaItemImplCopyWith(
          _$MediaItemImpl value, $Res Function(_$MediaItemImpl) then) =
      __$$MediaItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int sortOrder,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$MediaItemImplCopyWithImpl<$Res>
    extends _$MediaItemCopyWithImpl<$Res, _$MediaItemImpl>
    implements _$$MediaItemImplCopyWith<$Res> {
  __$$MediaItemImplCopyWithImpl(
      _$MediaItemImpl _value, $Res Function(_$MediaItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MediaItemImpl(
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
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaItemImpl implements _MediaItem {
  const _$MediaItemImpl(
      {required this.id,
      required this.url,
      this.thumbnailUrl,
      this.duration,
      required this.sortOrder,
      required this.createdAt,
      required this.updatedAt});

  factory _$MediaItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaItemImplFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final int? duration;
  @override
  final int sortOrder;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'MediaItem(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, duration: $duration, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaItemImpl &&
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

  /// Create a copy of MediaItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaItemImplCopyWith<_$MediaItemImpl> get copyWith =>
      __$$MediaItemImplCopyWithImpl<_$MediaItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaItemImplToJson(
      this,
    );
  }
}

abstract class _MediaItem implements MediaItem {
  const factory _MediaItem(
      {required final String id,
      required final String url,
      final String? thumbnailUrl,
      final int? duration,
      required final int sortOrder,
      required final String createdAt,
      required final String updatedAt}) = _$MediaItemImpl;

  factory _MediaItem.fromJson(Map<String, dynamic> json) =
      _$MediaItemImpl.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String? get thumbnailUrl;
  @override
  int? get duration;
  @override
  int get sortOrder;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of MediaItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaItemImplCopyWith<_$MediaItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

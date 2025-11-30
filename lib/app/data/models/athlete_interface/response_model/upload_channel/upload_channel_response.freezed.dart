// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_channel_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadChannelResponse _$UploadChannelResponseFromJson(
    Map<String, dynamic> json) {
  return _UploadChannelResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadChannelResponse {
  List<CategoryGroup> get categories => throw _privateConstructorUsedError;
  List<BrandGroup> get brands => throw _privateConstructorUsedError;

  /// Serializes this UploadChannelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadChannelResponseCopyWith<UploadChannelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadChannelResponseCopyWith<$Res> {
  factory $UploadChannelResponseCopyWith(UploadChannelResponse value,
          $Res Function(UploadChannelResponse) then) =
      _$UploadChannelResponseCopyWithImpl<$Res, UploadChannelResponse>;
  @useResult
  $Res call({List<CategoryGroup> categories, List<BrandGroup> brands});
}

/// @nodoc
class _$UploadChannelResponseCopyWithImpl<$Res,
        $Val extends UploadChannelResponse>
    implements $UploadChannelResponseCopyWith<$Res> {
  _$UploadChannelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? brands = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryGroup>,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandGroup>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadChannelResponseImplCopyWith<$Res>
    implements $UploadChannelResponseCopyWith<$Res> {
  factory _$$UploadChannelResponseImplCopyWith(
          _$UploadChannelResponseImpl value,
          $Res Function(_$UploadChannelResponseImpl) then) =
      __$$UploadChannelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryGroup> categories, List<BrandGroup> brands});
}

/// @nodoc
class __$$UploadChannelResponseImplCopyWithImpl<$Res>
    extends _$UploadChannelResponseCopyWithImpl<$Res,
        _$UploadChannelResponseImpl>
    implements _$$UploadChannelResponseImplCopyWith<$Res> {
  __$$UploadChannelResponseImplCopyWithImpl(_$UploadChannelResponseImpl _value,
      $Res Function(_$UploadChannelResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? brands = null,
  }) {
    return _then(_$UploadChannelResponseImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryGroup>,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadChannelResponseImpl implements _UploadChannelResponse {
  const _$UploadChannelResponseImpl(
      {required final List<CategoryGroup> categories,
      required final List<BrandGroup> brands})
      : _categories = categories,
        _brands = brands;

  factory _$UploadChannelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadChannelResponseImplFromJson(json);

  final List<CategoryGroup> _categories;
  @override
  List<CategoryGroup> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<BrandGroup> _brands;
  @override
  List<BrandGroup> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'UploadChannelResponse(categories: $categories, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadChannelResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_brands));

  /// Create a copy of UploadChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadChannelResponseImplCopyWith<_$UploadChannelResponseImpl>
      get copyWith => __$$UploadChannelResponseImplCopyWithImpl<
          _$UploadChannelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadChannelResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadChannelResponse implements UploadChannelResponse {
  const factory _UploadChannelResponse(
      {required final List<CategoryGroup> categories,
      required final List<BrandGroup> brands}) = _$UploadChannelResponseImpl;

  factory _UploadChannelResponse.fromJson(Map<String, dynamic> json) =
      _$UploadChannelResponseImpl.fromJson;

  @override
  List<CategoryGroup> get categories;
  @override
  List<BrandGroup> get brands;

  /// Create a copy of UploadChannelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadChannelResponseImplCopyWith<_$UploadChannelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CategoryGroup _$CategoryGroupFromJson(Map<String, dynamic> json) {
  return _CategoryGroup.fromJson(json);
}

/// @nodoc
mixin _$CategoryGroup {
  @JsonKey(name: 'categoryId')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryName')
  String? get name => throw _privateConstructorUsedError; // FIXED
  int get totalItems => throw _privateConstructorUsedError;
  List<PreviewItem> get preview => throw _privateConstructorUsedError;

  /// Serializes this CategoryGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryGroupCopyWith<CategoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryGroupCopyWith<$Res> {
  factory $CategoryGroupCopyWith(
          CategoryGroup value, $Res Function(CategoryGroup) then) =
      _$CategoryGroupCopyWithImpl<$Res, CategoryGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryId') String id,
      @JsonKey(name: 'categoryName') String? name,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class _$CategoryGroupCopyWithImpl<$Res, $Val extends CategoryGroup>
    implements $CategoryGroupCopyWith<$Res> {
  _$CategoryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? totalItems = null,
    Object? preview = null,
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
abstract class _$$CategoryGroupImplCopyWith<$Res>
    implements $CategoryGroupCopyWith<$Res> {
  factory _$$CategoryGroupImplCopyWith(
          _$CategoryGroupImpl value, $Res Function(_$CategoryGroupImpl) then) =
      __$$CategoryGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryId') String id,
      @JsonKey(name: 'categoryName') String? name,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class __$$CategoryGroupImplCopyWithImpl<$Res>
    extends _$CategoryGroupCopyWithImpl<$Res, _$CategoryGroupImpl>
    implements _$$CategoryGroupImplCopyWith<$Res> {
  __$$CategoryGroupImplCopyWithImpl(
      _$CategoryGroupImpl _value, $Res Function(_$CategoryGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? totalItems = null,
    Object? preview = null,
  }) {
    return _then(_$CategoryGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$CategoryGroupImpl implements _CategoryGroup {
  const _$CategoryGroupImpl(
      {@JsonKey(name: 'categoryId') required this.id,
      @JsonKey(name: 'categoryName') this.name,
      required this.totalItems,
      required final List<PreviewItem> preview})
      : _preview = preview;

  factory _$CategoryGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryGroupImplFromJson(json);

  @override
  @JsonKey(name: 'categoryId')
  final String id;
  @override
  @JsonKey(name: 'categoryName')
  final String? name;
// FIXED
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
    return 'CategoryGroup(id: $id, name: $name, totalItems: $totalItems, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._preview, _preview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, totalItems,
      const DeepCollectionEquality().hash(_preview));

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryGroupImplCopyWith<_$CategoryGroupImpl> get copyWith =>
      __$$CategoryGroupImplCopyWithImpl<_$CategoryGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryGroupImplToJson(
      this,
    );
  }
}

abstract class _CategoryGroup implements CategoryGroup {
  const factory _CategoryGroup(
      {@JsonKey(name: 'categoryId') required final String id,
      @JsonKey(name: 'categoryName') final String? name,
      required final int totalItems,
      required final List<PreviewItem> preview}) = _$CategoryGroupImpl;

  factory _CategoryGroup.fromJson(Map<String, dynamic> json) =
      _$CategoryGroupImpl.fromJson;

  @override
  @JsonKey(name: 'categoryId')
  String get id;
  @override
  @JsonKey(name: 'categoryName')
  String? get name; // FIXED
  @override
  int get totalItems;
  @override
  List<PreviewItem> get preview;

  /// Create a copy of CategoryGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryGroupImplCopyWith<_$CategoryGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandGroup _$BrandGroupFromJson(Map<String, dynamic> json) {
  return _BrandGroup.fromJson(json);
}

/// @nodoc
mixin _$BrandGroup {
  @JsonKey(name: 'brandId')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brandName')
  String get name => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  List<PreviewItem> get preview => throw _privateConstructorUsedError;

  /// Serializes this BrandGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandGroupCopyWith<BrandGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandGroupCopyWith<$Res> {
  factory $BrandGroupCopyWith(
          BrandGroup value, $Res Function(BrandGroup) then) =
      _$BrandGroupCopyWithImpl<$Res, BrandGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'brandId') String id,
      @JsonKey(name: 'brandName') String name,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class _$BrandGroupCopyWithImpl<$Res, $Val extends BrandGroup>
    implements $BrandGroupCopyWith<$Res> {
  _$BrandGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalItems = null,
    Object? preview = null,
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
abstract class _$$BrandGroupImplCopyWith<$Res>
    implements $BrandGroupCopyWith<$Res> {
  factory _$$BrandGroupImplCopyWith(
          _$BrandGroupImpl value, $Res Function(_$BrandGroupImpl) then) =
      __$$BrandGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'brandId') String id,
      @JsonKey(name: 'brandName') String name,
      int totalItems,
      List<PreviewItem> preview});
}

/// @nodoc
class __$$BrandGroupImplCopyWithImpl<$Res>
    extends _$BrandGroupCopyWithImpl<$Res, _$BrandGroupImpl>
    implements _$$BrandGroupImplCopyWith<$Res> {
  __$$BrandGroupImplCopyWithImpl(
      _$BrandGroupImpl _value, $Res Function(_$BrandGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalItems = null,
    Object? preview = null,
  }) {
    return _then(_$BrandGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$BrandGroupImpl implements _BrandGroup {
  const _$BrandGroupImpl(
      {@JsonKey(name: 'brandId') required this.id,
      @JsonKey(name: 'brandName') required this.name,
      required this.totalItems,
      required final List<PreviewItem> preview})
      : _preview = preview;

  factory _$BrandGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandGroupImplFromJson(json);

  @override
  @JsonKey(name: 'brandId')
  final String id;
  @override
  @JsonKey(name: 'brandName')
  final String name;
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
    return 'BrandGroup(id: $id, name: $name, totalItems: $totalItems, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._preview, _preview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, totalItems,
      const DeepCollectionEquality().hash(_preview));

  /// Create a copy of BrandGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandGroupImplCopyWith<_$BrandGroupImpl> get copyWith =>
      __$$BrandGroupImplCopyWithImpl<_$BrandGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandGroupImplToJson(
      this,
    );
  }
}

abstract class _BrandGroup implements BrandGroup {
  const factory _BrandGroup(
      {@JsonKey(name: 'brandId') required final String id,
      @JsonKey(name: 'brandName') required final String name,
      required final int totalItems,
      required final List<PreviewItem> preview}) = _$BrandGroupImpl;

  factory _BrandGroup.fromJson(Map<String, dynamic> json) =
      _$BrandGroupImpl.fromJson;

  @override
  @JsonKey(name: 'brandId')
  String get id;
  @override
  @JsonKey(name: 'brandName')
  String get name;
  @override
  int get totalItems;
  @override
  List<PreviewItem> get preview;

  /// Create a copy of BrandGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandGroupImplCopyWith<_$BrandGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewItem _$PreviewItemFromJson(Map<String, dynamic> json) {
  return _PreviewItem.fromJson(json);
}

/// @nodoc
mixin _$PreviewItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError; // FIXED
  String? get category => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<PreviewMedia> get media => throw _privateConstructorUsedError;

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
      String? caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? category,
      String? brand,
      String status,
      String type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<PreviewMedia> media});
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
    Object? caption = freezed,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? category = freezed,
    Object? brand = freezed,
    Object? status = null,
    Object? type = null,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<PreviewMedia>,
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
      String? caption,
      String mediaUrl,
      String? thumbnailUrl,
      String? category,
      String? brand,
      String status,
      String type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<PreviewMedia> media});
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
    Object? caption = freezed,
    Object? mediaUrl = null,
    Object? thumbnailUrl = freezed,
    Object? category = freezed,
    Object? brand = freezed,
    Object? status = null,
    Object? type = null,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isArchived: freezed == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<PreviewMedia>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewItemImpl implements _PreviewItem {
  const _$PreviewItemImpl(
      {required this.id,
      required this.title,
      this.caption,
      required this.mediaUrl,
      this.thumbnailUrl,
      this.category,
      this.brand,
      required this.status,
      required this.type,
      this.isArchived,
      this.scheduledAt,
      this.publishedAt,
      this.likesCount,
      this.commentsCount,
      this.createdAt,
      this.updatedAt,
      required final List<PreviewMedia> media})
      : _media = media;

  factory _$PreviewItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? caption;
  @override
  final String mediaUrl;
  @override
  final String? thumbnailUrl;
// FIXED
  @override
  final String? category;
  @override
  final String? brand;
  @override
  final String status;
  @override
  final String type;
  @override
  final bool? isArchived;
  @override
  final String? scheduledAt;
  @override
  final String? publishedAt;
  @override
  final int? likesCount;
  @override
  final int? commentsCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<PreviewMedia> _media;
  @override
  List<PreviewMedia> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'PreviewItem(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, category: $category, brand: $brand, status: $status, type: $type, isArchived: $isArchived, scheduledAt: $scheduledAt, publishedAt: $publishedAt, likesCount: $likesCount, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt, media: $media)';
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
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      caption,
      mediaUrl,
      thumbnailUrl,
      category,
      brand,
      status,
      type,
      isArchived,
      scheduledAt,
      publishedAt,
      likesCount,
      commentsCount,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_media));

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
      final String? caption,
      required final String mediaUrl,
      final String? thumbnailUrl,
      final String? category,
      final String? brand,
      required final String status,
      required final String type,
      final bool? isArchived,
      final String? scheduledAt,
      final String? publishedAt,
      final int? likesCount,
      final int? commentsCount,
      final String? createdAt,
      final String? updatedAt,
      required final List<PreviewMedia> media}) = _$PreviewItemImpl;

  factory _PreviewItem.fromJson(Map<String, dynamic> json) =
      _$PreviewItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get caption;
  @override
  String get mediaUrl;
  @override
  String? get thumbnailUrl; // FIXED
  @override
  String? get category;
  @override
  String? get brand;
  @override
  String get status;
  @override
  String get type;
  @override
  bool? get isArchived;
  @override
  String? get scheduledAt;
  @override
  String? get publishedAt;
  @override
  int? get likesCount;
  @override
  int? get commentsCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<PreviewMedia> get media;

  /// Create a copy of PreviewItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviewItemImplCopyWith<_$PreviewItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewMedia _$PreviewMediaFromJson(Map<String, dynamic> json) {
  return _PreviewMedia.fromJson(json);
}

/// @nodoc
mixin _$PreviewMedia {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PreviewMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreviewMediaCopyWith<PreviewMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewMediaCopyWith<$Res> {
  factory $PreviewMediaCopyWith(
          PreviewMedia value, $Res Function(PreviewMedia) then) =
      _$PreviewMediaCopyWithImpl<$Res, PreviewMedia>;
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int sortOrder,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$PreviewMediaCopyWithImpl<$Res, $Val extends PreviewMedia>
    implements $PreviewMediaCopyWith<$Res> {
  _$PreviewMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = null,
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
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$PreviewMediaImplCopyWith<$Res>
    implements $PreviewMediaCopyWith<$Res> {
  factory _$$PreviewMediaImplCopyWith(
          _$PreviewMediaImpl value, $Res Function(_$PreviewMediaImpl) then) =
      __$$PreviewMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String url,
      String? thumbnailUrl,
      int? duration,
      int sortOrder,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$PreviewMediaImplCopyWithImpl<$Res>
    extends _$PreviewMediaCopyWithImpl<$Res, _$PreviewMediaImpl>
    implements _$$PreviewMediaImplCopyWith<$Res> {
  __$$PreviewMediaImplCopyWithImpl(
      _$PreviewMediaImpl _value, $Res Function(_$PreviewMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = freezed,
    Object? sortOrder = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PreviewMediaImpl(
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
class _$PreviewMediaImpl implements _PreviewMedia {
  const _$PreviewMediaImpl(
      {required this.id,
      required this.url,
      this.thumbnailUrl,
      this.duration,
      required this.sortOrder,
      this.createdAt,
      this.updatedAt});

  factory _$PreviewMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewMediaImplFromJson(json);

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
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'PreviewMedia(id: $id, url: $url, thumbnailUrl: $thumbnailUrl, duration: $duration, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewMediaImpl &&
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

  /// Create a copy of PreviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewMediaImplCopyWith<_$PreviewMediaImpl> get copyWith =>
      __$$PreviewMediaImplCopyWithImpl<_$PreviewMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewMediaImplToJson(
      this,
    );
  }
}

abstract class _PreviewMedia implements PreviewMedia {
  const factory _PreviewMedia(
      {required final String id,
      required final String url,
      final String? thumbnailUrl,
      final int? duration,
      required final int sortOrder,
      final String? createdAt,
      final String? updatedAt}) = _$PreviewMediaImpl;

  factory _PreviewMedia.fromJson(Map<String, dynamic> json) =
      _$PreviewMediaImpl.fromJson;

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
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of PreviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviewMediaImplCopyWith<_$PreviewMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

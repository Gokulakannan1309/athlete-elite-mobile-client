// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_studio_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentStudioResponse _$ContentStudioResponseFromJson(
    Map<String, dynamic> json) {
  return _ContentStudioResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentStudioResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ContentStudioData get data => throw _privateConstructorUsedError;

  /// Serializes this ContentStudioResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentStudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentStudioResponseCopyWith<ContentStudioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStudioResponseCopyWith<$Res> {
  factory $ContentStudioResponseCopyWith(ContentStudioResponse value,
          $Res Function(ContentStudioResponse) then) =
      _$ContentStudioResponseCopyWithImpl<$Res, ContentStudioResponse>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, ContentStudioData data});

  $ContentStudioDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ContentStudioResponseCopyWithImpl<$Res,
        $Val extends ContentStudioResponse>
    implements $ContentStudioResponseCopyWith<$Res> {
  _$ContentStudioResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentStudioResponse
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
              as ContentStudioData,
    ) as $Val);
  }

  /// Create a copy of ContentStudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentStudioDataCopyWith<$Res> get data {
    return $ContentStudioDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentStudioResponseImplCopyWith<$Res>
    implements $ContentStudioResponseCopyWith<$Res> {
  factory _$$ContentStudioResponseImplCopyWith(
          _$ContentStudioResponseImpl value,
          $Res Function(_$ContentStudioResponseImpl) then) =
      __$$ContentStudioResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, ContentStudioData data});

  @override
  $ContentStudioDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ContentStudioResponseImplCopyWithImpl<$Res>
    extends _$ContentStudioResponseCopyWithImpl<$Res,
        _$ContentStudioResponseImpl>
    implements _$$ContentStudioResponseImplCopyWith<$Res> {
  __$$ContentStudioResponseImplCopyWithImpl(_$ContentStudioResponseImpl _value,
      $Res Function(_$ContentStudioResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentStudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ContentStudioResponseImpl(
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
              as ContentStudioData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentStudioResponseImpl implements _ContentStudioResponse {
  _$ContentStudioResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$ContentStudioResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentStudioResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final ContentStudioData data;

  @override
  String toString() {
    return 'ContentStudioResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentStudioResponseImpl &&
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

  /// Create a copy of ContentStudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentStudioResponseImplCopyWith<_$ContentStudioResponseImpl>
      get copyWith => __$$ContentStudioResponseImplCopyWithImpl<
          _$ContentStudioResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentStudioResponseImplToJson(
      this,
    );
  }
}

abstract class _ContentStudioResponse implements ContentStudioResponse {
  factory _ContentStudioResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final ContentStudioData data}) = _$ContentStudioResponseImpl;

  factory _ContentStudioResponse.fromJson(Map<String, dynamic> json) =
      _$ContentStudioResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  ContentStudioData get data;

  /// Create a copy of ContentStudioResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentStudioResponseImplCopyWith<_$ContentStudioResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContentStudioData _$ContentStudioDataFromJson(Map<String, dynamic> json) {
  return _ContentStudioData.fromJson(json);
}

/// @nodoc
mixin _$ContentStudioData {
  List<ContentItem> get items => throw _privateConstructorUsedError;
  Meta get meta => throw _privateConstructorUsedError;

  /// Serializes this ContentStudioData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentStudioData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentStudioDataCopyWith<ContentStudioData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStudioDataCopyWith<$Res> {
  factory $ContentStudioDataCopyWith(
          ContentStudioData value, $Res Function(ContentStudioData) then) =
      _$ContentStudioDataCopyWithImpl<$Res, ContentStudioData>;
  @useResult
  $Res call({List<ContentItem> items, Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ContentStudioDataCopyWithImpl<$Res, $Val extends ContentStudioData>
    implements $ContentStudioDataCopyWith<$Res> {
  _$ContentStudioDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentStudioData
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
              as List<ContentItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  /// Create a copy of ContentStudioData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentStudioDataImplCopyWith<$Res>
    implements $ContentStudioDataCopyWith<$Res> {
  factory _$$ContentStudioDataImplCopyWith(_$ContentStudioDataImpl value,
          $Res Function(_$ContentStudioDataImpl) then) =
      __$$ContentStudioDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContentItem> items, Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ContentStudioDataImplCopyWithImpl<$Res>
    extends _$ContentStudioDataCopyWithImpl<$Res, _$ContentStudioDataImpl>
    implements _$$ContentStudioDataImplCopyWith<$Res> {
  __$$ContentStudioDataImplCopyWithImpl(_$ContentStudioDataImpl _value,
      $Res Function(_$ContentStudioDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentStudioData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? meta = null,
  }) {
    return _then(_$ContentStudioDataImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ContentItem>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentStudioDataImpl implements _ContentStudioData {
  _$ContentStudioDataImpl(
      {required final List<ContentItem> items, required this.meta})
      : _items = items;

  factory _$ContentStudioDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentStudioDataImplFromJson(json);

  final List<ContentItem> _items;
  @override
  List<ContentItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Meta meta;

  @override
  String toString() {
    return 'ContentStudioData(items: $items, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentStudioDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), meta);

  /// Create a copy of ContentStudioData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentStudioDataImplCopyWith<_$ContentStudioDataImpl> get copyWith =>
      __$$ContentStudioDataImplCopyWithImpl<_$ContentStudioDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentStudioDataImplToJson(
      this,
    );
  }
}

abstract class _ContentStudioData implements ContentStudioData {
  factory _ContentStudioData(
      {required final List<ContentItem> items,
      required final Meta meta}) = _$ContentStudioDataImpl;

  factory _ContentStudioData.fromJson(Map<String, dynamic> json) =
      _$ContentStudioDataImpl.fromJson;

  @override
  List<ContentItem> get items;
  @override
  Meta get meta;

  /// Create a copy of ContentStudioData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentStudioDataImplCopyWith<_$ContentStudioDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentItem _$ContentItemFromJson(Map<String, dynamic> json) {
  return _ContentItem.fromJson(json);
}

/// @nodoc
mixin _$ContentItem {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get uploadedMediaType => throw _privateConstructorUsedError;
  List<UploadedMedia> get uploadedMedia => throw _privateConstructorUsedError;
  bool get hasEditedMedia => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get editedAt => throw _privateConstructorUsedError;

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
      String status,
      String description,
      String uploadedMediaType,
      List<UploadedMedia> uploadedMedia,
      bool hasEditedMedia,
      String createdAt,
      String updatedAt,
      String? editedAt});
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
    Object? status = null,
    Object? description = null,
    Object? uploadedMediaType = null,
    Object? uploadedMedia = null,
    Object? hasEditedMedia = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? editedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedMediaType: null == uploadedMediaType
          ? _value.uploadedMediaType
          : uploadedMediaType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedMedia: null == uploadedMedia
          ? _value.uploadedMedia
          : uploadedMedia // ignore: cast_nullable_to_non_nullable
              as List<UploadedMedia>,
      hasEditedMedia: null == hasEditedMedia
          ? _value.hasEditedMedia
          : hasEditedMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      String status,
      String description,
      String uploadedMediaType,
      List<UploadedMedia> uploadedMedia,
      bool hasEditedMedia,
      String createdAt,
      String updatedAt,
      String? editedAt});
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
    Object? status = null,
    Object? description = null,
    Object? uploadedMediaType = null,
    Object? uploadedMedia = null,
    Object? hasEditedMedia = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? editedAt = freezed,
  }) {
    return _then(_$ContentItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedMediaType: null == uploadedMediaType
          ? _value.uploadedMediaType
          : uploadedMediaType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedMedia: null == uploadedMedia
          ? _value._uploadedMedia
          : uploadedMedia // ignore: cast_nullable_to_non_nullable
              as List<UploadedMedia>,
      hasEditedMedia: null == hasEditedMedia
          ? _value.hasEditedMedia
          : hasEditedMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentItemImpl implements _ContentItem {
  _$ContentItemImpl(
      {required this.id,
      required this.status,
      required this.description,
      required this.uploadedMediaType,
      required final List<UploadedMedia> uploadedMedia,
      required this.hasEditedMedia,
      required this.createdAt,
      required this.updatedAt,
      this.editedAt})
      : _uploadedMedia = uploadedMedia;

  factory _$ContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentItemImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String description;
  @override
  final String uploadedMediaType;
  final List<UploadedMedia> _uploadedMedia;
  @override
  List<UploadedMedia> get uploadedMedia {
    if (_uploadedMedia is EqualUnmodifiableListView) return _uploadedMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadedMedia);
  }

  @override
  final bool hasEditedMedia;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? editedAt;

  @override
  String toString() {
    return 'ContentItem(id: $id, status: $status, description: $description, uploadedMediaType: $uploadedMediaType, uploadedMedia: $uploadedMedia, hasEditedMedia: $hasEditedMedia, createdAt: $createdAt, updatedAt: $updatedAt, editedAt: $editedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.uploadedMediaType, uploadedMediaType) ||
                other.uploadedMediaType == uploadedMediaType) &&
            const DeepCollectionEquality()
                .equals(other._uploadedMedia, _uploadedMedia) &&
            (identical(other.hasEditedMedia, hasEditedMedia) ||
                other.hasEditedMedia == hasEditedMedia) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      description,
      uploadedMediaType,
      const DeepCollectionEquality().hash(_uploadedMedia),
      hasEditedMedia,
      createdAt,
      updatedAt,
      editedAt);

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
  factory _ContentItem(
      {required final String id,
      required final String status,
      required final String description,
      required final String uploadedMediaType,
      required final List<UploadedMedia> uploadedMedia,
      required final bool hasEditedMedia,
      required final String createdAt,
      required final String updatedAt,
      final String? editedAt}) = _$ContentItemImpl;

  factory _ContentItem.fromJson(Map<String, dynamic> json) =
      _$ContentItemImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get description;
  @override
  String get uploadedMediaType;
  @override
  List<UploadedMedia> get uploadedMedia;
  @override
  bool get hasEditedMedia;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get editedAt;

  /// Create a copy of ContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentItemImplCopyWith<_$ContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadedMedia _$UploadedMediaFromJson(Map<String, dynamic> json) {
  return _UploadedMedia.fromJson(json);
}

/// @nodoc
mixin _$UploadedMedia {
  String get url => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;

  /// Serializes this UploadedMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadedMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadedMediaCopyWith<UploadedMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedMediaCopyWith<$Res> {
  factory $UploadedMediaCopyWith(
          UploadedMedia value, $Res Function(UploadedMedia) then) =
      _$UploadedMediaCopyWithImpl<$Res, UploadedMedia>;
  @useResult
  $Res call(
      {String url,
      String fileName,
      String filePath,
      int fileSize,
      String mimeType,
      String mediaType});
}

/// @nodoc
class _$UploadedMediaCopyWithImpl<$Res, $Val extends UploadedMedia>
    implements $UploadedMediaCopyWith<$Res> {
  _$UploadedMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadedMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedMediaImplCopyWith<$Res>
    implements $UploadedMediaCopyWith<$Res> {
  factory _$$UploadedMediaImplCopyWith(
          _$UploadedMediaImpl value, $Res Function(_$UploadedMediaImpl) then) =
      __$$UploadedMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String fileName,
      String filePath,
      int fileSize,
      String mimeType,
      String mediaType});
}

/// @nodoc
class __$$UploadedMediaImplCopyWithImpl<$Res>
    extends _$UploadedMediaCopyWithImpl<$Res, _$UploadedMediaImpl>
    implements _$$UploadedMediaImplCopyWith<$Res> {
  __$$UploadedMediaImplCopyWithImpl(
      _$UploadedMediaImpl _value, $Res Function(_$UploadedMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadedMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? mimeType = null,
    Object? mediaType = null,
  }) {
    return _then(_$UploadedMediaImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedMediaImpl implements _UploadedMedia {
  _$UploadedMediaImpl(
      {required this.url,
      required this.fileName,
      required this.filePath,
      required this.fileSize,
      required this.mimeType,
      required this.mediaType});

  factory _$UploadedMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedMediaImplFromJson(json);

  @override
  final String url;
  @override
  final String fileName;
  @override
  final String filePath;
  @override
  final int fileSize;
  @override
  final String mimeType;
  @override
  final String mediaType;

  @override
  String toString() {
    return 'UploadedMedia(url: $url, fileName: $fileName, filePath: $filePath, fileSize: $fileSize, mimeType: $mimeType, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedMediaImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, fileName, filePath, fileSize, mimeType, mediaType);

  /// Create a copy of UploadedMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedMediaImplCopyWith<_$UploadedMediaImpl> get copyWith =>
      __$$UploadedMediaImplCopyWithImpl<_$UploadedMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedMediaImplToJson(
      this,
    );
  }
}

abstract class _UploadedMedia implements UploadedMedia {
  factory _UploadedMedia(
      {required final String url,
      required final String fileName,
      required final String filePath,
      required final int fileSize,
      required final String mimeType,
      required final String mediaType}) = _$UploadedMediaImpl;

  factory _UploadedMedia.fromJson(Map<String, dynamic> json) =
      _$UploadedMediaImpl.fromJson;

  @override
  String get url;
  @override
  String get fileName;
  @override
  String get filePath;
  @override
  int get fileSize;
  @override
  String get mimeType;
  @override
  String get mediaType;

  /// Create a copy of UploadedMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadedMediaImplCopyWith<_$UploadedMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
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
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_$MetaImpl(
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
class _$MetaImpl implements _Meta {
  _$MetaImpl(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

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
    return 'Meta(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, limit, totalPages);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  factory _Meta(
      {required final int total,
      required final int page,
      required final int limit,
      required final int totalPages}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

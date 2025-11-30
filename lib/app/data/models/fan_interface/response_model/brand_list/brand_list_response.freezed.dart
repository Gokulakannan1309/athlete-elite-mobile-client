// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BrandListResponse _$BrandListResponseFromJson(Map<String, dynamic> json) {
  return _BrandListResponse.fromJson(json);
}

/// @nodoc
mixin _$BrandListResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BrandData get data => throw _privateConstructorUsedError;

  /// Serializes this BrandListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandListResponseCopyWith<BrandListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandListResponseCopyWith<$Res> {
  factory $BrandListResponseCopyWith(
          BrandListResponse value, $Res Function(BrandListResponse) then) =
      _$BrandListResponseCopyWithImpl<$Res, BrandListResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, BrandData data});

  $BrandDataCopyWith<$Res> get data;
}

/// @nodoc
class _$BrandListResponseCopyWithImpl<$Res, $Val extends BrandListResponse>
    implements $BrandListResponseCopyWith<$Res> {
  _$BrandListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandListResponse
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
              as BrandData,
    ) as $Val);
  }

  /// Create a copy of BrandListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BrandDataCopyWith<$Res> get data {
    return $BrandDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrandListResponseImplCopyWith<$Res>
    implements $BrandListResponseCopyWith<$Res> {
  factory _$$BrandListResponseImplCopyWith(_$BrandListResponseImpl value,
          $Res Function(_$BrandListResponseImpl) then) =
      __$$BrandListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, BrandData data});

  @override
  $BrandDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$BrandListResponseImplCopyWithImpl<$Res>
    extends _$BrandListResponseCopyWithImpl<$Res, _$BrandListResponseImpl>
    implements _$$BrandListResponseImplCopyWith<$Res> {
  __$$BrandListResponseImplCopyWithImpl(_$BrandListResponseImpl _value,
      $Res Function(_$BrandListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$BrandListResponseImpl(
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
              as BrandData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandListResponseImpl implements _BrandListResponse {
  const _$BrandListResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$BrandListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandListResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final BrandData data;

  @override
  String toString() {
    return 'BrandListResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandListResponseImpl &&
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

  /// Create a copy of BrandListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandListResponseImplCopyWith<_$BrandListResponseImpl> get copyWith =>
      __$$BrandListResponseImplCopyWithImpl<_$BrandListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandListResponseImplToJson(
      this,
    );
  }
}

abstract class _BrandListResponse implements BrandListResponse {
  const factory _BrandListResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final BrandData data}) = _$BrandListResponseImpl;

  factory _BrandListResponse.fromJson(Map<String, dynamic> json) =
      _$BrandListResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  BrandData get data;

  /// Create a copy of BrandListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandListResponseImplCopyWith<_$BrandListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandData _$BrandDataFromJson(Map<String, dynamic> json) {
  return _BrandData.fromJson(json);
}

/// @nodoc
mixin _$BrandData {
  String get message => throw _privateConstructorUsedError;
  List<BrandItem> get brands => throw _privateConstructorUsedError;

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
  $Res call({String message, List<BrandItem> brands});
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
    Object? message = null,
    Object? brands = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandItem>,
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
  $Res call({String message, List<BrandItem> brands});
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
    Object? message = null,
    Object? brands = null,
  }) {
    return _then(_$BrandDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandDataImpl implements _BrandData {
  const _$BrandDataImpl(
      {required this.message, required final List<BrandItem> brands})
      : _brands = brands;

  factory _$BrandDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandDataImplFromJson(json);

  @override
  final String message;
  final List<BrandItem> _brands;
  @override
  List<BrandItem> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'BrandData(message: $message, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_brands));

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
      {required final String message,
      required final List<BrandItem> brands}) = _$BrandDataImpl;

  factory _BrandData.fromJson(Map<String, dynamic> json) =
      _$BrandDataImpl.fromJson;

  @override
  String get message;
  @override
  List<BrandItem> get brands;

  /// Create a copy of BrandData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandDataImplCopyWith<_$BrandDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrandItem _$BrandItemFromJson(Map<String, dynamic> json) {
  return _BrandItem.fromJson(json);
}

/// @nodoc
mixin _$BrandItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageData')
  String get posterUrl => throw _privateConstructorUsedError;
  int get contentCount => throw _privateConstructorUsedError;

  /// Serializes this BrandItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandItemCopyWith<BrandItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandItemCopyWith<$Res> {
  factory $BrandItemCopyWith(BrandItem value, $Res Function(BrandItem) then) =
      _$BrandItemCopyWithImpl<$Res, BrandItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'imageData') String posterUrl,
      int contentCount});
}

/// @nodoc
class _$BrandItemCopyWithImpl<$Res, $Val extends BrandItem>
    implements $BrandItemCopyWith<$Res> {
  _$BrandItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? posterUrl = null,
    Object? contentCount = null,
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
      posterUrl: null == posterUrl
          ? _value.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contentCount: null == contentCount
          ? _value.contentCount
          : contentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandItemImplCopyWith<$Res>
    implements $BrandItemCopyWith<$Res> {
  factory _$$BrandItemImplCopyWith(
          _$BrandItemImpl value, $Res Function(_$BrandItemImpl) then) =
      __$$BrandItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'imageData') String posterUrl,
      int contentCount});
}

/// @nodoc
class __$$BrandItemImplCopyWithImpl<$Res>
    extends _$BrandItemCopyWithImpl<$Res, _$BrandItemImpl>
    implements _$$BrandItemImplCopyWith<$Res> {
  __$$BrandItemImplCopyWithImpl(
      _$BrandItemImpl _value, $Res Function(_$BrandItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? posterUrl = null,
    Object? contentCount = null,
  }) {
    return _then(_$BrandItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      posterUrl: null == posterUrl
          ? _value.posterUrl
          : posterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      contentCount: null == contentCount
          ? _value.contentCount
          : contentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandItemImpl extends _BrandItem {
  const _$BrandItemImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'imageData') required this.posterUrl,
      required this.contentCount})
      : super._();

  factory _$BrandItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'imageData')
  final String posterUrl;
  @override
  final int contentCount;

  @override
  String toString() {
    return 'BrandItem(id: $id, name: $name, posterUrl: $posterUrl, contentCount: $contentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.posterUrl, posterUrl) ||
                other.posterUrl == posterUrl) &&
            (identical(other.contentCount, contentCount) ||
                other.contentCount == contentCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, posterUrl, contentCount);

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandItemImplCopyWith<_$BrandItemImpl> get copyWith =>
      __$$BrandItemImplCopyWithImpl<_$BrandItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandItemImplToJson(
      this,
    );
  }
}

abstract class _BrandItem extends BrandItem {
  const factory _BrandItem(
      {required final String id,
      required final String name,
      @JsonKey(name: 'imageData') required final String posterUrl,
      required final int contentCount}) = _$BrandItemImpl;
  const _BrandItem._() : super._();

  factory _BrandItem.fromJson(Map<String, dynamic> json) =
      _$BrandItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'imageData')
  String get posterUrl;
  @override
  int get contentCount;

  /// Create a copy of BrandItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandItemImplCopyWith<_$BrandItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

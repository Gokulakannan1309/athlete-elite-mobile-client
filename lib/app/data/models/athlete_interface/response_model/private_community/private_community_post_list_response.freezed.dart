// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_community_post_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivateCommunityPostListResponse _$PrivateCommunityPostListResponseFromJson(
    Map<String, dynamic> json) {
  return _PrivateCommunityPostListResponse.fromJson(json);
}

/// @nodoc
mixin _$PrivateCommunityPostListResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PrivateCommunityPostsData get data => throw _privateConstructorUsedError;

  /// Serializes this PrivateCommunityPostListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivateCommunityPostListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivateCommunityPostListResponseCopyWith<PrivateCommunityPostListResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateCommunityPostListResponseCopyWith<$Res> {
  factory $PrivateCommunityPostListResponseCopyWith(
          PrivateCommunityPostListResponse value,
          $Res Function(PrivateCommunityPostListResponse) then) =
      _$PrivateCommunityPostListResponseCopyWithImpl<$Res,
          PrivateCommunityPostListResponse>;
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      PrivateCommunityPostsData data});

  $PrivateCommunityPostsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PrivateCommunityPostListResponseCopyWithImpl<$Res,
        $Val extends PrivateCommunityPostListResponse>
    implements $PrivateCommunityPostListResponseCopyWith<$Res> {
  _$PrivateCommunityPostListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivateCommunityPostListResponse
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
              as PrivateCommunityPostsData,
    ) as $Val);
  }

  /// Create a copy of PrivateCommunityPostListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivateCommunityPostsDataCopyWith<$Res> get data {
    return $PrivateCommunityPostsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivateCommunityPostListResponseImplCopyWith<$Res>
    implements $PrivateCommunityPostListResponseCopyWith<$Res> {
  factory _$$PrivateCommunityPostListResponseImplCopyWith(
          _$PrivateCommunityPostListResponseImpl value,
          $Res Function(_$PrivateCommunityPostListResponseImpl) then) =
      __$$PrivateCommunityPostListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status,
      int statusCode,
      String message,
      PrivateCommunityPostsData data});

  @override
  $PrivateCommunityPostsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PrivateCommunityPostListResponseImplCopyWithImpl<$Res>
    extends _$PrivateCommunityPostListResponseCopyWithImpl<$Res,
        _$PrivateCommunityPostListResponseImpl>
    implements _$$PrivateCommunityPostListResponseImplCopyWith<$Res> {
  __$$PrivateCommunityPostListResponseImplCopyWithImpl(
      _$PrivateCommunityPostListResponseImpl _value,
      $Res Function(_$PrivateCommunityPostListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivateCommunityPostListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PrivateCommunityPostListResponseImpl(
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
              as PrivateCommunityPostsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivateCommunityPostListResponseImpl
    implements _PrivateCommunityPostListResponse {
  const _$PrivateCommunityPostListResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$PrivateCommunityPostListResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PrivateCommunityPostListResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final PrivateCommunityPostsData data;

  @override
  String toString() {
    return 'PrivateCommunityPostListResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateCommunityPostListResponseImpl &&
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

  /// Create a copy of PrivateCommunityPostListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateCommunityPostListResponseImplCopyWith<
          _$PrivateCommunityPostListResponseImpl>
      get copyWith => __$$PrivateCommunityPostListResponseImplCopyWithImpl<
          _$PrivateCommunityPostListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateCommunityPostListResponseImplToJson(
      this,
    );
  }
}

abstract class _PrivateCommunityPostListResponse
    implements PrivateCommunityPostListResponse {
  const factory _PrivateCommunityPostListResponse(
          {required final bool status,
          required final int statusCode,
          required final String message,
          required final PrivateCommunityPostsData data}) =
      _$PrivateCommunityPostListResponseImpl;

  factory _PrivateCommunityPostListResponse.fromJson(
          Map<String, dynamic> json) =
      _$PrivateCommunityPostListResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  PrivateCommunityPostsData get data;

  /// Create a copy of PrivateCommunityPostListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateCommunityPostListResponseImplCopyWith<
          _$PrivateCommunityPostListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivateCommunityPostsData _$PrivateCommunityPostsDataFromJson(
    Map<String, dynamic> json) {
  return _PrivateCommunityPostsData.fromJson(json);
}

/// @nodoc
mixin _$PrivateCommunityPostsData {
  List<PrivateCommunityPost> get items => throw _privateConstructorUsedError;
  PrivateCommunityPagination get meta => throw _privateConstructorUsedError;

  /// Serializes this PrivateCommunityPostsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivateCommunityPostsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivateCommunityPostsDataCopyWith<PrivateCommunityPostsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateCommunityPostsDataCopyWith<$Res> {
  factory $PrivateCommunityPostsDataCopyWith(PrivateCommunityPostsData value,
          $Res Function(PrivateCommunityPostsData) then) =
      _$PrivateCommunityPostsDataCopyWithImpl<$Res, PrivateCommunityPostsData>;
  @useResult
  $Res call(
      {List<PrivateCommunityPost> items, PrivateCommunityPagination meta});

  $PrivateCommunityPaginationCopyWith<$Res> get meta;
}

/// @nodoc
class _$PrivateCommunityPostsDataCopyWithImpl<$Res,
        $Val extends PrivateCommunityPostsData>
    implements $PrivateCommunityPostsDataCopyWith<$Res> {
  _$PrivateCommunityPostsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivateCommunityPostsData
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
              as List<PrivateCommunityPost>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PrivateCommunityPagination,
    ) as $Val);
  }

  /// Create a copy of PrivateCommunityPostsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivateCommunityPaginationCopyWith<$Res> get meta {
    return $PrivateCommunityPaginationCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivateCommunityPostsDataImplCopyWith<$Res>
    implements $PrivateCommunityPostsDataCopyWith<$Res> {
  factory _$$PrivateCommunityPostsDataImplCopyWith(
          _$PrivateCommunityPostsDataImpl value,
          $Res Function(_$PrivateCommunityPostsDataImpl) then) =
      __$$PrivateCommunityPostsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PrivateCommunityPost> items, PrivateCommunityPagination meta});

  @override
  $PrivateCommunityPaginationCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PrivateCommunityPostsDataImplCopyWithImpl<$Res>
    extends _$PrivateCommunityPostsDataCopyWithImpl<$Res,
        _$PrivateCommunityPostsDataImpl>
    implements _$$PrivateCommunityPostsDataImplCopyWith<$Res> {
  __$$PrivateCommunityPostsDataImplCopyWithImpl(
      _$PrivateCommunityPostsDataImpl _value,
      $Res Function(_$PrivateCommunityPostsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivateCommunityPostsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? meta = null,
  }) {
    return _then(_$PrivateCommunityPostsDataImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PrivateCommunityPost>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PrivateCommunityPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivateCommunityPostsDataImpl implements _PrivateCommunityPostsData {
  const _$PrivateCommunityPostsDataImpl(
      {required final List<PrivateCommunityPost> items, required this.meta})
      : _items = items;

  factory _$PrivateCommunityPostsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivateCommunityPostsDataImplFromJson(json);

  final List<PrivateCommunityPost> _items;
  @override
  List<PrivateCommunityPost> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PrivateCommunityPagination meta;

  @override
  String toString() {
    return 'PrivateCommunityPostsData(items: $items, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateCommunityPostsDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), meta);

  /// Create a copy of PrivateCommunityPostsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateCommunityPostsDataImplCopyWith<_$PrivateCommunityPostsDataImpl>
      get copyWith => __$$PrivateCommunityPostsDataImplCopyWithImpl<
          _$PrivateCommunityPostsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateCommunityPostsDataImplToJson(
      this,
    );
  }
}

abstract class _PrivateCommunityPostsData implements PrivateCommunityPostsData {
  const factory _PrivateCommunityPostsData(
          {required final List<PrivateCommunityPost> items,
          required final PrivateCommunityPagination meta}) =
      _$PrivateCommunityPostsDataImpl;

  factory _PrivateCommunityPostsData.fromJson(Map<String, dynamic> json) =
      _$PrivateCommunityPostsDataImpl.fromJson;

  @override
  List<PrivateCommunityPost> get items;
  @override
  PrivateCommunityPagination get meta;

  /// Create a copy of PrivateCommunityPostsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateCommunityPostsDataImplCopyWith<_$PrivateCommunityPostsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivateCommunityPost _$PrivateCommunityPostFromJson(Map<String, dynamic> json) {
  return _PrivateCommunityPost.fromJson(json);
}

/// @nodoc
mixin _$PrivateCommunityPost {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "reactionsCount")
  Map<String, int> get reactions => throw _privateConstructorUsedError;
  String? get userReaction => throw _privateConstructorUsedError;

  /// Serializes this PrivateCommunityPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivateCommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivateCommunityPostCopyWith<PrivateCommunityPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateCommunityPostCopyWith<$Res> {
  factory $PrivateCommunityPostCopyWith(PrivateCommunityPost value,
          $Res Function(PrivateCommunityPost) then) =
      _$PrivateCommunityPostCopyWithImpl<$Res, PrivateCommunityPost>;
  @useResult
  $Res call(
      {String id,
      String content,
      String createdAt,
      @JsonKey(name: "reactionsCount") Map<String, int> reactions,
      String? userReaction});
}

/// @nodoc
class _$PrivateCommunityPostCopyWithImpl<$Res,
        $Val extends PrivateCommunityPost>
    implements $PrivateCommunityPostCopyWith<$Res> {
  _$PrivateCommunityPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivateCommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? reactions = null,
    Object? userReaction = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivateCommunityPostImplCopyWith<$Res>
    implements $PrivateCommunityPostCopyWith<$Res> {
  factory _$$PrivateCommunityPostImplCopyWith(_$PrivateCommunityPostImpl value,
          $Res Function(_$PrivateCommunityPostImpl) then) =
      __$$PrivateCommunityPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String createdAt,
      @JsonKey(name: "reactionsCount") Map<String, int> reactions,
      String? userReaction});
}

/// @nodoc
class __$$PrivateCommunityPostImplCopyWithImpl<$Res>
    extends _$PrivateCommunityPostCopyWithImpl<$Res, _$PrivateCommunityPostImpl>
    implements _$$PrivateCommunityPostImplCopyWith<$Res> {
  __$$PrivateCommunityPostImplCopyWithImpl(_$PrivateCommunityPostImpl _value,
      $Res Function(_$PrivateCommunityPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivateCommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? reactions = null,
    Object? userReaction = freezed,
  }) {
    return _then(_$PrivateCommunityPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivateCommunityPostImpl implements _PrivateCommunityPost {
  const _$PrivateCommunityPostImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      @JsonKey(name: "reactionsCount")
      required final Map<String, int> reactions,
      this.userReaction})
      : _reactions = reactions;

  factory _$PrivateCommunityPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivateCommunityPostImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String createdAt;
  final Map<String, int> _reactions;
  @override
  @JsonKey(name: "reactionsCount")
  Map<String, int> get reactions {
    if (_reactions is EqualUnmodifiableMapView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactions);
  }

  @override
  final String? userReaction;

  @override
  String toString() {
    return 'PrivateCommunityPost(id: $id, content: $content, createdAt: $createdAt, reactions: $reactions, userReaction: $userReaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateCommunityPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.userReaction, userReaction) ||
                other.userReaction == userReaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt,
      const DeepCollectionEquality().hash(_reactions), userReaction);

  /// Create a copy of PrivateCommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateCommunityPostImplCopyWith<_$PrivateCommunityPostImpl>
      get copyWith =>
          __$$PrivateCommunityPostImplCopyWithImpl<_$PrivateCommunityPostImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateCommunityPostImplToJson(
      this,
    );
  }
}

abstract class _PrivateCommunityPost implements PrivateCommunityPost {
  const factory _PrivateCommunityPost(
      {required final String id,
      required final String content,
      required final String createdAt,
      @JsonKey(name: "reactionsCount")
      required final Map<String, int> reactions,
      final String? userReaction}) = _$PrivateCommunityPostImpl;

  factory _PrivateCommunityPost.fromJson(Map<String, dynamic> json) =
      _$PrivateCommunityPostImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get createdAt;
  @override
  @JsonKey(name: "reactionsCount")
  Map<String, int> get reactions;
  @override
  String? get userReaction;

  /// Create a copy of PrivateCommunityPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateCommunityPostImplCopyWith<_$PrivateCommunityPostImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivateCommunityPagination _$PrivateCommunityPaginationFromJson(
    Map<String, dynamic> json) {
  return _PrivateCommunityPagination.fromJson(json);
}

/// @nodoc
mixin _$PrivateCommunityPagination {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this PrivateCommunityPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivateCommunityPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivateCommunityPaginationCopyWith<PrivateCommunityPagination>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateCommunityPaginationCopyWith<$Res> {
  factory $PrivateCommunityPaginationCopyWith(PrivateCommunityPagination value,
          $Res Function(PrivateCommunityPagination) then) =
      _$PrivateCommunityPaginationCopyWithImpl<$Res,
          PrivateCommunityPagination>;
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class _$PrivateCommunityPaginationCopyWithImpl<$Res,
        $Val extends PrivateCommunityPagination>
    implements $PrivateCommunityPaginationCopyWith<$Res> {
  _$PrivateCommunityPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivateCommunityPagination
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
abstract class _$$PrivateCommunityPaginationImplCopyWith<$Res>
    implements $PrivateCommunityPaginationCopyWith<$Res> {
  factory _$$PrivateCommunityPaginationImplCopyWith(
          _$PrivateCommunityPaginationImpl value,
          $Res Function(_$PrivateCommunityPaginationImpl) then) =
      __$$PrivateCommunityPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int page, int limit, int totalPages});
}

/// @nodoc
class __$$PrivateCommunityPaginationImplCopyWithImpl<$Res>
    extends _$PrivateCommunityPaginationCopyWithImpl<$Res,
        _$PrivateCommunityPaginationImpl>
    implements _$$PrivateCommunityPaginationImplCopyWith<$Res> {
  __$$PrivateCommunityPaginationImplCopyWithImpl(
      _$PrivateCommunityPaginationImpl _value,
      $Res Function(_$PrivateCommunityPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivateCommunityPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_$PrivateCommunityPaginationImpl(
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
class _$PrivateCommunityPaginationImpl implements _PrivateCommunityPagination {
  const _$PrivateCommunityPaginationImpl(
      {required this.total,
      required this.page,
      required this.limit,
      required this.totalPages});

  factory _$PrivateCommunityPaginationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PrivateCommunityPaginationImplFromJson(json);

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
    return 'PrivateCommunityPagination(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateCommunityPaginationImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, limit, totalPages);

  /// Create a copy of PrivateCommunityPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateCommunityPaginationImplCopyWith<_$PrivateCommunityPaginationImpl>
      get copyWith => __$$PrivateCommunityPaginationImplCopyWithImpl<
          _$PrivateCommunityPaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateCommunityPaginationImplToJson(
      this,
    );
  }
}

abstract class _PrivateCommunityPagination
    implements PrivateCommunityPagination {
  const factory _PrivateCommunityPagination(
      {required final int total,
      required final int page,
      required final int limit,
      required final int totalPages}) = _$PrivateCommunityPaginationImpl;

  factory _PrivateCommunityPagination.fromJson(Map<String, dynamic> json) =
      _$PrivateCommunityPaginationImpl.fromJson;

  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;

  /// Create a copy of PrivateCommunityPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateCommunityPaginationImplCopyWith<_$PrivateCommunityPaginationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

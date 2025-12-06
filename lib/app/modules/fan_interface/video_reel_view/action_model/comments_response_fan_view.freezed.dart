// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_response_fan_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsResponseFanView _$CommentsResponseFanViewFromJson(
    Map<String, dynamic> json) {
  return _CommentsResponseFanView.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponseFanView {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CommentsDataFanView get data => throw _privateConstructorUsedError;

  /// Serializes this CommentsResponseFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsResponseFanViewCopyWith<CommentsResponseFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseFanViewCopyWith<$Res> {
  factory $CommentsResponseFanViewCopyWith(CommentsResponseFanView value,
          $Res Function(CommentsResponseFanView) then) =
      _$CommentsResponseFanViewCopyWithImpl<$Res, CommentsResponseFanView>;
  @useResult
  $Res call(
      {bool status, int statusCode, String message, CommentsDataFanView data});

  $CommentsDataFanViewCopyWith<$Res> get data;
}

/// @nodoc
class _$CommentsResponseFanViewCopyWithImpl<$Res,
        $Val extends CommentsResponseFanView>
    implements $CommentsResponseFanViewCopyWith<$Res> {
  _$CommentsResponseFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsResponseFanView
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
              as CommentsDataFanView,
    ) as $Val);
  }

  /// Create a copy of CommentsResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentsDataFanViewCopyWith<$Res> get data {
    return $CommentsDataFanViewCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsResponseFanViewImplCopyWith<$Res>
    implements $CommentsResponseFanViewCopyWith<$Res> {
  factory _$$CommentsResponseFanViewImplCopyWith(
          _$CommentsResponseFanViewImpl value,
          $Res Function(_$CommentsResponseFanViewImpl) then) =
      __$$CommentsResponseFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status, int statusCode, String message, CommentsDataFanView data});

  @override
  $CommentsDataFanViewCopyWith<$Res> get data;
}

/// @nodoc
class __$$CommentsResponseFanViewImplCopyWithImpl<$Res>
    extends _$CommentsResponseFanViewCopyWithImpl<$Res,
        _$CommentsResponseFanViewImpl>
    implements _$$CommentsResponseFanViewImplCopyWith<$Res> {
  __$$CommentsResponseFanViewImplCopyWithImpl(
      _$CommentsResponseFanViewImpl _value,
      $Res Function(_$CommentsResponseFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CommentsResponseFanViewImpl(
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
              as CommentsDataFanView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsResponseFanViewImpl implements _CommentsResponseFanView {
  const _$CommentsResponseFanViewImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$CommentsResponseFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsResponseFanViewImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final CommentsDataFanView data;

  @override
  String toString() {
    return 'CommentsResponseFanView(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsResponseFanViewImpl &&
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

  /// Create a copy of CommentsResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsResponseFanViewImplCopyWith<_$CommentsResponseFanViewImpl>
      get copyWith => __$$CommentsResponseFanViewImplCopyWithImpl<
          _$CommentsResponseFanViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsResponseFanViewImplToJson(
      this,
    );
  }
}

abstract class _CommentsResponseFanView implements CommentsResponseFanView {
  const factory _CommentsResponseFanView(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final CommentsDataFanView data}) = _$CommentsResponseFanViewImpl;

  factory _CommentsResponseFanView.fromJson(Map<String, dynamic> json) =
      _$CommentsResponseFanViewImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  CommentsDataFanView get data;

  /// Create a copy of CommentsResponseFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsResponseFanViewImplCopyWith<_$CommentsResponseFanViewImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommentsDataFanView _$CommentsDataFanViewFromJson(Map<String, dynamic> json) {
  return _CommentsDataFanView.fromJson(json);
}

/// @nodoc
mixin _$CommentsDataFanView {
  List<CommentItemFanView> get comments => throw _privateConstructorUsedError;
  PaginationFanView get pagination => throw _privateConstructorUsedError;

  /// Serializes this CommentsDataFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsDataFanViewCopyWith<CommentsDataFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsDataFanViewCopyWith<$Res> {
  factory $CommentsDataFanViewCopyWith(
          CommentsDataFanView value, $Res Function(CommentsDataFanView) then) =
      _$CommentsDataFanViewCopyWithImpl<$Res, CommentsDataFanView>;
  @useResult
  $Res call({List<CommentItemFanView> comments, PaginationFanView pagination});

  $PaginationFanViewCopyWith<$Res> get pagination;
}

/// @nodoc
class _$CommentsDataFanViewCopyWithImpl<$Res, $Val extends CommentsDataFanView>
    implements $CommentsDataFanViewCopyWith<$Res> {
  _$CommentsDataFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentItemFanView>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationFanView,
    ) as $Val);
  }

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationFanViewCopyWith<$Res> get pagination {
    return $PaginationFanViewCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsDataFanViewImplCopyWith<$Res>
    implements $CommentsDataFanViewCopyWith<$Res> {
  factory _$$CommentsDataFanViewImplCopyWith(_$CommentsDataFanViewImpl value,
          $Res Function(_$CommentsDataFanViewImpl) then) =
      __$$CommentsDataFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CommentItemFanView> comments, PaginationFanView pagination});

  @override
  $PaginationFanViewCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$CommentsDataFanViewImplCopyWithImpl<$Res>
    extends _$CommentsDataFanViewCopyWithImpl<$Res, _$CommentsDataFanViewImpl>
    implements _$$CommentsDataFanViewImplCopyWith<$Res> {
  __$$CommentsDataFanViewImplCopyWithImpl(_$CommentsDataFanViewImpl _value,
      $Res Function(_$CommentsDataFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? pagination = null,
  }) {
    return _then(_$CommentsDataFanViewImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentItemFanView>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationFanView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsDataFanViewImpl implements _CommentsDataFanView {
  const _$CommentsDataFanViewImpl(
      {required final List<CommentItemFanView> comments,
      required this.pagination})
      : _comments = comments;

  factory _$CommentsDataFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsDataFanViewImplFromJson(json);

  final List<CommentItemFanView> _comments;
  @override
  List<CommentItemFanView> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final PaginationFanView pagination;

  @override
  String toString() {
    return 'CommentsDataFanView(comments: $comments, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsDataFanViewImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_comments), pagination);

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsDataFanViewImplCopyWith<_$CommentsDataFanViewImpl> get copyWith =>
      __$$CommentsDataFanViewImplCopyWithImpl<_$CommentsDataFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsDataFanViewImplToJson(
      this,
    );
  }
}

abstract class _CommentsDataFanView implements CommentsDataFanView {
  const factory _CommentsDataFanView(
      {required final List<CommentItemFanView> comments,
      required final PaginationFanView pagination}) = _$CommentsDataFanViewImpl;

  factory _CommentsDataFanView.fromJson(Map<String, dynamic> json) =
      _$CommentsDataFanViewImpl.fromJson;

  @override
  List<CommentItemFanView> get comments;
  @override
  PaginationFanView get pagination;

  /// Create a copy of CommentsDataFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsDataFanViewImplCopyWith<_$CommentsDataFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationFanView _$PaginationFanViewFromJson(Map<String, dynamic> json) {
  return _PaginationFanView.fromJson(json);
}

/// @nodoc
mixin _$PaginationFanView {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this PaginationFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationFanViewCopyWith<PaginationFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationFanViewCopyWith<$Res> {
  factory $PaginationFanViewCopyWith(
          PaginationFanView value, $Res Function(PaginationFanView) then) =
      _$PaginationFanViewCopyWithImpl<$Res, PaginationFanView>;
  @useResult
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
}

/// @nodoc
class _$PaginationFanViewCopyWithImpl<$Res, $Val extends PaginationFanView>
    implements $PaginationFanViewCopyWith<$Res> {
  _$PaginationFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationFanViewImplCopyWith<$Res>
    implements $PaginationFanViewCopyWith<$Res> {
  factory _$$PaginationFanViewImplCopyWith(_$PaginationFanViewImpl value,
          $Res Function(_$PaginationFanViewImpl) then) =
      __$$PaginationFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
}

/// @nodoc
class __$$PaginationFanViewImplCopyWithImpl<$Res>
    extends _$PaginationFanViewCopyWithImpl<$Res, _$PaginationFanViewImpl>
    implements _$$PaginationFanViewImplCopyWith<$Res> {
  __$$PaginationFanViewImplCopyWithImpl(_$PaginationFanViewImpl _value,
      $Res Function(_$PaginationFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(_$PaginationFanViewImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationFanViewImpl implements _PaginationFanView {
  const _$PaginationFanViewImpl(
      {required this.page,
      required this.limit,
      required this.total,
      required this.totalPages,
      required this.hasMore});

  factory _$PaginationFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationFanViewImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int totalPages;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PaginationFanView(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationFanViewImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, total, totalPages, hasMore);

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationFanViewImplCopyWith<_$PaginationFanViewImpl> get copyWith =>
      __$$PaginationFanViewImplCopyWithImpl<_$PaginationFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationFanViewImplToJson(
      this,
    );
  }
}

abstract class _PaginationFanView implements PaginationFanView {
  const factory _PaginationFanView(
      {required final int page,
      required final int limit,
      required final int total,
      required final int totalPages,
      required final bool hasMore}) = _$PaginationFanViewImpl;

  factory _PaginationFanView.fromJson(Map<String, dynamic> json) =
      _$PaginationFanViewImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get totalPages;
  @override
  bool get hasMore;

  /// Create a copy of PaginationFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationFanViewImplCopyWith<_$PaginationFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentItemFanView _$CommentItemFanViewFromJson(Map<String, dynamic> json) {
  return _CommentItemFanView.fromJson(json);
}

/// @nodoc
mixin _$CommentItemFanView {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  CommentUserFanView get user => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;
  int get reactionsCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get reactionCounts => throw _privateConstructorUsedError;
  String? get userReaction => throw _privateConstructorUsedError;
  bool get isReacted => throw _privateConstructorUsedError;
  List<ReplyItemFanView> get replies => throw _privateConstructorUsedError;

  /// Serializes this CommentItemFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentItemFanViewCopyWith<CommentItemFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentItemFanViewCopyWith<$Res> {
  factory $CommentItemFanViewCopyWith(
          CommentItemFanView value, $Res Function(CommentItemFanView) then) =
      _$CommentItemFanViewCopyWithImpl<$Res, CommentItemFanView>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CommentUserFanView user,
      int repliesCount,
      int reactionsCount,
      Map<String, dynamic> reactionCounts,
      String? userReaction,
      bool isReacted,
      List<ReplyItemFanView> replies});

  $CommentUserFanViewCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentItemFanViewCopyWithImpl<$Res, $Val extends CommentItemFanView>
    implements $CommentItemFanViewCopyWith<$Res> {
  _$CommentItemFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? repliesCount = null,
    Object? reactionsCount = null,
    Object? reactionCounts = null,
    Object? userReaction = freezed,
    Object? isReacted = null,
    Object? replies = null,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUserFanView,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionCounts: null == reactionCounts
          ? _value.reactionCounts
          : reactionCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ReplyItemFanView>,
    ) as $Val);
  }

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserFanViewCopyWith<$Res> get user {
    return $CommentUserFanViewCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentItemFanViewImplCopyWith<$Res>
    implements $CommentItemFanViewCopyWith<$Res> {
  factory _$$CommentItemFanViewImplCopyWith(_$CommentItemFanViewImpl value,
          $Res Function(_$CommentItemFanViewImpl) then) =
      __$$CommentItemFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CommentUserFanView user,
      int repliesCount,
      int reactionsCount,
      Map<String, dynamic> reactionCounts,
      String? userReaction,
      bool isReacted,
      List<ReplyItemFanView> replies});

  @override
  $CommentUserFanViewCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentItemFanViewImplCopyWithImpl<$Res>
    extends _$CommentItemFanViewCopyWithImpl<$Res, _$CommentItemFanViewImpl>
    implements _$$CommentItemFanViewImplCopyWith<$Res> {
  __$$CommentItemFanViewImplCopyWithImpl(_$CommentItemFanViewImpl _value,
      $Res Function(_$CommentItemFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? repliesCount = null,
    Object? reactionsCount = null,
    Object? reactionCounts = null,
    Object? userReaction = freezed,
    Object? isReacted = null,
    Object? replies = null,
  }) {
    return _then(_$CommentItemFanViewImpl(
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUserFanView,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionsCount: null == reactionsCount
          ? _value.reactionsCount
          : reactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reactionCounts: null == reactionCounts
          ? _value._reactionCounts
          : reactionCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ReplyItemFanView>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentItemFanViewImpl implements _CommentItemFanView {
  const _$CommentItemFanViewImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.user,
      required this.repliesCount,
      required this.reactionsCount,
      required final Map<String, dynamic> reactionCounts,
      this.userReaction,
      required this.isReacted,
      required final List<ReplyItemFanView> replies})
      : _reactionCounts = reactionCounts,
        _replies = replies;

  factory _$CommentItemFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentItemFanViewImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final CommentUserFanView user;
  @override
  final int repliesCount;
  @override
  final int reactionsCount;
  final Map<String, dynamic> _reactionCounts;
  @override
  Map<String, dynamic> get reactionCounts {
    if (_reactionCounts is EqualUnmodifiableMapView) return _reactionCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactionCounts);
  }

  @override
  final String? userReaction;
  @override
  final bool isReacted;
  final List<ReplyItemFanView> _replies;
  @override
  List<ReplyItemFanView> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString() {
    return 'CommentItemFanView(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, repliesCount: $repliesCount, reactionsCount: $reactionsCount, reactionCounts: $reactionCounts, userReaction: $userReaction, isReacted: $isReacted, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentItemFanViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.reactionsCount, reactionsCount) ||
                other.reactionsCount == reactionsCount) &&
            const DeepCollectionEquality()
                .equals(other._reactionCounts, _reactionCounts) &&
            (identical(other.userReaction, userReaction) ||
                other.userReaction == userReaction) &&
            (identical(other.isReacted, isReacted) ||
                other.isReacted == isReacted) &&
            const DeepCollectionEquality().equals(other._replies, _replies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      createdAt,
      updatedAt,
      user,
      repliesCount,
      reactionsCount,
      const DeepCollectionEquality().hash(_reactionCounts),
      userReaction,
      isReacted,
      const DeepCollectionEquality().hash(_replies));

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentItemFanViewImplCopyWith<_$CommentItemFanViewImpl> get copyWith =>
      __$$CommentItemFanViewImplCopyWithImpl<_$CommentItemFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentItemFanViewImplToJson(
      this,
    );
  }
}

abstract class _CommentItemFanView implements CommentItemFanView {
  const factory _CommentItemFanView(
          {required final String id,
          required final String content,
          required final DateTime createdAt,
          required final DateTime updatedAt,
          required final CommentUserFanView user,
          required final int repliesCount,
          required final int reactionsCount,
          required final Map<String, dynamic> reactionCounts,
          final String? userReaction,
          required final bool isReacted,
          required final List<ReplyItemFanView> replies}) =
      _$CommentItemFanViewImpl;

  factory _CommentItemFanView.fromJson(Map<String, dynamic> json) =
      _$CommentItemFanViewImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  CommentUserFanView get user;
  @override
  int get repliesCount;
  @override
  int get reactionsCount;
  @override
  Map<String, dynamic> get reactionCounts;
  @override
  String? get userReaction;
  @override
  bool get isReacted;
  @override
  List<ReplyItemFanView> get replies;

  /// Create a copy of CommentItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentItemFanViewImplCopyWith<_$CommentItemFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentUserFanView _$CommentUserFanViewFromJson(Map<String, dynamic> json) {
  return _CommentUserFanView.fromJson(json);
}

/// @nodoc
mixin _$CommentUserFanView {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this CommentUserFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentUserFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentUserFanViewCopyWith<CommentUserFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentUserFanViewCopyWith<$Res> {
  factory $CommentUserFanViewCopyWith(
          CommentUserFanView value, $Res Function(CommentUserFanView) then) =
      _$CommentUserFanViewCopyWithImpl<$Res, CommentUserFanView>;
  @useResult
  $Res call({String id, String name, String? username, String? profilePicture});
}

/// @nodoc
class _$CommentUserFanViewCopyWithImpl<$Res, $Val extends CommentUserFanView>
    implements $CommentUserFanViewCopyWith<$Res> {
  _$CommentUserFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentUserFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
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
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentUserFanViewImplCopyWith<$Res>
    implements $CommentUserFanViewCopyWith<$Res> {
  factory _$$CommentUserFanViewImplCopyWith(_$CommentUserFanViewImpl value,
          $Res Function(_$CommentUserFanViewImpl) then) =
      __$$CommentUserFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? username, String? profilePicture});
}

/// @nodoc
class __$$CommentUserFanViewImplCopyWithImpl<$Res>
    extends _$CommentUserFanViewCopyWithImpl<$Res, _$CommentUserFanViewImpl>
    implements _$$CommentUserFanViewImplCopyWith<$Res> {
  __$$CommentUserFanViewImplCopyWithImpl(_$CommentUserFanViewImpl _value,
      $Res Function(_$CommentUserFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentUserFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$CommentUserFanViewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentUserFanViewImpl implements _CommentUserFanView {
  const _$CommentUserFanViewImpl(
      {required this.id,
      required this.name,
      this.username,
      this.profilePicture});

  factory _$CommentUserFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentUserFanViewImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? username;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'CommentUserFanView(id: $id, name: $name, username: $username, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentUserFanViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, profilePicture);

  /// Create a copy of CommentUserFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentUserFanViewImplCopyWith<_$CommentUserFanViewImpl> get copyWith =>
      __$$CommentUserFanViewImplCopyWithImpl<_$CommentUserFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentUserFanViewImplToJson(
      this,
    );
  }
}

abstract class _CommentUserFanView implements CommentUserFanView {
  const factory _CommentUserFanView(
      {required final String id,
      required final String name,
      final String? username,
      final String? profilePicture}) = _$CommentUserFanViewImpl;

  factory _CommentUserFanView.fromJson(Map<String, dynamic> json) =
      _$CommentUserFanViewImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get username;
  @override
  String? get profilePicture;

  /// Create a copy of CommentUserFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentUserFanViewImplCopyWith<_$CommentUserFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReplyItemFanView _$ReplyItemFanViewFromJson(Map<String, dynamic> json) {
  return _ReplyItemFanView.fromJson(json);
}

/// @nodoc
mixin _$ReplyItemFanView {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  CommentUserFanView get user => throw _privateConstructorUsedError;

  /// Serializes this ReplyItemFanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReplyItemFanViewCopyWith<ReplyItemFanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplyItemFanViewCopyWith<$Res> {
  factory $ReplyItemFanViewCopyWith(
          ReplyItemFanView value, $Res Function(ReplyItemFanView) then) =
      _$ReplyItemFanViewCopyWithImpl<$Res, ReplyItemFanView>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CommentUserFanView user});

  $CommentUserFanViewCopyWith<$Res> get user;
}

/// @nodoc
class _$ReplyItemFanViewCopyWithImpl<$Res, $Val extends ReplyItemFanView>
    implements $ReplyItemFanViewCopyWith<$Res> {
  _$ReplyItemFanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUserFanView,
    ) as $Val);
  }

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentUserFanViewCopyWith<$Res> get user {
    return $CommentUserFanViewCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReplyItemFanViewImplCopyWith<$Res>
    implements $ReplyItemFanViewCopyWith<$Res> {
  factory _$$ReplyItemFanViewImplCopyWith(_$ReplyItemFanViewImpl value,
          $Res Function(_$ReplyItemFanViewImpl) then) =
      __$$ReplyItemFanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime createdAt,
      DateTime updatedAt,
      CommentUserFanView user});

  @override
  $CommentUserFanViewCopyWith<$Res> get user;
}

/// @nodoc
class __$$ReplyItemFanViewImplCopyWithImpl<$Res>
    extends _$ReplyItemFanViewCopyWithImpl<$Res, _$ReplyItemFanViewImpl>
    implements _$$ReplyItemFanViewImplCopyWith<$Res> {
  __$$ReplyItemFanViewImplCopyWithImpl(_$ReplyItemFanViewImpl _value,
      $Res Function(_$ReplyItemFanViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(_$ReplyItemFanViewImpl(
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CommentUserFanView,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyItemFanViewImpl implements _ReplyItemFanView {
  const _$ReplyItemFanViewImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.user});

  factory _$ReplyItemFanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyItemFanViewImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final CommentUserFanView user;

  @override
  String toString() {
    return 'ReplyItemFanView(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyItemFanViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, createdAt, updatedAt, user);

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyItemFanViewImplCopyWith<_$ReplyItemFanViewImpl> get copyWith =>
      __$$ReplyItemFanViewImplCopyWithImpl<_$ReplyItemFanViewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyItemFanViewImplToJson(
      this,
    );
  }
}

abstract class _ReplyItemFanView implements ReplyItemFanView {
  const factory _ReplyItemFanView(
      {required final String id,
      required final String content,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final CommentUserFanView user}) = _$ReplyItemFanViewImpl;

  factory _ReplyItemFanView.fromJson(Map<String, dynamic> json) =
      _$ReplyItemFanViewImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  CommentUserFanView get user;

  /// Create a copy of ReplyItemFanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyItemFanViewImplCopyWith<_$ReplyItemFanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

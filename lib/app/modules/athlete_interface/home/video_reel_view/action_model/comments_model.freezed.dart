// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) {
  return _CommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentsResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CommentsData get data => throw _privateConstructorUsedError;

  /// Serializes this CommentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsResponseCopyWith<CommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsResponseCopyWith<$Res> {
  factory $CommentsResponseCopyWith(
          CommentsResponse value, $Res Function(CommentsResponse) then) =
      _$CommentsResponseCopyWithImpl<$Res, CommentsResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, CommentsData data});

  $CommentsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CommentsResponseCopyWithImpl<$Res, $Val extends CommentsResponse>
    implements $CommentsResponseCopyWith<$Res> {
  _$CommentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsResponse
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
              as CommentsData,
    ) as $Val);
  }

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentsDataCopyWith<$Res> get data {
    return $CommentsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentsResponseImplCopyWith<$Res>
    implements $CommentsResponseCopyWith<$Res> {
  factory _$$CommentsResponseImplCopyWith(_$CommentsResponseImpl value,
          $Res Function(_$CommentsResponseImpl) then) =
      __$$CommentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, CommentsData data});

  @override
  $CommentsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CommentsResponseImplCopyWithImpl<$Res>
    extends _$CommentsResponseCopyWithImpl<$Res, _$CommentsResponseImpl>
    implements _$$CommentsResponseImplCopyWith<$Res> {
  __$$CommentsResponseImplCopyWithImpl(_$CommentsResponseImpl _value,
      $Res Function(_$CommentsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CommentsResponseImpl(
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
              as CommentsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsResponseImpl implements _CommentsResponse {
  const _$CommentsResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$CommentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final CommentsData data;

  @override
  String toString() {
    return 'CommentsResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsResponseImpl &&
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

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      __$$CommentsResponseImplCopyWithImpl<_$CommentsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsResponseImplToJson(
      this,
    );
  }
}

abstract class _CommentsResponse implements CommentsResponse {
  const factory _CommentsResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final CommentsData data}) = _$CommentsResponseImpl;

  factory _CommentsResponse.fromJson(Map<String, dynamic> json) =
      _$CommentsResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  CommentsData get data;

  /// Create a copy of CommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsResponseImplCopyWith<_$CommentsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentsData _$CommentsDataFromJson(Map<String, dynamic> json) {
  return _CommentsData.fromJson(json);
}

/// @nodoc
mixin _$CommentsData {
  String get channelId => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  List<CommentItem> get comments => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this CommentsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsDataCopyWith<CommentsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsDataCopyWith<$Res> {
  factory $CommentsDataCopyWith(
          CommentsData value, $Res Function(CommentsData) then) =
      _$CommentsDataCopyWithImpl<$Res, CommentsData>;
  @useResult
  $Res call(
      {String channelId,
      int commentsCount,
      List<CommentItem> comments,
      Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$CommentsDataCopyWithImpl<$Res, $Val extends CommentsData>
    implements $CommentsDataCopyWith<$Res> {
  _$CommentsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? commentsCount = null,
    Object? comments = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  /// Create a copy of CommentsData
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
abstract class _$$CommentsDataImplCopyWith<$Res>
    implements $CommentsDataCopyWith<$Res> {
  factory _$$CommentsDataImplCopyWith(
          _$CommentsDataImpl value, $Res Function(_$CommentsDataImpl) then) =
      __$$CommentsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      int commentsCount,
      List<CommentItem> comments,
      Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$CommentsDataImplCopyWithImpl<$Res>
    extends _$CommentsDataCopyWithImpl<$Res, _$CommentsDataImpl>
    implements _$$CommentsDataImplCopyWith<$Res> {
  __$$CommentsDataImplCopyWithImpl(
      _$CommentsDataImpl _value, $Res Function(_$CommentsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? commentsCount = null,
    Object? comments = null,
    Object? pagination = null,
  }) {
    return _then(_$CommentsDataImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsDataImpl implements _CommentsData {
  const _$CommentsDataImpl(
      {required this.channelId,
      required this.commentsCount,
      required final List<CommentItem> comments,
      required this.pagination})
      : _comments = comments;

  factory _$CommentsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsDataImplFromJson(json);

  @override
  final String channelId;
  @override
  final int commentsCount;
  final List<CommentItem> _comments;
  @override
  List<CommentItem> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final Pagination pagination;

  @override
  String toString() {
    return 'CommentsData(channelId: $channelId, commentsCount: $commentsCount, comments: $comments, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsDataImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channelId, commentsCount,
      const DeepCollectionEquality().hash(_comments), pagination);

  /// Create a copy of CommentsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsDataImplCopyWith<_$CommentsDataImpl> get copyWith =>
      __$$CommentsDataImplCopyWithImpl<_$CommentsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsDataImplToJson(
      this,
    );
  }
}

abstract class _CommentsData implements CommentsData {
  const factory _CommentsData(
      {required final String channelId,
      required final int commentsCount,
      required final List<CommentItem> comments,
      required final Pagination pagination}) = _$CommentsDataImpl;

  factory _CommentsData.fromJson(Map<String, dynamic> json) =
      _$CommentsDataImpl.fromJson;

  @override
  String get channelId;
  @override
  int get commentsCount;
  @override
  List<CommentItem> get comments;
  @override
  Pagination get pagination;

  /// Create a copy of CommentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsDataImplCopyWith<_$CommentsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentItem _$CommentItemFromJson(Map<String, dynamic> json) {
  return _CommentItem.fromJson(json);
}

/// @nodoc
mixin _$CommentItem {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get repliesCount => throw _privateConstructorUsedError;
  int get reactionsCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get reactionCounts => throw _privateConstructorUsedError;
  bool get isReacted => throw _privateConstructorUsedError;
  String? get userReaction => throw _privateConstructorUsedError;
  List<CommentItem> get replies => throw _privateConstructorUsedError;

  /// Serializes this CommentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentItemCopyWith<CommentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentItemCopyWith<$Res> {
  factory $CommentItemCopyWith(
          CommentItem value, $Res Function(CommentItem) then) =
      _$CommentItemCopyWithImpl<$Res, CommentItem>;
  @useResult
  $Res call(
      {String id,
      String content,
      String createdAt,
      String updatedAt,
      User user,
      int repliesCount,
      int reactionsCount,
      Map<String, dynamic> reactionCounts,
      bool isReacted,
      String? userReaction,
      List<CommentItem> replies});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentItemCopyWithImpl<$Res, $Val extends CommentItem>
    implements $CommentItemCopyWith<$Res> {
  _$CommentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentItem
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
    Object? isReacted = null,
    Object? userReaction = freezed,
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
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<CommentItem>,
    ) as $Val);
  }

  /// Create a copy of CommentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentItemImplCopyWith<$Res>
    implements $CommentItemCopyWith<$Res> {
  factory _$$CommentItemImplCopyWith(
          _$CommentItemImpl value, $Res Function(_$CommentItemImpl) then) =
      __$$CommentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String createdAt,
      String updatedAt,
      User user,
      int repliesCount,
      int reactionsCount,
      Map<String, dynamic> reactionCounts,
      bool isReacted,
      String? userReaction,
      List<CommentItem> replies});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentItemImplCopyWithImpl<$Res>
    extends _$CommentItemCopyWithImpl<$Res, _$CommentItemImpl>
    implements _$$CommentItemImplCopyWith<$Res> {
  __$$CommentItemImplCopyWithImpl(
      _$CommentItemImpl _value, $Res Function(_$CommentItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentItem
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
    Object? isReacted = null,
    Object? userReaction = freezed,
    Object? replies = null,
  }) {
    return _then(_$CommentItemImpl(
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      userReaction: freezed == userReaction
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<CommentItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentItemImpl implements _CommentItem {
  const _$CommentItemImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.user,
      required this.repliesCount,
      required this.reactionsCount,
      required final Map<String, dynamic> reactionCounts,
      required this.isReacted,
      this.userReaction,
      required final List<CommentItem> replies})
      : _reactionCounts = reactionCounts,
        _replies = replies;

  factory _$CommentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentItemImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final User user;
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
  final bool isReacted;
  @override
  final String? userReaction;
  final List<CommentItem> _replies;
  @override
  List<CommentItem> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString() {
    return 'CommentItem(id: $id, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, repliesCount: $repliesCount, reactionsCount: $reactionsCount, reactionCounts: $reactionCounts, isReacted: $isReacted, userReaction: $userReaction, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentItemImpl &&
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
            (identical(other.isReacted, isReacted) ||
                other.isReacted == isReacted) &&
            (identical(other.userReaction, userReaction) ||
                other.userReaction == userReaction) &&
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
      isReacted,
      userReaction,
      const DeepCollectionEquality().hash(_replies));

  /// Create a copy of CommentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentItemImplCopyWith<_$CommentItemImpl> get copyWith =>
      __$$CommentItemImplCopyWithImpl<_$CommentItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentItemImplToJson(
      this,
    );
  }
}

abstract class _CommentItem implements CommentItem {
  const factory _CommentItem(
      {required final String id,
      required final String content,
      required final String createdAt,
      required final String updatedAt,
      required final User user,
      required final int repliesCount,
      required final int reactionsCount,
      required final Map<String, dynamic> reactionCounts,
      required final bool isReacted,
      final String? userReaction,
      required final List<CommentItem> replies}) = _$CommentItemImpl;

  factory _CommentItem.fromJson(Map<String, dynamic> json) =
      _$CommentItemImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  User get user;
  @override
  int get repliesCount;
  @override
  int get reactionsCount;
  @override
  Map<String, dynamic> get reactionCounts;
  @override
  bool get isReacted;
  @override
  String? get userReaction;
  @override
  List<CommentItem> get replies;

  /// Create a copy of CommentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentItemImplCopyWith<_$CommentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? username,
      String? profilePicture,
      String role});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
    Object? role = null,
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? username,
      String? profilePicture,
      String role});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = freezed,
    Object? profilePicture = freezed,
    Object? role = null,
  }) {
    return _then(_$UserImpl(
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      this.username,
      this.profilePicture,
      required this.role});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? username;
  @override
  final String? profilePicture;
  @override
  final String role;

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, profilePicture: $profilePicture, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, profilePicture, role);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String name,
      final String? username,
      final String? profilePicture,
      required final String role}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get username;
  @override
  String? get profilePicture;
  @override
  String get role;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

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
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
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
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int total, int totalPages, bool hasMore});
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
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasMore = null,
  }) {
    return _then(_$PaginationImpl(
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
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {required this.page,
      required this.limit,
      required this.total,
      required this.totalPages,
      required this.hasMore});

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

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
    return 'Pagination(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
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
      {required final int page,
      required final int limit,
      required final int total,
      required final int totalPages,
      required final bool hasMore}) = _$PaginationImpl;

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl.fromJson;

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

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

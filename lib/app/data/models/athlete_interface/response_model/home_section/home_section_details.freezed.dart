// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_section_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeSectionResponse _$HomeSectionResponseFromJson(Map<String, dynamic> json) {
  return _HomeSectionResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeSectionResponse {
  bool get status => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  HomeData get data => throw _privateConstructorUsedError;

  /// Serializes this HomeSectionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeSectionResponseCopyWith<HomeSectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSectionResponseCopyWith<$Res> {
  factory $HomeSectionResponseCopyWith(
          HomeSectionResponse value, $Res Function(HomeSectionResponse) then) =
      _$HomeSectionResponseCopyWithImpl<$Res, HomeSectionResponse>;
  @useResult
  $Res call({bool status, int statusCode, String message, HomeData data});

  $HomeDataCopyWith<$Res> get data;
}

/// @nodoc
class _$HomeSectionResponseCopyWithImpl<$Res, $Val extends HomeSectionResponse>
    implements $HomeSectionResponseCopyWith<$Res> {
  _$HomeSectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeSectionResponse
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
              as HomeData,
    ) as $Val);
  }

  /// Create a copy of HomeSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeDataCopyWith<$Res> get data {
    return $HomeDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeSectionResponseImplCopyWith<$Res>
    implements $HomeSectionResponseCopyWith<$Res> {
  factory _$$HomeSectionResponseImplCopyWith(_$HomeSectionResponseImpl value,
          $Res Function(_$HomeSectionResponseImpl) then) =
      __$$HomeSectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, int statusCode, String message, HomeData data});

  @override
  $HomeDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$HomeSectionResponseImplCopyWithImpl<$Res>
    extends _$HomeSectionResponseCopyWithImpl<$Res, _$HomeSectionResponseImpl>
    implements _$$HomeSectionResponseImplCopyWith<$Res> {
  __$$HomeSectionResponseImplCopyWithImpl(_$HomeSectionResponseImpl _value,
      $Res Function(_$HomeSectionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$HomeSectionResponseImpl(
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
              as HomeData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeSectionResponseImpl implements _HomeSectionResponse {
  const _$HomeSectionResponseImpl(
      {required this.status,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$HomeSectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeSectionResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final HomeData data;

  @override
  String toString() {
    return 'HomeSectionResponse(status: $status, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSectionResponseImpl &&
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

  /// Create a copy of HomeSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSectionResponseImplCopyWith<_$HomeSectionResponseImpl> get copyWith =>
      __$$HomeSectionResponseImplCopyWithImpl<_$HomeSectionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeSectionResponseImplToJson(
      this,
    );
  }
}

abstract class _HomeSectionResponse implements HomeSectionResponse {
  const factory _HomeSectionResponse(
      {required final bool status,
      required final int statusCode,
      required final String message,
      required final HomeData data}) = _$HomeSectionResponseImpl;

  factory _HomeSectionResponse.fromJson(Map<String, dynamic> json) =
      _$HomeSectionResponseImpl.fromJson;

  @override
  bool get status;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  HomeData get data;

  /// Create a copy of HomeSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeSectionResponseImplCopyWith<_$HomeSectionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return _HomeData.fromJson(json);
}

/// @nodoc
mixin _$HomeData {
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  int get fansCount => throw _privateConstructorUsedError;
  String get heading => throw _privateConstructorUsedError;
  IntroData? get intro => throw _privateConstructorUsedError;
  List<String>? get aboutMe => throw _privateConstructorUsedError;
  List<FavSportsMoment> get favSportsMoments =>
      throw _privateConstructorUsedError;
  FindAthlete? get findAthlete => throw _privateConstructorUsedError;

  /// Serializes this HomeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res, HomeData>;
  @useResult
  $Res call(
      {String? profilePicture,
      String? bio,
      int fansCount,
      String heading,
      IntroData? intro,
      List<String>? aboutMe,
      List<FavSportsMoment> favSportsMoments,
      FindAthlete? findAthlete});

  $IntroDataCopyWith<$Res>? get intro;
  $FindAthleteCopyWith<$Res>? get findAthlete;
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res, $Val extends HomeData>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePicture = freezed,
    Object? bio = freezed,
    Object? fansCount = null,
    Object? heading = null,
    Object? intro = freezed,
    Object? aboutMe = freezed,
    Object? favSportsMoments = null,
    Object? findAthlete = freezed,
  }) {
    return _then(_value.copyWith(
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      fansCount: null == fansCount
          ? _value.fansCount
          : fansCount // ignore: cast_nullable_to_non_nullable
              as int,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      intro: freezed == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as IntroData?,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favSportsMoments: null == favSportsMoments
          ? _value.favSportsMoments
          : favSportsMoments // ignore: cast_nullable_to_non_nullable
              as List<FavSportsMoment>,
      findAthlete: freezed == findAthlete
          ? _value.findAthlete
          : findAthlete // ignore: cast_nullable_to_non_nullable
              as FindAthlete?,
    ) as $Val);
  }

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IntroDataCopyWith<$Res>? get intro {
    if (_value.intro == null) {
      return null;
    }

    return $IntroDataCopyWith<$Res>(_value.intro!, (value) {
      return _then(_value.copyWith(intro: value) as $Val);
    });
  }

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FindAthleteCopyWith<$Res>? get findAthlete {
    if (_value.findAthlete == null) {
      return null;
    }

    return $FindAthleteCopyWith<$Res>(_value.findAthlete!, (value) {
      return _then(_value.copyWith(findAthlete: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeDataImplCopyWith<$Res>
    implements $HomeDataCopyWith<$Res> {
  factory _$$HomeDataImplCopyWith(
          _$HomeDataImpl value, $Res Function(_$HomeDataImpl) then) =
      __$$HomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? profilePicture,
      String? bio,
      int fansCount,
      String heading,
      IntroData? intro,
      List<String>? aboutMe,
      List<FavSportsMoment> favSportsMoments,
      FindAthlete? findAthlete});

  @override
  $IntroDataCopyWith<$Res>? get intro;
  @override
  $FindAthleteCopyWith<$Res>? get findAthlete;
}

/// @nodoc
class __$$HomeDataImplCopyWithImpl<$Res>
    extends _$HomeDataCopyWithImpl<$Res, _$HomeDataImpl>
    implements _$$HomeDataImplCopyWith<$Res> {
  __$$HomeDataImplCopyWithImpl(
      _$HomeDataImpl _value, $Res Function(_$HomeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePicture = freezed,
    Object? bio = freezed,
    Object? fansCount = null,
    Object? heading = null,
    Object? intro = freezed,
    Object? aboutMe = freezed,
    Object? favSportsMoments = null,
    Object? findAthlete = freezed,
  }) {
    return _then(_$HomeDataImpl(
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      fansCount: null == fansCount
          ? _value.fansCount
          : fansCount // ignore: cast_nullable_to_non_nullable
              as int,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      intro: freezed == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as IntroData?,
      aboutMe: freezed == aboutMe
          ? _value._aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favSportsMoments: null == favSportsMoments
          ? _value._favSportsMoments
          : favSportsMoments // ignore: cast_nullable_to_non_nullable
              as List<FavSportsMoment>,
      findAthlete: freezed == findAthlete
          ? _value.findAthlete
          : findAthlete // ignore: cast_nullable_to_non_nullable
              as FindAthlete?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDataImpl implements _HomeData {
  const _$HomeDataImpl(
      {this.profilePicture,
      this.bio,
      required this.fansCount,
      required this.heading,
      this.intro,
      final List<String>? aboutMe,
      required final List<FavSportsMoment> favSportsMoments,
      this.findAthlete})
      : _aboutMe = aboutMe,
        _favSportsMoments = favSportsMoments;

  factory _$HomeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDataImplFromJson(json);

  @override
  final String? profilePicture;
  @override
  final String? bio;
  @override
  final int fansCount;
  @override
  final String heading;
  @override
  final IntroData? intro;
  final List<String>? _aboutMe;
  @override
  List<String>? get aboutMe {
    final value = _aboutMe;
    if (value == null) return null;
    if (_aboutMe is EqualUnmodifiableListView) return _aboutMe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FavSportsMoment> _favSportsMoments;
  @override
  List<FavSportsMoment> get favSportsMoments {
    if (_favSportsMoments is EqualUnmodifiableListView)
      return _favSportsMoments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favSportsMoments);
  }

  @override
  final FindAthlete? findAthlete;

  @override
  String toString() {
    return 'HomeData(profilePicture: $profilePicture, bio: $bio, fansCount: $fansCount, heading: $heading, intro: $intro, aboutMe: $aboutMe, favSportsMoments: $favSportsMoments, findAthlete: $findAthlete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataImpl &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.fansCount, fansCount) ||
                other.fansCount == fansCount) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.intro, intro) || other.intro == intro) &&
            const DeepCollectionEquality().equals(other._aboutMe, _aboutMe) &&
            const DeepCollectionEquality()
                .equals(other._favSportsMoments, _favSportsMoments) &&
            (identical(other.findAthlete, findAthlete) ||
                other.findAthlete == findAthlete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profilePicture,
      bio,
      fansCount,
      heading,
      intro,
      const DeepCollectionEquality().hash(_aboutMe),
      const DeepCollectionEquality().hash(_favSportsMoments),
      findAthlete);

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      __$$HomeDataImplCopyWithImpl<_$HomeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDataImplToJson(
      this,
    );
  }
}

abstract class _HomeData implements HomeData {
  const factory _HomeData(
      {final String? profilePicture,
      final String? bio,
      required final int fansCount,
      required final String heading,
      final IntroData? intro,
      final List<String>? aboutMe,
      required final List<FavSportsMoment> favSportsMoments,
      final FindAthlete? findAthlete}) = _$HomeDataImpl;

  factory _HomeData.fromJson(Map<String, dynamic> json) =
      _$HomeDataImpl.fromJson;

  @override
  String? get profilePicture;
  @override
  String? get bio;
  @override
  int get fansCount;
  @override
  String get heading;
  @override
  IntroData? get intro;
  @override
  List<String>? get aboutMe;
  @override
  List<FavSportsMoment> get favSportsMoments;
  @override
  FindAthlete? get findAthlete;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IntroData _$IntroDataFromJson(Map<String, dynamic> json) {
  return _IntroData.fromJson(json);
}

/// @nodoc
mixin _$IntroData {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get brandId => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<MediaItem> get media => throw _privateConstructorUsedError;

  /// Serializes this IntroData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IntroData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntroDataCopyWith<IntroData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroDataCopyWith<$Res> {
  factory $IntroDataCopyWith(IntroData value, $Res Function(IntroData) then) =
      _$IntroDataCopyWithImpl<$Res, IntroData>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String? status,
      String? type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class _$IntroDataCopyWithImpl<$Res, $Val extends IntroData>
    implements $IntroDataCopyWith<$Res> {
  _$IntroDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntroData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<MediaItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroDataImplCopyWith<$Res>
    implements $IntroDataCopyWith<$Res> {
  factory _$$IntroDataImplCopyWith(
          _$IntroDataImpl value, $Res Function(_$IntroDataImpl) then) =
      __$$IntroDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String? status,
      String? type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class __$$IntroDataImplCopyWithImpl<$Res>
    extends _$IntroDataCopyWithImpl<$Res, _$IntroDataImpl>
    implements _$$IntroDataImplCopyWith<$Res> {
  __$$IntroDataImplCopyWithImpl(
      _$IntroDataImpl _value, $Res Function(_$IntroDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntroData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
  }) {
    return _then(_$IntroDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<MediaItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntroDataImpl implements _IntroData {
  const _$IntroDataImpl(
      {this.id,
      this.title,
      this.caption,
      this.mediaUrl,
      this.thumbnailUrl,
      this.categoryId,
      this.categoryName,
      this.brandId,
      this.brandName,
      this.status,
      this.type,
      this.isArchived,
      this.scheduledAt,
      this.publishedAt,
      this.likesCount,
      this.isLiked,
      this.commentsCount,
      this.createdAt,
      this.updatedAt,
      required final List<MediaItem> media})
      : _media = media;

  factory _$IntroDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntroDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? caption;
  @override
  final String? mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  final String? brandId;
  @override
  final String? brandName;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final bool? isArchived;
  @override
  final String? scheduledAt;
  @override
  final String? publishedAt;
  @override
  final int? likesCount;
  @override
  final bool? isLiked;
  @override
  final int? commentsCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<MediaItem> _media;
  @override
  List<MediaItem> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'IntroData(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, categoryId: $categoryId, categoryName: $categoryName, brandId: $brandId, brandName: $brandName, status: $status, type: $type, isArchived: $isArchived, scheduledAt: $scheduledAt, publishedAt: $publishedAt, likesCount: $likesCount, isLiked: $isLiked, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroDataImpl &&
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
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
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
        isLiked,
        commentsCount,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_media)
      ]);

  /// Create a copy of IntroData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroDataImplCopyWith<_$IntroDataImpl> get copyWith =>
      __$$IntroDataImplCopyWithImpl<_$IntroDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntroDataImplToJson(
      this,
    );
  }
}

abstract class _IntroData implements IntroData {
  const factory _IntroData(
      {final String? id,
      final String? title,
      final String? caption,
      final String? mediaUrl,
      final String? thumbnailUrl,
      final String? categoryId,
      final String? categoryName,
      final String? brandId,
      final String? brandName,
      final String? status,
      final String? type,
      final bool? isArchived,
      final String? scheduledAt,
      final String? publishedAt,
      final int? likesCount,
      final bool? isLiked,
      final int? commentsCount,
      final String? createdAt,
      final String? updatedAt,
      required final List<MediaItem> media}) = _$IntroDataImpl;

  factory _IntroData.fromJson(Map<String, dynamic> json) =
      _$IntroDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get caption;
  @override
  String? get mediaUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  String? get brandId;
  @override
  String? get brandName;
  @override
  String? get status;
  @override
  String? get type;
  @override
  bool? get isArchived;
  @override
  String? get scheduledAt;
  @override
  String? get publishedAt;
  @override
  int? get likesCount;
  @override
  bool? get isLiked;
  @override
  int? get commentsCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<MediaItem> get media;

  /// Create a copy of IntroData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntroDataImplCopyWith<_$IntroDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavSportsMoment _$FavSportsMomentFromJson(Map<String, dynamic> json) {
  return _FavSportsMoment.fromJson(json);
}

/// @nodoc
mixin _$FavSportsMoment {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get brandId => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isArchived => throw _privateConstructorUsedError;
  String? get scheduledAt => throw _privateConstructorUsedError;
  String? get publishedAt => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<MediaItem> get media => throw _privateConstructorUsedError;

  /// Serializes this FavSportsMoment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavSportsMoment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavSportsMomentCopyWith<FavSportsMoment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavSportsMomentCopyWith<$Res> {
  factory $FavSportsMomentCopyWith(
          FavSportsMoment value, $Res Function(FavSportsMoment) then) =
      _$FavSportsMomentCopyWithImpl<$Res, FavSportsMoment>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String? status,
      String? type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class _$FavSportsMomentCopyWithImpl<$Res, $Val extends FavSportsMoment>
    implements $FavSportsMomentCopyWith<$Res> {
  _$FavSportsMomentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavSportsMoment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<MediaItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavSportsMomentImplCopyWith<$Res>
    implements $FavSportsMomentCopyWith<$Res> {
  factory _$$FavSportsMomentImplCopyWith(_$FavSportsMomentImpl value,
          $Res Function(_$FavSportsMomentImpl) then) =
      __$$FavSportsMomentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? caption,
      String? mediaUrl,
      String? thumbnailUrl,
      String? categoryId,
      String? categoryName,
      String? brandId,
      String? brandName,
      String? status,
      String? type,
      bool? isArchived,
      String? scheduledAt,
      String? publishedAt,
      int? likesCount,
      bool? isLiked,
      int? commentsCount,
      String? createdAt,
      String? updatedAt,
      List<MediaItem> media});
}

/// @nodoc
class __$$FavSportsMomentImplCopyWithImpl<$Res>
    extends _$FavSportsMomentCopyWithImpl<$Res, _$FavSportsMomentImpl>
    implements _$$FavSportsMomentImplCopyWith<$Res> {
  __$$FavSportsMomentImplCopyWithImpl(
      _$FavSportsMomentImpl _value, $Res Function(_$FavSportsMomentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavSportsMoment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caption = freezed,
    Object? mediaUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? brandId = freezed,
    Object? brandName = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isArchived = freezed,
    Object? scheduledAt = freezed,
    Object? publishedAt = freezed,
    Object? likesCount = freezed,
    Object? isLiked = freezed,
    Object? commentsCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? media = null,
  }) {
    return _then(_$FavSportsMomentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as List<MediaItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavSportsMomentImpl implements _FavSportsMoment {
  const _$FavSportsMomentImpl(
      {this.id,
      this.title,
      this.caption,
      this.mediaUrl,
      this.thumbnailUrl,
      this.categoryId,
      this.categoryName,
      this.brandId,
      this.brandName,
      this.status,
      this.type,
      this.isArchived,
      this.scheduledAt,
      this.publishedAt,
      this.likesCount,
      this.isLiked,
      this.commentsCount,
      this.createdAt,
      this.updatedAt,
      required final List<MediaItem> media})
      : _media = media;

  factory _$FavSportsMomentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavSportsMomentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? caption;
  @override
  final String? mediaUrl;
  @override
  final String? thumbnailUrl;
  @override
  final String? categoryId;
  @override
  final String? categoryName;
  @override
  final String? brandId;
  @override
  final String? brandName;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final bool? isArchived;
  @override
  final String? scheduledAt;
  @override
  final String? publishedAt;
  @override
  final int? likesCount;
  @override
  final bool? isLiked;
  @override
  final int? commentsCount;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<MediaItem> _media;
  @override
  List<MediaItem> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'FavSportsMoment(id: $id, title: $title, caption: $caption, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, categoryId: $categoryId, categoryName: $categoryName, brandId: $brandId, brandName: $brandName, status: $status, type: $type, isArchived: $isArchived, scheduledAt: $scheduledAt, publishedAt: $publishedAt, likesCount: $likesCount, isLiked: $isLiked, commentsCount: $commentsCount, createdAt: $createdAt, updatedAt: $updatedAt, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavSportsMomentImpl &&
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
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
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
        isLiked,
        commentsCount,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_media)
      ]);

  /// Create a copy of FavSportsMoment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavSportsMomentImplCopyWith<_$FavSportsMomentImpl> get copyWith =>
      __$$FavSportsMomentImplCopyWithImpl<_$FavSportsMomentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavSportsMomentImplToJson(
      this,
    );
  }
}

abstract class _FavSportsMoment implements FavSportsMoment {
  const factory _FavSportsMoment(
      {final String? id,
      final String? title,
      final String? caption,
      final String? mediaUrl,
      final String? thumbnailUrl,
      final String? categoryId,
      final String? categoryName,
      final String? brandId,
      final String? brandName,
      final String? status,
      final String? type,
      final bool? isArchived,
      final String? scheduledAt,
      final String? publishedAt,
      final int? likesCount,
      final bool? isLiked,
      final int? commentsCount,
      final String? createdAt,
      final String? updatedAt,
      required final List<MediaItem> media}) = _$FavSportsMomentImpl;

  factory _FavSportsMoment.fromJson(Map<String, dynamic> json) =
      _$FavSportsMomentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get caption;
  @override
  String? get mediaUrl;
  @override
  String? get thumbnailUrl;
  @override
  String? get categoryId;
  @override
  String? get categoryName;
  @override
  String? get brandId;
  @override
  String? get brandName;
  @override
  String? get status;
  @override
  String? get type;
  @override
  bool? get isArchived;
  @override
  String? get scheduledAt;
  @override
  String? get publishedAt;
  @override
  int? get likesCount;
  @override
  bool? get isLiked;
  @override
  int? get commentsCount;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<MediaItem> get media;

  /// Create a copy of FavSportsMoment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavSportsMomentImplCopyWith<_$FavSportsMomentImpl> get copyWith =>
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

FindAthlete _$FindAthleteFromJson(Map<String, dynamic> json) {
  return _FindAthlete.fromJson(json);
}

/// @nodoc
mixin _$FindAthlete {
  String? get spotify => throw _privateConstructorUsedError;
  String? get youtube => throw _privateConstructorUsedError;
  String? get instagram => throw _privateConstructorUsedError;
  String? get fameMe => throw _privateConstructorUsedError;
  String? get facebook => throw _privateConstructorUsedError;
  String? get tiktok => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;

  /// Serializes this FindAthlete to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAthlete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAthleteCopyWith<FindAthlete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAthleteCopyWith<$Res> {
  factory $FindAthleteCopyWith(
          FindAthlete value, $Res Function(FindAthlete) then) =
      _$FindAthleteCopyWithImpl<$Res, FindAthlete>;
  @useResult
  $Res call(
      {String? spotify,
      String? youtube,
      String? instagram,
      String? fameMe,
      String? facebook,
      String? tiktok,
      String? twitter});
}

/// @nodoc
class _$FindAthleteCopyWithImpl<$Res, $Val extends FindAthlete>
    implements $FindAthleteCopyWith<$Res> {
  _$FindAthleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAthlete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotify = freezed,
    Object? youtube = freezed,
    Object? instagram = freezed,
    Object? fameMe = freezed,
    Object? facebook = freezed,
    Object? tiktok = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_value.copyWith(
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      fameMe: freezed == fameMe
          ? _value.fameMe
          : fameMe // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      tiktok: freezed == tiktok
          ? _value.tiktok
          : tiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAthleteImplCopyWith<$Res>
    implements $FindAthleteCopyWith<$Res> {
  factory _$$FindAthleteImplCopyWith(
          _$FindAthleteImpl value, $Res Function(_$FindAthleteImpl) then) =
      __$$FindAthleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? spotify,
      String? youtube,
      String? instagram,
      String? fameMe,
      String? facebook,
      String? tiktok,
      String? twitter});
}

/// @nodoc
class __$$FindAthleteImplCopyWithImpl<$Res>
    extends _$FindAthleteCopyWithImpl<$Res, _$FindAthleteImpl>
    implements _$$FindAthleteImplCopyWith<$Res> {
  __$$FindAthleteImplCopyWithImpl(
      _$FindAthleteImpl _value, $Res Function(_$FindAthleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAthlete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotify = freezed,
    Object? youtube = freezed,
    Object? instagram = freezed,
    Object? fameMe = freezed,
    Object? facebook = freezed,
    Object? tiktok = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_$FindAthleteImpl(
      spotify: freezed == spotify
          ? _value.spotify
          : spotify // ignore: cast_nullable_to_non_nullable
              as String?,
      youtube: freezed == youtube
          ? _value.youtube
          : youtube // ignore: cast_nullable_to_non_nullable
              as String?,
      instagram: freezed == instagram
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      fameMe: freezed == fameMe
          ? _value.fameMe
          : fameMe // ignore: cast_nullable_to_non_nullable
              as String?,
      facebook: freezed == facebook
          ? _value.facebook
          : facebook // ignore: cast_nullable_to_non_nullable
              as String?,
      tiktok: freezed == tiktok
          ? _value.tiktok
          : tiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAthleteImpl implements _FindAthlete {
  const _$FindAthleteImpl(
      {this.spotify,
      this.youtube,
      this.instagram,
      this.fameMe,
      this.facebook,
      this.tiktok,
      this.twitter});

  factory _$FindAthleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAthleteImplFromJson(json);

  @override
  final String? spotify;
  @override
  final String? youtube;
  @override
  final String? instagram;
  @override
  final String? fameMe;
  @override
  final String? facebook;
  @override
  final String? tiktok;
  @override
  final String? twitter;

  @override
  String toString() {
    return 'FindAthlete(spotify: $spotify, youtube: $youtube, instagram: $instagram, fameMe: $fameMe, facebook: $facebook, tiktok: $tiktok, twitter: $twitter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAthleteImpl &&
            (identical(other.spotify, spotify) || other.spotify == spotify) &&
            (identical(other.youtube, youtube) || other.youtube == youtube) &&
            (identical(other.instagram, instagram) ||
                other.instagram == instagram) &&
            (identical(other.fameMe, fameMe) || other.fameMe == fameMe) &&
            (identical(other.facebook, facebook) ||
                other.facebook == facebook) &&
            (identical(other.tiktok, tiktok) || other.tiktok == tiktok) &&
            (identical(other.twitter, twitter) || other.twitter == twitter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, spotify, youtube, instagram,
      fameMe, facebook, tiktok, twitter);

  /// Create a copy of FindAthlete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAthleteImplCopyWith<_$FindAthleteImpl> get copyWith =>
      __$$FindAthleteImplCopyWithImpl<_$FindAthleteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAthleteImplToJson(
      this,
    );
  }
}

abstract class _FindAthlete implements FindAthlete {
  const factory _FindAthlete(
      {final String? spotify,
      final String? youtube,
      final String? instagram,
      final String? fameMe,
      final String? facebook,
      final String? tiktok,
      final String? twitter}) = _$FindAthleteImpl;

  factory _FindAthlete.fromJson(Map<String, dynamic> json) =
      _$FindAthleteImpl.fromJson;

  @override
  String? get spotify;
  @override
  String? get youtube;
  @override
  String? get instagram;
  @override
  String? get fameMe;
  @override
  String? get facebook;
  @override
  String? get tiktok;
  @override
  String? get twitter;

  /// Create a copy of FindAthlete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAthleteImplCopyWith<_$FindAthleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

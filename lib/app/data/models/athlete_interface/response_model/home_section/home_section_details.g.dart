// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeSectionResponseImpl _$$HomeSectionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeSectionResponseImpl(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeSectionResponseImplToJson(
        _$HomeSectionResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

_$HomeDataImpl _$$HomeDataImplFromJson(Map<String, dynamic> json) =>
    _$HomeDataImpl(
      profilePicture: json['profilePicture'] as String?,
      bio: json['bio'] as String?,
      fansCount: (json['fansCount'] as num).toInt(),
      heading: json['heading'] as String,
      intro: json['intro'] == null
          ? null
          : IntroData.fromJson(json['intro'] as Map<String, dynamic>),
      aboutMe:
          (json['aboutMe'] as List<dynamic>?)?.map((e) => e as String).toList(),
      favSportsMoments: (json['favSportsMoments'] as List<dynamic>)
          .map((e) => FavSportsMoment.fromJson(e as Map<String, dynamic>))
          .toList(),
      findAthlete: json['findAthlete'] == null
          ? null
          : FindAthlete.fromJson(json['findAthlete'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeDataImplToJson(_$HomeDataImpl instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'bio': instance.bio,
      'fansCount': instance.fansCount,
      'heading': instance.heading,
      'intro': instance.intro,
      'aboutMe': instance.aboutMe,
      'favSportsMoments': instance.favSportsMoments,
      'findAthlete': instance.findAthlete,
    };

_$IntroDataImpl _$$IntroDataImplFromJson(Map<String, dynamic> json) =>
    _$IntroDataImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      isArchived: json['isArchived'] as bool?,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IntroDataImplToJson(_$IntroDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'status': instance.status,
      'type': instance.type,
      'isArchived': instance.isArchived,
      'scheduledAt': instance.scheduledAt,
      'publishedAt': instance.publishedAt,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'commentsCount': instance.commentsCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'media': instance.media,
    };

_$FavSportsMomentImpl _$$FavSportsMomentImplFromJson(
        Map<String, dynamic> json) =>
    _$FavSportsMomentImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      isArchived: json['isArchived'] as bool?,
      scheduledAt: json['scheduledAt'] as String?,
      publishedAt: json['publishedAt'] as String?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      isLiked: json['isLiked'] as bool?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      media: (json['media'] as List<dynamic>)
          .map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavSportsMomentImplToJson(
        _$FavSportsMomentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caption': instance.caption,
      'mediaUrl': instance.mediaUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'status': instance.status,
      'type': instance.type,
      'isArchived': instance.isArchived,
      'scheduledAt': instance.scheduledAt,
      'publishedAt': instance.publishedAt,
      'likesCount': instance.likesCount,
      'isLiked': instance.isLiked,
      'commentsCount': instance.commentsCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'media': instance.media,
    };

_$MediaItemImpl _$$MediaItemImplFromJson(Map<String, dynamic> json) =>
    _$MediaItemImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$MediaItemImplToJson(_$MediaItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$FindAthleteImpl _$$FindAthleteImplFromJson(Map<String, dynamic> json) =>
    _$FindAthleteImpl(
      spotify: json['spotify'] as String?,
      youtube: json['youtube'] as String?,
      instagram: json['instagram'] as String?,
      fameMe: json['fameMe'] as String?,
      facebook: json['facebook'] as String?,
      tiktok: json['tiktok'] as String?,
      twitter: json['twitter'] as String?,
    );

Map<String, dynamic> _$$FindAthleteImplToJson(_$FindAthleteImpl instance) =>
    <String, dynamic>{
      'spotify': instance.spotify,
      'youtube': instance.youtube,
      'instagram': instance.instagram,
      'fameMe': instance.fameMe,
      'facebook': instance.facebook,
      'tiktok': instance.tiktok,
      'twitter': instance.twitter,
    };

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/draft_channel/draft_model_details.dart';
import 'package:athlete_elite/app/data/models/content_studio/content_studio_response.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

String fixCorruptedUrl(String? url) {
  // If API returns null or empty after delete,
  // DO NOT attempt to fix or return any previous URL.
  if (url == null || url.isEmpty) {
    return "";
  }

  // Your existing corruption fix logic
  if (url.contains("http://atlete-backend-inln.vercel.apphttps")) {
    return url.replaceFirst("http://atlete-backend-inln.vercel.app", "");
  }

  return url;
}

Widget buildProfileImage(double radius, AtheleteLandingController controller) {
  final imageUrl = controller.profilePicture.value;

  // No profile => default asset
  if (controller.homeSectionResponse.value?.data.profilePicture == null) {
    return ClipOval(
      child: Image.asset(
        "assets/images/profile.png",
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }

  // URL profile
  if (imageUrl.startsWith("http")) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (context, error, stackTrace) {
          AppLogger.d("Profile error: $error");
          return Image.asset(
            "assets/images/profile.png",
            fit: BoxFit.cover,
            width: radius * 2,
            height: radius * 2,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return shimmerBox(
            w: radius * 2,
            h: radius * 2,
            radius: radius,
          );
        },
      ),
    );
  }

  // If not http, invalid → shimmer
  return ClipOval(
    child: shimmerBox(
      w: radius * 2,
      h: radius * 2,
      radius: radius,
    ),
  );
}

ApiProvider apiProvider =
    Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

Future<void> getFcmDeviceToken(String token) async {
  final result = await apiProvider
      .post(ApiEndpoints.updateFcmDeviceToken, {"token": token});
  if (result.success) {
    AppLogger.d(result.data);
  } else {
    AppLogger.d(result.error);
  }
}

Future<void> getFcmToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  print('FCM Token: $token');

  if (token != null) {
    await getFcmDeviceToken(token);
  }
}

Widget shimmerBox({double? w, double? h, double radius = 12}) {
  return Shimmer.fromColors(
    baseColor: const Color(0xFF2A2A2A),
    highlightColor: const Color(0xFF3A3A3A),
    child: Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

Widget buildUploadShimmer() {
  return ListView.builder(
    itemCount: 4,
    itemBuilder: (_, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerBox(w: 140.w, h: 20.h, radius: 4),
          SizedBox(height: 10.h),
          SizedBox(
            height: 125.h,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: shimmerBox(w: 100.w, h: 125.h, radius: 10.r),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
        ],
      );
    },
  );
}

PreviewItem modelToPreview(DraftChannel item) {
  return PreviewItem(
    id: item.id,
    title: item.title ?? "",
    caption: item.caption ?? "",
    mediaUrl: item.mediaUrl ?? "",
    thumbnailUrl: item.thumbnailUrl,
    categoryId: "" ?? "",
    status: item.status ?? "",
    type: item.type ?? "",
    isArchived: item.isArchived ?? false,
    scheduledAt: item.scheduledAt,
    publishedAt: item.publishedAt ?? "",
    likesCount: item.likesCount ?? 0,
    isLiked: item.isLiked ?? false,
    commentsCount: item.commentsCount ?? 0,
    createdAt: item.createdAt ?? "",
    updatedAt: item.updatedAt ?? "",
    media: [],
  );
}

PreviewItem modelToReelPreview(dynamic item) {
  T? get<T>(String key) {
    try {
      if (item is Map<String, dynamic>) {
        return item[key] as T?;
      } else {
        final value = item.toJson()[key];
        return value as T?;
      }
    } catch (_) {
      return null;
    }
  }

  final rawMediaUrl = get<String>("mediaUrl") ?? item.mediaUrl;

  // final rawThumbnailUrl = get<String>("thumbnailUrl") ?? item.thumbnailUrl;

  return PreviewItem(
    id: get<String>("id") ?? item.id ?? "",
    title: get<String>("title") ?? item.title ?? "",
    caption: get<String>("caption") ?? item.caption ?? "",
    mediaUrl: fixCorruptedUrl(rawMediaUrl) ?? "",
    thumbnailUrl: item.thumbnailUrl ?? "",
    categoryId: get<String>("categoryId") ?? "",
    status: get<String>("status") ?? item.status ?? "",
    type: get<String>("type") ?? item.type ?? "",
    isArchived: get<bool>("isArchived") ?? item.isArchived ?? false,
    scheduledAt: get<String>("scheduledAt") ?? item.scheduledAt,
    publishedAt: get<String>("publishedAt") ?? item.publishedAt ?? "",
    likesCount: get<int>("likesCount") ?? item.likesCount ?? 0,
    isLiked: get<bool>("isLiked") ?? item.isLiked ?? false,
    commentsCount: get<int>("commentsCount") ?? item.commentsCount ?? 0,
    createdAt: get<String>("createdAt") ?? item.createdAt ?? "",
    updatedAt: get<String>("updatedAt") ?? item.updatedAt ?? "",
    media: [],
  );
}

SelectedMedia convertDraftChannelItemToSelectedMedia(DraftChannel item) {
  return SelectedMedia(
    file: null, // No local file
    networkUrl: item.mediaUrl, // Media URL from API
    type: item.type.toString().toLowerCase() == 'video'
        ? MediaType.video
        : MediaType.image,
  );
}

formatDate(String? createdAt) {
  try {
    final date = DateTime.parse(createdAt!);
    return "${date.day}/0${date.month}/${date.year}";
  } catch (e) {
    return "";
  }
}

formatTime(String? createdAt) {
  try {
    final date = DateTime.parse(createdAt!);
    return "${date.hour}:${date.minute} ${date.hour < 12 ? "AM" : "PM"}";
  } catch (e) {
    return "";
  }
}

extension TimeAgoExtension on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) return "${difference.inSeconds}s";
    if (difference.inMinutes < 60) return "${difference.inMinutes}m";
    if (difference.inHours < 24) return "${difference.inHours}h";
    if (difference.inDays < 7) return "${difference.inDays}d";

    return DateFormat('MMM d').format(this); // e.g., Nov 28
  }
}

class PreviewItemForFan {
  final String id;
  final String title;
  final String caption;
  final String mediaUrl;
  final String? thumbnailUrl;

  // Category fields
  final String categoryId;
  final String? categoryName;

  // Brand fields
  final String? brandId;
  final String? brandName;

  // Post fields
  final String status;
  final String type;
  final bool isArchived;
  final String? scheduledAt;
  final String publishedAt;

  // Counts
  final int likesCount;
  final bool isLiked;
  final int commentsCount;

  // Timestamps
  final String createdAt;
  final String updatedAt;

  // Media list
  final List<MediaItem> media;

  PreviewItemForFan({
    required this.id,
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
    required this.isLiked,
    required this.commentsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.media,
  });

  factory PreviewItemForFan.fromJson(Map<String, dynamic> json) {
    return PreviewItemForFan(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      caption: json['caption'] ?? '',
      mediaUrl: json['mediaUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      categoryId: json['categoryId'] ?? '',
      categoryName: json['categoryName'],
      brandId: json['brandId'],
      brandName: json['brandName'],
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      isArchived: json['isArchived'] ?? false,
      scheduledAt: json['scheduledAt'],
      publishedAt: json['publishedAt'] ?? '',
      likesCount: json['likesCount'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      commentsCount: json['commentsCount'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      media: (json['media'] as List<dynamic>? ?? [])
          .map((e) => MediaItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'caption': caption,
      'mediaUrl': mediaUrl,
      'thumbnailUrl': thumbnailUrl,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'brandId': brandId,
      'brandName': brandName,
      'status': status,
      'type': type,
      'isArchived': isArchived,
      'scheduledAt': scheduledAt,
      'publishedAt': publishedAt,
      'likesCount': likesCount,
      'isLiked': isLiked,
      'commentsCount': commentsCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'media': media.map((e) => e.toJson()).toList(),
    };
  }
}

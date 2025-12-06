import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';

import 'package:athlete_elite/app/data/models/athlete_interface/response_model/draft_channel/draft_model_details.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/private_community/private_community_post_list_response.dart';
import 'package:athlete_elite/app/data/models/content_studio/content_studio_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/story_view/latest_story_response.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' hide Config;

import '../../../data/models/athlete_interface/response_model/upload_channel/upload_channel_response.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/navigation_helper.dart';
import '../../../widgets/AppText.dart';
import 'athelete_home_controller.dart';

class AtheleteHomeView extends GetWidget<AtheleteHomeController> {
  final bool isAthlete;
  const AtheleteHomeView({super.key, required this.isAthlete});

  AtheleteLandingController get landingController =>
      Get.isRegistered() ? Get.find() : Get.put(AtheleteLandingController());

  MediaPickerController get mediaPickerController =>
      Get.isRegistered() ? Get.find() : Get.put(MediaPickerController());

  String detectMediaType(String url) {
    final ext = url.toLowerCase();
    if (ext.endsWith(".mp4") || ext.endsWith(".mov") || ext.contains("video")) {
      return "video";
    }
    return "image";
  }

  List<StoryItem> convertToStoryItems(List<AthleteStory> stories) {
    return stories.map((e) {
      final fixedUrl = fixCorruptedUrl(e.mediaUrl);

      return StoryItem(
        id: e.id,
        mediaUrl: fixedUrl,
        mediaType: e.mediaType ?? detectMediaType(fixedUrl),
        thumbnailUrl: e.thumbnailUrl,
        duration: e.duration,
        createdAt: e.createdAt,
        publishedAt: e.publishedAt,
        expiresAt: e.publishedAt, // or your own expiration logic
        isViewed: false,
        caption: e.caption,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isAvoidbottom: true,
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            NavigationHelper.toNamed(
                              AppRoutes.atheleteLandingScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: AppColors.lightRed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: AppText(
                                "Go To\nChannel",
                                color: AppColors.black,
                                fontSize: 15.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.getAllAthleteStories();

                            if (controller.athleteStories.isNotEmpty) {
                              final storyItems = convertToStoryItems(
                                controller.athleteStories.toList(),
                              );

                              NavigationHelper.toNamed(
                                AppRoutes.fanToViewStoriesScreen,
                                arguments: {
                                  'isAthlete': isAthlete,
                                  'initialIndex': 0,
                                  'athleteName': landingController
                                          .athleteUser.value?.name ??
                                      "",
                                  'athleteProfile': landingController
                                          .homeSectionResponse
                                          .value
                                          ?.data
                                          .profilePicture ??
                                      "",
                                  'stories': storyItems,
                                },
                                transition: Transition.rightToLeft,
                              );
                            }
                          },
                          child: Obx(() {
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.lightRed,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: landingController
                                            .isHomeIntroLoading.value
                                        ? shimmerBox(
                                            w: 110.w, h: 110.w, radius: 30)
                                        : landingController
                                                        .homeSectionResponse
                                                        .value
                                                        ?.data
                                                        .profilePicture !=
                                                    null &&
                                                landingController
                                                        .homeSectionResponse
                                                        .value
                                                        ?.data
                                                        .profilePicture !=
                                                    ""
                                            ? landingController
                                                    .profilePicture.value
                                                    .startsWith("http")
                                                ? Image.network(
                                                    landingController
                                                        .profilePicture.value,
                                                    fit: BoxFit.cover,
                                                    width: 110.w,
                                                    height: 110.h,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      AppLogger.d(
                                                          "the profile error is $error and stack trace is $stackTrace");
                                                      return Image.asset(
                                                        "assets/images/profile.png",
                                                        fit: BoxFit.cover,
                                                        width: 110.w,
                                                        height: 110.h,
                                                      );
                                                    },
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return shimmerBox(
                                                          w: 110.w,
                                                          h: 110.w,
                                                          radius: 30);
                                                    },
                                                  )
                                                : shimmerBox(
                                                    w: 110.w,
                                                    h: 110.w,
                                                    radius: 30)
                                            : Image.asset(
                                                "assets/images/profile.png",
                                                fit: BoxFit.cover,
                                                width: 110.w,
                                                height: 110.h,
                                              ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        InkWell(
                          onTap: () {
                            NavigationHelper.toNamed(
                              AppRoutes.athleteSettingScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: AppColors.lightWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: AppText(
                                "Settings".tr,
                                color: AppColors.black,
                                fontSize: 16.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            mediaPickerController.selectedMixed.clear();
                            landingController.captionForNewPost.clear();
                            mediaPickerController.clearVideos();
                            mediaPickerController.selectedImages.clear();
                            mediaPickerController.selectedVideos.clear();
                            mediaPickerController.pickMixedMedia(true,
                                allowMultiple: true);
                          },
                          child: Container(
                            height: 78.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightWhite,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Direct Content\nUpload",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20.sp,
                                  fontFamily: GoogleFonts.barlowSemiCondensed()
                                      .fontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            mediaPickerController.selectedMixed.clear();
                            landingController.captionForNewPost.clear();
                            mediaPickerController.clearVideos();
                            mediaPickerController.selectedImages.clear();
                            mediaPickerController.selectedVideos.clear();
                            mediaPickerController.pickMixedMedia(true,
                                isSendToStudio: true, allowMultiple: true);
                          },
                          child: Container(
                            height: 78.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightWhite,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Send To Studio".tr,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20.sp,
                                  fontFamily: GoogleFonts.barlowSemiCondensed()
                                      .fontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildTab(
                          "home",
                          0,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                        buildTab(
                          "notification",
                          1,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                        buildTab(
                          "comment",
                          2,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                        buildTab(
                          "studio",
                          3,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                switch (controller.selectedOuterTab.value) {
                  case 0:
                    // Home tab has its own inner tabs
                    return Column(
                      children: [
                        buildHomeTab(), // inner tab buttons
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Obx(() {
                            switch (controller.selectedInnerTab.value) {
                              case 0:
                                return buildDraftsTab();
                              case 1:
                                return buildUploadsTab();
                              case 2:
                                return buildScheduledList();
                              default:
                                return buildDraftsTab();
                            }
                          }),
                        ),
                      ],
                    );

                  case 1:
                    return notificationsection();

                  case 2:
                    return buildCommentReactionTab();

                  case 3:
                    return Obx(() {
                      if (controller.isContentStudioListingLoading.value) {
                        return buildUploadShimmer();
                      }

                      if (!controller.isContentStudioListingLoading.value &&
                          controller.contentStudioResponse.value!.data.items
                              .isEmpty) {
                        return Center(
                          child: AppText("No uploads found",
                              color: Colors.white54, fontSize: 14.sp),
                        );
                      }

                      final items =
                          controller.contentStudioResponse.value?.data.items ??
                              [];

                      // if (items.isEmpty) {
                      //   return Center(child: Text("No uploads found"));
                      // }

                      return buildContentScreen(items);
                    });

                  default:
                    return buildCategoryContentTab();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDraftsTab() {
    return Obx(() {
      if (controller.isDraftChannelLoading.value) {
        return buildUploadShimmer();
      }

      if (controller.draftCategories.isEmpty) {
        return Center(
          child: AppText(
            "No draft posts found".tr,
            color: Colors.white54,
            fontSize: 14.sp,
          ),
        );
      }

      return ListView(
        controller: controller.draftScrollController,
        children: controller.draftCategories.asMap().entries.expand((entry) {
          final categoryItem = entry.value;

          // Group channels by type
          Map<String, List<DraftChannel>> groupedByType = {};
          for (var channel in categoryItem.channels) {
            final type = channel.type?.toUpperCase() ?? "CHANNEL";
            if (!groupedByType.containsKey(type)) {
              groupedByType[type] = [];
            }
            groupedByType[type]!.add(channel);
          }

          // Create a widget for each type group
          return groupedByType.entries.map((typeGroup) {
            final type = typeGroup.key;
            final channels = typeGroup.value;

            // Determine category name based on type and categoryName
            final categoryName = (categoryItem.categoryName != null &&
                    categoryItem.categoryName!.isNotEmpty)
                ? categoryItem.categoryName!
                : type == "STORY"
                    ? "Stories"
                    : "Uncategorized";

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Text(
                    categoryName.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.lightWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                    ),
                  ),
                ),

                // GRID OF CHANNELS
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: channels.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.90,
                  ),
                  itemBuilder: (context, index) {
                    final item = channels[index];
                    final thumbnailUrl =
                        item.media.first.thumbnailUrl ?? item.media.first.url;

                    // Pass the type-specific channels list
                    return draftCard(thumbnailUrl, item, index, channels);
                  },
                ),

                SizedBox(height: 20.h),
              ],
            );
          }).toList();
        }).toList(),
      );
    });
  }

  Widget buildUploadsTab() {
    return Obx(() {
      if (controller.isUploadsLoading.value) {
        return buildUploadShimmer();
      }

      if (controller.uploadCategories.isEmpty &&
          controller.uploadBrands.isEmpty) {
        return Center(
            child: AppText(
          "No uploads found".tr,
          color: Colors.white54,
          fontSize: 14.sp,
        ));
      }

      return ListView(
        controller: controller.uploadsScrollController,
        padding: EdgeInsets.all(10),
        children: [
          ...controller.uploadCategories.map((cat) => buildUploadSection(
              title: cat.name ?? "Unnamed Category", previews: cat.preview)),

          ...controller.uploadBrands.map((brand) => buildUploadSection(
              title: "Brand: ${brand.name}", previews: brand.preview)),

          // Lazy load shimmer
          Obx(() => controller.isUploadingMore.value
              ? Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: buildUploadShimmer(),
                )
              : SizedBox()),
        ],
      );
    });
  }

  // Widget buildUploadsTab() {
  //   return Obx(() {
  //     if (controller.isUploadsLoading.value) {
  //       return buildUploadShimmer();
  //     }

  //     final hasData = controller.uploadCategories.isNotEmpty ||
  //         controller.uploadBrands.isNotEmpty;

  //     if (!controller.isUploadsLoading.value &&
  //         controller.uploadCategories.isEmpty &&
  //         controller.uploadBrands.isEmpty) {
  //       return Center(
  //         child: AppText(
  //           "No upload posts found",
  //           color: Colors.white54,
  //           fontSize: 14.sp,
  //         ),
  //       );
  //     }

  //     if (!hasData) {
  //       return Center(
  //         child: AppText(
  //           "Upload posts will appear here.",
  //           color: AppColors.white,
  //           fontSize: 16.sp,
  //         ),
  //       );
  //     }

  //     return ListView(
  //       padding: EdgeInsets.all(10),
  //       children: [
  //         /// ---------- Categories section ----------
  //         ...controller.uploadCategories.map(
  //           (cat) => buildUploadSection(
  //             title: "${cat.name}",
  //             previews: cat.preview,
  //           ),
  //         ),

  //         /// ---------- Brands section ----------
  //         ...controller.uploadBrands.map(
  //           (brand) => buildUploadSection(
  //             title: "Brand: ${brand.name}",
  //             previews: brand.preview,
  //           ),
  //         ),
  //       ],
  //     );
  //   });
  // }

  Widget buildHomeTab() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTab(
            "home",
            0,
            controller.selectedInnerTab.value,
            AppColors.primaryColor,
            isInideTabView: true,
            title: "Drafts",
          ),
          buildTab(
            "notification",
            1,
            controller.selectedInnerTab.value,
            AppColors.primaryColor,
            isInideTabView: true,
            title: "Uploads",
          ),
          buildTab(
            "comment",
            2,
            controller.selectedInnerTab.value,
            AppColors.primaryColor,
            isInideTabView: true,
            title: "Scheduled",
          ),
        ],
      ),
    );
  }

  // Widget buildContentListVertical(List<ContentItem> items) {
  //   return ListView(
  //     padding: EdgeInsets.symmetric(horizontal: 16.w),
  //     children: [
  //       Text("Uploads",
  //           style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: AppColors.white)),
  //       SizedBox(height: 10.h),
  //       buildContentList(items),
  //     ],
  //   );
  // }

  Widget buildContentScreen(List<ContentItem> items) {
    final doneItems = items.where((e) => e.status == "DONE").toList();
    final sentItems = items.where((e) => e.status != "DONE").toList();

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        /// ---- My Content Studio ----
        AppText("My Content Studio".tr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFFE2E2E2)),
        SizedBox(height: 12.h),

        buildGridSection(doneItems),

        SizedBox(height: 30.h),

        /// ---- Sent to Content Studio ----
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightWhite, width: 0.8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    "SENT TO CONTENT STUDIO".tr.toUpperCase(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: buildGridSection(sentItems),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ],
    );
  }

  SelectedMedia convertContentItemToSelectedMedia(ContentItem item) {
    final media = item.uploadedMedia.first;

    return SelectedMedia(
      file: null, // No local file
      networkUrl: media.url, // Media URL from API
      type: media.mediaType.toLowerCase() == 'video'
          ? MediaType.video
          : MediaType.image,
    );
  }

  Widget buildGridSection(List<ContentItem> list) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: List.generate(list.length, (index) {
        return FutureBuilder<String>(
          future: controller.generateThumbnail(list[index]),
          builder: (context, snap) {
            final thumb = snap.data;

            return InkWell(
              onTap: () async {
                final selected = convertContentItemToSelectedMedia(
                  list[index],
                );

                NavigationHelper.toNamed(
                  AppRoutes.atheleteSelectPostFromStudioScreen,
                  arguments: {
                    'isAthlete': isAthlete,
                    'mediaType': selected.type,
                    'selectedMedia': [selected].obs,
                    'contentItem': list[index],
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 110.w,
                  height: 160.h,
                  color: Colors.grey.shade300,
                  child: Stack(
                    children: [
                      thumb == null
                          ? shimmerBox(w: 110.w, h: 160.h, radius: 12)
                          : (list[index].uploadedMedia.first.mediaType ==
                                  "IMAGE"
                              ? Image.network(thumb, fit: BoxFit.cover)
                              : Image.file(File(thumb), fit: BoxFit.cover)),
                      if (list[index].uploadedMedia.first.mediaType == "VIDEO")
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Icon(Icons.play_circle_fill,
                              color: Colors.white70, size: 28),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget buildContentList(List<ContentItem> list) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return FutureBuilder<String>(
            future: controller.generateThumbnail(list[index]),
            builder: (context, snap) {
              final thumb = snap.data;

              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: InkWell(
                  onTap: () {
                    NavigationHelper.toNamed(
                      AppRoutes.atheleteSelectPostFromStudioScreen,
                      arguments: {
                        'isAthlete': isAthlete,
                        'content': list[index],
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      // Thumbnail placeholder while loading
                      Container(
                        width: 110.w,
                        height: 160.h,
                        color: Colors.grey.shade300,
                        child: thumb == null
                            ? shimmerBox(w: 110.w, h: 160.h, radius: 12)
                            : (list[index].uploadedMedia.first.mediaType ==
                                    "IMAGE"
                                ? Image.network(thumb, fit: BoxFit.cover)
                                : Image.file(File(thumb), fit: BoxFit.cover)),
                      ),

                      // Video play icon
                      if (list[index].uploadedMedia.first.mediaType == "VIDEO")
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Icon(Icons.play_circle_fill,
                              color: Colors.white70, size: 28),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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

  // Widget buildSendToStudioTab() {
  //   return Obx(() {
  //     return Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "My Content Studio",
  //             style: GoogleFonts.barlowSemiCondensed(
  //               color: Colors.white,
  //               fontSize: 16.sp,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           SizedBox(height: 10.h),
  //           buildContentList(controller.myContent),

  //           SizedBox(height: 20.h),

  //           Container(
  //             width: double.infinity,
  //             height: 230.h,
  //             // padding: EdgeInsets.symmetric(vertical: 8.h),
  //             decoration: BoxDecoration(
  //               // color: AppColors.white,
  //               border: Border.all(color: AppColors.white, width: 3),
  //               borderRadius: BorderRadius.circular(10.r),
  //             ),
  //             alignment: Alignment.topCenter,
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: double.infinity,
  //                   height: 35.h,
  //                   decoration: BoxDecoration(
  //                     color: AppColors.white,

  //                     // borderRadius: BorderRadius.circular(.r),
  //                   ),
  //                   alignment: Alignment.topCenter,
  //                   child: Text(
  //                     "SENT TO CONTENT STUDIO",
  //                     style: GoogleFonts.barlowSemiCondensed(
  //                       color: Colors.black,
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.w500,
  //                       letterSpacing: 1,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 12.h),
  //                 Expanded(
  //                   child: ListView.separated(
  //                     scrollDirection: Axis.horizontal,
  //                     itemCount: controller.myContent.length,
  //                     separatorBuilder: (_, __) => SizedBox(width: 1.w),
  //                     itemBuilder: (context, index) {
  //                       return ClipRRect(
  //                         child: InkWell(
  //                           onTap: () {
  //                             NavigationHelper.toNamed(
  //                               AppRoutes.atheleteSelectPostFromStudioScreen,
  //                               arguments: {
  //                                 'isAthlete': isAthlete,
  //                                 'content': controller.myContent[index],
  //                               },
  //                               transition: Transition.rightToLeft,
  //                             );
  //                           },
  //                           child: Image.asset(
  //                             controller.myContent[index].imagePath,
  //                             height: 125.h,
  //                             width: 100.w,
  //                             fit: BoxFit.cover,
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 SizedBox(height: 12.h),
  //               ],
  //             ),
  //           ),

  //           SizedBox(height: 12.h),
  //           // buildSendStudioContentList(controller.sentContent),
  //         ],
  //       ),
  //     );
  //   });
  // }

  // Widget buildContentList(List<ContentItem> list) {
  //   return SizedBox(
  //     height: 160.h,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: list.length,
  //       separatorBuilder: (_, __) => SizedBox(width: 1.w),
  //       itemBuilder: (context, index) {
  //         return ClipRRect(
  //           borderRadius: BorderRadius.circular(10.r),
  //           child: InkWell(
  //             onTap: () {
  //               NavigationHelper.toNamed(
  //                 AppRoutes.atheleteSelectPostFromStudioScreen,
  //                 arguments: {'isAthlete': isAthlete, 'content': list[index]},
  //                 transition: Transition.rightToLeft,
  //               );
  //             },
  //             child: Image.asset(
  //               list[index].imagePath,
  //               height: 175.h,
  //               width: 100.w,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget buildSendStudioContentList(List<ContentItem> list) {
  //   return SizedBox(
  //     height: 160.h,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: list.length,
  //       separatorBuilder: (_, __) => SizedBox(width: 1.w),
  //       itemBuilder: (context, index) {
  //         return ClipRRect(
  //           borderRadius: BorderRadius.circular(10.r),
  //           child: InkWell(
  //             onTap: () {
  //               NavigationHelper.toNamed(
  //                 AppRoutes.atheleteSelectPostFromStudioScreen,
  //                 arguments: {'isAthlete': isAthlete, 'content': list[index]},
  //                 transition: Transition.rightToLeft,
  //               );
  //             },
  //             child: Image.asset(
  //               list[index].imagePath,
  //               height: 175.h,
  //               width: 100.w,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget buildCategoryContentTab() {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: controller.routineItems.length,
        itemBuilder: (context, index) {
          final item = controller.routineItems[index];
          return uploadSection(item['title'], item['images']);
        },
      ),
    );
  }

  Widget notificationsection() {
    return Obx(() {
      if (controller.isAthleteNotificationsLoading.value) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          itemCount: 8, // shimmer count
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: shimmerBox(h: 60.h, w: double.infinity, radius: 10),
            );
          },
        );
      }

      final list = controller.notifications;

      if (list.isEmpty) {
        return const Center(
          child: Text(
            "No Notifications Yet",
            style: TextStyle(color: Colors.white),
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];

          return GestureDetector(
            onTap: item.onTap,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 5.h,
                ),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      fixCorruptedUrl(item.iconPath),
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      loadingBuilder: (context, child, loadingProgress) =>
                          shimmerBox(
                        w: 40.w,
                        h: 40.h,
                        radius: 8,
                      ),
                    )),
                title: Text(
                  item.message,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget draftCard(
      String videoUrl, DraftChannel item, int index, List<DraftChannel> items) {
    return FutureBuilder<String>(
      future: controller.generateDraftVideoThumbnail(fixCorruptedUrl(videoUrl)),
      builder: (context, snap) {
        final thumbnail = snap.data;

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 125.h,
                width: 100.w,
                color: Colors.grey.shade900,
                child: thumbnail == null || thumbnail.isEmpty
                    ? shimmerBox(w: 100.w, h: 100.h, radius: 12)
                    : GestureDetector(
                        onTap: () {
                          final previewList =
                              items.map((e) => modelToPreview(e)).toList();

                          NavigationHelper.toNamed(
                            AppRoutes.athleteVideoReelView,
                            arguments: {
                              'isAthlete': isAthlete,
                              'reels': previewList,
                              'startIndex': index,
                              'comesFrom': 'draft_section',
                            },
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: item.mediaUrl!.endsWith(".mp4") ||
                                item.mediaUrl!.endsWith(".mov")
                            ? Image.file(File(thumbnail), fit: BoxFit.cover)
                            : Image.network(
                                fixCorruptedUrl(item.mediaUrl),
                                fit: BoxFit.cover,
                              ),
                      ),
              ),
            ),
            Positioned(
              right: 0.w,
              bottom: -8.h,
              child: PopupMenuButton<String>(
                color: const Color(0xFF1A1A1A),
                elevation: 12,
                offset: const Offset(-10, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.white, width: 1),
                ),
                constraints: BoxConstraints(maxWidth: 140.w),
                padding: EdgeInsets.all(6.w),
                onSelected: (value) {
                  if (value == 'edit') {
                    final SelectedMedia media = SelectedMedia(
                      file: null,
                      networkUrl: fixCorruptedUrl(item.mediaUrl!),
                      type: item.mediaUrl!.endsWith(".mp4")
                          ? MediaType.video
                          : MediaType.image,
                    );
                    NavigationHelper.toNamed(
                      AppRoutes.editPostScreen,
                      arguments: {
                        "isAthlete": isAthlete,
                        "isEditpostType": false,
                        'mediaType': media.type,
                        'selectedMedia': RxList<SelectedMedia>([media]),
                        'previewItem': modelToPreview(item),
                      },
                      transition: Transition.rightToLeft,
                    );
                    debugPrint("Edit Draft tapped");
                  } else if (value == 'post') {
                    controller.onPostDraftChannel(modelToPreview(item));
                    debugPrint("Post Now tapped");
                  } else if (value == 'delete') {
                    CustomDialogbox.showConfirmation(
                      title: "Are you sure?",
                      cancelText: "Cancel",
                      confirmText: "Delete Post",
                      onConfirm: () {
                        controller.onDeleteDraftChannel(modelToPreview(item));
                      },
                      onCancel: () {
                        print("Cancelled");
                        Navigator.pop(context);
                      },
                    );
                    debugPrint("Delete Draft tapped");
                  }
                },
                itemBuilder: (context) => [
                  commonMenuPopupItem(
                    value: 'edit',
                    icon: "edit",
                    text: "Edit Draft",
                    borderColor: AppColors.primaryColor,
                  ),
                  commonMenuPopupItem(
                    value: 'post',
                    icon: "share",
                    text: "Post Now",
                    borderColor: AppColors.primaryColor,
                  ),
                  commonMenuPopupItem(
                    value: 'delete',
                    icon: "delete",
                    text: "Delete Draft",
                    borderColor: AppColors.red,
                    textColor: AppColors.red,
                    iconColor: AppColors.red,
                  ),
                ],
                icon: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget uploadChannelPreviewCard(
      PreviewItem item, List<PreviewItem> previews, int index) {
    final videoUrl = item.media.first.url;

    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: FutureBuilder<String>(
        future:
            controller.generateUploadVideoThumbnail(fixCorruptedUrl(videoUrl)),
        builder: (_, snap) {
          final thumb = snap.data;

          return ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 125.h,
              width: 100.w,
              color: Colors.grey.shade900,
              child: (thumb == null || thumb.isEmpty)
                  ? shimmerBox(w: 100.w, h: 125.h, radius: 10.r)
                  : GestureDetector(
                      onTap: () {
                        final previewList =
                            previews.map((e) => modelToReelPreview(e)).toList();

                        debugPrint(previewList.toString());

                        NavigationHelper.toNamed(
                          AppRoutes.athleteVideoReelView,
                          arguments: {
                            'isAthlete': isAthlete,
                            'reels': previewList,
                            'startIndex': index,
                            'comesFrom': 'upload_section',
                          },
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: item.mediaUrl!.endsWith(".mp4") ||
                              item.mediaUrl!.endsWith(".mov")
                          ? Image.file(File(thumb), fit: BoxFit.cover)
                          : Image.network(
                              fixCorruptedUrl(item.mediaUrl),
                              fit: BoxFit.cover,
                            ),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget buildUploadSection({
    required String title,
    required List<PreviewItem> previews,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              fontSize: 15.sp,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          height: 125.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: previews.length,
            itemBuilder: (context, index) {
              return uploadChannelPreviewCard(previews[index], previews, index);
            },
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget uploadSection(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 125.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 1.w),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildReactionCard(PrivateCommunityPost item) {
    if (item.reactions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: item.reactions.entries.map((entry) {
            final emoji = entry.key;
            final count = entry.value;
            final userReacted = item.userReaction == emoji;

            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: userReacted
                      ? Colors.teal.withOpacity(0.25)
                      : const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: userReacted ? Colors.teal : const Color(0xFF3A3A3A),
                  ),
                ),
                child: Row(
                  children: [
                    Text(emoji, style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 4.w),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: userReacted ? Colors.teal : Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPostCard(PrivateCommunityPost item) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          // Right shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(4, 0), // → right
          ),
          // Bottom shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 4), // ↓ bottom
          ),
        ],
      ),
      child: AppText(
        item.content,
        fontSize: 14.sp,
        color: Colors.white,
      ),
    );
  }

  // Widget buildCommentReactionTab() {
  //   return Obx(() {
  //     final posts =
  //         landingController.privateCommunityPostList.value?.data.items ?? [];

  //     if (posts.isEmpty) {
  //       return Center(
  //           child:
  //               AppText("No Thoughts", color: Colors.white54, fontSize: 14.sp));
  //     }

  //     return Stack(children: [
  //       Padding(
  //         padding: EdgeInsets.only(bottom: 70.h), // Space for TextField
  //         child: ListView.builder(
  //           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
  //           itemCount: posts.length,
  //           itemBuilder: (context, index) {
  //             final item = posts[index];

  //             return Padding(
  //               padding: const EdgeInsets.all(4.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   _buildPostCard(item),
  //                   _buildReactionCard(item),
  //                   if (index != posts.length - 1) SizedBox(height: 20.h),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),

  //       /// TEXTBOX FIXED AT BOTTOM
  //       Positioned(
  //         left: 16.w,
  //         right: 16.w,
  //         bottom: 10.h,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(horizontal: 12.w),
  //           decoration: BoxDecoration(
  //             color: AppColors.screenBackgroundColor,
  //             borderRadius: BorderRadius.circular(30.r),
  //             border: Border.all(color: AppColors.lightWhite),
  //           ),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: TextField(
  //                   controller: controller.addYourThoughtsController,
  //                   style: TextStyle(
  //                     color: AppColors.white,
  //                     fontSize: 16.sp,
  //                   ),
  //                   maxLines: null,
  //                   decoration: InputDecoration(
  //                     filled: true,
  //                     fillColor: const Color(0xFF1A1A1A),
  //                     hintText: 'Start typing here...',
  //                     hintStyle: TextStyle(
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.w400,
  //                       color: AppColors.white.withOpacity(0.5),
  //                     ),
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(13),
  //                       borderSide: BorderSide.none,
  //                     ),
  //                     contentPadding: EdgeInsets.symmetric(
  //                       horizontal: 14.w,
  //                       vertical: 12.h,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Obx(() {
  //                 if (landingController.sendPrivateCommunityPostLoading.value) {
  //                   return Container(
  //                       padding: EdgeInsets.all(6),
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         color: AppColors.screenBackgroundColor,
  //                       ),
  //                       child: const CircularProgressIndicator(
  //                         strokeWidth: 1,
  //                         color: AppColors.lightRed,
  //                       ));
  //                 }
  //                 return InkWell(
  //                   onTap: () {
  //                     if (controller
  //                         .addYourThoughtsController.text.isNotEmpty) {
  //                       controller.createNewPrivateCommunityThought();
  //                     } else {
  //                       CustomToast.show("Please enter your thoughts");
  //                     }
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.all(6),
  //                     decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: AppColors.screenBackgroundColor,
  //                     ),
  //                     child: Icon(
  //                       Icons.send,
  //                       color: AppColors.lightRed,
  //                       size: 20.sp,
  //                     ),
  //                   ),
  //                 );
  //               }),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ]);
  //   });
  // }

  Widget buildCommentReactionTab() {
    return Obx(() {
      final posts =
          landingController.privateCommunityPostList.value?.data.items ?? [];

      return Column(
        children: [
          // LISTVIEW
          Expanded(
            child: posts.isEmpty
                ? Center(
                    child: AppText(
                      "No Thoughts.".tr,
                      color: Colors.white54,
                      fontSize: 14.sp,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 10.h,
                      bottom: 85.h, // space for TextField
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final item = posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPostCard(item),
                            _buildReactionCard(item),
                            if (index != posts.length - 1)
                              SizedBox(height: 20.h),
                          ],
                        ),
                      );
                    },
                  ),
          ),

          // TEXTFIELD AT BOTTOM
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.screenBackgroundColor,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: AppColors.lightWhite),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.addYourThoughtsController,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF1A1A1A),
                        hintText: 'Start typing here...'.tr,
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    if (landingController
                        .sendPrivateCommunityPostLoading.value) {
                      return SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.lightRed,
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        if (controller
                            .addYourThoughtsController.text.isNotEmpty) {
                          controller.createNewPrivateCommunityThought();
                        } else {
                          CustomToast.show("Please enter your thoughts".tr);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.send,
                          color: AppColors.lightRed,
                          size: 20.sp,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildTab(
    String icon,
    int index,
    int selectedTab,
    Color lineColor, {
    bool isInideTabView = false,
    String title = '',
  }) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => isInideTabView
            ? controller.changeInsideTab(index)
            : controller.changeOuterTab(index),
        child: Column(
          children: [
            Visibility(
              visible: !isInideTabView,
              replacement: Text(
                title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.5.sp,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
              child: Image.asset("assets/icons/$icon.png", height: 27.sp),
            ),
            SizedBox(height: 7.h),
            Container(
              width: double.infinity,
              height: isInideTabView ? 1.h : 2.5.h,
              color: isSelected
                  ? lineColor
                  : isInideTabView
                      ? Colors.transparent
                      : AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScheduledList() {
    return Obx(() {
      if (controller.isScheduleLoading.value &&
          controller.scheduleItems.isEmpty) {
        return ListView.builder(
          controller: controller.scheduleScrollController,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: shimmerBox(w: 50.w, h: 50.w, radius: 8),
            );
          },
        );
      }

      if (!controller.isScheduleLoading.value &&
          controller.scheduleItems.isEmpty) {
        return Center(
          child: AppText(
            "No scheduled posts found".tr,
            color: Colors.white54,
            fontSize: 14.sp,
          ),
        );
      }

      return ListView.builder(
        controller: controller.scheduleScrollController,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: controller.scheduleItems.length,
        itemBuilder: (context, index) {
          final item = controller.scheduleItems[index];
          AppLogger.d("item.mediaUrl: ${item.mediaUrl}");

          return FutureBuilder<String>(
            future: controller.generateScheduleVideoThumbnail(
                fixCorruptedUrl(item.mediaUrl ?? "")),
            builder: (context, snap) {
              final thumb = snap.data;

              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        NavigationHelper.toNamed(
                          AppRoutes.athleteVideoReelView,
                          arguments: {
                            'isAthlete': isAthlete,
                            'reels': controller.scheduleItems,
                            'startIndex': index,
                            'comesFrom': "scheduled",
                          },
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: snap.connectionState == ConnectionState.waiting
                              ? shimmerBox(
                                  w: 50.w,
                                  h: 50.w,
                                  radius: 8,
                                )
                              : item.mediaUrl.endsWith(".mp4") ||
                                      item.mediaUrl.endsWith(".mov")
                                  ? Image.file(
                                      File(thumb ?? ""),
                                      width: 50.w,
                                      height: 50.w,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      fixCorruptedUrl(item.mediaUrl) ?? "",
                                      width: 50.w,
                                      height: 50.w,
                                      fit: BoxFit.cover,
                                    )),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          NavigationHelper.toNamed(
                            AppRoutes.athleteVideoReelView,
                            arguments: {
                              'isAthlete': isAthlete,
                              'reels': controller.scheduleItems,
                              'startIndex': index,
                              'comesFrom': "scheduled",
                            },
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "Scheduled as",
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 2.h),
                            AppText(
                              item.type == "CHANNEL" ? "Channel" : "Story",
                              fontSize: 13.sp,
                              color: item.type == "CHANNEL"
                                  ? AppColors.lightRed
                                  : AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// ---------------- MENU ----------------
                    PopupMenuButton<String>(
                      color: const Color(0xFF1A1A1A),
                      elevation: 12,
                      offset: const Offset(-10, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.white, width: 1),
                      ),
                      constraints: BoxConstraints(maxWidth: 140.w),
                      padding: EdgeInsets.all(6.w),
                      onSelected: (value) {
                        if (value == 'edit') {
                          final SelectedMedia media = SelectedMedia(
                            file: null,
                            networkUrl: fixCorruptedUrl(item.mediaUrl),
                            type: item.mediaUrl!.endsWith(".mp4")
                                ? MediaType.video
                                : MediaType.image,
                          );
                          NavigationHelper.toNamed(
                            AppRoutes.athletePostContentTagScreen,
                            arguments: {
                              'sheetType': 'post-new',
                              'isAthlete': isAthlete,
                              'mediaType': media.type,
                              'selectedMedia': RxList<SelectedMedia>([media]),
                              'previewItem': item,
                            },
                          );
                        } else if (value == 'Reschedule') {
                          final SelectedMedia media = SelectedMedia(
                            file: null,
                            networkUrl: fixCorruptedUrl(item.mediaUrl),
                            type: item.mediaUrl!.endsWith(".mp4")
                                ? MediaType.video
                                : MediaType.image,
                          );
                          NavigationHelper.toNamed(
                            AppRoutes.athletePostContentTagScreen,
                            arguments: {
                              'sheetType': 'reschedule-set',
                              'mediaType': media.type,
                              'selectedMedia': RxList<SelectedMedia>([media]),
                              'isAthlete': isAthlete,
                              'previewItem': item,
                            },
                          );
                        } else if (value == 'post') {
                          CustomToast.show("Post Uploaded Successfully!");
                          controller.postAthleteChannelFromSchedule(item);
                        } else if (value == 'delete') {
                          CustomDialogbox.showConfirmation(
                            title: "Are you sure?",
                            cancelText: "Cancel",
                            confirmText: "Delete Post",
                            onConfirm: () {
                              controller.deleteAthleteChannelFromSchedule(item);
                            },
                            onCancel: () {},
                          );
                        }
                      },
                      itemBuilder: (context) => [
                        commonMenuPopupItem(
                          value: 'edit',
                          icon: "edit",
                          text: "Edit Channel",
                          borderColor: AppColors.primaryColor,
                        ),
                        commonMenuPopupItem(
                          value: 'Reschedule',
                          icon: "reschedule",
                          text: "Reschedule Channel",
                          borderColor: AppColors.primaryColor,
                        ),
                        commonMenuPopupItem(
                          value: 'post',
                          icon: "share",
                          text: "Post Now",
                          borderColor: AppColors.primaryColor,
                        ),
                        commonMenuPopupItem(
                          value: 'delete',
                          icon: "delete",
                          text: "Delete Draft",
                          textColor: AppColors.red,
                          iconColor: AppColors.red,
                          borderColor: AppColors.red,
                        ),
                      ],
                      icon: const Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    });
  }

  Widget buildSendToStudioTab() {
    return Obx(() {
      if (controller.isContentStudioListingLoading.value) {
        return buildUploadShimmer();
      }

      final items = controller.contentStudioResponse.value?.data.items ?? [];

      if (items.isEmpty) {
        return Center(
            child: AppText(
          "No uploads found".tr,
          color: Colors.white54,
          fontSize: 14.sp,
        ));
      }

      return buildContentScreen(items);
    });
  }
}

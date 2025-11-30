// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/infinite_content_response/infinite_content_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/latest_channel/latest_channel_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/story_view/latest_story_response.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_routes.dart';
import '../../../routes/navigation_helper.dart';
import '../../../widgets/AppText.dart';
import 'fan_landing_controller.dart';

class FanLandingView extends GetView<FanLandingController> {
  final bool isAthlete;
  const FanLandingView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// Two icons on top-right
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  NavigationHelper.toNamed(
                                    AppRoutes.fanTrackAthleteScreen,
                                    arguments: {'isAthlete': isAthlete},
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.white,
                                  size: 32.sp,
                                ),
                              ),
                              SizedBox(width: 17.w),
                              GestureDetector(
                                onTap: () {
                                  NavigationHelper.toNamed(
                                    AppRoutes.athleteSettingScreen,
                                    arguments: {'isAthlete': isAthlete},
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 32.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                controller.fanUser.value?.name ?? '',
                                underlineOffset: 0.2,
                                fontSize: 18.sp,
                                useCustomUnderline: true,
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.underline,
                              ),
                              SizedBox(height: 5.h),
                              AppText(controller.fanUser.value?.userName ?? '',
                                  fontSize: 16.sp),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // NavigationHelper.toNamed(
                            //   AppRoutes.atheleteAddStoryScreen,
                            //   arguments: {'isAthlete': isAthlete},
                            //   transition: Transition.rightToLeft,
                            // );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Obx(() {
                              if (controller.fanDetailsLoading.value) {
                                return shimmerBox(
                                    w: 110.w, h: 110.w, radius: 30);
                              }

                              final profile = fixCorruptedUrl(controller
                                      .userDetails
                                      .value
                                      ?.data
                                      ?.user
                                      ?.profilePicture ??
                                  '');

                              if (profile == null || profile.isEmpty) {
                                return Image.asset(
                                  "assets/images/profile.png",
                                  fit: BoxFit.cover,
                                  width: 110.w,
                                  height: 110.w,
                                );
                              }

                              if (!profile.startsWith("http")) {
                                return shimmerBox(
                                    w: 110.w, h: 110.w, radius: 30);
                              }

                              return Image.network(
                                profile,
                                fit: BoxFit.cover,
                                width: 110.w,
                                height: 110.w,
                                errorBuilder: (context, error, stackTrace) {
                                  AppLogger.d("Profile image error: $error");
                                  return shimmerBox(
                                      w: 110.w, h: 110.w, radius: 30);
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return shimmerBox(
                                      w: 110.w, h: 110.w, radius: 30);
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() {
                                final trackedAthletes = controller.userDetails
                                        .value?.data?.totalTrackedAthletes ??
                                    0;

                                return InkWell(
                                  onTap: () {
                                    NavigationHelper.toNamed(
                                      AppRoutes.fanTrackAthleteScreen,
                                      arguments: {'isAthlete': isAthlete},
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  child: AppText(
                                    trackedAthletes.toString(),
                                    underlineOffset: 0.2,
                                    fontSize: 22.sp,
                                    useCustomUnderline: true,
                                    fontWeight: FontWeight.w600,
                                    textDecoration: TextDecoration.underline,
                                  ),
                                );
                              }),
                              SizedBox(height: 5.h),
                              AppText(
                                "Fans",
                                fontSize: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
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
                          "play",
                          1,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                        buildTab(
                          "padel",
                          2,
                          controller.selectedOuterTab.value,
                          AppColors.lightRed,
                        ),
                        buildTab(
                          "notification",
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
              Expanded(
                child: Obx(() {
                  switch (controller.selectedOuterTab.value) {
                    case 0:
                      return buildHomeTab();

                    case 1:
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final items = controller.infiniteChannelList;

                        final previewList = items
                            .map((e) => latestInfiniteToPreview(e))
                            .toList();

                        NavigationHelper.toNamed(
                          AppRoutes.athleteVideoReelViewForFan,
                          arguments: {
                            'isAthlete': isAthlete,
                            'reels': previewList,
                            'startIndex': 0,
                          },
                          transition: Transition.rightToLeft,
                        );
                        // buildInfiniteScroll();
                        controller.selectedOuterTab.value = 0;
                      });
                      return const SizedBox();

                    case 2:
                      return buildPadelTab();

                    case 3:
                      return buildNotificationTab();

                    default:
                      return buildHomeTab();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPadelTab() {
    return Obx(
      () {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (controller.sportVisionListIsLoading.value) {
                  return shimmerBox(w: 350.w, h: 250.h, radius: 0);
                }

                if (controller.sportVisionList.isEmpty) {
                  return AppText("No vision found", color: AppColors.white);
                }

                final vision = controller.sportVisionList[0];
                final mediaType = vision["mediaType"];
                final mediaData = vision["mediaData"];
                final title = vision["title"] ?? "";

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              child: mediaType == "IMAGE"
                                  ? _buildImage(mediaData)
                                  : _buildVideoThumbnail(mediaData),
                            ),

                            // ---- TITLE ----
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Center(
                                child: Text(
                                  title.toString().toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.lightGray.withOpacity(0.8),
                                    fontFamily:
                                        GoogleFonts.barlowSemiCondensed()
                                            .fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 15.h),

              Text(
                "THE ATHLETES",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.lightGray.withOpacity(0.6),
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),

              Obx(() {
                if (controller.sportAllTrackAthletesIsLoading.value) {
                  return Row(
                    children: List.generate(
                      6,
                      (i) => shimmerBox(w: 100.w, h: 124.74.h, radius: 10.r),
                    ),
                  );
                }

                if (controller.sportAllTrackAthletes.isEmpty) {
                  return AppText("No athletes found", color: AppColors.white);
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.sportAllTrackAthletes.length,
                      (index) {
                        final athlete = controller.sportAllTrackAthletes[index];

                        final name = athlete["name"] ?? "Unknown";
                        final imageUrl = athlete["profilePicture"] ?? "";

                        return Row(
                          children: [
                            athleteCard(imageUrl, name, 120.w, 150.h),
                            if (index !=
                                controller.sportAllTrackAthletes.length - 1)
                              SizedBox(width: 10.w),
                          ],
                        );
                      },
                    ),
                  ),
                );
              }),

              SizedBox(height: 25.h),

              Text(
                "THE CATEGORIES",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.lightGray.withOpacity(0.6),
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(controller.sportsCategories.length,
                      (index) {
                    final category = controller.sportsCategories[index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationHelper.toNamed(
                              AppRoutes.exploreCategories,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: largeCard(category.posterUrl, category.name),
                        ),
                        if (index != controller.sportsCategories.length - 1)
                          SizedBox(width: 10.w),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 25.h),

              Text(
                "THE BRANDS",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.lightGray.withOpacity(0.6),
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      List.generate(controller.sportsBrands.length, (index) {
                    final brands = controller.sportsBrands[index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationHelper.toNamed(
                              AppRoutes.exploreCategories,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: largeCard(brands.posterUrl, brands.name),
                        ),
                        if (index != controller.sportsBrands.length - 1)
                          SizedBox(width: 10.w),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 25.h),

              // /// ---- Optional Feed Section below ----
              // Expanded(
              //   child: Center(
              //     child: AppText(
              //       "Feed content here",
              //       fontSize: 18.sp,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVideoThumbnail(String url) {
    return FutureBuilder<String>(
      future: controller.getThumbnail(url),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return shimmerBox(w: 350.w, h: 150.h, radius: 16);
        }

        final thumb = snapshot.data!;
        return GestureDetector(
          onTap: () {
            // NavigationHelper.toNamed(
            //   AppRoutes.fullScreenVideo,
            //   arguments: {"url": url},
            // );
          },
          child: Stack(
            children: [
              Image.file(
                File(thumb),
                width: 350.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Center(
                  child: Icon(Icons.play_circle_fill,
                      size: 50, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage(String url) {
    return GestureDetector(
      onTap: () {
        // NavigationHelper.toNamed(AppRoutes.fullScreenImage,
        //     arguments: {"url": url});
      },
      child: Image.network(
        url,
        width: 350.w,
        height: 150.h,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, loading) {
          if (loading == null) return child;
          return shimmerBox(w: 350.w, h: 150.h, radius: 16);
        },
        errorBuilder: (_, __, ___) =>
            Icon(Icons.broken_image, color: Colors.white),
      ),
    );
  }

  Widget shimmerLatestCard() {
    return shimmerBox(
      w: 120.w,
      h: 160.h,
      radius: 14,
    );
  }

  Widget buildInfiniteScroll() {
    return Obx(() {
      final items = controller.infiniteChannelList;

      return ListView.builder(
        controller: controller.infiniteChannelListScrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildInfiniteItem(item, index, items);
        },
      );
    });
  }

  PreviewItemForFan latestInfiniteToPreview(InfiniteContentItem item) {
    return PreviewItemForFan(
      id: item.id,
      title: item.title,
      caption: item.caption,
      mediaUrl: fixCorruptedUrl(item.mediaUrl),
      thumbnailUrl: null, // we generate ourselves
      categoryId: item.category?.id ?? "",
      categoryName: item.category?.name,
      brandId: item.brand?.id,
      brandName: item.brand?.name,
      status: "active",
      type: item.mediaType ?? "",
      isArchived: false, publishedAt: '',
      likesCount: item.likesCount ?? 0,
      commentsCount: item.commentsCount ?? 0,
      createdAt: '', updatedAt: '', media: [],
    );
  }

  Widget buildInfiniteItem(
      InfiniteContentItem item, int index, List<InfiniteContentItem> items) {
    return FutureBuilder<String>(
      future: controller.getThumbnail(
        fixCorruptedUrl(item.mediaUrl),
      ),
      builder: (context, snapshot) {
        final thumb = snapshot.data ?? "";

        return GestureDetector(
          onTap: () {
            final previewList =
                items.map((e) => latestInfiniteToPreview(e)).toList();

            NavigationHelper.toNamed(
              AppRoutes.athleteVideoReelViewForFan,
              arguments: {
                'isAthlete': isAthlete,
                'reels': previewList,
                'startIndex': index,
              },
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
              image: thumb.isNotEmpty
                  ? DecorationImage(
                      image: FileImage(File(thumb)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            height: 200,
          ),
        );
      },
    );
  }

  String detectMediaType(String url) {
    final ext = url.toLowerCase();
    if (ext.endsWith(".mp4") || ext.endsWith(".mov") || ext.contains("video")) {
      return "video";
    }
    return "image";
  }

  Widget buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
            child: Obx(() {
              if (controller.getAllAthleteStoriesViewLoading.value) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (_, __) => SizedBox(width: 14.w),
                  itemBuilder: (_, __) => shimmerBox(
                    w: 80.w,
                    h: 80.w,
                    radius: 40.w,
                  ),
                );
              }

              final storyChannels = controller.athleteStoriesView;

              AppLogger.d("🎥 storyChannels: $storyChannels");

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                itemCount: storyChannels.length,
                separatorBuilder: (context, index) => SizedBox(width: 14.w),
                itemBuilder: (context, index) {
                  final channel = storyChannels[index];
                  final firstStory = channel.stories.first;

                  return FutureBuilder(
                    future: controller
                        .getThumbnail(fixCorruptedUrl(firstStory.mediaUrl)),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return shimmerBox(
                          w: 80.w,
                          h: 80.w,
                          radius: 40.w,
                        );
                      }

                      return InkWell(
                        onTap: () {
                          NavigationHelper.toNamed(
                            AppRoutes.fanToViewStoriesScreen,
                            arguments: {
                              'initialIndex': index,
                              'athleteName': channel.athlete.name,
                              'athleteProfile': channel.athlete.profilePicture,
                              'stories': channel.stories.map((e) {
                                final fixedUrl = fixCorruptedUrl(e.mediaUrl);

                                return StoryItem(
                                  mediaUrl: fixedUrl,
                                  mediaType:
                                      e.mediaType ?? detectMediaType(fixedUrl),
                                  thumbnailUrl: e.thumbnailUrl,
                                  id: e.id,
                                  duration: e.duration,
                                  createdAt: e.createdAt,
                                  publishedAt: e.publishedAt,
                                  expiresAt: e.expiresAt,
                                  isViewed: e.isViewed,
                                  caption: e.caption,
                                );
                              }).toList(),
                            },
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: firstStory.isViewed
                                  ? Colors.grey
                                  : AppColors.lightRed,
                              width: 2.5.w,
                            ),
                            image: DecorationImage(
                              image: FileImage(File(snapshot.data!)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
          SizedBox(height: 25.h),
          AppText(
            "YOUR LATEST",
            fontSize: 14.sp,
            color: Color(0xFFE2E2E2).withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          Obx(() {
            if (controller.getAllLatestChannelLoading.value &&
                controller.latestChannel.isEmpty) {
              return SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (_, __) => shimmerLatestCard(),
                ),
              );
            }

            final items = controller.latestChannel;
            if (items.isEmpty) {
              return Center(
                  child: AppText(
                "No latest content found",
                color: Color(0xFFE2E2E2).withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ));
            }

            return SizedBox(
              height: 160.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => SizedBox(width: 1.w),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return FutureBuilder<String>(
                    future:
                        controller.getThumbnail(fixCorruptedUrl(item.mediaUrl)),
                    builder: (context, snap) {
                      final thumb = snap.data;

                      return GestureDetector(
                        onTap: () {
                          final previewList = items
                              .map((e) => latestChannelModelToPreview(e))
                              .toList();
                          NavigationHelper.toNamed(
                            AppRoutes.athleteVideoReelViewForFan,
                            arguments: {
                              'isAthlete': isAthlete,
                              'reels': previewList,
                              'startIndex': index,
                            },
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Container(
                          width: 100.w,
                          height: 175.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:
                                snap.connectionState == ConnectionState.waiting
                                    ? null
                                    : DecorationImage(
                                        image: thumb != null
                                            ? FileImage(File(thumb))
                                            : NetworkImage(item.mediaUrl)
                                                as ImageProvider,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          child: snap.connectionState == ConnectionState.waiting
                              ? shimmerLatestCard()
                              : Align(
                                  alignment: Alignment.bottomLeft,
                                ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }),
          SizedBox(height: 25.h),
          AppText(
            "YOUR CATEGORIES",
            fontSize: 14.sp,
            color: Color(0xFFE2E2E2).withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          Obx(() {
            if (controller.getAllCategoryListLoading.value &&
                controller.categoriesList.isEmpty) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        shimmerBox(h: 120.h, w: 140.w, radius: 12.r),
                        SizedBox(width: 10.w),
                      ],
                    );
                  }),
                ),
              );
            }

            final items = controller.categoriesList;
            if (items.isEmpty) {
              return Center(
                  child: AppText(
                "No Category content found",
                color: Color(0xFFE2E2E2).withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ));
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    List.generate(controller.categoriesList.length, (index) {
                  final category = controller.categoriesList[index];

                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.toNamed(
                            AppRoutes.exploreCategories,
                            arguments: {
                              'isAthlete': isAthlete,
                              'categoryName': category.name
                            },
                            transition: Transition.rightToLeft,
                          );
                          controller.getAllChannelCategory(category.id);
                        },
                        child: largeCard(category.posterUrl, category.name),
                      ),
                      if (index != controller.categoriesList.length - 1)
                        SizedBox(width: 10.w),
                    ],
                  );
                }),
              ),
            );
          }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  PreviewItemForFan latestChannelModelToPreview(LatestChannelItem item) {
    return PreviewItemForFan(
      id: item.id,
      title: item.title ?? "",
      caption: item.caption ?? "",
      mediaUrl: fixCorruptedUrl(item.mediaUrl) ?? "",
      thumbnailUrl: item.thumbnailUrl,
      categoryId: "" ?? "",
      status: "" ?? "",
      type: "" ?? "",
      isArchived: false ?? false,
      scheduledAt: "" ?? "",
      publishedAt: item.publishedAt ?? "",
      likesCount: item.likesCount ?? 0,
      commentsCount: item.commentsCount ?? 0,
      createdAt: "" ?? "",
      updatedAt: "" ?? "",
      media: [],
    );
  }

  Widget buildNotificationTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Obx(
        () => ListView.separated(
          itemCount: controller.notifications.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            final item = controller.notifications[index];
            return Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1D1D),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage(item.profileImage),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.username,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.message,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12.sp,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
              child: Image.asset("assets/icons/$icon.png", height: 30.sp),
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

  Widget largeCard(String image, String title, {bool isSmall = false}) {
    return Stack(
      children: [
        Container(
          width: 145.w,
          height: 195.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSmall ? Colors.transparent : AppColors.lightRed,
              width: 0.8,
            ),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFFE2E2E2).withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.bebasNeue().fontFamily),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget athleteCard(String image, String title, double w, double h,
      {bool isSmall = false}) {
    AppLogger.d("title: $title");
    AppLogger.d("image: $image");
    return Stack(
      children: [
        Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isSmall ? Colors.transparent : AppColors.primaryColor,
              width: 0.8,
            ),
            image: DecorationImage(
              image: NetworkImage(image.isNotEmpty ? image : ""),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: AppText(
              title.toUpperCase(),
              fontSize: 10.sp,
              color: Color(0xFFE2E2E2).withOpacity(0.8),
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}

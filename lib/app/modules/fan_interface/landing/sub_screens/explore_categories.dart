import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/category_content_response/category_content_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../../signup/fan_signup_controller.dart';

class ExploreCategories extends GetWidget<FanLandingController> {
  final bool isAthlete;
  final String categoryName;
  const ExploreCategories(
      {super.key, required this.isAthlete, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonBackButton(),
                  ),
                  Center(
                    child: Text(
                      categoryName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: buildGridSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridSection() {
    return Obx(() {
      // Initial shimmer
      if (controller.getAllChannelCategoryLoading.value &&
          controller.allChannelCategory.isEmpty) {
        return _buildInitialGridShimmer();
      }

      if (controller.allChannelCategory.isEmpty) {
        return Center(
          child: AppText(
            "No content available".tr,
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        );
      }

      return GridView.builder(
        controller: controller.allChannelCategoryScrollController,
        padding: EdgeInsets.only(bottom: 20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 130 / 200, // WIDTH / HEIGHT
        ),
        itemCount: controller.allChannelCategory.length +
            (controller.isLoadingMoreAllChannelCategory.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == controller.allChannelCategory.length) {
            return _buildLoadMoreGridShimmer();
          }

          final item = controller.allChannelCategory[index];
          return trackItem(item, index);
        },
      );
    });
  }

  Widget _buildLoadMoreGridShimmer() {
    return shimmerBox(
      w: 130.w,
      h: 200.h,
      radius: 10,
    );
  }

  Widget _buildInitialGridShimmer() {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 130 / 200,
      ),
      itemCount: 9,
      itemBuilder: (_, __) => shimmerBox(
        w: 130.w,
        h: 200.h,
        radius: 10,
      ),
    );
  }

  Widget trackItem(ContentItem item, int index) {
    return FutureBuilder<String>(
      future: controller.getThumbnail(fixCorruptedUrl(item.mediaUrl)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return shimmerBox(w: 130.w, h: 200.h, radius: 10);
        }

        return GestureDetector(
          onTap: () {
            final previewList = controller.allChannelCategory
                .map((e) => latestChannelModelToPreview(e))
                .toList();

            NavigationHelper.toNamed(
              AppRoutes.athleteVideoReelViewForFan,
              arguments: {
                'isAthlete': isAthlete,
                'reels': previewList,
                'startIndex': index,
              },
            );
          },
          child: Container(
            width: 130.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1),
              image: DecorationImage(
                image: FileImage(File(snapshot.data!)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  PreviewItemForFan latestChannelModelToPreview(ContentItem item) {
    return PreviewItemForFan(
      id: item.id,
      title: item.title,
      caption: item.caption,
      mediaUrl: fixCorruptedUrl(item.mediaUrl),
      thumbnailUrl: item.thumbnailUrl,
      categoryId: "",
      status: "",
      type: "",
      isArchived: false,
      scheduledAt: "",
      publishedAt: item.publishedAt,
      likesCount: item.likesCount,
      isLiked: item.isLiked,
      commentsCount: item.commentsCount,
      createdAt: "",
      updatedAt: "",
      media: [],
    );
  }
}

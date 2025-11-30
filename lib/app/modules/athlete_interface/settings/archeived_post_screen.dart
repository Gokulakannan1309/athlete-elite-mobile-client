import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/draft_channel/draft_model_details.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';

import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/AppText.dart';
import '../../../widgets/common_back_button.dart';
import 'settings_controller.dart';

class ArcheivedPostScreen extends GetView<AthleteSettingsController> {
  final bool isAthlete;
  const ArcheivedPostScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              /// HEADER
              Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CommonBackButton(),
                  ),
                  Center(
                    child: Text(
                      'ARCHIVED POSTS',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: GoogleFonts.anton().fontFamily,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Expanded(child: buildArchivedList()),
            ],
          ),
        ),
      ),
    );
  }

  // MAIN LIST WITH GROUPING + LAZY LOADING
  Widget buildArchivedList() {
    return Obx(() {
      final grouped = controller.groupedArchived.entries.toList();

      if (grouped.isEmpty && controller.isArchivedLoading.isFalse) {
        return Center(
          child: AppText(
            "Your archived posts will appear here.",
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        );
      }

      return NotificationListener<ScrollNotification>(
        child: ListView.builder(
          controller: controller.archivedScrollController,
          padding: EdgeInsets.only(bottom: 30.h),
          itemCount:
              grouped.length + (controller.isArchivedLoading.value ? 1 : 0),
          itemBuilder: (context, index) {
            // Show loader
            if (index == grouped.length) {
              return Padding(
                padding: EdgeInsets.all(20.h),
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            final categoryName = grouped[index].key;
            final items = grouped[index].value;

            return archivedCategorySection(categoryName, items);
          },
        ),
      );
    });
  }

  // CATEGORY SECTION
  Widget archivedCategorySection(String title, List<ArchivedItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Text(title.toUpperCase(),
              style: TextStyle(
                color: AppColors.lightWhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              )),
        ),

        /// GRID OF POSTS
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 11.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            final String meadiaUrl = item.mediaUrl ?? "";
            return buildArchivedCard(meadiaUrl, items[index], index, items);
          },
        ),

        SizedBox(height: 20.h),
      ],
    );
  }

  // SINGLE ARCHIVED CARD
  Widget buildArchivedCard(
      String videoUrl, ArchivedItem item, int index, List<ArchivedItem> items) {
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
                              },
                              transition: Transition.rightToLeft,
                            );
                          },
                          child:
                              Image.file(File(thumbnail), fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                right: 4.w,
                top: 4.h,
                child: PopupMenuButton<String>(
                  color: const Color(0xFF1A1A1A),
                  elevation: 10,
                  offset: const Offset(-10, 40),
                  constraints: BoxConstraints(maxWidth: 140.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: AppColors.white, width: 1),
                  ),
                  onSelected: (value) {
                    if (value == "unarchive") {
                      // controller.unArchivePost(item.id);
                    } else {
                      // controller.deleteArchivedPost(item.id);
                    }
                  },
                  itemBuilder: (context) => [
                    commonMenuPopupItem(
                      value: "unarchive",
                      icon: "share",
                      text: "Unarchive",
                      borderColor: AppColors.primaryColor,
                    ),
                    commonMenuPopupItem(
                      value: "delete",
                      icon: "delete",
                      text: "Delete",
                      borderColor: AppColors.red,
                      textColor: AppColors.red,
                      iconColor: AppColors.red,
                    ),
                  ],
                  icon: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.more_horiz,
                        color: AppColors.primaryColor, size: 22),
                  ),
                ),
              ),
            ],
          );
        });
  }

  PreviewItem modelToPreview(ArchivedItem item) {
    return PreviewItem(
      id: item.id,
      title: item.title ?? "",
      caption: item.caption ?? "",
      mediaUrl: item.mediaUrl ?? "",
      thumbnailUrl: item.thumbnailUrl,
      categoryId: "" ?? "",
      status: "" ?? "",
      type: "" ?? "",
      isArchived: true ?? false,
      scheduledAt: "" ?? "",
      publishedAt: "" ?? "",
      likesCount: 0 ?? 0,
      commentsCount: 0 ?? 0,
      createdAt: item.createdAt ?? "",
      updatedAt: item.updatedAt ?? "",
      media: [],
    );
  }
}

class ArchivedItem {
  final String id;
  final String? title;
  final String? caption;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final String? category;
  final String? brand;
  final String? createdAt;
  final String? updatedAt;

  ArchivedItem({
    required this.id,
    this.title,
    this.caption,
    this.mediaUrl,
    this.thumbnailUrl,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
  });

  factory ArchivedItem.fromJson(Map<String, dynamic> json) {
    return ArchivedItem(
      id: json["id"],
      title: json["title"],
      caption: json["caption"],
      mediaUrl: json["mediaUrl"],
      thumbnailUrl: json["thumbnailUrl"],
      category: json["category"],
      brand: json["brand"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}

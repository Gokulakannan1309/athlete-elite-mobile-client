// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/filter_screen/image_filter/image_filter_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class ImageFilterEditor extends StatefulWidget {
  final List<SelectedMedia> selectedMedia;
  final Map<String, String> filters;

  const ImageFilterEditor({
    super.key,
    required this.selectedMedia,
    required this.filters,
  });

  @override
  State<ImageFilterEditor> createState() => _ImageFilterEditorState();
}

class _ImageFilterEditorState extends State<ImageFilterEditor> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ImageFilterController(
        selectedMedia: widget.selectedMedia,
        filters: widget.filters,
      ),
      tag: DateTime.now().toString(),
    );

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Obx(() {
        // Show loading only during initial load
        if (controller.isGeneratingTopImage.value &&
            controller.topImagePath.isEmpty &&
            controller.currentVideoPath.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        return Stack(
          children: [
            // Main content area
            PageView.builder(
                controller: _pageController,
                itemCount: controller.selectedMedia.length,
                onPageChanged: (index) {
                  controller.onImageChanged(index);
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final media = controller.selectedMedia[index];

                  // IMAGE DISPLAY
                  if (media.type == MediaType.image) {
                    return Obx(() {
                      final path = controller.topImagePath.value;

                      if (path.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      return Center(
                        child: Image.file(
                          File(path),
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            print("Image error: $error");
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.error,
                                      color: Colors.red, size: 50),
                                  SizedBox(height: 10),
                                  Text(
                                    "Error loading image",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    });
                  }

                  // VIDEO DISPLAY
                  if (media.type == MediaType.video) {
                    return Obx(() {
                      if (!controller.isVideoInitialized.value ||
                          controller.videoController == null) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      return Center(
                        child: AspectRatio(
                          aspectRatio:
                              controller.videoController!.value.aspectRatio,
                          child: VideoPlayer(controller.videoController!),
                        ),
                      );
                    });
                  }

                  return const Center(
                    child: Text(
                      "Unsupported media type",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),

            // Back button
            Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),

            // Navigation arrows (for multiple media)
            Visibility(
              visible: widget.selectedMedia.length > 1,
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button
                      GestureDetector(
                        onTap: () async {
                          if (_currentIndex > 0) {
                            _currentIndex--;
                            await _pageController.animateToPage(
                              _currentIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      ),
                      // Next button
                      GestureDetector(
                        onTap: () async {
                          if (_currentIndex < widget.selectedMedia.length - 1) {
                            _currentIndex++;
                            await _pageController.animateToPage(
                              _currentIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Loading overlay (only when applying filter)
            if (controller.isApplyingFilter.value)
              Container(
                color: Colors.black.withOpacity(0.7),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(color: Colors.white),
                      SizedBox(height: 16),
                      Text(
                        "Applying filters...",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      if (controller.selectedFilters.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "${controller.selectedFilters.length} filter(s) selected",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

            // Filter bottom sheet
            buildFilterBottomSheet(controller),
          ],
        );
      }),
    );
  }

  Widget buildFilterBottomSheet(ImageFilterController controller) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.32.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.92),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title and clear button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontFamily:
                            GoogleFonts.barlowSemiCondensed().fontFamily,
                      ),
                    ),
                  ),
                ),
                Obx(() => controller.selectedFilters.isNotEmpty
                    ? GestureDetector(
                        onTap: () => controller.clearAllFilters(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.red, width: 1),
                          ),
                          child: Text(
                            "Clear All",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(width: 80.w)),
              ],
            ),

            SizedBox(height: 8.h),

            // Selected filters count
            Obx(() {
              if (controller.selectedFilters.isEmpty) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Center(
                  child: Text(
                    "${controller.selectedFilters.length} filter(s) applied",
                    style: TextStyle(
                      color: AppColors.lightRed,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),

            // Filter list
            Expanded(
              child: Obx(() {
                final filtersMap = controller.filters;
                final cache = controller.thumbnailCache;
                final isGenerating = controller.isGeneratingThumbnails.value;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filtersMap.length,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  itemBuilder: (context, index) {
                    final name = filtersMap.keys.elementAt(index);
                    final isSelected =
                        controller.selectedFilters.contains(name);
                    final thumb = cache[name];

                    return GestureDetector(
                      onTap: () => controller.onFilterTap(name),
                      child: Container(
                        width: 75.w,
                        margin: EdgeInsets.only(right: 12.w),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: 75.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.lightRed
                                          : Colors.grey.shade700,
                                      width: isSelected ? 3 : 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: AppColors.lightRed
                                                  .withOpacity(0.3),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: thumb != null && thumb.isNotEmpty
                                        ? Image.file(
                                            File(thumb),
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              print(
                                                  "Thumbnail error for $name: $error");
                                              return Container(
                                                color: Colors.grey.shade800,
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.broken_image,
                                                    color: Colors.white70,
                                                    size: 30,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : Container(
                                            color: Colors.grey.shade800,
                                            child: Center(
                                              child: isGenerating
                                                  ? SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: Colors.white70,
                                                      ),
                                                    )
                                                  : Icon(
                                                      Icons.image,
                                                      color: Colors.white70,
                                                      size: 30,
                                                    ),
                                            ),
                                          ),
                                  ),
                                ),
                                // Checkmark for selected
                                if (isSelected)
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightRed,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              name,
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.lightRed
                                    : Colors.white,
                                fontSize: 11.sp,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            SizedBox(height: 12.h),

            // Next button
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  // Get the filtered media and return to previous screen
                  final filteredMedia = controller.getFinalFilteredMedia();
                  Get.back(result: filteredMedia);
                },
                child: Container(
                  width: 110.w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.lightRed, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Next",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

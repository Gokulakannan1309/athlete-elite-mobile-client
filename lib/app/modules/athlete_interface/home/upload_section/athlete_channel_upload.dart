import 'package:athlete_elite/app/constants/filters.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/filter_screen/image_filter/image_filter_editor.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';

class AthleteChannelUpload extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  const AthleteChannelUpload({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
  });

  @override
  State<AthleteChannelUpload> createState() => _AthleteChannelUploadState();
}

class _AthleteChannelUploadState extends State<AthleteChannelUpload> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  late final AtheleteHomeController homeController;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());

    homeController = Get.isRegistered<AtheleteHomeController>()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());

    _initMedia(0);
  }

  Future<void> _initMedia(int index) async {
    AppLogger.d("🎥 Starting _initMedia for index: $index");
    final selected = widget.selectedMedia[index];
    _disposeVideo();

    if (selected.type == MediaType.video) {
      try {
        if (selected.file != null) {
          AppLogger.d("🎥 Creating controller from file");
          _videoController = VideoPlayerController.file(selected.file!);
        } else if (selected.networkUrl != null) {
          AppLogger.d("🎥 Creating controller from network");
          _videoController =
              VideoPlayerController.network(selected.networkUrl!,
            httpHeaders: {
              'User-Agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
              'Referer': Uri.parse(selected.networkUrl!).origin,
              'Accept': '*/*',
            },
          );
        } else {
          AppLogger.d("❌ No video source available");
          setState(() => _isVideoInitialized = false);
          return;
        }

        AppLogger.d("🎥 Initializing video controller...");

        // IMPORTANT: Initialize the controller
        await _videoController!.initialize();

        AppLogger.d(
            "🎥 ✅ Video initialized: ${_videoController!.value.isInitialized}");
        AppLogger.d("🎥 Video size: ${_videoController!.value.size}");
        AppLogger.d("🎥 Video duration: ${_videoController!.value.duration}");

        if (!mounted) {
          AppLogger.d("⚠️ Widget not mounted, skipping setState");
          return;
        }

        // Set properties and play
        _videoController!.setLooping(true);
        _videoController!.setVolume(1.0);

        setState(() {
          _isVideoInitialized = true;
        });

        _videoController!.play();
        AppLogger.d("🎥 ✅ Video playing: ${_videoController!.value.isPlaying}");
      } catch (e) {
        AppLogger.d("❌ Error initializing video: $e");
        setState(() => _isVideoInitialized = false);
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AthleteChannelUpload oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Whenever the bottom sheet changes, reinitialize the media
    if (oldWidget.sheetType != widget.sheetType) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initMedia(_currentIndex);
      });
    }
  }

// IMPORTANT: Wait for initialization before building
  Future<void> _ensureVideoInitialized() async {
    if (_videoController != null && !_videoController!.value.isInitialized) {
      await _videoController!.initialize();
      if (mounted) {
        setState(() => _isVideoInitialized = true);
        _videoController!.play();
      }
    }
  }

  Widget _buildMediaView(SelectedMedia media) {
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController == null || !_videoController!.value.isInitialized) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      }

      return Center(
        child: AspectRatio(
          aspectRatio: _videoController!.value.aspectRatio,
          child: VideoPlayer(_videoController!),
        ),
      );
    }

    return Container(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isAvoidbottom: true,
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() => _currentIndex = index);
              await _initMedia(index);
            },
            itemBuilder: (context, index) {
              return _buildMediaView(widget.selectedMedia[index]);
            },
          ),
          Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),
          Visibility(
            visible: widget.selectedMedia.length > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex > 0) {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex < widget.selectedMedia.length - 1) {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
          Visibility(
            visible: widget.sheetType == 'select-category',
            child: buildPostcategorySheet(),
          ),
          Visibility(
            visible: widget.sheetType == 'story-new',
            child: buildStoryCaptionSheet(),
          ),
          Visibility(
            visible: widget.sheetType == 'post-ready',
            child: buildPostReadyOverView(),
          ),
          Visibility(
            visible: widget.sheetType == 'reschedule-set',
            child: buildShedulePostTimeSheet(),
          ),
          Visibility(
            visible: widget.sheetType == 'post-new',
            child: buildPostCaptionSheet(),
          ),
        ],
      ),
    );
  }

  Widget buildPostReadyOverView() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_videoController != null &&
          _videoController!.value.isInitialized &&
          !_videoController!.value.isPlaying) {
        _videoController!.play();
      }
    });

    return Positioned(
      bottom: 30.h,
      left: 20.w,
      right: 20.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Container(
                  width: 170.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Edit Content",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Obx(() {
                return InkWell(
                  onTap: () {
                    // Disable tap while loading
                    if (!homeController.postNowIsLoading.value) {
                      homeController.postNewChannelViaDirectUpload(
                        'POST_NOW',
                        homeController.postNowIsLoading,
                      );
                    }
                  },
                  child: Container(
                    width: 170.w,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      border: Border.all(color: AppColors.lightRed, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: homeController.postNowIsLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : AppText(
                            "Post Now",
                            color: AppColors.white,
                            fontSize: 16.sp,
                            textAlign: TextAlign.center,
                          ),
                  ),
                );
              })
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (!homeController.saveDraftIsLoading.value) {
                    homeController.postNewChannelViaDirectUpload(
                      "SAVE_DRAFT",
                      homeController.saveDraftIsLoading,
                    );
                  }
                },
                child: Container(
                  width: 170.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: homeController.saveDraftIsLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                      : AppText(
                          "Save & Draft",
                          color: AppColors.white,
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
              InkWell(
                onTap: () {
                  NavigationHelper.offNamed(
                    AppRoutes.athleteNewSchedulePostCategorySelectScreen,
                    arguments: {
                      'sheetType': 'reschedule-set',
                      'isAthlete': widget.isAthlete,
                      'mediaType': widget.mediaType,
                      'selectedMedia': widget.selectedMedia,
                    },
                  );
                },
                child: Container(
                  width: 170.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.lightRed, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Schedule Post",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPostcategorySheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.75.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "SELECT:",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CONTENT CATEGORY Column
                  Column(
                    children: [
                      Text(
                        "CONTENT CATEGORY",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily:
                              GoogleFonts.barlowSemiCondensed().fontFamily,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightWhite,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // Remove nested Obx - only one Obx needed
                      SizedBox(
                        width: 150.w,
                        height: 400.h,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.allCategories.length,
                            itemBuilder: (context, index) {
                              final text = controller.allCategories[index];
                              // This will now properly react to changes
                              final isSelected = controller.selectedCategoryIds
                                  .contains(text.id);

                              return Column(
                                children: [
                                  Obx(
                                    () => SelectableButton(
                                      text: text.name,
                                      isSelected: isSelected,
                                      width: 145.w,
                                      color: AppColors.red,
                                      borderColor: AppColors.white,
                                      onTap: () {
                                        controller
                                            .toggleCategorySelection(index);
                                      },
                                    ),
                                  ),
                                  if (index !=
                                      controller.allCategories.length - 1)
                                    SizedBox(height: 20.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // MY BRANDS Column
                  Column(
                    children: [
                      Text(
                        "MY BRANDS",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily:
                              GoogleFonts.barlowSemiCondensed().fontFamily,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightWhite,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // Remove nested Obx - only one Obx needed
                      SizedBox(
                        width: 150.w,
                        height: 400.h,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.brandItems.length,
                            itemBuilder: (context, index) {
                              final text = controller.brandItems[index];
                              // This will now properly react to changes
                              final isSelected =
                                  controller.selectedBrandIds.contains(text.id);

                              return Column(
                                children: [
                                  SelectableButton(
                                    text: text.name,
                                    isSelected: isSelected,
                                    width: 145.w,
                                    color: AppColors.red,
                                    borderColor: AppColors.white,
                                    onTap: () {
                                      controller.toggleBrandSelection(index);
                                    },
                                  ),
                                  if (index != controller.brandItems.length - 1)
                                    SizedBox(height: 20.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Bottom Right Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 110.w,
                    padding: EdgeInsets.all(16),
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
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget buildPostCaptionSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.4.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "New Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () async {
                if (widget.selectedMedia.isEmpty) {
                  Get.snackbar("No Media", "Please select an image or video");
                  return;
                }

                // Navigate to filter editor and wait for result
                final result = await Get.to(
                  () => ImageFilterEditor(
                    selectedMedia: widget.selectedMedia,
                    filters: filters,
                  ),
                );

                // If filters were applied, update the selectedMedia
                if (result != null && result is List<SelectedMedia>) {
                  setState(() {
                    widget.selectedMedia.clear();
                    widget.selectedMedia.addAll(result);
                  });

                  // Show success message
                  Get.snackbar(
                    "Success",
                    "Filters applied successfully",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.lightRed,
                    colorText: Colors.white,
                  );
                }
              },
              child: Stack(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.screenBackgroundColor.withOpacity(0.7),
                      border: Border.all(color: AppColors.white, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/icons/filter_icon.png",
                        height: 10.sp,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: controller.captionForNewPost,
              maxLines: 7,
              minLines: 3,
              style: TextStyle(color: AppColors.white, fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'Add Caption',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withOpacity(0.8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),

            const Spacer(),

            // Bottom Right Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                  onTap: () {
                    if (controller.captionForNewPost.text.isEmpty) {
                      Get.snackbar("Caption", "Please enter a caption",
                          backgroundColor: AppColors.lightRed);
                    } else {
                      NavigationHelper.toNamed(
                        AppRoutes.athleteNewPostCategorySelectScreen,
                        arguments: {
                          'sheetType': 'select-category',
                          'isAthlete': widget.isAthlete,
                          'mediaType': widget.mediaType,
                          'selectedMedia': widget.selectedMedia,
                        },
                        transition: Transition.rightToLeft,
                      );
                    }
                  },
                  child: Container(
                    width: 110.w,
                    padding: EdgeInsets.all(16),
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
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget buildStoryCaptionSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.25.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "New Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            color: AppColors.screenBackgroundColor.withOpacity(
                              0.7,
                            ),
                            border: Border.all(
                              color: AppColors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/icons/filter_icon.png",
                              height: 10.sp,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        NavigationHelper.toNamed(
                          AppRoutes.athleteNewStoryPostReadyViewScreen,
                          arguments: {
                            'sheetType': 'post-ready',
                            'mediaType': widget.mediaType,
                            'selectedMedia': widget.selectedMedia,
                            'isAthlete': widget.isAthlete,
                          },
                        );
                      },
                      child: Container(
                        width: 110.w,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          border: Border.all(
                            color: AppColors.lightRed,
                            width: 1.5,
                          ),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget buildShedulePostTimeSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.25.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "New Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // HOUR PICKER
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        height: 250,
                        child: CupertinoPicker(
                          backgroundColor: AppColors.black.withOpacity(0.6),
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                            initialItem: controller.selectedHour.value,
                          ),
                          onSelectedItemChanged: (index) {
                            controller.selectedHour.value = index;
                          },
                          children: List.generate(
                            24,
                            (i) => Center(child: AppText(i.toString())),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AppText("Hour"),
                      Obx(() =>
                          AppText(controller.selectedHour.value.toString())),
                    ],
                  ),
                ),

                // DATE PICKER
                InkWell(
                  onTap: () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate.value,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            dialogBackgroundColor: AppColors.black,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    foregroundColor: AppColors.white)),
                            colorScheme: ColorScheme.dark(
                              primary: AppColors.lightRed,
                              onSurface: AppColors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (selected != null) {
                      controller.selectedDate.value = selected;
                    }
                  },
                  child: Column(
                    children: [
                      AppText("Day"),
                      Obx(() => AppText(
                          "${controller.selectedDate.value.day}/${controller.selectedDate.value.month}")),
                    ],
                  ),
                ),
                Obx(() {
                  return InkWell(
                    onTap: () {
                      if (!homeController.scheduleNowIsLoading.value) {
                        homeController.postNewChannelViaDirectUpload(
                          "SCHEDULE",
                          homeController.scheduleNowIsLoading,
                        );
                      }
                    },
                    child: Container(
                      width: 110.w,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        border:
                            Border.all(color: AppColors.lightRed, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: homeController.scheduleNowIsLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                          : AppText(
                              "Schedule Post",
                              color: AppColors.white,
                              fontSize: 16.sp,
                              textAlign: TextAlign.center,
                            ),
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AthleteNewPostCategorySelectScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;

  const AthleteNewPostCategorySelectScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
  });

  @override
  State<AthleteNewPostCategorySelectScreen> createState() =>
      _AthleteNewPostCategorySelectScreenState();
}

class _AthleteNewPostCategorySelectScreenState
    extends State<AthleteNewPostCategorySelectScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    _initMedia(0);
  }

  Future<void> _initMedia(int index) async {
    final selected = widget.selectedMedia[index];
    _disposeVideo();

    // if (selected.type == MediaType.video) {
    //   _videoController = VideoPlayerController.file(selected.file);
    //   await _videoController!.initialize();
    //   _videoController!
    //     ..setLooping(true)
    //     ..setVolume(1.0)
    //     ..play();
    //   setState(() => _isVideoInitialized = true);
    // } else {
    //   setState(() => _isVideoInitialized = false);
    // }
    if (selected.type == MediaType.video) {
      if (selected.file != null) {
        _videoController = VideoPlayerController.file(selected.file!);
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else if (selected.networkUrl != null) {
        _videoController = VideoPlayerController.network(selected.networkUrl!,
          httpHeaders: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Referer': Uri.parse(selected.networkUrl!).origin,
            'Accept': '*/*',
          },
        );
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else {
        setState(() => _isVideoInitialized = false);
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMediaView(SelectedMedia media) {
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return Center(
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: _videoController!.value.size.width,
                height: _videoController!.value.size.height,
                child: VideoPlayer(_videoController!),
              ),
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    final AtheleteLandingController controller = Get.find();

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() => _currentIndex = index);
              await _initMedia(index);
            },
            itemBuilder: (context, index) {
              return _buildMediaView(widget.selectedMedia[index]);
            },
          ),
          Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),
          Visibility(
            visible: widget.selectedMedia.length > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex > 0) {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex < widget.selectedMedia.length - 1) {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
          buildPostcategorySheet(controller),
        ],
      ),
    );
  }

  Widget buildPostcategorySheet(AtheleteLandingController controller) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.75.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "SELECT:",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "CONTENT CATEGORY",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily:
                              GoogleFonts.barlowSemiCondensed().fontFamily,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightWhite,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // Remove nested Obx - only one Obx needed
                      SizedBox(
                        width: 150.w,
                        height: 400.h,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.allCategories.length,
                            itemBuilder: (context, index) {
                              final text = controller.allCategories[index];
                              // This will now properly react to changes
                              AppLogger.d(
                                  "the selected categories are: ${controller.selectedCategoryIds}");
                              AppLogger.d("the index is: $index");
                              final isSelected = controller.selectedCategoryIds
                                  .contains(text.id);

                              AppLogger.d("isSelected: $isSelected");

                              return Column(
                                children: [
                                  SelectableButton(
                                    text: text.name,
                                    isSelected: isSelected,
                                    width: 145.w,
                                    color: AppColors.red,
                                    borderColor: AppColors.white,
                                    onTap: () {
                                      setState(() {
                                        controller
                                            .toggleCategorySelection(index);
                                        controller.update();
                                      });
                                    },
                                  ),
                                  if (index !=
                                      controller.allCategories.length - 1)
                                    SizedBox(height: 20.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // MY BRANDS Column
                  Column(
                    children: [
                      Text(
                        "MY BRANDS",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          fontFamily:
                              GoogleFonts.barlowSemiCondensed().fontFamily,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightWhite,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: 150.w,
                        height: 400.h,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.brandItems.length,
                            itemBuilder: (context, index) {
                              final text = controller.brandItems[index];
                              // This will now properly react to changes
                              final isSelected =
                                  controller.selectedBrandIds.contains(text.id);

                              return Column(
                                children: [
                                  SelectableButton(
                                    text: text.name,
                                    isSelected: isSelected,
                                    width: 145.w,
                                    color: AppColors.red,
                                    borderColor: AppColors.white,
                                    onTap: () {
                                      setState(() {
                                        controller.toggleBrandSelection(index);
                                      });
                                    },
                                  ),
                                  if (index != controller.brandItems.length - 1)
                                    SizedBox(height: 20.h),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                  onTap: () {
                    if (controller.selectedCategoryIds.isEmpty) {
                      Get.snackbar(
                        "Selection Category",
                        "Please select at least one category",
                        backgroundColor: AppColors.red,
                        colorText: AppColors.white,
                      );
                    } else {
                      NavigationHelper.toNamed(
                        AppRoutes.athleteUploadChannelSelectScreen,
                        arguments: {
                          'sheetType': 'post-ready',
                          'mediaType': widget.mediaType,
                          'selectedMedia': widget.selectedMedia,
                          'isAthlete': widget.isAthlete,
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 110.w,
                    padding: EdgeInsets.all(16),
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
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class AthleteNewStoryPostReadyViewScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;

  const AthleteNewStoryPostReadyViewScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
  });

  @override
  State<AthleteNewStoryPostReadyViewScreen> createState() =>
      _AthleteNewStoryPostReadyViewScreenState();
}

class _AthleteNewStoryPostReadyViewScreenState
    extends State<AthleteNewStoryPostReadyViewScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  late final AtheleteHomeController homeController;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());

    homeController = Get.isRegistered<AtheleteHomeController>()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());
    _initMedia(0);
  }

  Future<void> _initMedia(int index) async {
    final selected = widget.selectedMedia[index];
    _disposeVideo();

    // if (selected.type == MediaType.video) {
    //   _videoController = VideoPlayerController.file(selected.file);
    //   await _videoController!.initialize();
    //   _videoController!
    //     ..setLooping(true)
    //     ..setVolume(1.0)
    //     ..play();
    //   setState(() => _isVideoInitialized = true);
    // } else {
    //   setState(() => _isVideoInitialized = false);
    // }
    if (selected.type == MediaType.video) {
      if (selected.file != null) {
        _videoController = VideoPlayerController.file(selected.file!);
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else if (selected.networkUrl != null) {
        _videoController = VideoPlayerController.network(selected.networkUrl!,
          httpHeaders: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Referer': Uri.parse(selected.networkUrl!).origin,
            'Accept': '*/*',
          },
        );
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else {
        setState(() => _isVideoInitialized = false);
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMediaView(SelectedMedia media) {
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return Center(
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: _videoController!.value.size.width,
                height: _videoController!.value.size.height,
                child: VideoPlayer(_videoController!),
              ),
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    final AtheleteLandingController controller = Get.find();

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() => _currentIndex = index);
              await _initMedia(index);
            },
            itemBuilder: (context, index) {
              return _buildMediaView(widget.selectedMedia[index]);
            },
          ),
          Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),
          Visibility(
            visible: widget.selectedMedia.length > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex > 0) {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex < widget.selectedMedia.length - 1) {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
          buildNewStoryReadyOverView(),
        ],
      ),
    );
  }

  Widget buildNewStoryReadyOverView() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_videoController != null &&
          _videoController!.value.isInitialized &&
          !_videoController!.value.isPlaying) {
        _videoController!.play();
      }
    });

    return Positioned(
      bottom: 30.h,
      left: 20.w,
      right: 20.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 170.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Edit Content",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Obx(() {
                return InkWell(
                  onTap: () {
                    // Disable tap while loading
                    if (!homeController.postNowIsLoading.value) {
                      homeController
                          .uploadStoryForAthlete(
                        'POST_NOW',
                        homeController.postNowIsLoading,
                      )
                          .then((value) {
                        NavigationHelper.offAllNamed(
                          AppRoutes.atheleteLandingScreen,
                          arguments: {"isAthlete": true},
                          transition: Transition.rightToLeft,
                        );
                        CustomToast.show("Story posted successfully");
                      });
                    }
                  },
                  child: Container(
                    width: 170.w,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      border: Border.all(color: AppColors.lightRed, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: homeController.postNowIsLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : AppText(
                            "Post Now",
                            color: AppColors.white,
                            fontSize: 16.sp,
                            textAlign: TextAlign.center,
                          ),
                  ),
                );
              })
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return InkWell(
                  onTap: () {
                    if (!homeController.saveDraftIsLoading.value) {
                      homeController.postNewChannelViaDirectUpload(
                        "SAVE_DRAFT",
                        homeController.saveDraftIsLoading,
                      );
                    }
                  },
                  child: Container(
                    width: 170.w,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      border: Border.all(color: AppColors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: homeController.saveDraftIsLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : AppText(
                            "Save & Draft",
                            color: AppColors.white,
                            fontSize: 16.sp,
                            textAlign: TextAlign.center,
                          ),
                  ),
                );
              }),
              InkWell(
                onTap: () {
                  NavigationHelper.offNamed(
                    AppRoutes.athleteNewScheduleStoryCategorySelectScreen,
                    arguments: {
                      'sheetType': 'reschedule-set-story',
                      'isAthlete': widget.isAthlete,
                      'mediaType': widget.mediaType,
                      'selectedMedia': widget.selectedMedia,
                    },
                  );
                },
                child: Container(
                  width: 170.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(color: AppColors.lightRed, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    "Schedule Post",
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AthleteNewPostShcedulePostCategorySelectScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;

  const AthleteNewPostShcedulePostCategorySelectScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
  });

  @override
  State<AthleteNewPostShcedulePostCategorySelectScreen> createState() =>
      _AthleteNewPostShcedulePostCategorySelectScreenState();
}

class _AthleteNewPostShcedulePostCategorySelectScreenState
    extends State<AthleteNewPostShcedulePostCategorySelectScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    _initMedia(0);
  }

  Future<void> _initMedia(int index) async {
    final selected = widget.selectedMedia[index];
    _disposeVideo();

    // if (selected.type == MediaType.video) {
    //   _videoController = VideoPlayerController.file(selected.file);
    //   await _videoController!.initialize();
    //   _videoController!
    //     ..setLooping(true)
    //     ..setVolume(1.0)
    //     ..play();
    //   setState(() => _isVideoInitialized = true);
    // } else {
    //   setState(() => _isVideoInitialized = false);
    // }
    if (selected.type == MediaType.video) {
      if (selected.file != null) {
        _videoController = VideoPlayerController.file(selected.file!);
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else if (selected.networkUrl != null) {
        _videoController = VideoPlayerController.network(selected.networkUrl!,
          httpHeaders: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Referer': Uri.parse(selected.networkUrl!).origin,
            'Accept': '*/*',
          },
        );
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else {
        setState(() => _isVideoInitialized = false);
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMediaView(SelectedMedia media) {
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return Center(
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: _videoController!.value.size.width,
                height: _videoController!.value.size.height,
                child: VideoPlayer(_videoController!),
              ),
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    final AtheleteLandingController controller = Get.find();

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() => _currentIndex = index);
              await _initMedia(index);
            },
            itemBuilder: (context, index) {
              return _buildMediaView(widget.selectedMedia[index]);
            },
          ),
          Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),
          Visibility(
            visible: widget.selectedMedia.length > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex > 0) {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex < widget.selectedMedia.length - 1) {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
          buildShedulePostTimeSheet(controller),
        ],
      ),
    );
  }

  Widget buildShedulePostTimeSheet(AtheleteLandingController controller) {
    AtheleteHomeController homeController = Get.isRegistered()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.25.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "New Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // HOUR PICKER
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        height: 250,
                        child: CupertinoPicker(
                          backgroundColor: AppColors.black.withOpacity(0.6),
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                            initialItem: controller.selectedHour.value,
                          ),
                          onSelectedItemChanged: (index) {
                            controller.selectedHour.value = index;
                          },
                          children: List.generate(
                            24,
                            (i) => Center(child: AppText(i.toString())),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AppText("Hour"),
                      Obx(() =>
                          AppText(controller.selectedHour.value.toString())),
                    ],
                  ),
                ),

                // DATE PICKER
                InkWell(
                  onTap: () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate.value,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            dialogBackgroundColor: AppColors.black,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    foregroundColor: AppColors.white)),
                            colorScheme: ColorScheme.dark(
                              primary: AppColors.lightRed,
                              onSurface: AppColors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (selected != null) {
                      controller.selectedDate.value = selected;
                    }
                  },
                  child: Column(
                    children: [
                      AppText("Day"),
                      Obx(() => AppText(
                          "${controller.selectedDate.value.day}/${controller.selectedDate.value.month}")),
                    ],
                  ),
                ),
                // BUTTON
                Obx(() {
                  return InkWell(
                    onTap: () {
                      if (!homeController.scheduleNowIsLoading.value) {
                        homeController.postNewChannelViaDirectUpload(
                          "SCHEDULE",
                          homeController.scheduleNowIsLoading,
                        );
                      }
                    },
                    child: Container(
                      width: 110.w,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        border:
                            Border.all(color: AppColors.lightRed, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: homeController.scheduleNowIsLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                          : AppText(
                              "Schedule Post",
                              color: AppColors.white,
                              fontSize: 16.sp,
                              textAlign: TextAlign.center,
                            ),
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AthleteNewStoryShcedulePostCategorySelectScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;

  const AthleteNewStoryShcedulePostCategorySelectScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
  });

  @override
  State<AthleteNewStoryShcedulePostCategorySelectScreen> createState() =>
      _AthleteNewStoryShcedulePostCategorySelectScreenState();
}

class _AthleteNewStoryShcedulePostCategorySelectScreenState
    extends State<AthleteNewStoryShcedulePostCategorySelectScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    _initMedia(0);
  }

  Future<void> _initMedia(int index) async {
    final selected = widget.selectedMedia[index];
    _disposeVideo();

    // if (selected.type == MediaType.video) {
    //   _videoController = VideoPlayerController.file(selected.file);
    //   await _videoController!.initialize();
    //   _videoController!
    //     ..setLooping(true)
    //     ..setVolume(1.0)
    //     ..play();
    //   setState(() => _isVideoInitialized = true);
    // } else {
    //   setState(() => _isVideoInitialized = false);
    // }
    if (selected.type == MediaType.video) {
      if (selected.file != null) {
        _videoController = VideoPlayerController.file(selected.file!);
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else if (selected.networkUrl != null) {
        _videoController = VideoPlayerController.network(selected.networkUrl!,
          httpHeaders: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Referer': Uri.parse(selected.networkUrl!).origin,
            'Accept': '*/*',
          },
        );
        await _videoController!.initialize();
        _videoController!
          ..setLooping(true)
          ..setVolume(1.0)
          ..play();
        setState(() => _isVideoInitialized = true);
      } else {
        setState(() => _isVideoInitialized = false);
      }
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
  }

  @override
  void dispose() {
    _disposeVideo();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMediaView(SelectedMedia media) {
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController != null && _videoController!.value.isInitialized) {
        return Center(
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: _videoController!.value.size.width,
                height: _videoController!.value.size.height,
                child: VideoPlayer(_videoController!),
              ),
            ),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    final AtheleteLandingController controller = Get.find();

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() => _currentIndex = index);
              await _initMedia(index);
            },
            itemBuilder: (context, index) {
              return _buildMediaView(widget.selectedMedia[index]);
            },
          ),
          Positioned(top: 50.h, left: 20.w, child: const CommonBackButton()),
          Visibility(
            visible: widget.selectedMedia.length > 1,
            child: Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex > 0) {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
                    GestureDetector(
                      onTap: () async {
                        if (_currentIndex < widget.selectedMedia.length - 1) {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          await _initMedia(_currentIndex);
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
          buildShedulePostTimeSheet(controller),
        ],
      ),
    );
  }

  Widget buildShedulePostTimeSheet(AtheleteLandingController controller) {
    AtheleteHomeController homeController = Get.isRegistered()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 0.25.sh,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor.withOpacity(0.85),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centered Text
            Center(
              child: Text(
                "New Post",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // HOUR PICKER
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        height: 250,
                        child: CupertinoPicker(
                          backgroundColor: AppColors.black.withOpacity(0.6),
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                            initialItem: controller.selectedHour.value,
                          ),
                          onSelectedItemChanged: (index) {
                            controller.selectedHour.value = index;
                          },
                          children: List.generate(
                            24,
                            (i) => Center(child: AppText(i.toString())),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AppText("Hour"),
                      Obx(() =>
                          AppText(controller.selectedHour.value.toString())),
                    ],
                  ),
                ),

                // DATE PICKER
                InkWell(
                  onTap: () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate.value,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            dialogBackgroundColor: AppColors.black,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    foregroundColor: AppColors.white)),
                            colorScheme: ColorScheme.dark(
                              primary: AppColors.lightRed,
                              onSurface: AppColors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (selected != null) {
                      controller.selectedDate.value = selected;
                    }
                  },
                  child: Column(
                    children: [
                      AppText("Day"),
                      Obx(() => AppText(
                          "${controller.selectedDate.value.day}/${controller.selectedDate.value.month}")),
                    ],
                  ),
                ),
                // BUTTON
                Obx(() {
                  return InkWell(
                    onTap: () {
                      if (!homeController.scheduleNowIsLoading.value) {
                        homeController
                            .uploadStoryForAthlete(
                          'SCHEDULE',
                          homeController.scheduleNowIsLoading,
                        )
                            .then((value) {
                          NavigationHelper.offAllNamed(
                            AppRoutes.atheleteLandingScreen,
                            arguments: {"isAthlete": true},
                            transition: Transition.rightToLeft,
                          );
                          CustomToast.show("Story Scheduled successfully");
                        });
                      }
                    },
                    child: Container(
                      width: 110.w,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        border:
                            Border.all(color: AppColors.lightRed, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: homeController.scheduleNowIsLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                          : AppText(
                              "Schedule Post",
                              color: AppColors.white,
                              fontSize: 16.sp,
                              textAlign: TextAlign.center,
                            ),
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:athlete_elite/app/constants/filters.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/filter_screen/image_filter/image_filter_editor.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/filters/subfilters.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../athelete_landing_controller.dart';

class AthleteContentTagScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  final PreviewItem previewItem;
  const AthleteContentTagScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
    required this.previewItem,
  });

  @override
  State<AthleteContentTagScreen> createState() =>
      _AthleteContentTagScreenState();
}

class _AthleteContentTagScreenState extends State<AthleteContentTagScreen> {
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
        _videoController = VideoPlayerController.network(
          selected.networkUrl!,
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
            visible: widget.sheetType == 'post-ready',
            child: Positioned(
              top: 50.h,
              right: 20.w,
              child: Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: Color(0xFFCC5533).withOpacity(0.4),
                  border: Border.all(color: AppColors.white, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.file_download_outlined,
                  color: AppColors.white,
                  size: 28.sp,
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
                  NavigationHelper.toNamed(
                    AppRoutes.athletePostContentTagScreen,
                    arguments: {
                      'sheetType': 'post-new',
                      'isAthlete': widget.isAthlete,
                      'mediaType': widget.mediaType,
                      'selectedMedia': widget.selectedMedia,
                      'previewItem': widget.previewItem,
                    },
                  );
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
                    "Edit Content".tr,
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  homeController
                      .postAthleteChannelFromSchedule(widget.previewItem);
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
                    "Post Now".tr,
                    color: AppColors.white,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
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
                  NavigationHelper.toNamed(
                      AppRoutes.athletePostContentTagScreen,
                      arguments: {
                        'sheetType': 'reschedule-set',
                        'mediaType': widget.mediaType,
                        'selectedMedia': widget.selectedMedia,
                        'isAthlete': widget.isAthlete,
                        'previewItem': widget.previewItem,
                      },
                      transition: Transition.rightToLeft);
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
                "SELECT:".tr.toUpperCase(),
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
                        "CONTENT CATEGORY".tr.toUpperCase(),
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
                        "MY BRANDS".tr.toUpperCase(),
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
                                    text: text.name ?? "",
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
                      "Next".tr.toUpperCase(),
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
                "New Post".tr,
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
                  Get.snackbar(
                      "No Media", "Please select an image or video".tr);
                  return;
                }

                // Navigate to filter editor and wait for result
                final result = await Get.to(
                  () => ImageFilterEditor(
                    selectedMedia: widget.selectedMedia,
                    filters: AppFilters.getPopularFilters(),
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
                    "Filters applied successfully".tr,
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
                hintText: 'Add Caption'.tr,
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
                      Get.snackbar("Caption", "Please enter a caption".tr,
                          backgroundColor: AppColors.lightRed);
                    } else {
                      NavigationHelper.toNamed(
                        AppRoutes.athletePostCategorySelectScreen,
                        arguments: {
                          'sheetType': 'select-category',
                          'isAthlete': widget.isAthlete,
                          'mediaType': widget.mediaType,
                          'selectedMedia': widget.selectedMedia,
                          'previewItem': widget.previewItem
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
                      "Next".tr,
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
                "New Post".tr,
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
                      onTap: () {},
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
                          "Next".tr,
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
                "New Post".tr,
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
                InkWell(
                  onTap: () {
                    if (homeController.isReschedulingLoading.value) return;
                    AppLogger.d("widget.previewItem   ${widget.previewItem}");
                    homeController.onReScheduleChannel(widget.previewItem);
                  },
                  child: Container(
                    width: 110.w,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      border: Border.all(color: AppColors.lightRed, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Visibility(
                      visible: !homeController.isReschedulingLoading.value,
                      replacement: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.white,
                      )),
                      child: AppText(
                        "Schedule Post",
                        color: AppColors.white,
                        fontSize: 16.sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Predefined filter list for image and video filtering
///
/// This provides a comprehensive list of popular Instagram-style filters
/// using the photofilters package.

class AppFilters {
  /// Get all available preset filters
  static List<Filter> getAllFilters() {
    return [
      NoFilter(),
      AddictiveBlueFilter(),
      AddictiveRedFilter(),
      AdenFilter(),
      AmaroFilter(),
      AshbyFilter(),
      BrannanFilter(),
      BrooklynFilter(),
      ClarendonFilter(),
      CremaFilter(),
      DogpatchFilter(),
      EarlybirdFilter(),
      // Filter1977Filter(),
      GinghamFilter(),
      GinzaFilter(),
      HefeFilter(),
      HelenaFilter(),
      HudsonFilter(),
      InkwellFilter(),
      JunoFilter(),
      KelvinFilter(),
      LarkFilter(),
      LoFiFilter(),
      LudwigFilter(),
      MavenFilter(),
      MayfairFilter(),
      MoonFilter(),
      NashvilleFilter(),
      PerpetuaFilter(),
      ReyesFilter(),
      RiseFilter(),
      SierraFilter(),
      SkylineFilter(),
      SlumberFilter(),
      StinsonFilter(),
      SutroFilter(),
      ToasterFilter(),
      ValenciaFilter(),
      VesperFilter(),
      WaldenFilter(),
      WillowFilter(),
      XProIIFilter(),
    ];
  }

  /// Get popular/commonly used filters (subset)
  static List<Filter> getPopularFilters() {
    return [
      NoFilter(),
      ClarendonFilter(),
      GinghamFilter(),
      JunoFilter(),
      LarkFilter(),
      LudwigFilter(),
      SlumberFilter(),
      CremaFilter(),
      AdenFilter(),
      PerpetuaFilter(),
      AmaroFilter(),
      MayfairFilter(),
      RiseFilter(),
      HudsonFilter(),
      ValenciaFilter(),
      XProIIFilter(),
      SierraFilter(),
      WillowFilter(),
      LoFiFilter(),
      InkwellFilter(),
      NashvilleFilter(),
    ];
  }

  /// Get filters categorized by style
  static Map<String, List<Filter>> getCategorizedFilters() {
    return {
      'No Filter': [NoFilter()],
      'Warm Tones': [
        ValenciaFilter(),
        RiseFilter(),
        MayfairFilter(),
        ToasterFilter(),
        SutroFilter(),
      ],
      'Cool Tones': [
        AdenFilter(),
        JunoFilter(),
        LarkFilter(),
        GinghamFilter(),
        SkylineFilter(),
      ],
      'Vintage': [
        // Filter1977Filter(),
        BrannanFilter(),
        EarlybirdFilter(),
        HefeFilter(),
        LudwigFilter(),
        NashvilleFilter(),
        WaldenFilter(),
      ],
      'Black & White': [
        InkwellFilter(),
        WillowFilter(),
        MoonFilter(),
      ],
      'Dramatic': [
        XProIIFilter(),
        LoFiFilter(),
        KelvinFilter(),
        HudsonFilter(),
        AmaroFilter(),
      ],
      'Soft & Light': [
        SlumberFilter(),
        CremaFilter(),
        PerpetuaFilter(),
        ReyesFilter(),
        HelenaFilter(),
        VesperFilter(),
      ],
      'Urban': [
        BrooklynFilter(),
        ClarendonFilter(),
        DogpatchFilter(),
        GinzaFilter(),
        SierraFilter(),
        StinsonFilter(),
      ],
      'Vibrant': [
        AddictiveBlueFilter(),
        AddictiveRedFilter(),
        AshbyFilter(),
        MavenFilter(),
      ],
    };
  }

  /// Get filter by name (case-insensitive)
  static Filter? getFilterByName(String name) {
    final allFilters = getAllFilters();
    try {
      return allFilters.firstWhere(
        (filter) => filter.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get filter names list
  static List<String> getFilterNames() {
    return getAllFilters().map((filter) => filter.name).toList();
  }
}

/// Custom filter definitions (optional - for creating your own filters)

/// Video filter names mapping
/// (for use with video filter processors)
class VideoFilterNames {
  static const String grayscale = "Grayscale";
  static const String sepia = "Sepia";
  static const String vintage = "Vintage";
  static const String cool = "Cool";
  static const String warm = "Warm";
  static const String brightness = "Brightness";
  static const String contrast = "Contrast";
  static const String noir = "Noir";
  static const String vignette = "Vignette";

  /// Get all video filter names
  static List<String> getAllVideoFilterNames() {
    return [
      grayscale,
      sepia,
      vintage,
      cool,
      warm,
      brightness,
      contrast,
      noir,
      vignette,
    ];
  }

  /// Map filter name to FFmpeg command
  static String getFFmpegCommand(String filterName) {
    switch (filterName.toLowerCase()) {
      case 'grayscale':
        return 'colorchannelmixer=.3:.4:.3:0:.3:.4:.3:0:.3:.4:.3';
      case 'sepia':
        return 'colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131';
      case 'vintage':
        return 'curves=vintage';
      case 'cool':
        return 'colorbalance=rs=-.2:gs=-.1:bs=.2';
      case 'warm':
        return 'colorbalance=rs=.2:gs=.1:bs=-.2';
      case 'brightness':
        return 'eq=brightness=0.10';
      case 'contrast':
        return 'eq=contrast=1.5';
      case 'noir':
        return 'colorchannelmixer=.3:.4:.3:0:.3:.4:.3:0:.3:.4:.3,eq=contrast=1.2:brightness=0.05';
      case 'vignette':
        return 'vignette=angle=PI/4';
      default:
        return 'null';
    }
  }
}

import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../athelete_landing_controller.dart';

class AthletePostCategorySelectScreen extends StatefulWidget {
  final bool isAthlete;
  final String sheetType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  final PreviewItem previewItem;

  const AthletePostCategorySelectScreen({
    super.key,
    required this.sheetType,
    required this.isAthlete,
    required this.mediaType,
    required this.selectedMedia,
    required this.previewItem,
  });

  @override
  State<AthletePostCategorySelectScreen> createState() =>
      _AthletePostCategorySelectScreenState();
}

class _AthletePostCategorySelectScreenState
    extends State<AthletePostCategorySelectScreen> {
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
                              final isSelected = controller.selectedBrandIds
                                  .contains(text.id);

                              return Column(
                                children: [
                                  SelectableButton(
                                    text: text.name ?? "",
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

            // Bottom Right Button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                  onTap: () {
                    if (controller.selectedCategoryIds.isEmpty) {
                      Get.snackbar(
                        "Selection Category",
                        "Please select at least one category".tr,
                        backgroundColor: AppColors.red,
                        colorText: AppColors.white,
                      );
                    } else {
                      NavigationHelper.toNamed(
                        AppRoutes.athletePostContentTagScreen,
                        arguments: {
                          'sheetType': 'post-ready',
                          'mediaType': widget.mediaType,
                          'selectedMedia': widget.selectedMedia,
                          'isAthlete': widget.isAthlete,
                          'previewItem': widget.previewItem
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
                      "Next".tr,
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

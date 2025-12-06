import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../../routes/navigation_helper.dart';
import '../../../../widgets/common_back_button.dart';
import '../../../../widgets/common_button.dart';
import '../athelete_landing_controller.dart';

class SendToStudioScreen extends StatefulWidget {
  final bool isAthlete;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  const SendToStudioScreen(
      {super.key,
      required this.isAthlete,
      required this.mediaType,
      required this.selectedMedia});

  @override
  State<SendToStudioScreen> createState() => _SendToStudioScreenState();
}

class _SendToStudioScreenState extends State<SendToStudioScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  late final AtheleteLandingController controller;
  late final AtheleteHomeController homeController;

  @override

  /// Initializes the state of the widget, which includes
  /// registering the necessary controllers and calling
  /// `_initMedia` to initialize the media at the given index.
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
          _videoController = VideoPlayerController.network(
            selected.networkUrl!,
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
       height: 20.h,
      width: 20.h,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 0.5.sh,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: AppColors.screenBackgroundColor,
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
                      "Content Studio ".tr,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        fontFamily:
                            GoogleFonts.barlowSemiCondensed().fontFamily,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  TextField(
                    controller: controller.addDescriptionForStudio,
                    maxLines: 7,
                    minLines: 6,
                    style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: 'Add description'.tr,
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
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

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(
                      () => CommonButton(
                        text: "Send to Studio".tr,
                        onPressed: () {
                          homeController.uploadContentStudio().then((value) {
                            if (value) {
                              NavigationHelper.toNamed(
                                AppRoutes.atheleteHomeScreen,
                                arguments: {'isAthlete': widget.isAthlete},
                                transition: Transition.rightToLeft,
                              );
                              CustomToast.show("Successfully sent to studio");
                            }
                          });
                        },
                        isOutlined: true,
                        isLoading:
                            homeController.isContentStudioListingLoading.value,
                        color: Color(0xFF1C4ED8),
                        textColor: Colors.white,
                        fontSize: 16.sp,
                        width: 170.w,
                        height: 55.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

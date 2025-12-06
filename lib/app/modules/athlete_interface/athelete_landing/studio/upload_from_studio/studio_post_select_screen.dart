import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/content_studio/content_studio_response.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../routes/app_routes.dart';
import '../../../../../routes/navigation_helper.dart';
import '../../../../../widgets/common_back_button.dart';

class StudioPostSelectScreen extends StatefulWidget {
  final bool isAthlete;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  final ContentItem contentItem;
  const StudioPostSelectScreen(
      {super.key,
      required this.isAthlete,
      required this.mediaType,
      required this.selectedMedia,
      required this.contentItem});

  @override
  State<StudioPostSelectScreen> createState() => _StudioPostSelectScreenState();
}

class _StudioPostSelectScreenState extends State<StudioPostSelectScreen> {
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
          Positioned(
            bottom: 30.h,
            left: 20.w,
            child: InkWell(
              onTap: () {
                PreviewItem previewItem = PreviewItem(
                  id: widget.contentItem.id,
                  title: "title" ?? "",
                  caption: "Caption" ?? "",
                  mediaUrl: widget.contentItem.uploadedMedia.first.url ?? "",
                  thumbnailUrl: "thumbnailUrl" ?? "",
                  status: widget.contentItem.status ?? "",
                  type: "type" ?? "",
                  isArchived: false,
                  scheduledAt: "",
                  publishedAt: "" ?? "",
                  likesCount: 0 ?? 0,
                  isLiked: false ?? false,
                  commentsCount: 0 ?? 0,
                  createdAt: "" ?? "",
                  updatedAt: "" ?? "",
                  media: [],
                  categoryId: "" ?? "",
                );
                NavigationHelper.toNamed(
                  AppRoutes.athletePostContentTagScreen,
                  arguments: {
                    'sheetType': 'post-new',
                    'isAthlete': widget.isAthlete,
                    'mediaType': widget.mediaType,
                    'selectedMedia': widget.selectedMedia,
                    'previewItem': previewItem,
                  },
                  transition: Transition.rightToLeft,
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  border: Border.all(color: AppColors.lightRed, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppText(
                  "Channel".tr,
                  color: AppColors.white,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

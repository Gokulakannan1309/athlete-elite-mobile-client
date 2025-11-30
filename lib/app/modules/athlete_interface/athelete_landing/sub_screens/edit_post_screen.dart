import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/common_button.dart';
import '../athelete_landing_controller.dart';

class EditPostScreen extends StatefulWidget {
  final bool isAthlete;
  final bool isEditpostType;
  final MediaType mediaType;
  final RxList<SelectedMedia> selectedMedia;
  final PreviewItem previewItem;
  const EditPostScreen({
    super.key,
    required this.isAthlete,
    required this.isEditpostType,
    required this.mediaType,
    required this.selectedMedia,
    required this.previewItem,
  });

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final PageController _pageController = PageController();
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  int _currentIndex = 0;
  AtheleteLandingController controller = Get.isRegistered()
      ? Get.find<AtheleteLandingController>()
      : Get.put(AtheleteLandingController());

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<AtheleteLandingController>()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());

    if (widget.previewItem != null) {
      controller.editCaptionController.text = widget.previewItem?.caption ?? "";
    }

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
    AtheleteHomeController homeController = Get.isRegistered()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());

    return AppScaffold(
      isAvoidbottom: true,
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                color: AppColors.screenBackgroundColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonBackButton(),
                    ),
                    Text(
                      widget.isEditpostType ? 'EDIT POST' : 'EDIT DRAFT',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 120,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// user row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.transparent,
                            child: controller.isHomeIntroLoading.value
                                ? ClipOval(
                                    child: shimmerBox(
                                      w: 20.r * 2,
                                      h: 20.r * 2,
                                      radius: 20.r,
                                    ),
                                  )
                                : buildProfileImage(20.r, controller),
                          ),
                          SizedBox(width: 12),
                          Text(
                            controller.athleteUser.value?.name ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 350.h, // set proper height
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _pageController,
                              itemCount: widget.selectedMedia.length,
                              onPageChanged: (index) async {
                                setState(() => _currentIndex = index);
                                await _initMedia(index);
                              },
                              itemBuilder: (context, index) {
                                return _buildMediaView(
                                    widget.selectedMedia[index]);
                              },
                            ),

                            // arrows
                            if (widget.selectedMedia.length > 1)
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _arrowButton(
                                          Icons.arrow_back_ios_new_rounded,
                                          () async {
                                        if (_currentIndex > 0) {
                                          _currentIndex--;
                                          await _pageController.animateToPage(
                                            _currentIndex,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                          await _initMedia(_currentIndex);
                                          setState(() {});
                                        }
                                      }),
                                      _arrowButton(
                                          Icons.arrow_forward_ios_rounded,
                                          () async {
                                        if (_currentIndex <
                                            widget.selectedMedia.length - 1) {
                                          _currentIndex++;
                                          await _pageController.animateToPage(
                                            _currentIndex,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                          await _initMedia(_currentIndex);
                                          setState(() {});
                                        }
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),

                      /// Caption label
                      Text(
                        'Caption',
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      SizedBox(height: 8),

                      /// Caption field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[800]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: controller.editCaptionController,
                          maxLines: 3,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: InputBorder.none,
                            hintText: 'Write a caption...',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  if (homeController.saveDraftIsLoading.value == true) {
                    return CircularProgressIndicator(
                      backgroundColor: AppColors.primaryColor,
                    );
                  }
                  return CommonButton(
                    text: "Save Changes",
                    onPressed: () {
                      if (homeController.saveDraftIsLoading.value == false) {
                        AppLogger.d(
                            "the typed word is: ${controller.editCaptionController.text}");
                        homeController.onEditDraftChannel(widget.previewItem!);
                      }
                    },
                    isOutlined: true,
                    isLoading: homeController.saveDraftIsLoading.value,
                    width: 160.w,
                    height: 45.h,
                    borderRadius: 8,
                  );
                }),
                Obx(() {
                  if (homeController.postNowIsLoading.value == true) {
                    return CircularProgressIndicator(
                      backgroundColor: AppColors.primaryColor,
                    );
                  }
                  return CommonButton(
                    text: "Post",
                    onPressed: () {
                      if (homeController.postNowIsLoading.value == false) {
                        homeController.onPostDraftChannel(widget.previewItem!);
                      }
                    },
                    width: 160.w,
                    height: 45.h,
                    isLoading: homeController.postNowIsLoading.value,
                    borderRadius: 8,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.w,
        height: 45.w,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 22.sp),
      ),
    );
  }
}

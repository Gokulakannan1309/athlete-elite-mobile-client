import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/add_intro_screen.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../routes/app_routes.dart';
import '../../../../routes/navigation_helper.dart';
import '../../../../widgets/common_text_field.dart';
import '../athelete_landing_controller.dart';

class AddIntroEditScreen extends GetView<AtheleteLandingController> {
  final bool isAthlete;
  const AddIntroEditScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    MediaPickerController mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());
    return AppScaffold(
      isAvoidbottom: true,
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CommonBackButton(),
                        ),
                        Center(
                          child: Text(
                            "Manage Content".toUpperCase(),
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontFamily: GoogleFonts.bebasNeue().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Obx(() {
                          if (controller.profilePicture.value.isEmpty ||
                              !controller.profilePicture.value
                                  .startsWith("http")) {
                            return shimmerBox(w: 170.w, h: 170.w, radius: 30);
                          }
                          return Image.network(
                            controller.profilePicture.value,
                            width: 110.w,
                            height: 110.w,
                            fit: BoxFit.cover,
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
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextField(
                            controller: controller.aboutMeController,
                            label: "About me",
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            controller.addItem();
                            controller.aboutMeController.clear();
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.aboutItems.length,
                        itemBuilder: (context, index) {
                          final item = controller.aboutItems[index];
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 0.8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: InkWell(
                                  onTap: () => controller.removeItem(index),
                                  child: Container(
                                    padding: EdgeInsets.all(7.5.r),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD71D24)
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(Icons.close,
                                        color: AppColors.white, size: 24.sp),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(() {
                      final intro =
                          controller.homeSectionResponse.value?.data.intro;
                      final backendUrl = intro?.mediaUrl ?? "";
                      final pickedThumb = controller.introThumbnail.value;
                      bool hasBackendVideo =
                          controller.backendIntroUrl.value.isNotEmpty;
                      bool hasPickedVideo =
                          pickedThumb.isNotEmpty && !hasBackendVideo;

                      if (controller.isHomeIntroLoading.value) {
                        return shimmerBox(h: 196.h, radius: 12);
                      }

                      if (!hasBackendVideo && !hasPickedVideo) {
                        return InkWell(
                          onTap: () =>
                              mediaPickerController.pickVideoToUpload(),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 196.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.lightWhite,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Icon(Icons.file_upload_outlined,
                                      size: 45.sp, color: Colors.black),
                                  AppText("Upload Intro Video",
                                      color: Colors.black, fontSize: 16.sp),
                                ],
                              )
                            ],
                          ),
                        );
                      }

                      if (hasBackendVideo &&
                          !hasPickedVideo &&
                          pickedThumb.isEmpty) {
                        return shimmerBox(h: 196.h, radius: 12);
                      }

                      return GestureDetector(
                        onTap: () {
                          if (hasPickedVideo) {
                            Get.to(() => FullScreenVideoPlayer(
                                  videoFile:
                                      File(controller.introVideoPath.value),
                                ));
                          } else {
                            Get.to(() =>
                                FullScreenVideoPlayer(videoUrl: backendUrl));
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 196.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: FileImage(
                                      File(controller.introThumbnail.value)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(Icons.play_circle_outline_sharp,
                                  color: Colors.white, size: 36.sp),
                            ),
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: InkWell(
                                onTap: () {
                                  controller.introThumbnail.value = "";
                                  controller.introVideoPath.value = "";
                                  controller.backendIntroUrl.value = "";
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD71D24)
                                        .withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.close,
                                      color: AppColors.white, size: 16.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              right: 20.w,
              child: Obx(
                () => CommonButton(
                  text: "Save Change",
                  onPressed: () {
                    controller.updateAthleteAboutMe().then((value) {
                      if (controller.introVideoPath.value.isNotEmpty) {
                        controller.updateAthleteIntroVideo();
                      }
                      controller.initializeDetailsofGoToChannel().then((value) {
                        CustomToast.show("Changes Saved Successfully!");
                        NavigationHelper.offAllNamed(
                          AppRoutes.atheleteLandingScreen,
                          arguments: {"isAthlete": isAthlete},
                          transition: Transition.rightToLeft,
                        );
                      });
                    }).onError((error, stackTrace) {
                      AppLogger.d("error $error");
                      AppLogger.d("stackTrace $stackTrace");
                    });
                  },
                  width: 220.w,
                  isLoading: controller.isHomeIntroLoading.value,
                  height: 42.h,
                  borderRadius: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerBox({double? w, double? h, double radius = 12}) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2A2A),
      highlightColor: const Color(0xFF3A3A3A),
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final File? videoFile;

  const FullScreenVideoPlayer({
    super.key,
    this.videoUrl,
    this.videoFile,
  });

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController controller;
  bool showControls = true;

  @override
  void initState() {
    super.initState();

    if (widget.videoFile != null) {
      controller = VideoPlayerController.file(widget.videoFile!)
        ..initialize().then((_) {
          controller.setLooping(true);
          controller.play();
          setState(() {});
        });
    } else {
      controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!),
        httpHeaders: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          'Referer': Uri.parse(widget.videoUrl!).origin,
          'Accept': '*/*',
        },
      )
        ..initialize().then((_) {
          controller.setLooping(true);
          controller.play();
          setState(() {});
        });
      controller.value.isPlaying == true;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: controller.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      setState(() => showControls = !showControls);
                    },
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  )
                : const CircularProgressIndicator(
                    backgroundColor: AppColors.primaryColor,
                  ),
          ),
          if (showControls)
            Positioned(
              top: 70.h,
              left: 28.w,
              child: CommonBackButton(),
            ),
          if (showControls && controller.value.isInitialized)
            Center(
              child: IconButton(
                icon: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: Colors.white,
                  size: 70,
                ),
                onPressed: togglePlayPause,
              ),
            ),
          if (!controller.value.isInitialized)
            Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}

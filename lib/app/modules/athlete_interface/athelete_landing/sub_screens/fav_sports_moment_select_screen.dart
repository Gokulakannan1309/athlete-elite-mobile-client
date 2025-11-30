import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/add_intro_edit_screen.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../widgets/common_back_button.dart' show CommonBackButton;
import '../athelete_landing_controller.dart';

class FavSportsMomentSelectScreen extends GetView<AtheleteLandingController> {
  final bool isAthlete;
  const FavSportsMomentSelectScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // ---------------------------------------------------
            // MAIN CONTENT
            // ---------------------------------------------------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
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
                          "UPLOAD VIDEO",
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
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                "Upload your Fave sports Moment",
                                color: AppColors.lightWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      InkWell(
                        onTap: () {
                          if (controller.favMomentThumbnail.value.isEmpty) {
                            controller.uploadFavSportMoment().then((value) {
                              if (value) {
                                CustomToast.show("Video uploaded successfully");
                              }
                            });
                          } else {
                            CustomToast.show(
                                "Video already uploaded. Please remove and try again");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
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
                  Obx(() {
                    final favSports = controller
                        .homeSectionResponse.value?.data.favSportsMoments;

                    final backendUrl = favSports?.isNotEmpty == true
                        ? favSports!.first.mediaUrl
                        : "";
                    final pickedThumb = controller.favMomentThumbnail.value;

                    bool hasBackendVideo =
                        controller.backendFaveSportsMomentUrl.value.isNotEmpty;
                    bool hasPickedVideo =
                        pickedThumb.isNotEmpty && !hasBackendVideo;

                    ImageProvider? displayThumbnail;

                    if (pickedThumb.isNotEmpty) {
                      displayThumbnail = FileImage(File(pickedThumb));
                    } else if (hasBackendVideo) {
                      displayThumbnail = NetworkImage(backendUrl ?? "");
                    } else {
                      displayThumbnail = null;
                    }

                    if (hasBackendVideo && pickedThumb.isEmpty) {
                      return _videoShimmer();
                    }

                    return Visibility(
                      visible: displayThumbnail != null,
                      child: GestureDetector(
                        onTap: () {
                          if (hasPickedVideo) {
                            Get.to(() => FullScreenVideoPlayer(
                                  videoFile:
                                      File(controller.favMomentVideoPath.value),
                                ));
                          } else {
                            Get.to(() => FullScreenVideoPlayer(
                                  videoUrl: fixCorruptedUrl(backendUrl ?? ""),
                                ));
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
                                  image:
                                      displayThumbnail ?? const AssetImage(""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.play_circle_outline_sharp,
                                color: Colors.white,
                                size: 36.sp,
                              ),
                            ),
                            if (pickedThumb.isNotEmpty)
                              Positioned(
                                top: 8.h,
                                right: 8.w,
                                child: InkWell(
                                  onTap: () {
                                    CustomDialogbox.showConfirmation(
                                        title: "Delete Video",
                                        message:
                                            "Are you sure you want to delete this video?",
                                        onConfirm: () {
                                          if (hasPickedVideo) {
                                            displayThumbnail = null;
                                            controller
                                                .favMomentVideoPath.value = "";
                                            controller
                                                .favMomentThumbnail.value = "";
                                            controller.update();
                                          } else {
                                            controller
                                                .deleteAthleteFavSportMoment()
                                                .then((value) {
                                              if (value) {
                                                CustomToast.show(
                                                    "Deleted Successfully");
                                              }
                                            });
                                          }
                                        });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6.w),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            Obx(() {
              return controller.isHomeIntroLoading.value
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.4),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          strokeWidth: 4,
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }

  Widget _videoShimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2A2A),
      highlightColor: const Color(0xFF3A3A3A),
      child: Container(
        height: 196.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

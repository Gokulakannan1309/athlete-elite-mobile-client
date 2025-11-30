import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/add_intro_edit_screen.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../../../routes/app_routes.dart';
import '../../../../routes/navigation_helper.dart';

class AddIntroScreen extends GetView<AtheleteLandingController> {
  final bool isAthlete;
  const AddIntroScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonBackButton(),
                    Text(
                      "Add your intro".toUpperCase(),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.aboutItems.value =
                            List<String>.from(controller.aboutMe);
                        NavigationHelper.toNamed(
                          AppRoutes.atheleteaddIntroEditScreen,
                          arguments: {'isAthlete': isAthlete},
                          transition: Transition.rightToLeft,
                        );
                      },
                      icon: Container(
                        padding: EdgeInsets.all(9.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                            Image.asset("assets/icons/edit.png", height: 15.h),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: controller.profilePicture.value.startsWith("http")
                          ? Image.network(
                              controller.profilePicture.value,
                              fit: BoxFit.cover,
                              width: 110.w,
                              height: 110.h,
                            )
                          : Image.asset(
                              "assets/images/profile.png",
                              fit: BoxFit.cover,
                              width: 110.w,
                              height: 110.h,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Obx(() {
                final intro = controller.homeSectionResponse.value?.data.intro;
                final backendUrl = intro?.mediaUrl ?? "";
                final pickedThumb = controller.introThumbnail.value;
                bool hasBackendVideo =
                    controller.backendIntroUrl.value.isNotEmpty;

                if (!hasBackendVideo) {
                  return InkWell(
                    onTap: () {
                      NavigationHelper.toNamed(
                        AppRoutes.atheleteaddIntroEditScreen,
                        arguments: {'isAthlete': isAthlete},
                        transition: Transition.rightToLeft,
                      );
                    },
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

                if (hasBackendVideo && pickedThumb.isEmpty) {
                  return _videoShimmer();
                }

                return GestureDetector(
                  onTap: () {
                    Get.to(() => FullScreenVideoPlayer(
                        videoUrl: fixCorruptedUrl(backendUrl)));
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
                    ],
                  ),
                );
              }),
              SizedBox(height: 15.h),
              if (controller.aboutMe.isNotEmpty)
                Obx(() {
                  final aboutList = controller.aboutMe;
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryColor, width: 0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("About me", fontSize: 16.sp),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: aboutList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 15.w, bottom: 6.h),
                              child: _bulletPoint(
                                aboutList[index],
                                AppColors.primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletPoint(String text, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.circle, size: 6.sp, color: color),
        SizedBox(width: 8.w),
        Flexible(
          child: AppText(text, color: color, fontSize: 12.sp),
        ),
      ],
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

import 'dart:io';

import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../constants/app_colors.dart';
import '../../constants/font_family.dart';
import '../../routes/app_routes.dart';
import '../../routes/navigation_helper.dart';
import '../../utils/app_logger.dart';
import '../../widgets/AppText.dart';
import '../../widgets/common_back_button.dart';
import '../../widgets/common_button.dart';
import 'set_profile_pic_controller.dart';

class SetProfilePicView extends GetWidget<SetProfilePicController> {
  final bool isAthlete;
  const SetProfilePicView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    MediaPickerController mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());
    AtheleteLandingController atheleteLandingController = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CommonBackButton(),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  AppText(
                    "SET PROFILE PICTURE".tr.toUpperCase(),
                    fontFamily: FontFamily.titleTextFont,
                    color: AppColors.primaryColor,
                    fontSize: 24.sp,
                    letterSpacing: 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 50.h),
                  GestureDetector(
                    onTap: () {
                      mediaPickerController
                          .pickSingleImage()
                          .then((value) async {
                        if (value) {}
                      }).onError((error, stackTrace) {
                        AppLogger.e(error.toString(), stackTrace);
                      });
                    },
                    child: Obx(() {
                      final files = mediaPickerController.selectedImages;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              width: 110.w,
                              height: 110.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: (files.isNotEmpty &&
                                      files.first.path != null)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.file(
                                        File(files.first.path!),
                                        width: 110.w,
                                        height: 110.h,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(
                                      Icons.person,
                                      size: 90.sp,
                                      color: AppColors.lightWhite,
                                    )),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 23.w,
                                height: 23.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/icons/edit.png",
                                  height: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            Obx(
              () => CommonButton(
                text: "Set Profile".tr,
                onPressed: () async {
                  if (mediaPickerController.selectedImages.isNotEmpty &&
                      mediaPickerController.selectedImages.first.path != null) {
                    if (isAthlete) {
                      await atheleteLandingController.uploadProfileImage();
                      NavigationHelper.toNamed(
                        AppRoutes.atheleteLandingScreen,
                        arguments: {'isAthlete': isAthlete},
                        transition: Transition.rightToLeft,
                      );
                    } else {
                      final userBox = Hive.box<FanUserModel>('fan_user');
                      userBox.get('current_user');
                      await controller.uploadProfilePicture(
                          mediaPickerController, userBox.values.single.id);
                      NavigationHelper.toNamed(
                        AppRoutes.fanLandingView,
                        arguments: {'isAthlete': isAthlete},
                        transition: Transition.rightToLeft,
                      );
                    }
                  } else {
                    CustomToast.show("Please select profile picture");
                  }
                },
                isLoading: controller.isLoading.value,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 15.h),
            InkWell(
              onTap: () {
                if (isAthlete) {
                  mediaPickerController.clearSelectedImages();
                  mediaPickerController.clearImages();
                  mediaPickerController.clearMixed();
                  NavigationHelper.offAllNamed(
                    AppRoutes.atheleteLandingScreen,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                } else {
                  mediaPickerController.clearSelectedImages();
                  mediaPickerController.clearImages();
                  mediaPickerController.clearMixed();
                  NavigationHelper.offAllNamed(
                    AppRoutes.fanLandingView,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                }
              },
              child: AppText(
                "Skip".tr,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

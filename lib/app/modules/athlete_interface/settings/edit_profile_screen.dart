import 'dart:io';

import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
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

import '../../../constants/app_colors.dart';
import '../../../widgets/common_back_button.dart';
import '../../../widgets/common_button.dart';
import 'settings_controller.dart';

class EditProfileScreen extends GetView<AthleteSettingsController> {
  final bool isAthlete;
  const EditProfileScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    MediaPickerController mediaPickerController =
        Get.put(MediaPickerController());
    AtheleteLandingController atheleteLandingController =
        Get.put(AtheleteLandingController());

    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                      'Edit Profile'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: GoogleFonts.anton().fontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Obx(() {
                final athlete = isAthlete;
                final files = mediaPickerController.selectedImages;
                final hasLocalFile =
                    files.isNotEmpty && (files.first.path?.isNotEmpty ?? false);

                String? profilePic;

                if (controller.isEditProfileLoading.value) {
                  return shimmerBox(w: 110.w, h: 110.w, radius: 30);
                }

                if (!athlete) {
                  profilePic = fixCorruptedUrl(controller
                          .userDetails.value?.data?.user?.profilePicture ??
                      '');
                } else {
                  profilePic = fixCorruptedUrl(atheleteLandingController
                          .homeSectionResponse.value?.data.profilePicture ??
                      '');
                }

                AppLogger.d("profile pic $profilePic");

                final hasNetworkPic = profilePic.isNotEmpty ?? false;

                return buildProfileWidget(
                  hasLocalFile: hasLocalFile,
                  hasNetworkPic: hasNetworkPic,
                  imagePath: files.isNotEmpty ? files.first.path : null,
                  networkUrl: profilePic,
                  onDelete: () {
                    CustomDialogbox.showConfirmation(
                      title:
                          "Are you sure you want to remove the profile picture?",
                      onConfirm: () {
                        if (!athlete) {
                          controller.deleteFanProfilePicture();
                        } else {
                          controller.deleteAthleteProfilePicture();
                        }
                      },
                    );
                  },
                  mediaPickerController: mediaPickerController,
                );
              }),
              SizedBox(height: 10.h),
              AppText(
                controller.athleteUser.value?.name ?? "",
                fontSize: 18.sp,
                color: AppColors.white,
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: controller.changeNameController,
                style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Change Name',
                  labelText: 'Change Name',
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.lightRed),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.lightRed,
                      width: 2,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                ),
              ),
              SizedBox(height: 18.h),
              if (isAthlete)
                TextField(
                  controller: controller.changeBioController,
                  maxLines: 7,
                  minLines: 4,
                  style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: 'Change bio',
                    labelText: 'Change bio',
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
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
                      borderSide: const BorderSide(color: AppColors.lightRed),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(
                        color: AppColors.lightRed,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              const Spacer(),
              Obx(() {
                return CommonButton(
                  text: 'Save Changes',
                  color: AppColors.lightRed,
                  disabledColor: AppColors.lightRed,
                  onPressed: controller.isEditProfileLoading.value
                      ? null
                      : () async {
                          final files = mediaPickerController.selectedImages;

                          if (isAthlete) {
                            controller.updateUserProfileDetails().then((value) {
                              if (value) {
                                if (files.isNotEmpty) {
                                  controller.updateProfilePicture();
                                }
                                Get.back();
                              }
                              CustomToast.show("Profile updated successfully");
                            });
                          } else {
                            controller
                                .updateFanUserProfileDetails()
                                .then((value) {
                              if (value) {
                                if (files.isNotEmpty) {
                                  controller.updateFanProfilePicture();
                                }
                                Get.back();
                              }
                              CustomToast.show("Profile updated successfully");
                            });
                          }
                        },
                  isLoading: controller.isEditProfileLoading.value,
                );
              }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileWidget({
    required bool hasLocalFile,
    required bool hasNetworkPic,
    required String? imagePath,
    required String? networkUrl,
    required VoidCallback onDelete,
    required MediaPickerController mediaPickerController,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 110.w,
          height: 110.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightRed, width: 1.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: hasLocalFile
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                  ),
                )
              : hasNetworkPic
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        networkUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Image.asset("assets/images/profile.png"),
                        loadingBuilder: (context, child, loading) {
                          if (loading == null) return child;
                          return shimmerBox(w: 110.w, h: 110.w, radius: 30);
                        },
                      ),
                    )
                  : Icon(Icons.person, size: 90.sp),
        ),

        // DELETE BUTTON
        if (hasNetworkPic || hasLocalFile)
          Positioned(
            top: -4,
            right: -4,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: EdgeInsets.all(3),
                width: 23.w,
                height: 23.w,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/icons/delete.png"),
              ),
            ),
          ),

        // EDIT BUTTON
        Positioned(
          bottom: -4,
          right: -4,
          child: GestureDetector(
            onTap: () {
              mediaPickerController.pickSingleImage().catchError((e) {
                AppLogger.e(e.toString());
              });
            },
            child: Container(
              width: 23.w,
              height: 23.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/icons/edit.png"),
            ),
          ),
        ),
      ],
    );
  }
}

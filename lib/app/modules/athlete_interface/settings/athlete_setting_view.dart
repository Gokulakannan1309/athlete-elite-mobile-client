import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/common_back_button.dart';

class AthleteSettingView extends GetWidget<AthleteSettingsController> {
  final bool isAthlete;
  const AthleteSettingView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
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
                      'SETTINGS'.tr.toUpperCase(),
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
              CommonButton(
                text: "Edit Profile".tr,
                onPressed: () {
                  NavigationHelper.toNamed(
                    AppRoutes.editProfileScreen,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                  if (isAthlete) {
                    controller.getUserProfileDetails();
                  } else {
                    controller.getFanDetails();
                  }
                },
                color: AppColors.lightRed,
                icon: "person",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
              CommonButton(
                text: "User Details".tr,
                onPressed: () {
                  NavigationHelper.toNamed(
                    AppRoutes.athleteUserDetailsScreen,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                  if (isAthlete) {
                    controller.getAthleteUserDetails();
                  } else {
                    controller.getFanDetails();
                  }
                },
                color: AppColors.lightRed,
                icon: "user_details",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              Visibility(visible: isAthlete, child: SizedBox(height: 10.h)),
              Visibility(
                visible: isAthlete,
                child: CommonButton(
                  text: "Archived Content".tr,
                  onPressed: () async {
                    NavigationHelper.toNamed(
                      AppRoutes.archeivedPostScreen,
                      arguments: {'isAthlete': isAthlete},
                      transition: Transition.rightToLeft,
                    );
                    await controller.getAthleteArchivedContent();
                  },
                  color: AppColors.lightRed,
                  icon: "archived",
                  iconColor: AppColors.white,
                  isOutlined: true,
                  textColor: AppColors.white,
                  isCenterAligned: false,
                  fontSize: 16.sp,
                  iconSize: 22,
                ),
              ),
              SizedBox(height: 10.h),
              CommonButton(
                text: "Preferences".tr,
                onPressed: () async {
                  if (isAthlete) {
                    NavigationHelper.toNamed(
                      AppRoutes.athleteUserPreferencesScreen,
                      arguments: {'isAthlete': isAthlete},
                      transition: Transition.rightToLeft,
                    );
                    await controller.getAthletePreferences();
                  } else {
                    NavigationHelper.toNamed(
                      AppRoutes.fanUserPreferenceScreen,
                      arguments: {'isAthlete': isAthlete},
                      transition: Transition.rightToLeft,
                    );
                    await controller.getFanPreferences();
                  }
                },
                color: AppColors.lightRed,
                icon: "filter",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
              CommonButton(
                text: "Change Password".tr,
                onPressed: () {
                  NavigationHelper.toNamed(
                    AppRoutes.athleteChangePasswordScreen,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                },
                color: AppColors.lightRed,
                icon: "lock",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
              CommonButton(
                text: "Privacy Policy".tr,
                onPressed: () {},
                color: AppColors.lightRed,
                icon: "privacy",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
              CommonButton(
                text: "Help & Support".tr,
                onPressed: () {
                  NavigationHelper.toNamed(
                    AppRoutes.helpAndSupportScreen,
                    arguments: {'isAthlete': isAthlete},
                    transition: Transition.rightToLeft,
                  );
                },
                color: AppColors.lightRed,
                icon: "help",
                iconColor: AppColors.white,
                isOutlined: true,
                textColor: AppColors.white,
                isCenterAligned: false,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              Visibility(visible: isAthlete, child: SizedBox(height: 10.h)),
              Visibility(
                visible: isAthlete,
                child: CommonButton(
                  text: "Add Social Links".tr,
                  onPressed: () {
                    NavigationHelper.toNamed(
                      AppRoutes.addSocialLinksScreen,
                      arguments: {'isAthlete': isAthlete},
                      transition: Transition.rightToLeft,
                    );
                    controller.getAthleteAllSocialLinks();
                  },
                  color: AppColors.lightRed,
                  icon: "link",
                  iconColor: AppColors.white,
                  isOutlined: true,
                  textColor: AppColors.white,
                  isCenterAligned: false,
                  fontSize: 16.sp,
                  iconSize: 22,
                ),
              ),
              Spacer(),
              CommonButton(
                text: "Log Out".tr,
                onPressed: () {
                  CustomDialogbox.showConfirmation(
                    title: "Are you sure you want to logout?".tr,
                    cancelText: "Cancel".tr,
                    confirmText: "Log Out".tr,
                    onConfirm: () {
                      AthleteSettingsController controller =
                          Get.isRegistered<AthleteSettingsController>()
                              ? Get.find<AthleteSettingsController>()
                              : Get.put(AthleteSettingsController());
                      if (isAthlete) {
                        controller.logout(isAthlete);
                        NavigationHelper.offAllNamed(
                          AppRoutes.login,
                          arguments: {'isAthlete': isAthlete},
                          transition: Transition.rightToLeft,
                        );
                      } else {
                        controller.logout(isAthlete);
                        NavigationHelper.toNamed(
                          AppRoutes.onboardScreenView,
                          arguments: {'isAthlete': isAthlete},
                          transition: Transition.rightToLeft,
                        );
                      }
                    },
                    onCancel: () {
                      print("Cancelled");
                      Navigator.pop(context);
                    },
                  );
                },
                color: AppColors.red,
                icon: "logout",
                iconColor: AppColors.red,
                isOutlined: true,
                textColor: AppColors.red,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

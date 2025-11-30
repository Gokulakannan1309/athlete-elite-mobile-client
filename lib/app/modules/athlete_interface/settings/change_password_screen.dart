import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/common_back_button.dart';

class AthleteChangePasswordScreen extends GetView<AthleteSettingsController> {
  final bool isAthlete;
  const AthleteChangePasswordScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: controller.changePasswordFormKey,
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
                        'CHANGE PASSWORD'.toUpperCase(),
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
                CommonTextField(
                    controller: controller.currentPasswordController,
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightRed,
                    label: "Current Password"),
                SizedBox(height: 13.h),
                CommonTextField(
                  controller: controller.newPasswordController,
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightRed,
                  label: "New Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Password is required.';
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$',
                    );
                    if (!passwordRegex.hasMatch(value)) {
                      return '*Password must be at least 8 characters with one uppercase letter and one special character.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 13.h),
                CommonTextField(
                  controller: controller.confirmPasswordController,
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightRed,
                  label: "Confirm Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Please confirm your password.';
                    }
                    if (value != controller.newPasswordController.text) {
                      return '*Passwords do not match.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      NavigationHelper.toNamed(
                        AppRoutes.forgotPasswordRequestScreen,
                        arguments: {'isAthlete': isAthlete},
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: AppText(
                      "Forgot Password?",
                      color: Colors.white70,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      useCustomUnderline: true,
                      decorationColor: Colors.white70,
                      textDecoration: TextDecoration.underline,
                      underlineOffset: 1.h,
                    ),
                  ),
                ),
                Spacer(),
                Obx(
                  () => CommonButton(
                    text: "Save Password",
                    onPressed: () {
                      if (isAthlete) {
                        controller.onChangePassword();
                      } else {
                        controller.onChangeFanPassword();
                      }
                    },
                    color: AppColors.lightRed,
                    fontSize: 20.sp,
                    isLoading: controller.isLoading.value,
                    isDisabled: controller.isButtonDisabled.value,
                    disabledColor: AppColors.lightRed,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

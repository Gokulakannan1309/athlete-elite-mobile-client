import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/navigation_helper.dart';
import 'fan_signup_controller.dart';

class FanSignupView extends GetView<FanSignupController> {
  final bool isAthlete;
  const FanSignupView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontFamily:
                              GoogleFonts.barlowSemiCondensed().fontFamily,
                          color: AppColors.primaryColor,
                          fontSize: 26.sp,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      AppText(
                        "Welcome to Fan..!!",
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),
                      SizedBox(height: 17.h),
                      CommonTextField(
                        controller: controller.emailOrUsernameOrPhoneController,
                        label: "Username, Email or Phone no",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Please Enter Username, Email or Phone no.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Obx(
                () => CommonButton(
                  text: "Sign In",
                  onPressed: () {
                    if (controller.signUpFormKey.currentState!.validate()) {
                      final input = controller
                          .emailOrUsernameOrPhoneController.text
                          .trim();

                      final bool isEmail = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(input);

                      final bool isPhone = RegExp(
                        r'^[0-9]{10}$',
                      ).hasMatch(input);

                      if (isEmail) {
                        controller.onSignupRequest("email address", isAthlete);
                      } else if (isPhone) {
                        controller.onSignupRequest("mobile number", isAthlete);
                      } else {
                        CustomToast.show(
                          "Please enter a valid Email or Phone number.",
                        );
                      }
                    } else {
                      CustomToast.show(
                        "Please Enter Username, Email or Phone no.",
                      );
                    }
                  },
                  isDisabled: controller.isButtonDisabled.value,
                  isLoading: controller.isLoading.value,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10.h),
              AppText("Or", color: AppColors.white, fontSize: 16.sp),
              SizedBox(height: 10.h),
              Obx(
                () => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 13.2,
                      horizontal: 16,
                    ),
                  ),
                  onPressed: controller.isGSSOLoading.value ? null : () {},
                  child: controller.isGSSOLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/google.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "Already have an Account?",
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                  InkWell(
                    onTap: () {
                      NavigationHelper.toNamed(
                        AppRoutes.onboardScreenView,
                        arguments: {'isAthlete': false},
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: AppText(
                      "Sign In",
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../fan_signup_controller.dart';

class FanSignupOTPView extends GetView<FanSignupController> {
  final bool isAthlete;
  const FanSignupOTPView({super.key, required this.isAthlete});

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
                  key: controller.signUpOtpFormKey,
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
                      SizedBox(height: 75.h),
                      CommonTextField(
                        controller: controller.otpController,
                        label: "OTP",
                        inputType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return '*Please Enter correct OTP';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText("Didn’t get the OTP? "),
                            if (controller.secondsRemaining.value > 0)
                              AppText(
                                "Resend OTP in 00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}",
                                color: AppColors.primaryColor,
                              )
                            else
                              TextButton(
                                onPressed: () {
                                  controller.resendOtpTimer();
                                },
                                child: AppText(
                                  "Resend OTP",
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Obx(
                () => CommonButton(
                  text: "Verify OTP",
                  onPressed: () {
                    if (controller.signUpOtpFormKey.currentState!.validate()) {
                      controller.onSignupOTPVerify(isAthlete);
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
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

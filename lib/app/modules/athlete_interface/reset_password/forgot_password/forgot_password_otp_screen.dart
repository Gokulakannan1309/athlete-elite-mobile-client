import 'dart:async';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_family.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_text_field.dart';
import '../../../../widgets/custom_toast.dart';
import '../reset_password_controller.dart';

class ForgotPasswordOTPScreen extends GetView<ResetPasswordController> {
  final bool isAthlete;
  final String userId;
  const ForgotPasswordOTPScreen(
      {super.key, required this.isAthlete, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Form(
                      key: controller.forgotpasswordOtpformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            "OTP DETAILS",
                            fontFamily: FontFamily.titleTextFont,
                            color: AppColors.primaryColor,
                            fontSize: 24.sp,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 35.h),
                          CommonTextField(
                            controller: controller.forgotPasswordOtpController,
                            label: "Enter OTP",
                            inputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 6) {
                                return '*Please Enter correct OTP';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
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
                ),
              ),

              Obx(
                () => CommonButton(
                  text: "Verify OTP",
                  onPressed: () {
                    if (controller.forgotpasswordOtpformKey.currentState!
                        .validate()) {
                      final input =
                          controller.forgotPasswordEmailController.text.trim();

                      final bool isEmail = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(input);

                      final bool isPhone =
                          RegExp(r'^[0-9]{10}$').hasMatch(input);

                      if (isEmail || isPhone) {
                        controller.onForgotPasswordOTPVerify(
                            isAthlete, userId);
                      } else {
                        CustomToast.show(
                          "Please enter a valid Email or Phone number.",
                        );
                      }
                    } else {
                      CustomToast.show(
                        "Please enter Email, or Phone number.",
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

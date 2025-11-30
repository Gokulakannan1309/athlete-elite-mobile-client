import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/font_family.dart';
import '../../../../routes/navigation_helper.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_text_field.dart';
import '../../../../widgets/custom_toast.dart';
import '../reset_password_controller.dart';

class ForgotPasswordRequestScreen extends GetView<ResetPasswordController> {
  final bool isAthlete;
  const ForgotPasswordRequestScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                      key: controller.forgotPasswordRequestFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            "ENTER DETAILS",
                            fontFamily: FontFamily.titleTextFont,
                            color: AppColors.primaryColor,
                            fontSize: 24.sp,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 35.h),
                          CommonTextField(
                            controller:
                                controller.forgotPasswordEmailController,
                            label: "Enter Mobile Number/Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please Enter Mobile Number/Email.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => CommonButton(
                  text: "GET OTP",
                  onPressed: () {
                    if (controller.forgotPasswordRequestFormKey.currentState!
                        .validate()) {
                      final input =
                          controller.forgotPasswordEmailController.text.trim();

                      final bool isEmail = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(input);

                      final bool isPhone = RegExp(
                        r'^[0-9]{10}$',
                      ).hasMatch(input);

                      if (isEmail) {
                        controller
                            .onForgotPasswordRequest("email address", isAthlete)
                            .then((value) {
                          if (value) {
                            controller.startOtpTimer();
                            NavigationHelper.toNamed(
                              AppRoutes.forgotPasswordOTPScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          }
                        });
                      } else if (isPhone) {
                        controller.onForgotPasswordRequest(
                            "mobile number", isAthlete);
                      } else {
                        CustomToast.show(
                          "Please enter a valid Email or Phone number.",
                        );
                      }
                    } else {
                      CustomToast.show("Please enter Email, or Phone number.");
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

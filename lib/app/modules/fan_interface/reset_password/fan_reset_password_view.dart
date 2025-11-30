import 'package:athlete_elite/app/modules/fan_interface/reset_password/fan_reset_password_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/font_family.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/navigation_helper.dart';
import '../../../widgets/AppText.dart';
import '../../../widgets/common_back_button.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_text_field.dart';
import '../../../widgets/custom_toast.dart';

class FanResetPasswordView extends GetView<FanResetPasswordController> {
  final bool isAthlete;
  final String userId;
  const FanResetPasswordView({super.key, required this.isAthlete, required this.userId});

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
                    padding: EdgeInsets.only(top: 80.h),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            "SET PASSWORD",
                            fontFamily: FontFamily.titleTextFont,
                            letterSpacing: 1.8,
                            color: AppColors.primaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 25.h),

                          CommonTextField(
                            controller: controller.newPasswordController,
                            label: "Enter New Password",
                            isPassword: true,
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
                          SizedBox(height: 25.h),
                          CommonTextField(
                            controller: controller.confirmPasswordController,
                            label: "Confirm Password",
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please confirm your password.';
                              }
                              if (value !=
                                  controller.newPasswordController.text) {
                                return '*Passwords do not match.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Obx(
                () => CommonButton(
                  text: "Continue",
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (controller.formKey.currentState!.validate()) {
                    controller.onFanSetPassword(userId, isAthlete);
                    } else {
                      CustomToast.show("Please fix the errors.");
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

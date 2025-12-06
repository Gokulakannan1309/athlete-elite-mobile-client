import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/login/login_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/font_family.dart';
import '../../../routes/navigation_helper.dart';

class LoginView extends GetWidget<LoginController> {
  final bool isAthlete;
  const LoginView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Log In".tr.toUpperCase(),
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.barlowSemiCondensed().fontFamily,
                              color: AppColors.primaryColor,
                              fontSize: 22.sp,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          AppText(
                            "welcome Atlete".tr,
                            color: AppColors.white,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 17.h),
                          CommonTextField(
                            controller:
                                controller.emailOrUsernameOrPhoneController,
                            label: "Username, Email or Phone no.".tr,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please Enter Username, Email or Phone no.'
                                    .tr;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.h),
                          CommonTextField(
                            controller: controller.passwordController,
                            label: "Enter Password".tr,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please Enter Password.'.tr;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
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
                                "Forgot Password ?".tr,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() {
                return CommonButton(
                  text: "Log In".tr,
                  onPressed: () async {
                    controller.login(isAthlete);
                  },
                  isDisabled: controller.isButtonDisabled.value,
                  isLoading: controller.isLoading.value,
                  color: AppColors.primaryColor,
                );
              }),
              SizedBox(height: 15.h),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 450.w),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 2.w,
                  runSpacing: 2.h,
                  children: [
                    AppText(
                      "By logging you agree ".tr,
                      color: AppColors.white,
                      fontSize: 12.sp,
                    ),
                    AppText(
                      "Term and Conditions".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      " and ".tr,
                      color: AppColors.white,
                      fontSize: 12.sp,
                    ),
                    AppText(
                      "Privacy Policy".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

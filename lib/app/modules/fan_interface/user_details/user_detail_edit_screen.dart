import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/common_button.dart';

class UserDetailEditScreen extends GetView<AthleteSettingsController> {
  final bool isAthlete;
  const UserDetailEditScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    final RxBool showOtpButtonForRow4 = false.obs;
    final RxBool showOtpButtonForRow5 = false.obs;
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // ---------- HEADER ----------
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonBackButton(),
                  ),
                  Center(
                    child: Text(
                      'EDIT DETAILS',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(height: 30.h),
              Visibility(
                visible: !isAthlete,
                child: Column(
                  children: [
                    CommonRedTextField(
                      controller: controller.fanAgeController,
                      label: "Age",
                      prfixIcon:
                          Image.asset("assets/icons/age.png", height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller:
                          controller.fanGenderController,
                      label: "Gender",
                      prfixIcon:
                          Image.asset("assets/icons/gender.png", height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller: controller.fanCountryController,
                      label: "Country",
                      prfixIcon:
                          Image.asset("assets/icons/flag.png", height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.fanEmailController,
                            label: "Email",
                            prfixIcon: Image.asset("assets/icons/mail.png",
                                height: 26.sp),
                            suffixIcon: null,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Visibility(
                            visible: showOtpButtonForRow5.value,
                            child: SizedBox(width: 10.w)),
                        Visibility(
                          visible: showOtpButtonForRow5.value,
                          child: CommonButton(
                            text: "Send OTP",
                            onPressed: () {
                              // Handle OTP logic
                              showOtpButtonForRow5.value = false;
                            },
                            color: AppColors.lightRed,
                            fontSize: 14.sp,
                            width: 100.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller:
                                controller.fanPhoneNumberController,
                            label: "Phone",
                            prfixIcon: Image.asset("assets/icons/phone.png",
                                height: 26.sp),
                            suffixIcon: null,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Visibility(
                            visible: showOtpButtonForRow5.value,
                            child: SizedBox(width: 10.w)),
                        Visibility(
                          visible: showOtpButtonForRow5.value,
                          child: CommonButton(
                            text: "Send OTP",
                            onPressed: () {
                              // Handle OTP logic
                              showOtpButtonForRow5.value = false;
                            },
                            color: AppColors.lightRed,
                            fontSize: 14.sp,
                            width: 100.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller: controller.fanDateofbirthController,
                      label: "Date of Birth",
                      prfixIcon: Image.asset("assets/icons/calender.png",
                          height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),

              Visibility(
                visible: isAthlete,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.athleteEmailController,
                            label: "Email",
                            prfixIcon: Image.asset("assets/icons/mail.png",
                                height: 26.sp),
                            suffixIcon: null,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Visibility(
                            visible: showOtpButtonForRow4.value,
                            child: SizedBox(width: 10.w)),
                        Visibility(
                          visible: showOtpButtonForRow4.value,
                          child: CommonButton(
                            text: "Send OTP",
                            onPressed: () {
                              // Handle OTP logic
                              showOtpButtonForRow4.value = false;
                            },
                            color: AppColors.lightRed,
                            fontSize: 14.sp,
                            width: 100.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.athletePhoneNumberController,
                            label: "Phone",
                            prfixIcon: Image.asset("assets/icons/phone.png",
                                height: 26.sp),
                            suffixIcon: null,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Visibility(
                            visible: showOtpButtonForRow4.value,
                            child: SizedBox(width: 10.w)),
                        Visibility(
                          visible: showOtpButtonForRow4.value,
                          child: CommonButton(
                            text: "Send OTP",
                            onPressed: () {
                              // Handle OTP logic
                              showOtpButtonForRow4.value = false;
                            },
                            color: AppColors.lightRed,
                            fontSize: 14.sp,
                            width: 100.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller: controller.athleteDateofbirthController,
                      label: "Calendar",
                      prfixIcon: Image.asset("assets/icons/calender.png",
                          height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              Spacer(),
              Obx(
                () => CommonButton(
                  text: 'Save Changes',
                  color: AppColors.lightRed,
                  disabledColor: AppColors.lightRed,
                  onPressed: controller.isUserDetailsLoading.value
                      ? null
                      : () async {
                        if(isAthlete){
                            await controller.updateUserDetails().then((value) {
                              if (value) {
                                Get.back();
                                CustomToast.show(
                                    "User details updated successfully.");
                              }
                            });
                        }
                        },
                  isLoading: controller.isUserDetailsLoading.value,
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

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import '../../../widgets/common_back_button.dart';

class HelpAndSupportScreen extends GetWidget<AthleteSettingsController> {
  final bool isAthlete;
  const HelpAndSupportScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: controller.formKeyForAthleteQuery,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Help & Support'.tr,
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
                Text(
                  'Enter Your queries here'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: controller.messageController,
                  maxLines: 7,
                  minLines: 5,
                  style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                   inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9\s.,!@#$%^&*()_+=-]'),
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your queries here..'.tr,
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
                Obx(
                  () => CommonButton(
                    text: 'Submit'.tr,
                    color: AppColors.lightRed,
                    onPressed: controller.isSubmitQueryLoading.value
                        ? null
                        : () {
                            if (controller.formKeyForAthleteQuery.currentState!
                                .validate()) {
                              if (isAthlete) {
                                controller.submitQuery();
                              } else {
                                controller.submitFanQuery();
                              }
                            }
                          },
                    isLoading: controller.isSubmitQueryLoading.value,
                    isDisabled: controller.isQueryValid.value,
                    disabledColor: AppColors.lightRed,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

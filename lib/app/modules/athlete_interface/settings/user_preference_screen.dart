import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../widgets/common_back_button.dart';
import '../../../widgets/selectable_button.dart';

class AthleteUserPreferencesScreen extends StatelessWidget {
  final bool isAthlete;
  const AthleteUserPreferencesScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AthleteSettingsController());
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(
            () {
              if (controller.isAthletePreferencesLoading.value) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: AppColors.lightRed,
                ));
              }
              return Column(
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
                          'PREFERENCES'.tr.toUpperCase(),
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

                  _PreferenceTile(
                    title: "Studio Push Notifications",
                    value: controller.studioPushNotifications,
                    onChanged: controller.toggleStudioPushNotifications,
                  ),
                  SizedBox(height: 10.h),

                  _PreferenceTile(
                    title: "Cheers & Comments",
                    value: controller.cheersAndComments,
                    onChanged: controller.toggleCheersAndComments,
                  ),
                  SizedBox(height: 10.h),

                  _PreferenceTile(
                    title: "Fan Tracking",
                    value: controller.fanTracking,
                    onChanged: controller.toggleFanTracking,
                  ),
                  SizedBox(height: 10.h),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        // color: AppColors.lightRed,
                        border:
                            Border.all(color: AppColors.lightRed, width: 0.8),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AppText("Preferred Languages".tr,
                                fontSize: 16.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 9, bottom: 9),
                            child: Row(
                              children: [
                                SelectableButton(
                                  text: 'EN',
                                  width: 40.w,
                                  isSelected:
                                      controller.selectedLang.value == 'en',
                                  onTap: () => controller.selectLanguage('en'),
                                  color: AppColors.primaryColor,
                                  borderColor: AppColors.primaryColor,
                                ),
                                SizedBox(width: 20.w),
                                SelectableButton(
                                  text: 'ES',
                                  width: 40.w,
                                  isSelected:
                                      controller.selectedLang.value == 'es',
                                  onTap: () => controller.selectLanguage('es'),
                                  color: AppColors.primaryColor,
                                  borderColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                 
                  SizedBox(height: 10.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PreferenceTile extends StatelessWidget {
  final String title;
  final RxBool value;
  final Function(bool) onChanged;

  const _PreferenceTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value.value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightRed, width: 0.8),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppText(title.tr, fontSize: 16.sp),
            ),
            // ✅ Switch with GetX reactive binding
            Obx(
              () => Switch(
                value: value.value,
                onChanged: onChanged,
                activeColor: Colors.green,
                inactiveTrackColor: AppColors.white.withOpacity(0.3),
                inactiveThumbColor: AppColors.lightWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

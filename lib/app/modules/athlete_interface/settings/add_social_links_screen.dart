import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/common_back_button.dart';

class AddSocialLinksScreen extends GetWidget<AthleteSettingsController> {
  final bool isAthlete;
  const AddSocialLinksScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                      'ADD SOCIAL LINKS'.tr.toUpperCase(),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Enter URL To connect Social Apps'.tr,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Obx(
                        () => Column(
                          children: controller.socialMediaList.map((item) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: SocialLinkField(
                                item: item,
                                initialValue:
                                    controller.socialLinks[item.key] ?? '',
                                onChanged: (value) {
                                  controller.updateSocialLink(item.key, value);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Obx(
                  () => CommonButton(
                    text: 'Add Links'.tr,
                    color: AppColors.lightRed,
                    disabledColor: AppColors.lightRed,
                    onPressed: controller.isSaving.value
                        ? null
                        : () => controller.updateAthleteSocialLinks(),
                    isLoading: controller.isSaving.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLinkField extends StatelessWidget {
  final SocialMediaItem item;
  final String initialValue;
  final Function(String) onChanged;

  const SocialLinkField({
    super.key,
    required this.item,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(8.r),
            width: 48.w,
            height: 48.h,
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Color(0xFFCC5533).withOpacity(0.15),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: item.image),
        SizedBox(width: 16.w),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            controller: TextEditingController(text: initialValue)
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: initialValue.length),
              ),
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.lightRed),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.lightRed),
              ),
              hintText: item.urlHint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12.sp),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 14.h,
              ),
              suffixIcon: Visibility(
                visible: initialValue.isNotEmpty,
                child: InkWell(
                  onTap: () {
                    onChanged('');
                  },
                  child: Icon(Icons.close, color: Colors.white, size: 16.sp),
                ),
              ),
              suffixIconColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

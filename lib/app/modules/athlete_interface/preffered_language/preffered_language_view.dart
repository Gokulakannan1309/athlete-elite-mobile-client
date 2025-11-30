import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/constants/font_family.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../routes/navigation_helper.dart';
import '../../../widgets/common_button.dart';
import 'preffered_language_controller.dart';

class PrefferedLanguageView extends GetView<PrefferedLanguageController> {
  final bool isAthlete;
  final String userId;
  const PrefferedLanguageView(
      {super.key, required this.isAthlete, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      "SELECT PREFERRED LANGUAGE",
                      fontFamily: FontFamily.titleTextFont,
                      color: AppColors.primaryColor,
                      fontSize: 20.sp,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 25.h),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableButton(
                            text: 'English',
                            isSelected: controller.selectedLang.value == 'en',
                            onTap: () => controller.selectLanguage('en'),
                            color: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor,
                          ),
                          SizedBox(width: 20.w),
                          SelectableButton(
                            text: 'Spanish',
                            isSelected: controller.selectedLang.value == 'es',
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
              Obx(
                () => CommonButton(
                  text: "Next",
                  onPressed: () {
                    controller.onLanguagePreferenceRequest(userId);
                  },
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

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/common_back_button.dart' show CommonBackButton;
import '../../../widgets/common_button.dart';
import '../../../widgets/common_text_field.dart';
import 'settings_controller.dart';

class SubmitBrandsScreen extends GetView<AthleteSettingsController> {
  final bool isAthlete;
  const SubmitBrandsScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
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
                          'SUBMIT YOUR BRANDS',
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
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          controller: controller.brandsController,
                          label: "YOUR BRANDS",
                          inputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          controller.addItem();
                          controller.brandsController.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.aboutItems.length,
                        itemBuilder: (context, index) {
                          final item = controller.aboutItems[index];
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 10.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () => controller.removeItem(index),
                                child: Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD71D24).withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Spacer(),
                  CommonButton(
                    text: "Submit",
                    onPressed: () {},
                    color: AppColors.lightRed,
                    height: 42.h,
                    borderRadius: 5,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

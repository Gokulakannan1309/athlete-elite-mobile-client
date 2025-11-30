import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../fan_signup_controller.dart';

class AboutMeDetailScreen extends GetView<FanSignupController> {
  final bool isAthlete;
  final String userId;
  const AboutMeDetailScreen(
      {super.key, required this.isAthlete, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.signupAboutMeFormKey,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonBackButton(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70.h),
                        child: Center(
                          child: Text(
                            'ABOUT ME',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontFamily: GoogleFonts.anton().fontFamily,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          controller: controller.firstnameController,
                          label: "First Name",
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter first name";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: CommonTextField(
                          controller: controller.lastnameController,
                          label: "Last Name",
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter last name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  CommonTextField(
                    controller: controller.usernameController,
                    label: "Username",
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Please enter username";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 100.w,
                      child: CommonTextField(
                        controller: controller.ageController,
                        label: "Age",
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Please enter your age";
                          }
                          return null;
                        },
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectableButton(
                            text: "Male",
                            isSelected:
                                controller.selectedGender.value == "Male",
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                            ),
                            onTap: () {
                              controller.selectedGender.value = "Male";
                            },
                            color: controller.selectedGender.value == "Male"
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderColor: AppColors.primaryColor,
                          ),
                          SelectableButton(
                            text: "Female",
                            isSelected:
                                controller.selectedGender.value == "Female",
                            onTap: () {
                              controller.selectedGender.value = "Female";
                            },
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                            ),
                            color: controller.selectedGender.value == "Female"
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderColor: AppColors.primaryColor,
                          ),
                          SelectableButton(
                            text: "Prefer Not to Say",
                            isSelected: controller.selectedGender.value ==
                                "Prefer Not to Say",
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                            ),
                            onTap: () {
                              controller.selectedGender.value =
                                  "Prefer Not to Say";
                            },
                            color: controller.selectedGender.value ==
                                    "Prefer Not to Say"
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderColor: AppColors.primaryColor,
                          ),
                        ],
                      )),
                  SizedBox(height: 25.h),
                  Obx(() => CommonCountryDropdown(
                        selectedCountry:
                            controller.selectedCountry.value.isEmpty
                                ? null
                                : controller.selectedCountry.value,
                        onChanged: (value) {
                          controller.selectedCountry.value = value ?? '';
                        },
                        countryList: const [
                          'India',
                          'United States',
                          'United Kingdom',
                          'Australia',
                          'Canada',
                          'Germany',
                          'France',
                          'Japan',
                          'Brazil',
                        ],
                      )),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryColor, width: 0.8),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: AppText(
                            "Preferred Languages",
                            fontSize: 16.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                          child: Obx(() => Row(
                                children: controller.languages.map((lang) {
                                  final isSelected =
                                      controller.selectedLanguage.value == lang;
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: SelectableButton(
                                      text: lang,
                                      isSelected: isSelected,
                                      onTap: () =>
                                          controller.selectLanguage(lang),
                                      color: AppColors.primaryColor,
                                      borderColor: AppColors.primaryColor,
                                      width: 45.w,
                                    ),
                                  );
                                }).toList(),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Obx(
                    () => Align(
                      alignment: Alignment.bottomCenter,
                      child: CommonButton(
                        text: "Continue",
                        isLoading: controller.isLoading.value,
                        isDisabled: controller.isAboutMeButtonDisabled.value,
                        onPressed: () {
                          if (controller.signupAboutMeFormKey.currentState!
                              .validate()) {
                            controller.onSignupAboutMe(isAthlete, userId);
                          } else {
                            Get.snackbar("Warning",
                                "Please fill all the required fields",
                                backgroundColor: AppColors.primaryColor);
                          }
                        },
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonCountryDropdown extends StatelessWidget {
  final String? selectedCountry;
  final ValueChanged<String?> onChanged;
  final List<String> countryList;

  const CommonCountryDropdown({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
    required this.countryList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.screenBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCountry,
          borderRadius: BorderRadius.circular(16.r),
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.white),
          dropdownColor: AppColors.screenBackgroundColor,
          isExpanded: true,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 15.sp,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          hint: Text(
            "Select Country",
            style: TextStyle(
              color: AppColors.white.withOpacity(0.6),
              fontSize: 15.sp,
            ),
          ),
          items: countryList.map((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

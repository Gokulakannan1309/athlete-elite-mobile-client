import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:athlete_elite/app/widgets/selectable_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../fan_signup_controller.dart';

class AboutMeDetailScreen extends GetWidget<FanSignupController> {
  final bool isAthlete;
  final String userId;
  final String accessToken;
  const AboutMeDetailScreen(
      {super.key,
      required this.isAthlete,
      required this.userId,
      required this.accessToken});

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
                      Padding(
                        padding: EdgeInsets.only(top: 70.h),
                        child: Center(
                          child: Text(
                            'ABOUT ME'.tr.toUpperCase(),
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
                          label: "First Name".tr,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter first name".tr;
                            } else if (p0.length < 3 && p0.length > 15) {
                              return "First name must be between 3 and 20 characters"
                                  .tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Expanded(
                        child: CommonTextField(
                          controller: controller.lastnameController,
                          label: "Last Name".tr,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter last name".tr;
                            } else if (p0.length < 3 && p0.length > 15) {
                              return "First name must be between 3 and 20 characters"
                                  .tr;
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
                    label: "Username".tr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a username".tr;
                      }

                      if (value.length < 3 || value.length > 20) {
                        return "Username must be between 3 and 20 characters"
                            .tr;
                      }

                      final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]+$');
                      if (!regex.hasMatch(value)) {
                        return "Username must start with a letter and contain only letters, numbers, or _"
                            .tr;
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
                        label: "Age".tr,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Please enter your age".tr;
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
                            text: "Male".tr,
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
                            text: "Female".tr,
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
                            text: "Prefer Not to Say".tr,
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
                  // Obx(() => CommonCountryDropdown(
                  //       selectedCountry:
                  //           controller.selectedCountry.value.isEmpty
                  //               ? null
                  //               : controller.selectedCountry.value,
                  //       onChanged: (value) {
                  //         controller.selectedCountry.value = value ?? '';
                  //       },
                  //       countryList: const [
                  //         'India',
                  //         'United States',
                  //         'United Kingdom',
                  //         'Australia',
                  //         'Canada',
                  //         'Germany',
                  //         'France',
                  //         'Japan',
                  //         'Brazil',
                  //       ],
                  //     )),
                  Obx(() => CommonDropdown(
                        label: "Select Country",
                        heading: "Country",
                        selectedValue: controller.selectedCountry.value.isEmpty
                            ? null
                            : controller.selectedCountry.value,
                        items: [
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
                        onChanged: (value) {
                          controller.selectedCountry.value = value ?? '';
                        },
                        showAbove: true,
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
                            "Preferred Languages".tr,
                            fontSize: 16.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                          child: Obx(() => Row(
                                children: controller.languages.map((lang) {
                                  final isSelected =
                                      controller.selectedLanguage.value == lang;
                                  return SelectableButton(
                                    text: lang == "English" ? "EN" : "ES",
                                    isSelected: isSelected,
                                    onTap: () =>
                                        controller.selectLanguage(lang),
                                    color: AppColors.primaryColor,
                                    borderColor: AppColors.primaryColor,
                                    width: 45.w,
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
                        text: "Continue".tr,
                        isLoading: controller.isLoading.value,
                        isDisabled: controller.isAboutMeButtonDisabled.value,
                        onPressed: () {
                          if (controller.signupAboutMeFormKey.currentState!
                              .validate()) {
                            AppLogger.d(
                                "accessToken in about me screen is $accessToken");
                            controller.onSignupAboutMe(
                                isAthlete, userId, accessToken);
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

class CommonDropdown extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final bool showAbove;
  final String heading;

  const CommonDropdown({
    super.key,
    this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.showAbove = false,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: selectedValue,
            isExpanded: true,
            isDense: true,
            hint: Text(
              heading,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontFamily: GoogleFonts.jost().fontFamily),
            ),
            items: items
                .map(
                  (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontFamily: GoogleFonts.jost().fontFamily)),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 53.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.screenBackgroundColor,
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down_rounded,
                  size: 20.sp, color: AppColors.lightGray),
            ),
            dropdownStyleData: DropdownStyleData(
              direction:
                  showAbove ? DropdownDirection.left : DropdownDirection.right,
              maxHeight: 200.h,
              offset: Offset(0, -10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.screenBackgroundColor,
                border: Border.all(color: Colors.grey.withOpacity(0.7)),
              ),
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }
}

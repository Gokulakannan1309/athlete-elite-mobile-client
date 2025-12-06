import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/signup/signup_sub_screen/about_me_detail_screen.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/common_back_button.dart';

class AthleteUserDetailsScreen extends GetWidget<AthleteSettingsController> {
  final bool isAthlete;
  const AthleteUserDetailsScreen({super.key, required this.isAthlete});

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
                      'USER DETAILS'.tr.toUpperCase(),
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: GoogleFonts.bebasNeue().fontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isAthlete,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          if (isAthlete) {
                            NavigationHelper.toNamed(
                              AppRoutes.userDetailEditScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          } else {
                            NavigationHelper.toNamed(
                              AppRoutes.userDetailEditScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          }
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            // color: AppColors.lightRed,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/edit.png",
                            height: 26.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Visibility(
                visible: !isAthlete,
                child: Column(
                  children: [
                    Obx(() {
                      return CommonRedTextField(
                        controller: controller.fanAgeController,
                        label: "Age".tr,
                        isReadOnly: !controller.isAgeEditing.value,
                        prfixIcon:
                            Image.asset("assets/icons/age.png", height: 26.sp),
                        suffixIcon: Image.asset(
                          controller.isAgeEditing.value
                              ? "assets/icons/check.png"
                              : "assets/icons/edit.png",
                          height: 26.sp,
                          color: Colors.white70,
                        ),
                        onSuffixIconTap: () {
                          if (controller.isAgeEditing.value) {
                            print(
                                "checked → ${controller.fanAgeController.text}");
                            controller.updateFanUserDetails();
                          }

                          controller.isAgeEditing.toggle();
                        },
                      );
                    }),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return Stack(
                        children: [
                          // Dropdown (works only when editing)
                          AbsorbPointer(
                            absorbing: !controller.isGenderEditing
                                .value, // disable taps if not editing
                            child: CommonDropdownForUserDetail(
                              label: "Gender",
                              heading: "Gender",
                              selectedValue:
                                  controller.selectedGender.value.isEmpty
                                      ? null
                                      : controller.selectedGender.value,
                              items: const [
                                "Male",
                                "Female",
                                "Prefer not to say"
                              ],
                              onChanged: (value) {
                                controller.updateSelectedGender(value);
                              },
                              dropdownKey: controller.genderDropdownKey,
                              showAbove: true,
                            ),
                          ),

                          // Prefix Icon
                          Positioned(
                            left: 12,
                            top: 14,
                            child: Image.asset(
                              "assets/icons/gender.png",
                              height: 26.sp,
                            ),
                          ),

                          // Suffix icon (edit / check)
                          Positioned(
                            right: 12,
                            top: 14,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: GestureDetector(
                                onTap: () {
                                  if (controller.isGenderEditing.value) {
                                    controller.updateFanUserDetails();
                                  } else {
                                    Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      controller.openGenderDropdownMenu();
                                    });
                                  }
                                  controller.isGenderEditing.toggle();
                                },
                                child: Image.asset(
                                  controller.isGenderEditing.value
                                      ? "assets/icons/check.png"
                                      : "assets/icons/edit.png",
                                  height: controller.isGenderEditing.value
                                      ? 17.sp
                                      : 23.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return Stack(
                        children: [
                          // Dropdown (works only when editing)
                          AbsorbPointer(
                            absorbing: !controller.isCountryEditing
                                .value, // disable taps if not editing
                            child: CommonDropdownForUserDetail(
                              label: "Country",
                              heading: "Country",
                              selectedValue:
                                  controller.selectedCountry.value.isEmpty
                                      ? null
                                      : controller.selectedCountry.value,
                              items: const [
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
                                controller.updateSelectedCountry(value);
                              },
                              dropdownKey: controller.countryDropdownKey,
                              showAbove: true,
                            ),
                          ),

                          // Prefix Icon
                          Positioned(
                            left: 12,
                            top: 14,
                            child: Image.asset(
                              "assets/icons/flag.png",
                              height: 26,
                            ),
                          ),

                          // Suffix icon (edit / check)
                          Positioned(
                            right: 12,
                            top: 14,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: GestureDetector(
                                onTap: () {
                                  if (controller.isCountryEditing.value) {
                                    controller.updateFanUserDetails(); // save
                                  } else {
                                    // enable editing and open dropdown
                                    Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      controller.openCountryDropdownMenu();
                                    });
                                  }
                                  controller.isCountryEditing.toggle();
                                },
                                child: Image.asset(
                                  controller.isCountryEditing.value
                                      ? "assets/icons/check.png"
                                      : "assets/icons/edit.png",
                                  height: controller.isCountryEditing.value
                                      ? 17.sp
                                      : 23.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),

                    // UI Code
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.fanPhoneNumberController,
                            label: "Phone".tr,
                            inputType: TextInputType.phone,
                            prfixIcon: Image.asset("assets/icons/phone.png",
                                height: 26.sp),
                            validator: controller.validatePhone,
                            onSuffixIconTap: null,
                            // : !controller.isMobileVerified.value,
                          ),
                        ),
                        Obx(() {
                          if (controller.isMobileVerified.value) {
                            return Row(
                              children: [
                                SizedBox(width: 10.w),
                                Icon(Icons.check_circle,
                                    color: Colors.green, size: 24.sp),
                              ],
                            );
                          }

                          if (controller.showOtpMobileButton.value) {
                            return Row(
                              children: [
                                SizedBox(width: 10.w),
                                CommonButton(
                                  text: "Send OTP".tr,
                                  fontSize: 12.sp,
                                  width: 100.w,
                                  color: AppColors.lightRed,
                                  onPressed: controller.postSendOTPToMobile,
                                ),
                              ],
                            );
                          }

                          if (controller.mobileOtpTimer.value > 0) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Text(
                                "${controller.mobileOtpTimer.value}s",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.lightRed,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }

                          return SizedBox.shrink();
                        }),
                      ],
                    ),
                    Obx(() => controller.showMobileOtpField.value &&
                            !controller.isMobileVerified.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonRedTextField(
                                    controller: controller.phoneOtpController,
                                    label: "Enter OTP".tr,
                                    inputType: TextInputType.number,
                                    validator: (v) => v == null || v.isEmpty
                                        ? "OTP required".tr
                                        : v.length < 4
                                            ? "Invalid OTP".tr
                                            : null,
                                    onSuffixIconTap: null,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                CommonButton(
                                  text: "Verify".tr,
                                  fontSize: 12.sp,
                                  width: 100.w,
                                  color: AppColors.lightRed,
                                  onPressed: controller.postVerifyMobileOTP,
                                )
                              ],
                            ),
                          )
                        : SizedBox.shrink()),
                    Obx(() => controller.showMobileOtpField.value &&
                            !controller.isMobileVerified.value &&
                            controller.mobileOtpTimer.value == 0
                        ? Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: GestureDetector(
                              onTap: controller.postSendOTPToMobile,
                              child: Text(
                                "Resend OTP".tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.lightRed,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink()),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return CommonRedTextField(
                        controller: controller.fanEmailController,
                        isReadOnly: !controller.isEmailEditing.value,
                        label: "Email".tr,
                        prfixIcon:
                            Image.asset("assets/icons/mail.png", height: 26.sp),
                        validator: controller.validateEmail,
                        suffixIcon: Image.asset(
                          controller.isEmailEditing.value
                              ? "assets/icons/check.png"
                              : "assets/icons/edit.png",
                          height: 26.sp,
                          color: Colors.white70,
                        ),
                        onSuffixIconTap: () {
                          if (controller.isEmailEditing.value) {
                            print(
                                "checked → ${controller.fanEmailController.text}");
                            controller.updateFanUserDetails();
                          }

                          controller.isEmailEditing.toggle();
                        },
                      );
                    }),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (!controller.isDateofbirthEditing.value) return;

                          controller.tempSelectedDate =
                              controller.parseDateFromDOB(
                            controller.dobText.value,
                          );

                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Container(
                              height: 300,
                              color: Colors.white70,
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.grey[900],
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: const Text("Done",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            controller.fanDateofbirthController
                                                    .text =
                                                controller.formatDateForDOB(
                                                    controller
                                                        .tempSelectedDate);
                                            controller.updateFanUserDetails();
                                            controller.isDateofbirthEditing
                                                .toggle();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      maximumYear: DateTime.now().year,
                                      minimumYear: 1900,
                                      initialDateTime:
                                          controller.tempSelectedDate,
                                      onDateTimeChanged: (DateTime newDate) {
                                        controller.tempSelectedDate = newDate;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.screenBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.lightRed),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/icons/calender.png",
                                  height: 24, color: Colors.white),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  controller.dobText.value.isEmpty
                                      ? "Select Date of Birth"
                                      : controller.dobText.value,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: GestureDetector(
                                  onTap: () {
                                    if (controller.isDateofbirthEditing.value) {
                                      print(
                                          "✔ DOB Selected → ${controller.dobText.value}");
                                    } else {
                                      controller.tempSelectedDate =
                                          controller.parseDateFromDOB(
                                        controller.dobText.value,
                                      );

                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (_) => Container(
                                          height: 300,
                                          color: Colors.white70,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.grey[900],
                                                padding: const EdgeInsets.only(
                                                    right: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      child: const Text("Done",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () {
                                                        controller
                                                                .fanDateofbirthController
                                                                .text =
                                                            controller
                                                                .formatDateForDOB(
                                                                    controller
                                                                        .tempSelectedDate);
                                                        controller
                                                            .updateFanUserDetails();
                                                        controller
                                                            .isDateofbirthEditing
                                                            .toggle();
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  maximumYear:
                                                      DateTime.now().year,
                                                  minimumYear: 1900,
                                                  initialDateTime: controller
                                                      .tempSelectedDate,
                                                  onDateTimeChanged:
                                                      (DateTime newDate) {
                                                    controller
                                                            .tempSelectedDate =
                                                        newDate;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    controller.isDateofbirthEditing.toggle();
                                  },
                                  child: Image.asset(
                                    controller.isDateofbirthEditing.value
                                        ? "assets/icons/check.png"
                                        : "assets/icons/edit.png",
                                    color: Colors.white70,
                                    height:
                                        controller.isDateofbirthEditing.value
                                            ? 17.sp
                                            : 23.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              if (isAthlete)
                Obx(
                  () => Visibility(
                    visible: !controller.isUserDetailsLoading.value,
                    replacement: Center(
                      child:
                          CircularProgressIndicator(color: AppColors.lightRed),
                    ),
                    child: Column(
                      children: [
                        CommonRedTextField(
                          controller: controller.athleteEmailController,
                          label: "Email".tr,
                          isReadOnly: true,
                          prfixIcon: Image.asset("assets/icons/mail.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonRedTextField(
                          controller: controller.athletePhoneNumberController,
                          label: "Phone".tr,
                          isReadOnly: true,
                          prfixIcon: Image.asset("assets/icons/phone.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonRedTextField(
                          controller: controller.athleteDateofbirthController,
                          isReadOnly: true,
                          label: "Calendar".tr,
                          prfixIcon: Image.asset("assets/icons/calender.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonButton(
                          text: "Submit your Brand".tr,
                          onPressed: () {
                            NavigationHelper.toNamed(
                              AppRoutes.submitBrandsScreen,
                              arguments: {'isAthlete': isAthlete},
                              transition: Transition.rightToLeft,
                            );
                          },
                          color: AppColors.lightRed,
                          isOutlined: true,
                          textColor: AppColors.white,
                          isCenterAligned: false,
                          fontSize: 14.sp,
                          height: 54.h,
                        ),
                      ],
                    ),
                  ),
                ),
              Spacer(),
              CommonButton(
                text: "Delete Account".tr,
                onPressed: () {
                  CustomDialogbox.showConfirmation(
                    title: "We are sorry to see you go...".tr,
                    cancelText: "Cancel".tr,
                    confirmText: "Delete Account".tr,
                    onConfirm: () {
                      print("Confirmed");
                      NavigationHelper.toNamed(
                        AppRoutes.login,
                        arguments: {'isAthlete': isAthlete},
                        transition: Transition.rightToLeft,
                      );
                    },
                    onCancel: () {
                      print("Cancelled");
                      Navigator.pop(context);
                    },
                  );
                },
                color: AppColors.red,
                icon: "delete",
                iconColor: AppColors.red,
                isOutlined: true,
                textColor: AppColors.red,
                fontSize: 16.sp,
                iconSize: 22,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  String normalizeGender(String value) {
    switch (value.toLowerCase()) {
      case "male":
        return "Male";
      case "female":
        return "Female";
      case "prefer not to say":
        return "Prefer not to say";
      default:
        return "";
    }
  }

  void showDOBPicker(BuildContext context) {
    DateTime initial =
        DateTime.now().subtract(Duration(days: 365 * 18)); // default 18 yrs
    DateTime min = DateTime(1900);
    DateTime max = DateTime.now();

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.black,
        child: Column(
          children: [
            // Done Button
            SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            // Picker
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime:
                    DateTime.now().subtract(Duration(days: 365 * 20)),
                minimumDate: min,
                maximumDate: max,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  controller.setDOB(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonRedDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedValue;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onSuffixIconTap;
  final Function(String?) onChanged;

  final GlobalKey? dropdownKey;

  const CommonRedDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.isReadOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.dropdownKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 2.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightRed, width: 0.8),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) prefixIcon!,
          SizedBox(width: 10),
          Expanded(
            child: IgnorePointer(
              ignoring: isReadOnly,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                key: dropdownKey,
                dropdownColor: Colors.black87,
                value: selectedValue,
                hint: Text(label, style: TextStyle(color: Colors.white54)),
                icon: const SizedBox.shrink(),
                onChanged: onChanged,
                items: items.map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
              )),
            ),
          ),
          if (suffixIcon != null)
            GestureDetector(
              onTap: onSuffixIconTap,
              child: Container(
                height: 18.h,
                width: 18.w,
                color: Colors.transparent,
                child: suffixIcon!,
              ),
            )
        ],
      ),
    );
  }
}

class CommonDropdownForUserDetail extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final bool showAbove;
  final String heading;
  final Key? dropdownKey;

  const CommonDropdownForUserDetail({
    super.key,
    this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.showAbove = false,
    required this.heading,
    this.dropdownKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: GestureDetector(
            key: dropdownKey,
            onTap: () {},
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
                padding: EdgeInsets.only(
                  left: 50.w,
                  right: 12.w,
                  top: 8.h,
                  bottom: 8.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.lightRed,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.screenBackgroundColor,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    size: 20.sp, color: AppColors.screenBackgroundColor),
              ),
              dropdownStyleData: DropdownStyleData(
                direction: showAbove
                    ? DropdownDirection.left
                    : DropdownDirection.right,
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
        ),
      ],
    );
  }
}

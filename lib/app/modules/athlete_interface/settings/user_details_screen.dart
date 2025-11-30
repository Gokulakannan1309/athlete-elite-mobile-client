import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/common_back_button.dart';

class AthleteUserDetailsScreen extends GetView<AthleteSettingsController> {
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
                      'USER DETAILS'.toUpperCase(),
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
                        label: "Age",
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
                      return CommonRedDropdown(
                        label: "Gender",
                        items: const ["Male", "Female", "Prefer not to say"],
                        selectedValue: controller.selectedGender.value.isEmpty
                            ? null
                            : controller.selectedGender.value,
                        isReadOnly: !controller.isGenderEditing.value,
                        prefixIcon:
                            Image.asset("assets/icons/age.png", height: 26.sp),
                        suffixIcon: Image.asset(
                          controller.isGenderEditing.value
                              ? "assets/icons/check.png"
                              : "assets/icons/edit.png",
                          height: 26.sp,
                          color: Colors.white70,
                        ),
                        dropdownKey: controller
                            .genderDropdownKey, // if you're using the auto-open trick
                        onSuffixIconTap: () {
                          if (controller.isGenderEditing.value) {
                            controller.updateFanUserDetails();
                          } else {
                            // when enabling edit, open dropdown
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              controller.openGenderDropdownMenu();
                            });
                          }
                          controller.isGenderEditing.toggle();
                        },
                        onChanged: (value) {
                          controller.updateSelectedGender(value);
                        },
                      );
                    }),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return CommonRedTextField(
                        controller: controller.fanCountryController,
                        label: "Country",
                        isReadOnly: !controller.isCountryEditing.value,
                        prfixIcon:
                            Image.asset("assets/icons/age.png", height: 26.sp),
                        suffixIcon: Image.asset(
                          controller.isCountryEditing.value
                              ? "assets/icons/check.png"
                              : "assets/icons/edit.png",
                          color: Colors.white70,
                          height: 26.sp,
                        ),
                        onSuffixIconTap: () {
                          if (controller.isCountryEditing.value) {
                            print(
                                "checked → ${controller.fanCountryController.text}");
                            controller.updateFanUserDetails();
                          }

                          controller.isCountryEditing.toggle();
                        },
                      );
                    }),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.fanPhoneNumberController,
                            label: "Phone",
                            prfixIcon: Image.asset("assets/icons/phone.png",
                                height: 26.sp),
                            validator: controller.validatePhone,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Obx(() => controller.showOtpMobileButton.value
                            ? Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  CommonButton(
                                    text: "Send OTP",
                                    fontSize: 12.sp,
                                    width: 100.w,
                                    color: AppColors.lightRed,
                                    onPressed: () {
                                      controller.showMobileOtpField.value =
                                          true;
                                      controller.showOtpMobileButton.value =
                                          false;
                                    },
                                  ),
                                ],
                              )
                            : SizedBox.shrink()),
                      ],
                    ),
                    Obx(() => controller.showMobileOtpField.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonRedTextField(
                                    controller: controller.phoneOtpController,
                                    label: "Enter OTP",
                                    validator: (v) => v == null || v.isEmpty
                                        ? "OTP required"
                                        : null,
                                    onSuffixIconTap: null,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                CommonButton(
                                  text: "Verify OTP",
                                  fontSize: 12.sp,
                                  width: 100.w,
                                  color: AppColors.lightRed,
                                  onPressed: () {
                                    print(
                                        "Verify mobile OTP: ${controller.phoneOtpController.text}");
                                  },
                                )
                              ],
                            ),
                          )
                        : SizedBox.shrink()),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonRedTextField(
                            controller: controller.fanEmailController,
                            label: "Email",
                            prfixIcon: Image.asset("assets/icons/mail.png",
                                height: 26.sp),
                            validator: controller.validateEmail,
                            onSuffixIconTap: null,
                          ),
                        ),
                        Obx(() => controller.showOtpEmailButton.value
                            ? Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  CommonButton(
                                    text: "Send OTP",
                                    fontSize: 12.sp,
                                    width: 100.w,
                                    color: AppColors.lightRed,
                                    onPressed: () {
                                      controller.showEmailOtpField.value = true;
                                      controller.showOtpEmailButton.value =
                                          false;
                                    },
                                  ),
                                ],
                              )
                            : SizedBox.shrink()),
                      ],
                    ),
                    Obx(() => controller.showEmailOtpField.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonRedTextField(
                                    controller: controller.emailOtpController,
                                    label: "Enter OTP",
                                    validator: (v) => v == null || v.isEmpty
                                        ? "OTP required"
                                        : null,
                                    onSuffixIconTap: null,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                CommonButton(
                                  text: "Verify OTP",
                                  fontSize: 12.sp,
                                  width: 100.w,
                                  color: AppColors.lightRed,
                                  onPressed: () {
                                    print(
                                        "Verify email OTP: ${controller.emailOtpController.text}");
                                  },
                                )
                              ],
                            ),
                          )
                        : SizedBox.shrink()),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (!controller.isDateofbirthEditing.value) return;

                          controller.tempSelectedDate = DateTime.tryParse(
                                controller.fanDateofbirthController.text,
                              ) ??
                              DateTime(2000, 1, 1);

                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Container(
                              height: 300,
                              color: Colors.white70,
                              child: Column(
                                children: [
                                  // Done button
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
                                            // Update the controller value ONLY when Done is pressed
                                            controller.fanDateofbirthController
                                                    .text =
                                                "${controller.tempSelectedDate.year}-${controller.tempSelectedDate.month.toString().padLeft(2, '0')}-${controller.tempSelectedDate.day.toString().padLeft(2, '0')}";
                                            controller.updateFanUserDetails();
                                            controller.isDateofbirthEditing
                                                .toggle();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Cupertino Date Picker
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      maximumYear: DateTime.now().year,
                                      minimumYear: 1900,
                                      initialDateTime:
                                          controller.tempSelectedDate,
                                      onDateTimeChanged: (DateTime newDate) {
                                        controller.tempSelectedDate =
                                            newDate; // store temporarily
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
                                  controller
                                          .fanDateofbirthController.text.isEmpty
                                      ? "Select Date of Birth"
                                      : controller
                                          .fanDateofbirthController.text,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (controller.isDateofbirthEditing.value) {
                                    print(
                                        "✔ DOB Selected → ${controller.fanDateofbirthController.text}");
                                  } else {
                                    controller.tempSelectedDate =
                                        DateTime.tryParse(
                                              controller
                                                  .fanDateofbirthController
                                                  .text,
                                            ) ??
                                            DateTime(2000, 1, 1);

                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) => Container(
                                        height: 300,
                                        color: Colors.white70,
                                        child: Column(
                                          children: [
                                            // Done button
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
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {
                                                      // Update the controller value ONLY when Done is pressed
                                                      controller
                                                              .fanDateofbirthController
                                                              .text =
                                                          "${controller.tempSelectedDate.day.toString().padLeft(2, '0')}/${controller.tempSelectedDate.month.toString().padLeft(2, '0')}/${controller.tempSelectedDate.year.toString()}";
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

                                            // Cupertino Date Picker
                                            Expanded(
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                maximumYear:
                                                    DateTime.now().year,
                                                minimumYear: 1900,
                                                initialDateTime:
                                                    controller.tempSelectedDate,
                                                onDateTimeChanged:
                                                    (DateTime newDate) {
                                                  controller.tempSelectedDate =
                                                      newDate; // store temporarily
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
                                child: Container(
                                  // padding: EdgeInsets.all(5),
                                  height: 18.h,
                                  width: 18.w,

                                  child: Image.asset(
                                    controller.isDateofbirthEditing.value
                                        ? "assets/icons/check.png"
                                        : "assets/icons/edit.png",
                                    color: Colors.white70,
                                    height: 26.sp,
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
                          label: "Email",
                          isReadOnly: true,
                          prfixIcon: Image.asset("assets/icons/mail.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonRedTextField(
                          controller: controller.athletePhoneNumberController,
                          label: "Phone",
                          isReadOnly: true,
                          prfixIcon: Image.asset("assets/icons/phone.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonRedTextField(
                          controller: controller.athleteDateofbirthController,
                          label: "Date of Birth",
                          isReadOnly: true,
                          prfixIcon: Image.asset("assets/icons/calender.png",
                              height: 26.sp),
                          suffixIcon: null,
                          onSuffixIconTap: null,
                        ),
                        SizedBox(height: 10.h),
                        CommonButton(
                          text: "Submit your Brand",
                          onPressed: () {
                            // NavigationHelper.toNamed(
                            //   AppRoutes.athleteUserDetailsScreen,
                            //   arguments: {'isAthlete': isAthlete},
                            //   transition: Transition.rightToLeft,
                            // );
                            // controller.getAthleteUserDetails();
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
                text: "Delete Account",
                onPressed: () {
                  CustomDialogbox.showConfirmation(
                    title: "We are sorry to see you go...",
                    cancelText: "Cancel",
                    confirmText: "Delete Account",
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

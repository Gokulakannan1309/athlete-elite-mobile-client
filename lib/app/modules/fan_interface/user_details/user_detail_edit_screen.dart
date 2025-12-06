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
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/common_button.dart';

class UserDetailEditScreen extends GetWidget<AthleteSettingsController> {
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
                      'EDIT DETAILS'.tr.toUpperCase(),
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
                      label: "Age".tr,
                      prfixIcon:
                          Image.asset("assets/icons/age.png", height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller: controller.fanGenderController,
                      label: "Gender".tr,
                      prfixIcon:
                          Image.asset("assets/icons/gender.png", height: 26.sp),
                      suffixIcon: null,
                      onSuffixIconTap: null,
                    ),
                    SizedBox(height: 10.h),
                    CommonRedTextField(
                      controller: controller.fanCountryController,
                      label: "Country".tr,
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
                            label: "Email".tr,
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
                            text: "Send OTP".tr,
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
                            controller: controller.fanPhoneNumberController,
                            label: "Phone".tr,
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
                            text: "Send OTP".tr,
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
                      label: "Date of Birth".tr,
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
                            label: "Email".tr,
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
                            text: "Send OTP".tr,
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
                            label: "Phone".tr,
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
                            text: "Send OTP".tr,
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
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.tempSelectedDate = controller
                                  .parseDateFromDOB(controller.dobText.value) ??
                              DateTime.now();

                          showCenteredCalendar(
                            context,
                            controller.tempSelectedDate,
                            (selected) {
                              controller.tempSelectedDate = selected;
                              controller.athleteDateofbirthController.text =
                                  controller.formatDateForDOB(selected);
                              controller.dobText.value =
                                  controller.formatDateForDOB(selected);
                            },
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
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              Spacer(),
              Obx(
                () => CommonButton(
                  text: 'Save Changes'.tr,
                  color: AppColors.lightRed,
                  disabledColor: AppColors.lightRed,
                  onPressed: controller.isUserDetailsLoading.value
                      ? null
                      : () async {
                          if (isAthlete) {
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

  void showCenteredCalendar(
    BuildContext context,
    DateTime initialDate,
    ValueChanged<DateTime> onDateSelected,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        DateTime focusedDay = initialDate;
        DateTime selectedDay = initialDate;

        List<int> years = [for (int y = 1900; y <= DateTime.now().year; y++) y];

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title: Month + Year + arrows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left,
                                color: Color(0xFFd9ff00)),
                            onPressed: () {
                              setState(() {
                                focusedDay = DateTime(
                                    focusedDay.year, focusedDay.month - 1, 1);
                              });
                            },
                          ),
                          Row(
                            children: [
                              Text(
                                _monthName(focusedDay.month),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),

                              // Year dropdown
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white24),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: DropdownButton<int>(
                                  dropdownColor: Colors.black,
                                  value: focusedDay.year,
                                  underline: const SizedBox(),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  style: const TextStyle(color: Colors.white),
                                  items: years.reversed.map((year) {
                                    return DropdownMenuItem(
                                      value: year,
                                      child: Text(year.toString(),
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    );
                                  }).toList(),
                                  onChanged: (newYear) {
                                    setState(() {
                                      focusedDay = DateTime(
                                          newYear!, focusedDay.month, 1);
                                    });
                                  },
                                  menuMaxHeight: 100.h,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.chevron_right,
                                color: Color(0xFFd9ff00)),
                            onPressed: () {
                              setState(() {
                                focusedDay = DateTime(
                                    focusedDay.year, focusedDay.month + 1, 1);
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Calendar Grid
                      TableCalendar(
                        firstDay: DateTime(1900, 1, 1),
                        lastDay: DateTime.now(),
                        focusedDay: focusedDay,
                        calendarFormat: CalendarFormat.month,
                        headerVisible: false,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        selectedDayPredicate: (day) =>
                            day.year == selectedDay.year &&
                            day.month == selectedDay.month &&
                            day.day == selectedDay.day,
                        onDaySelected: (day, _) {
                          setState(() {
                            selectedDay = day;
                            focusedDay = day;
                          });
                        },
                        onPageChanged: (newFocus) {
                          setState(() => focusedDay = newFocus);
                        },
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.white),
                          weekendTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Color(0xFFd9ff00),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Color(0xFFd9ff00),
                            shape: BoxShape.circle,
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.grey),
                          weekendStyle: TextStyle(color: Colors.grey),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Done Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFd9ff00),
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            onDateSelected(selectedDay);
                            Navigator.pop(context);
                          },
                          child: const Text("Done"),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  String monthName(int month) {
    const names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return names[month - 1];
  }
}

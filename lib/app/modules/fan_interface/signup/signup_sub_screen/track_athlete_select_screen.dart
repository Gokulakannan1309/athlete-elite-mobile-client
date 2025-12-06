import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../fan_signup_controller.dart';

class TrackAthleteSelectScreen extends GetWidget<FanSignupController> {
  final bool isAthlete;
  const TrackAthleteSelectScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /// HEADER
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Center(
                      child: Text(
                        'Track Athletes'.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: GoogleFonts.bebasNeue().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              /// SCROLLABLE GRID AREA
              Expanded(child: buildGridSection()),

              /// STICKY BOTTOM BUTTON
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                child: CommonButton(
                  text: "Next".tr,
                  onPressed: () async {
                    print(
                        "SELECTED ATHLETE IDS: ${controller.selectedAthleteIds}");

                    await controller.trackMultipleAthletes();

                    NavigationHelper.toNamed(
                      AppRoutes.setProfilePicScreen,
                      arguments: {
                        'isAthlete': isAthlete,
                        'selectedAthletes':
                            controller.selectedAthleteIds.toList(),
                      },
                      transition: Transition.rightToLeft,
                    );
                  },
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// BUILD GRIDS
  Widget buildGridSection() {
    return Obx(() {
      final athletes = controller.allAthletes;
      final selectedIds = controller.selectedAthleteIds;

      if (athletes.isEmpty) {
        return Center(
          child: AppText(
            "No Athletes Available".tr,
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        );
      }

      return GridView.builder(
        padding: EdgeInsets.only(bottom: 20.h),
        itemCount: athletes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 22.w,
          mainAxisSpacing: 22.h,
          childAspectRatio: 110.w / 180.h,
        ),
        itemBuilder: (context, index) {
          final athlete = athletes[index];

          return Obx(() {
            final isSelected = selectedIds.contains(athlete.id);

            return GestureDetector(
              onTap: () {
                controller.toggleSelect(athlete.id);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : Colors.white,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: athlete.profilePicture != null
                        ? NetworkImage(athlete.profilePicture!)
                        : const AssetImage("assets/images/person.png")
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: AppText(
                          athlete.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12)),
                          ),
                          child: Text(
                            "T",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          });
        },
      );
    });
  }
}

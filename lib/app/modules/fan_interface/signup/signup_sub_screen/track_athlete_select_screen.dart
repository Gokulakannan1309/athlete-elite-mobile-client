import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../fan_signup_controller.dart';

class TrackAthleteSelectScreen extends GetView<FanSignupController> {
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonBackButton(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Center(
                      child: Text(
                        'Track Athletes'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: GoogleFonts.anton().fontFamily,
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
              Expanded(child: Obx(() => buildGridSection())),

              /// STICKY BOTTOM BUTTON
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                child: CommonButton(
                  text: "Next",
                  onPressed: () {
                     NavigationHelper.toNamed(
                      AppRoutes.setProfilePicScreen,
                      arguments: {'isAthlete': isAthlete},
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

  Widget buildGridSection() {
    return Center(
      child: Visibility(
        visible: controller.routineItems.isNotEmpty,
        replacement: AppText(
          "Your Drafts will appear here.",
          color: AppColors.white,
          fontSize: 16.sp,
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 20.h),
          itemCount: controller.routineItems.length,
          itemBuilder: (context, index) {
            final item = controller.routineItems[index];
            return trackSection(item['images']);
          },
        ),
      ),
    );
  }

  Widget trackSection(List<String> images) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 22.w,
          mainAxisSpacing: 22.h,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              /// Athlete Image
              Container(
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// "T" Badge at Top-Right
              Positioned(
                right: 0.w,
                top: 0.h,
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "T",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

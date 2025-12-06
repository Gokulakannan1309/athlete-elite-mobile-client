import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/fan_all_athletes_list/athletes_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/athlete_profile_view_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/common_back_button.dart';

class FanTrackAthleteScreen extends GetWidget<FanLandingController> {
  final bool isAthlete;
  final bool isSearchPage;
  const FanTrackAthleteScreen(
      {super.key, required this.isAthlete, this.isSearchPage = false});

  bool isAtBottom(ScrollNotification scroll) {
    return scroll.metrics.pixels >= (scroll.metrics.maxScrollExtent - 50);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onWillPop: () {
        if (controller.athleteSearchQuery.text.isNotEmpty) {
          controller.athleteSearchQuery.clear();
          controller.searchQuery.value = '';
          return Future.value(false);
        }
        return Future.value(true);
      },
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /// HEADER
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CommonBackButton(),
                  ),
                  Center(
                    child: Text(
                      'ATHLETES'.tr.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily:
                            GoogleFonts.barlowSemiCondensed().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightWhite,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: controller.athleteSearchQuery,
                    onChanged: (value) => controller.searchQuery.value = value,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search'.tr,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  )),

              SizedBox(height: 10.h),

              Expanded(child: buildGridSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridSection() {
    return Obx(() {
      final list = controller.searchQuery.value.isEmpty && !isSearchPage
          ? controller.trackedAthletes
          : controller.searchedAthletes;

      final isLoading = controller.getTrackedAllAthletesByFanLoading.value ||
          controller.getAllSearchedAthletesLoading.value;

      if (isLoading && list.isEmpty) {
        return buildShimmerGrid();
      }

      if (list.isEmpty && controller.athleteSearchQuery.text.isNotEmpty) {
        return Center(
          child: AppText(
            "No athletes found".tr,
            color: AppColors.lightWhite,
            fontSize: 16.sp,
          ),
        );
      }

      if (list.isEmpty && !isSearchPage) {
        return Center(
          child: AppText(
            "No athletes tracked".tr,
            color: AppColors.lightWhite,
            fontSize: 16.sp,
          )
        );
      }

      return GridView.builder(
        padding: EdgeInsets.only(bottom: 20.h),
        itemCount: list.length + (isLoading ? 3 : 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          if (index >= list.length) {
            return shimmerBox(w: double.infinity, h: 180.h, radius: 10);
          }

          return athleteCard(list[index]);
        },
      );
    });
  }

  Widget buildShimmerGrid() {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 22.w,
        mainAxisSpacing: 22.h,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (_, index) {
        return shimmerBox(w: double.infinity, h: 180.h, radius: 12);
      },
    );
  }

  Widget athleteCard(Athlete athlete) {
    return InkWell(
      onTap: () {
        AthleteProfileViewController athleteProfileViewController =
            Get.isRegistered()
                ? Get.find<AthleteProfileViewController>()
                : Get.put(AthleteProfileViewController());
        NavigationHelper.toNamed(
          AppRoutes.athleteProfileViewForFan,
          arguments: {'isAthlete': isAthlete},
        );
        controller.getAthlete(athlete.id.toString()).then((value) {
          if (value) {
            athleteProfileViewController
                .getAthleteProfileViewIntro(athlete.id.toString());
            athleteProfileViewController
                .getAthleteProfileViewFavMoment(athlete.id.toString());
            athleteProfileViewController
                .getAthleteProfileViewCategories(athlete.id.toString());

            athleteProfileViewController
                .getAthleteProfileViewBrands(athlete.id.toString());

            athleteProfileViewController
                .getAthleteSocialLinksForFanView(athlete.id.toString());
            athleteProfileViewController
                .getAthleteProfileViewContentLibrary(athlete.id.toString());
            athleteProfileViewController
                .getAthleteProfileViewCommunityPost(athlete.id.toString());
          }
        });
      },
      child: Container(
        height: 180.h,
        width: 110.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
          image: DecorationImage(
            image: athlete.profilePicture != null
                ? NetworkImage(athlete.profilePicture!)
                : const AssetImage("assets/images/user_placeholder.png")
                    as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

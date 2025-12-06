import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/AppText.dart';
import '../../../../widgets/common_back_button.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/custom_dialogbox.dart';
import '../athelete_landing_controller.dart';

class FanFollowListScreen extends GetWidget<AtheleteLandingController> {
  final bool isAthlete;
  const FanFollowListScreen({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              color: Color.fromARGB(255, 203, 203, 203).withOpacity(0.2),
              child: Row(
                children: [
                  CommonBackButton(),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                          SizedBox(width: 8.w),
                          AppText(
                            "Nick Kyrgios",
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
            ),

            // FANS Title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                "FANS".tr.toUpperCase(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28.sp,
                  fontFamily: GoogleFonts.anton().fontFamily,
                ),
              ),
            ),

            Expanded(
              child: Obx(() {
                if (controller.isFansListLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  );
                }

                final fans = controller.fansList.value?.items ?? [];

                if (fans.isEmpty) {
                  return Center(
                    child: AppText(
                      "No fans found".tr,
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: fans.length,
                  itemBuilder: (context, index) {
                    final fan = fans[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.r,
                            height: 40.r,
                            child: Stack(
                              children: [
                                // SHIMMER LOADER
                                if (controller.isFansListLoading.value)
                                  ClipOval(
                                    child: shimmerBox(
                                      w: 40.r,
                                      h: 40.r,
                                      radius: 40.r,
                                    ),
                                  ),

                                // IMAGE WHEN LOADED
                                if (!controller.isFansListLoading.value)
                                  ClipOval(
                                    child: fan.profilePicture != null &&
                                            fan.profilePicture!
                                                .startsWith("http")
                                        ? Image.network(
                                            fan.profilePicture!,
                                            fit: BoxFit.cover,
                                            width: 40.r,
                                            height: 40.r,
                                            errorBuilder:
                                                (context, error, stack) {
                                              return Image.asset(
                                                "assets/images/profile.png",
                                                fit: BoxFit.cover,
                                                width: 40.r,
                                                height: 40.r,
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;

                                              return shimmerBox(
                                                w: 40.r,
                                                h: 40.r,
                                                radius: 40.r,
                                              );
                                            },
                                          )
                                        : Image.asset(
                                            "assets/images/profile.png",
                                            fit: BoxFit.cover,
                                            width: 40.r,
                                            height: 40.r,
                                          ),
                                  ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Name
                          Expanded(
                            child: AppText(
                              fan.name,
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          CommonButton(
                            text: "Remove".tr,
                            onPressed: () {
                              CustomDialogbox.showConfirmation(
                                title: "Remove Fan?",
                                cancelText: "Cancel",
                                confirmText: "Remove",
                                onConfirm: () {
                                  print("Removed ${fan.name}");
                                  controller.removeFanFromTrack(fan.id);
                                },
                                onCancel: () {},
                              );
                            },
                            color: AppColors.lightRed,
                            textColor: AppColors.red,
                            fontSize: 12.sp,
                            width: 100.w,
                            height: 32.h,
                            isOutlined: true,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

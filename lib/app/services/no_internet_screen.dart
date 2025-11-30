// lib/views/no_internet_screen.dart
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/network_service.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/no_internet.png', height: 250.h),
                Text(
                  "No Internet Connection",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Please check your network settings\nand try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.white),
                ),
                SizedBox(height: 30.h),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 24.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () async {
                    bool connected = await NetworkService.isConnectedNow();
                    if (connected) {
                      Get.back(); // remove this screen
                    } else {
                      Get.snackbar(
                        "Still Offline",
                        "Please check your network connection.",
                        backgroundColor: Colors.redAccent,
                        colorText: AppColors.black,
                      );
                    }
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: AppColors.black,
                    size: 24.sp,
                  ),
                  label: Text(
                    "Try Again",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

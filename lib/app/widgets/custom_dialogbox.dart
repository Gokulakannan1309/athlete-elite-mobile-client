import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialogbox {
  static void showConfirmation({
    required String title,
    String? message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              bottom: 70,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                backgroundColor: Colors.black.withOpacity(0.9),
                insetPadding: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      AppText(
                        title,
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      // Optional message
                      if (message != null && message.isNotEmpty) ...[
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Cancel Button
                          CommonButton(
                            text: cancelText,
                            onPressed: () {
                              Get.back(); // close dialog
                              // if (onCancel != null) onCancel();
                            },
                            color: Color(0x00ffffff).withOpacity(0.2),
                            textColor: Colors.white,
                            borderRadius: 6,
                            width: 127.w,
                            height: 30.h,
                            fontSize: 14.sp,
                          ),

                          // Confirm Button
                          CommonButton(
                            text: confirmText,
                            onPressed: () {
                              Get.back();
                              onConfirm();
                            },
                            color: AppColors.red,
                            textColor: Colors.white,
                            borderRadius: 6,
                            width: 140.w,
                            height: 30.h,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

static Future<void> showCustomPopup({
    List<Map<String, dynamic>>? buttons,
    String? title,
  }) async {
    return await showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              top: 350.h,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                backgroundColor: Colors.black.withOpacity(0.9),
                insetPadding: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null && title.isNotEmpty) ...[
                        AppText(
                          title,
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25.h),
                      ],
                      if (buttons != null && buttons.isNotEmpty)
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 12.h,
                          alignment: WrapAlignment.center,
                          children: buttons.map((btn) {
                            return CommonButton(
                              text: btn['text'] ?? 'Button',
                              onPressed: () {
                                Get.back(result: btn['onTap']);
                                if (btn['onTap'] != null) btn['onTap']();
                              },
                              color: btn['color'] ?? AppColors.primaryColor,
                              textColor: btn['textColor'] ?? Colors.black,
                              borderRadius: 8.r,
                              width: btn['width'] ?? 120.w,
                              height: btn['height'] ?? 35.h,
                              fontSize: 14.sp,
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

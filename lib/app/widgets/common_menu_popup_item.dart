import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PopupMenuItem<String> commonMenuPopupItem({
  required String value,
  required String icon,
  required String text,
  required Color borderColor,
  Color textColor = Colors.white,
  Color iconColor = Colors.white,
}) {
  return PopupMenuItem<String>(
    value: value,
    child: Container(
      height: 36.h,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/$icon.png",
            height: 14.sp,
            color: iconColor,
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: AppText(
              text,
              color: textColor,
              fontSize: 12.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}


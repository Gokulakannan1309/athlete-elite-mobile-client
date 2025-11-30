import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double borderRadius;
  final IconData icon;
  final double iconSize;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const CommonBackButton({
    super.key,
    this.onTap,
    this.backgroundColor = const Color.fromARGB(95, 73, 73, 73),
    this.iconColor = Colors.white,
    this.size = 35,
    this.borderRadius = 8,
    this.icon = Icons.arrow_back_ios_new_rounded,
    this.iconSize = 17,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        height: size.h,
        width: size.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: boxShadow,
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: iconColor, size: iconSize.sp),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:athlete_elite/app/constants/app_colors.dart';

class SelectableButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color color;
  final Color borderColor;

  const SelectableButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.width,
    this.height,
    this.borderRadius = 15,
    this.textStyle,
    required this.color,
    required this.borderColor,
  });

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width ?? 110.w,
        height: widget.height ?? 45.h,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? widget.color.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: widget.borderColor, width: 0.8),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style:
              widget.textStyle ??
              TextStyle(
                color: widget.isSelected ? AppColors.primaryColor : AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

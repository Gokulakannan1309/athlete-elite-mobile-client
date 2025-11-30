import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? color;
  final Color? textColor;
  final double height;
  final double width;
  final double borderRadius;
  final String? icon;
  final Color? iconColor;
  final double iconSize;
  final double? fontSize;
  final bool isDisabled;
  final bool isCenterAligned;
  final Color disabledColor;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.color,
    this.textColor,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 14,
    this.icon,
    this.iconColor,
    this.iconSize = 20,
    this.fontSize,
    this.isDisabled = false,
    this.isCenterAligned = true,
    this.disabledColor = const Color(0x66CCFF00),
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = color ?? AppColors.primaryColor;
    final Color primaryDisabledColor =
        disabledColor.withOpacity(0.4) ?? Color(0xFFCCFF00).withOpacity(0.4);
    final Color foreground = textColor ?? AppColors.black;
    final Color disabledTextColor = AppColors.black.withOpacity(0.4);
    final bool effectivelyDisabled = isDisabled || isLoading;

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: effectivelyDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (isOutlined) return Colors.transparent;
            if (effectivelyDisabled) return primaryDisabledColor;
            return buttonColor;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (isOutlined) {
              return effectivelyDisabled
                  ? primaryDisabledColor
                  : (textColor ?? buttonColor);
            }
            return effectivelyDisabled
                ? disabledTextColor
                : (textColor ?? foreground);
          }),
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (isOutlined) {
              return BorderSide(
                color: effectivelyDisabled
                    ? primaryDisabledColor
                    : (color ?? buttonColor),
                width: 1.2,
              );
            }
            return const BorderSide(color: Colors.transparent, width: 0);
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isOutlined ? primaryDisabledColor : Colors.white,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: isCenterAligned
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Image.asset(
                      "assets/icons/$icon.png",
                      height: iconSize,
                      color: iconColor ??
                          (isOutlined
                              ? (effectivelyDisabled
                                  ? primaryDisabledColor
                                  : (color ?? buttonColor))
                              : (effectivelyDisabled
                                  ? disabledTextColor
                                  : (textColor ?? foreground))),
                    ),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.buttonTextFontMedium,
                      fontSize: fontSize ?? 18.sp,
                      color: isOutlined
                          ? (effectivelyDisabled
                              ? primaryDisabledColor
                              : (textColor ?? buttonColor))
                          : (effectivelyDisabled
                              ? disabledTextColor
                              : (textColor ?? foreground)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

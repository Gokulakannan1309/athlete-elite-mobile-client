import 'package:athlete_elite/app/constants/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import '../constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double? fontSize;
  final double? decorationThickness;
  final Color? color;
  final Color? decorationColor;
  final double? letterSpacing;
  final double height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final List<Shadow>? shadows;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? boxHeight;
  final double? underlineOffset;
  final bool useCustomUnderline;
  final double? lineHeight;

  const AppText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.fontFamily = 'Jost',
    this.letterSpacing,
    this.overflow,
    this.decorationThickness,
    this.shadows,
    this.decorationColor,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.height = 1.3,
    this.maxLines = 100,
    this.fontStyle,
    this.boxHeight,
    this.fontWeight = FontWeight.normal,
    this.underlineOffset,
    this.useCustomUnderline = false,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text.tr,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: _getFontFamily(),
        fontSize: (fontSize ?? 16.sp),
        // height: height,
        color: color ?? AppColors.white,
        letterSpacing: letterSpacing,
        decoration: useCustomUnderline ? TextDecoration.none : textDecoration,
        decorationColor: decorationColor ?? color ?? AppColors.black,
        decorationThickness: decorationThickness,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        shadows: shadows,
        height: lineHeight != null
            ? (lineHeight! /
                  (fontSize ?? 16.sp)) // 👈 maintain proportional line spacing
            : height,
      ),
    );

    // ✅ Handle custom underline with offset
    if (useCustomUnderline &&
        textDecoration == TextDecoration.underline &&
        underlineOffset != null) {
      return SizedBox(
        height: boxHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: _getCrossAxisAlignment(),
          children: [
            textWidget,
            SizedBox(height: underlineOffset),
            Container(
              height: decorationThickness ?? 1.0,
              width: _calculateTextWidth(context),
              color: decorationColor ?? color ?? Colors.white70,
            ),
          ],
        ),
      );
    }

    return SizedBox(height: boxHeight, child: textWidget);
  }

  String _getFontFamily() {
    switch (fontFamily.toLowerCase()) {
      case FontFamily.titleTextFont:
      case 'bebasneue':
        return 'BebasNeue-Regular';
      case FontFamily.buttonTextFontRegular:
      case 'sfpro':
        return 'SF-Pro';
      case FontFamily.buttonTextFontMedium:
      case 'sfpro-medium':
        return 'SF-Pro-Medium';
      case FontFamily.normalTextFontMedium:
        return 'Jost-Medium';
      default:
        return 'Jost-Regular';
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment() {
    switch (textAlign) {
      case TextAlign.center:
        return CrossAxisAlignment.center;
      case TextAlign.end:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

  double _calculateTextWidth(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: _getFontFamily(),
          fontSize: (fontSize ?? 16.sp),
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}

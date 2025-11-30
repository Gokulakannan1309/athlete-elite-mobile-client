import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool darkIcons;
  final Color backgroundColor;
  final bool isAvoidbottom;
  final Future<bool> Function()? onWillPop;

  const AppScaffold({
    super.key,
    required this.body,
    this.darkIcons = false,
    this.backgroundColor = AppColors.screenBackgroundColor,
    this.isAvoidbottom = false,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkIcons ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: WillPopScope(
        onWillPop: onWillPop ??
            () async {
              return true;
            },
        child: Scaffold(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: isAvoidbottom ? true : false,
          body: SafeArea(child: body),
        ),
      ),
    );
  }
}

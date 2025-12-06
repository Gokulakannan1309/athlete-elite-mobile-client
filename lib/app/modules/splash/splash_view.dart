import 'dart:async';
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Start splash timer
    Timer(const Duration(seconds: 2), _onInitUser);
  }

  Future<void> _onInitUser() async {
    final athleteBox = Hive.box<AthleteUser>('athlete_user');
    final loggedAthlete = athleteBox.get('current_user');
    final fanBox = Hive.box<FanUserModel>('fan_user');
    final loggedFan = fanBox.get('current_user');

    if (loggedAthlete != null) {
      debugPrint('Welcome back, ${loggedAthlete.name}');
      NavigationHelper.offAllNamed(
        AppRoutes.atheleteLandingScreen,
        arguments: {'isAthlete': true},
        transition: Transition.rightToLeft,
      );
    } else if (loggedFan != null) {
      debugPrint('Welcome back, ${loggedFan.name}');
      NavigationHelper.offAllNamed(
        AppRoutes.fanLandingView,
        arguments: {'isAthlete': false},
        transition: Transition.rightToLeft,
      );
    } else {
      NavigationHelper.offAllNamed(
        AppRoutes.onboardScreenView,
        arguments: {'isAthlete': false},
        transition: Transition.rightToLeft,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.sports_martial_arts,
            //   size: 80,
            //   color: Colors.white,
            // ),
            const SizedBox(height: 20),
            const Text(
              'Atlete Elite',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            // const Text(
            //   'Powering Your Sports Journey',
            //   style: TextStyle(
            //     fontSize: 14,
            //     color: Colors.white70,
            //   ),
            // ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.white70,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/lang/app_translations.dart';
import 'package:athlete_elite/app/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkService.init();
  await Hive.initFlutter();
  Hive.registerAdapter(AthleteUserAdapter());
  Hive.registerAdapter(FanUserModelAdapter());
  await Hive.openBox<AthleteUser>('athlete_user');
  await Hive.openBox<FanUserModel>('fan_user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Athlete App',
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          home: child,
        );
      },

      // child:
    );
  }
}

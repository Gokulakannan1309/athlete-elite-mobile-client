import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/lang/app_translations.dart';
import 'package:athlete_elite/app/localization/app_translations.dart';
import 'package:athlete_elite/app/services/network_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 1));
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD41kH9T5B0NHiQq8bSalVPhrGJnv6UxZo",
      appId: "1:464569309566:android:758ee8ef7f9fabc7be3b2f",
      messagingSenderId: "464569309566",
      projectId: "testing-elite-7be52",
      storageBucket: "testing-elite-7be52.firebasestorage.app",
    ),
  );

  await LocaleService.init();
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
          locale: LocaleService.currentLocale,
          fallbackLocale: const Locale('en', 'US'),
          home: child,
        );
      },

      // child:
    );
  }
}

class LocaleService {
  static Locale currentLocale = const Locale('en', 'US');

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('language');

    if (lang != null) {
      currentLocale = Locale(lang, lang.toUpperCase());
    }
  }

  static Future<void> changeLocale(String lang) async {
    currentLocale = Locale(lang, lang.toUpperCase());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }
}

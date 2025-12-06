import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/common_text_field.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../../routes/navigation_helper.dart';

class OnboardScreenView extends StatefulWidget {
  const OnboardScreenView({super.key});

  @override
  State<OnboardScreenView> createState() => _OnboardScreenViewState();
}

class _OnboardScreenViewState extends State<OnboardScreenView> {
  final formKey = GlobalKey<FormState>();
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  final emailOrUsernameOrPhoneController = TextEditingController();

  final passwordController = TextEditingController();

  final isLoading = false.obs;

  final isGSSOLoading = false.obs;

  final isButtonDisabled = true.obs;

  @override
  initState() {
    super.initState();
    emailOrUsernameOrPhoneController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonDisabled.value = emailOrUsernameOrPhoneController.text.isEmpty ||
        passwordController.text.isEmpty;
  }

  @override
  void dispose() {
    emailOrUsernameOrPhoneController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    // emailOrUsernameOrPhoneController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    NavigationHelper.toNamed(
                      AppRoutes.login,
                      arguments: {'isAthlete': true},
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Container(
                    height: 37.h,
                    width: 37.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 0.8,
                      ),
                      color: AppColors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/icons/athlete.png",
                        height: 10.h,
                        width: 10.w,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Log In".tr.toUpperCase(),
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.barlowSemiCondensed().fontFamily,
                              color: AppColors.primaryColor,
                              fontSize: 26.sp,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          AppText(
                            "welcome Fan",
                            color: AppColors.white,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 17.h),
                          CommonTextField(
                            controller: emailOrUsernameOrPhoneController,
                            label: "Username, Email or Phone no.".tr,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please Enter Username, Email or Phone no.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.h),
                          CommonTextField(
                            controller: passwordController,
                            label: "Enter Password".tr,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please Enter Password.'.tr;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                NavigationHelper.toNamed(
                                  AppRoutes.forgotPasswordRequestScreen,
                                  arguments: {'isAthlete': false},
                                  transition: Transition.rightToLeft,
                                );
                              },
                              child: AppText(
                                "Forgot Password ?".tr,
                                color: Colors.white70,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                useCustomUnderline: true,
                                decorationColor: Colors.white70,
                                textDecoration: TextDecoration.underline,
                                underlineOffset: 1.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => CommonButton(
                  text: "Sign In".tr,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final result = await apiProvider.post(
                        ApiEndpoints.fanLogin,
                        {
                          'identifier': emailOrUsernameOrPhoneController.text,
                          'password': passwordController.text
                        },
                        isLoading: isLoading,
                      );

                      if (result.success) {
                        AppLogger.d(result.data);

                        final data = result.data['data'];
                        final message = result.message ?? '';
                        final userJson = data['user'];
                        final user = FanUserModel.fromJson({
                          'id': userJson['id'],
                          'email': userJson['email'],
                          'userName': userJson['username'],
                          'name': userJson['name'],
                          'role': userJson['role'],
                          'status': userJson['status'],
                        });

                        final userBox = Hive.box<FanUserModel>('fan_user');
                        await userBox.put('current_user', user);

                        final tokenBox = await Hive.openBox('auth_token');
                        await tokenBox.put(
                            'access_token', data['access_token']);
                        final token = data['access_token'];
                        await Get.find<ApiProvider>().setAccessToken(token);
                        await getFcmToken();
                        Get.put(FanLandingController());
                        NavigationHelper.offAllNamed(
                          AppRoutes.fanLandingView,
                          arguments: {'isAthlete': false},
                          transition: Transition.rightToLeft,
                        );
                        CustomToast.show(message);
                        CustomToast.show("Login Successfully.");
                      } else {
                        AppLogger.d('Error: ${result.message}');
                      }
                    } else {
                      CustomToast.show("Please Enter the required fields.");
                    }
                  },
                  isDisabled: isButtonDisabled.value,
                  isLoading: isLoading.value,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 10.h),
              AppText("Or", color: AppColors.white, fontSize: 14.sp),
              SizedBox(height: 10.h),
              Obx(
                () => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 13.2,
                      horizontal: 16,
                    ),
                  ),
                  onPressed: isGSSOLoading.value ? null : () {},
                  child: isGSSOLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/google.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Sign In with Google'.tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "Don’t have an Account? ".tr,
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                  InkWell(
                    onTap: () {
                      NavigationHelper.toNamed(
                        AppRoutes.fanSignupView,
                        arguments: {'isAthlete': false},
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: AppText(
                      'Sign Up'.tr,
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

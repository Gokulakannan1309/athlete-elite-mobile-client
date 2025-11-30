import 'dart:async';

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ResetPasswordController extends GetxController {
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  final resetPasswordViewFormKey = GlobalKey<FormState>();
  final forgotPasswordRequestFormKey = GlobalKey<FormState>();
  final forgotpasswordOtpformKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isButtonDisabled = true.obs;
  final forgotPasswordEmailController = TextEditingController();
  final forgotPasswordOtpController = TextEditingController();
  final forgotPasswordIsButtonDisabled = true.obs;

  RxInt secondsRemaining = 30.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    newPasswordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);

    forgotPasswordEmailController.addListener(_forgotpasswordButtonState);
    startOtpTimer();
  }

  void startOtpTimer() {
    secondsRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtpTimer() async {
    final result = await apiProvider.post(
      ApiEndpoints.athleteForgotPasswordResendOtp,
      {
        'identifier': forgotPasswordEmailController.text,
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("OTP successfully has been resent to your email.");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  void _updateButtonState() {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$');

    bool isInvalid = newPassword.isEmpty ||
        confirmPassword.isEmpty ||
        !passwordRegex.hasMatch(newPassword) ||
        confirmPassword != newPassword;
    isButtonDisabled.value = isInvalid;
  }

  void _forgotpasswordButtonState() {
    isButtonDisabled.value = forgotPasswordEmailController.text.isEmpty;
  }

  Future<void> onSavePassword(bool isFirstTimerReset, bool isAthlete,
      {String? userId, String? resetToken}) async {
    if (isFirstTimerReset || (userId != null && userId.isNotEmpty)) {
      final userBox = Hive.box<AthleteUser>('athlete_user');
      final loggedUser = userBox.get('current_user');

      if (loggedUser != null || (userId != null && userId.isNotEmpty)) {
        AppLogger.d('Logged in user ID, ${loggedUser?.id} and $userId');
        final result = await apiProvider.post(
          isAthlete
              ? ApiEndpoints.athleteFirstTimerResetPassword
              : ApiEndpoints.fanResetPassword,
          {
            'userId': loggedUser?.id ?? userId,
            'newPassword': newPasswordController.text,
            'confirmPassword': confirmPasswordController.text
          },
          isLoading: isLoading,
        );
        AppLogger.d(result);
        if (result.success) {
          AppLogger.d(result.data);
          CustomToast.show("Successfully Saved Details");
          final data = result.data['data'];

          final userJson = data['user'];
          final user = AthleteUser.fromJson({
            'id': userJson['id'],
            'email': userJson['email'],
            // 'userName': userJson['username'],
            'name': userJson['name'],
            'role': userJson['role'],
            'status': userJson['status'],
            'firstTimeLogin': false,
          });

          final userBox = Hive.box<AthleteUser>('athlete_user');
          await userBox.put('current_user', user);

          final tokenBox = await Hive.openBox('auth_token');
          await tokenBox.put('access_token', data['access_token']);
          final token = data['access_token'];
          await Get.find<ApiProvider>().setAccessToken(token);
          NavigationHelper.toNamed(
            AppRoutes.prefferedLanguageScreen,
            arguments: {'isAthlete': isAthlete, 'userId': user.id},
            transition: Transition.rightToLeft,
          );
        } else {
          AppLogger.d('Error: ${result.message}');
        }
      }
    } else {
      AppLogger.d("the reset token is $resetToken");
      apiProvider.dio.options.headers['Authorization'] = 'Bearer $resetToken';
      final result = await apiProvider.post(
        isAthlete
            ? ApiEndpoints.athleteResetPassword
            : ApiEndpoints.fanResetPassword,
        {
          'newPassword': newPasswordController.text,
          'confirmPassword': confirmPasswordController.text
        },
        isLoading: isLoading,
      );
      AppLogger.d(result);
      if (result.success) {
        AppLogger.d(result.data);
        CustomToast.show("Successfully Saved Details");
        if (isAthlete) {
          NavigationHelper.offAllNamed(
            AppRoutes.login,
            arguments: {'isAthlete': isAthlete},
            transition: Transition.rightToLeft,
          );
        } else {
          NavigationHelper.toNamed(
            AppRoutes.fanLandingView,
            arguments: {'isAthlete': isAthlete},
            transition: Transition.rightToLeft,
          );
        }
      } else {
        AppLogger.e("Error: ${result.message}");
      }
    }
  }

  Future<bool> onForgotPasswordRequest(String otpType, bool isAthlete) async {
    final result = await apiProvider.post(
      isAthlete
          ? ApiEndpoints.athleteForgotPasswordRequest
          : ApiEndpoints.fanForgotPasswordRequest,
      {'identifier': forgotPasswordEmailController.text},
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(
          "result.data['data']['userId'] ${result.data['data']['userId']}");
      AppLogger.d(result.data);
      CustomToast.show("OTP has been sent to your $otpType.");
      startOtpTimer();
      NavigationHelper.toNamed(
        AppRoutes.forgotPasswordOTPScreen,
        arguments: {
          'isAthlete': isAthlete,
          'userId': result.data['data']['userId']
        },
        transition: Transition.rightToLeft,
      );
      return result.success;
    } else {
      AppLogger.d('Error: ${result.message}');
      return result.success;
    }
  }

  Future<void> onForgotPasswordOTPVerify(bool isAthlete, String userId) async {
    final result = await apiProvider.post(
      isAthlete
          ? ApiEndpoints.athleteForgotPasswordVerify
          : ApiEndpoints.fanForgotPasswordVerify,
      {
        'identifier': forgotPasswordEmailController.text,
        'otp': forgotPasswordOtpController.text
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("OTP has been verified. Please reset your password.");
      NavigationHelper.toNamed(
        AppRoutes.atheleteResetPassword,
        arguments: {
          'isAthlete': isAthlete,
          'userId': '',
          'resetToken': result.data['data']['resetToken']
        },
        transition: Transition.rightToLeft,
      );
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  @override
  void onClose() {
    newPasswordController.removeListener(_updateButtonState);
    confirmPasswordController.removeListener(_updateButtonState);
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/request_model/athlete_login_requested.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LoginController extends GetxController {
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  final formKey = GlobalKey<FormState>();
  final emailOrUsernameOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final isButtonDisabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrUsernameOrPhoneController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonDisabled.value = emailOrUsernameOrPhoneController.text.isEmpty ||
        passwordController.text.isEmpty;
  }

  Future<void> login(bool isAthlete) async {
    if (formKey.currentState!.validate()) {
      final result = await apiProvider.post(
        ApiEndpoints.athleteLogin,
        AthleteLoginRequested(
          identifier: emailOrUsernameOrPhoneController.text,
          password: passwordController.text,
        ),
        isLoading: isLoading,
      );

      if (result.success) {
        AppLogger.d(result.data);

        final data = result.data['data'];
        final message = result.message ?? '';

        final userJson = data['user'];
        final user = AthleteUser.fromJson({
          'id': userJson['id'],
          'email': userJson['email'],
          // 'userName': userJson['username'],
          'name': userJson['name'],
          'role': userJson['role'],
          'status': userJson['status'],
          'firstTimeLogin': userJson['firstTimeLogin'] ?? false,
        });

        final userBox = Hive.box<AthleteUser>('athlete_user');
        await userBox.put('current_user', user);

        final tokenBox = await Hive.openBox('auth_token');
        await tokenBox.put('access_token', data['access_token']);
        final token = data['access_token'];
        await Get.find<ApiProvider>().setAccessToken(token);
        await getFcmToken();

        NavigationHelper.toNamed(
          AppRoutes.atheleteLandingScreen,
          arguments: {'isAthlete': isAthlete},
          transition: Transition.rightToLeft,
        );

        CustomToast.show("Login Successfully.");
      } else {
        AppLogger.d('Error: ${result.message}');
        if (result.message ==
            'First-time login. Please change your password.') {
          AppLogger.d("result.data ${result}");
          final userId = result.data?['data']?['userId'] ??
              result.error?['data']?['userId'];
          AppLogger.d("userId $userId");
          if (userId != null) {
            NavigationHelper.toNamed(
              AppRoutes.atheleteResetPassword,
              arguments: {
                'isAthlete': isAthlete,
                'isFirstTimeLogin': true,
                'userId': userId,
              },
              transition: Transition.rightToLeft,
            );
          } else {
            AppLogger.d('userId is null in first-time login response');
          }
        }
      }
    } else {
      CustomToast.show("Please Enter Username, Email or Phone no.");
    }
  }

  @override
  void onClose() {
    emailOrUsernameOrPhoneController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    // emailOrUsernameOrPhoneController.dispose();
    // passwordController.dispose();
    super.onClose();
  }
}

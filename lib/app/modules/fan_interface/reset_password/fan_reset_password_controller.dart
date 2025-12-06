import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FanResetPasswordController extends GetxController {
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isButtonDisabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    newPasswordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonDisabled.value = newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty;
  }

  Future<bool> onFanSetPassword(String userId, bool isAthlete) async {
    final result = await apiProvider.post(
      ApiEndpoints.fanfirstTimerSetPassword,
      {
        "userId": userId,
        "newPassword": newPasswordController.text,
        "confirmPassword": confirmPasswordController.text,
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
     AppLogger.d("Access Token: ${result.data['data']['access_token']}");
      NavigationHelper.toNamed(
        AppRoutes.aboutMeDetailScreen,
        arguments: {
          'isAthlete': isAthlete,
          'userId': userId,
          "accessToken": result.data['data']['access_token']
        },
        transition: Transition.rightToLeft,
      );
      CustomToast.show("Password Reset Successful");
      return result.success;
    } else {
      AppLogger.d('Error: ${result.message}');
      return result.success;
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

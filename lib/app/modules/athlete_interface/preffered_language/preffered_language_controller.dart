import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PrefferedLanguageController extends GetxController {
  RxString selectedLang = 'en'.obs;
  final isLoading = false.obs;

  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  void selectLanguage(String lang) {
    selectedLang.value = lang;
  }

  Future<bool> onLanguagePreferenceRequest(String userId) async {
    print("the user id is $userId");
    print("selectedLang.value is ${selectedLang.value}");
    final result = await apiProvider.post(
      ApiEndpoints.athleteLanguagePreference,
      {
        'userId': userId,
        'language': selectedLang.value == 'en' ? 'English' : 'Spanish'
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
      NavigationHelper.toNamed(
        AppRoutes.setProfilePicScreen,
        arguments: {'isAthlete': true, 'userId': userId},
        transition: Transition.rightToLeft,
      );
      return result.success;
    } else {
      AppLogger.d('Error: ${result.error}');
      return result.success;
    }
  }
}

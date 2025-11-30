import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AthleteSettingsController>(
      () => AthleteSettingsController(),
    );
  }
}

import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:get/get.dart';


class FanLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FanLandingController>(
      () => FanLandingController(),
    );
  }
}

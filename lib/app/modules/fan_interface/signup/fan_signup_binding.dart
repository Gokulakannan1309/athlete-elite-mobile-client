import 'package:athlete_elite/app/modules/fan_interface/signup/fan_signup_controller.dart';
import 'package:get/get.dart';


class FanSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FanSignupController>(() => FanSignupController());
  }
}

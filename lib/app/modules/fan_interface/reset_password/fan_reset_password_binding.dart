import 'package:athlete_elite/app/modules/fan_interface/reset_password/fan_reset_password_controller.dart';
import 'package:get/get.dart';


class FanResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FanResetPasswordController>(() => FanResetPasswordController());
  }
}

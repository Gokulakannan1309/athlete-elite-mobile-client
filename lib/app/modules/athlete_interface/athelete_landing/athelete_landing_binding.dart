import 'package:get/get.dart';

import 'athelete_landing_controller.dart';

class AtheleteLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtheleteLandingController>(() => AtheleteLandingController());
  }
}
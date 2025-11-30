import 'package:get/get.dart';

import 'set_profile_pic_controller.dart';

class SetProfilePicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetProfilePicController>(() => SetProfilePicController());
  }
}
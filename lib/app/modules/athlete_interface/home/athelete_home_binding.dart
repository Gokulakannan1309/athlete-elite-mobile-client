import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:get/get.dart';

import 'athelete_home_controller.dart';

class AtheleteHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtheleteHomeController>(() => AtheleteHomeController());
    Get.lazyPut<MediaPickerController>(() => MediaPickerController());
  }
}

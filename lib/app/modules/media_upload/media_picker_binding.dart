import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:get/get.dart';

class MediaPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaPickerController>(() => MediaPickerController());
  }
}

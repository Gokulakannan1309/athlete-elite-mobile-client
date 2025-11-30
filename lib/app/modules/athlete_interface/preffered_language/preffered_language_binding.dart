import 'package:get/get.dart';

import 'preffered_language_controller.dart';
class PrefferedLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrefferedLanguageController>(() => PrefferedLanguageController());
  }
}

import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/athlete_profile_view_controller.dart';
import 'package:get/get.dart';

class AthleteProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AthleteProfileViewController>(
        () => AthleteProfileViewController());
  }
}

import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/services/network_service.dart';
import 'package:get/get.dart';

class NavigationHelper {
  /// Navigate to a route with custom transition
  static Future<void> toNamed(
    String routeName, {
    dynamic arguments,
    Transition? transition,
    Duration? duration,
    bool preventDuplicates = true,
  }) async {
    final connected = await NetworkService.isConnectedNow();
    if (connected) {
      Get.toNamed(
        routeName,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      );
    } else {
      Get.toNamed(
        AppRoutes.noInternetScreen,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      );
    }
  }

  /// Navigate off all previous routes
  static Future<void> offAllNamed(
    String routeName, {
    dynamic arguments,
    Transition? transition,
    Duration? duration,
  }) async {
    final connected = await NetworkService.isConnectedNow();
    if (connected) {
      Get.offAllNamed(routeName, arguments: arguments);
    } else {
      Get.toNamed(AppRoutes.noInternetScreen, arguments: arguments);
    }
  }

  /// Replace current screen with a new one
  static Future<void> offNamed(
    String routeName, {
    dynamic arguments,
    Transition? transition,
    Duration? duration,
  }) async {
    final connected = await NetworkService.isConnectedNow();
    if (connected) {
      Get.offNamed(routeName, arguments: arguments);
    } else {
      Get.toNamed(AppRoutes.noInternetScreen, arguments: arguments);
    }
  }

  /// Go back
  static void back({dynamic result}) {
    if (Get.key.currentState?.canPop() ?? false) {
      Get.back(result: result);
    }
  }
}

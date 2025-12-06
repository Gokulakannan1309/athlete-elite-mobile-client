import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class SetProfilePicController extends GetxController {
  final isLoading = false.obs;
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  Future<void> uploadProfilePicture(
    MediaPickerController mediaPickerController,
    String userId,
  ) async {
    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return;
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.post(
      "${ApiEndpoints.updateFanProfilePicture}?userId=${userId}",
      formData,
      isLoading: isLoading,
    );

    if (result.success) {
      AppLogger.d("update profile picture ${result.data}");
    } else {
      AppLogger.d(result.error);
    }
  }
}

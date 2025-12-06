import 'dart:io';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MediaPickerController extends GetxController {
  final ImagePicker picker = ImagePicker();

  final RxList<SelectedMedia> selectedMedia = <SelectedMedia>[].obs;
  final Rxn<MediaType> currentMediaType = Rxn<MediaType>();

  final RxList<PlatformFile> selectedImages = <PlatformFile>[].obs;
  final RxList<PlatformFile> selectedVideos = <PlatformFile>[].obs;
  final RxList<PlatformFile> selectedMixed = <PlatformFile>[].obs;
  RxBool isImageError = false.obs;
  RxBool isExistingImageRemoved = false.obs;
  VideoPlayerController? videoPlayerController;

  Future<void> initVideo(String filePath) async {
    videoPlayerController?.dispose();
    videoPlayerController = VideoPlayerController.file(File(filePath));
    await videoPlayerController!.initialize();
    videoPlayerController!.setLooping(true);
    update();
  }

  Future<bool> pickSingleImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      selectedImages.assignAll(result.files);
      AppLogger.d("selectedImages ${selectedImages.length}");
      isImageError.value = false;
      return true;
    } else {
      isImageError.value = true;
      return false;
    }
  }

  void clearSelectedImages() {
    selectedImages.clear();
  }

  void removeMixedFile(PlatformFile file) {
    selectedMixed.remove(file);
    update();
  }

  Future<void> pickMultipleImages() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      selectedImages.assignAll(result.files);
    }
  }

  Future<void> pickSingleVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
      allowedExtensions: ['mp4', 'mov', 'avi'],
    );

    AppLogger.d("the result of pickSingleVideo is $result");

    if (result != null) {
      selectedVideos.assignAll(result.files);
      if (result.files.first.path != null) {
        await initVideo(result.files.first.path!);
      }
    }
    AppLogger.d("the selectedVideos is ${selectedVideos.length}");
  }

  Future<void> pickMultipleVideos() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );

    if (result != null) {
      selectedVideos.assignAll(result.files);
      videoPlayerController?.dispose();
      videoPlayerController = null;

      if (selectedVideos.isNotEmpty && selectedVideos.first.path != null) {
        await initVideo(selectedVideos.first.path!);
      }
    }
  }

  // NEW FUNCTION: Convert PlatformFile to SelectedMedia
  Future<void> convertMixedToSelectedMedia() async {
    selectedMedia.clear();

    for (var file in selectedMixed) {
      final ext = file.extension?.toLowerCase() ?? "";

      if (['jpg', 'jpeg', 'png'].contains(ext)) {
        // It's an image
        selectedMedia.add(
          SelectedMedia(
            file: File(file.path!),
            type: MediaType.image,
          ),
        );
      } else if (['mp4', 'mov', 'avi'].contains(ext)) {
        // It's a video
        selectedMedia.add(
          SelectedMedia(
            file: File(file.path!),
            type: MediaType.video,
          ),
        );
      }
    }

    // Set the media type based on what's selected
    if (selectedMedia.isNotEmpty) {
      // Check if all items are of the same type
      bool allImages = selectedMedia.every((m) => m.type == MediaType.image);
      bool allVideos = selectedMedia.every((m) => m.type == MediaType.video);

      if (allImages) {
        currentMediaType.value = MediaType.image;
      } else if (allVideos) {
        currentMediaType.value = MediaType.video;
      } else {
        // Mixed content - you can define a new MediaType.mixed or handle it
        currentMediaType.value = MediaType.image; // Default to image
      }
    }

    AppLogger.d("Converted ${selectedMedia.length} items to SelectedMedia");
  }

  Future<void> pickMixedMedia(bool isEnableBottomSheet,
      {bool allowMultiple = true, bool isSendToStudio = false}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: allowMultiple,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mov', 'avi'],
    );

    if (result != null) {
      selectedMixed.assignAll(result.files);
      videoPlayerController?.dispose();
      videoPlayerController = null;

      // Find and initialize the first video
      for (var file in selectedMixed) {
        final ext = file.extension?.toLowerCase() ?? "";
        AppLogger.d("the ext is $ext");
        if (["mp4", "mov", "avi"].contains(ext)) {
          if (file.path != null) {
            await initVideo(file.path!);
            break;
          }
        }
      }

      // Convert to SelectedMedia format
      await convertMixedToSelectedMedia();

      update();
      if (isEnableBottomSheet) {
        if (isSendToStudio) {
          showBottomSheet(false, false, true);
        } else {
          showBottomSheet(true, true, false);
        }
      }
    }
  }

  void clearImages() => selectedImages.clear();

  void clearVideos() {
    videoPlayerController?.dispose();
    videoPlayerController = null;
    selectedVideos.clear();
  }

  void clearMixed() {
    videoPlayerController?.dispose();
    videoPlayerController = null;
    selectedMixed.clear();
    selectedMedia.clear();
  }

  Future<void> pickMedia(BuildContext context) async {
    try {
      MediaType? mediaChoice;

      await CustomDialogbox.showCustomPopup(
        title: "Select Media Type",
        buttons: [
          {
            'text': 'Images',
            'onTap': () {
              mediaChoice = MediaType.image;
            },
          },
          {
            'text': 'Video',
            'onTap': () {
              mediaChoice = MediaType.video;
            },
          },
        ],
      );

      if (mediaChoice == null) return;

      if (currentMediaType.value != null &&
          currentMediaType.value != mediaChoice) {
        bool? shouldClear;

        await CustomDialogbox.showCustomPopup(
          title:
              "Already some ${currentMediaType.value == MediaType.image ? 'images' : 'videos'} are selected. Do you want to clear and continue?",
          buttons: [
            {
              'text': 'Cancel',
              'color': Colors.grey,
              'onTap': () {
                shouldClear = false;
              },
            },
            {
              'text': 'Continue',
              'color': AppColors.primaryColor,
              'onTap': () {
                shouldClear = true;
              },
            },
          ],
        );

        if (shouldClear != true) return;

        selectedMedia.clear();
        currentMediaType.value = null;
      }

      if (mediaChoice == MediaType.image) {
        await pickImages();
      } else {
        await pickVideo();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error picking media: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> pickImages() async {
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      currentMediaType.value = MediaType.image;
      selectedMedia.addAll(
        images.map(
          (img) => SelectedMedia(file: File(img.path), type: MediaType.image),
        ),
      );
      showBottomSheet(true, true, false);
    }
  }

  Future<void> pickVideo() async {
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      currentMediaType.value = MediaType.video;
      selectedMedia.value = [
        SelectedMedia(file: File(video.path), type: MediaType.video),
      ];
      showBottomSheet(true, true, false);
    }
  }

  Future<void> pickVideoToUpload() async {
    AtheleteLandingController controller = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      final savedPath = await saveToTempDirectory(video);

      controller.introVideoPath.value = savedPath;

      final thumb = await _generateVideoThumbnail(savedPath);
      controller.introThumbnail.value = thumb;

      AppLogger.d("Video saved: $savedPath");
      AppLogger.d("Thumbnail saved: $thumb");
    }
  }

  Future<String> _generateVideoThumbnail(String videoPath) async {
    return await VideoThumbnail.thumbnailFile(
          video: videoPath,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";
  }

  Future<String> saveToTempDirectory(XFile xfile) async {
    final dir = await getTemporaryDirectory();
    final newPath = "${dir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4";
    final newFile = await File(xfile.path).copy(newPath);
    return newFile.path;
  }

  Future<String?> _buildMediaPreview(PlatformFile media) async {
    final ext = media.extension?.toLowerCase() ?? "";

    if (['jpg', 'jpeg', 'png'].contains(ext)) {
      return media.path;
    }

    if (['mp4', 'mov', 'avi'].contains(ext)) {
      return await VideoThumbnail.thumbnailFile(
        video: media.path!,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 300,
        quality: 75,
      );
    }

    return null;
  }

  void showBottomSheet(bool? ischannel, bool? isStory, bool? isUpload) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.3,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.w),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => AppText(
                      '${selectedMedia.length} ${_getMediaTypeText()} Selected',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Obx(
                        () => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedMixed.length,
                          separatorBuilder: (_, __) => SizedBox(width: 8.w),
                          itemBuilder: (context, index) {
                            final media = selectedMixed[index];

                            return FutureBuilder(
                              future: _buildMediaPreview(media),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    width: 110.w,
                                    height: 100.h,
                                    color: Colors.grey[300],
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2)),
                                  );
                                }

                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 110.w,
                                        height: 100.h,
                                        child: Image.file(
                                          File(snapshot.data!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Video indicator
                                    // if (['mp4', 'mov', 'avi'].contains(
                                    //     media.extension?.toLowerCase() ?? ""))
                                    //   Positioned(
                                    //     bottom: 6,
                                    //     left: 6,
                                    //     child: Container(
                                    //       padding: const EdgeInsets.all(4),
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.black54,
                                    //         borderRadius:
                                    //             BorderRadius.circular(4),
                                    //       ),
                                    //       child: const Icon(
                                    //         Icons.play_circle_outline,
                                    //         color: Colors.white,
                                    //         size: 20,
                                    //       ),
                                    //     ),
                                    //   ),
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      child: GestureDetector(
                                        onTap: () => removeMixedMedia(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.close,
                                              color: Colors.white, size: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Visibility(
                              visible: ischannel ?? false,
                              child: MaterialButton(
                                onPressed: () => handleUpload('channel'),
                                color: AppColors.screenBackgroundColor,
                                textColor: AppColors.white,
                                height: 45.h,
                                minWidth: double.infinity,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color: AppColors.lightRed, width: 2),
                                ),
                                child: Text(
                                  "Channel",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              )),
                          Visibility(
                              visible: isUpload ?? false,
                              child: MaterialButton(
                                  onPressed: () => handleUpload('upload'),
                                  color: AppColors.screenBackgroundColor,
                                  textColor: AppColors.white,
                                  height: 45.h,
                                  minWidth: double.infinity,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ))),
                          SizedBox(height: 12.h),
                          Visibility(
                            visible: isStory ?? false,
                            child: MaterialButton(
                              onPressed: () => handleUpload('story'),
                              color: AppColors.screenBackgroundColor,
                              textColor: AppColors.white,
                              height: 45.h,
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                    color: AppColors.primaryColor, width: 2),
                              ),
                              child: Text(
                                "Story",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
    );
  }

  // Helper method to get media type text
  String _getMediaTypeText() {
    if (selectedMedia.isEmpty) return 'Items';

    bool hasImages = selectedMedia.any((m) => m.type == MediaType.image);
    bool hasVideos = selectedMedia.any((m) => m.type == MediaType.video);

    if (hasImages && hasVideos) {
      return 'Items'; // Mixed
    } else if (hasImages) {
      return selectedMedia.length > 1 ? 'Images' : 'Image';
    } else if (hasVideos) {
      return selectedMedia.length > 1 ? 'Videos' : 'Video';
    }
    return 'Items';
  }

  void removeMixedMedia(int index) {
    selectedMixed.removeAt(index);
    selectedMedia.removeAt(index);

    if (selectedMedia.isEmpty) {
      currentMediaType.value = null;
      Get.back();
    } else {
      // Update media type if needed
      bool allImages = selectedMedia.every((m) => m.type == MediaType.image);
      bool allVideos = selectedMedia.every((m) => m.type == MediaType.video);

      if (allImages) {
        currentMediaType.value = MediaType.image;
      } else if (allVideos) {
        currentMediaType.value = MediaType.video;
      }
    }
    update();
  }

  void removeMedia(int index) {
    selectedMedia.removeAt(index);
    if (selectedMedia.isEmpty) {
      currentMediaType.value = null;
      Get.back();
    }
  }

  void handleUpload(String uploadType) {
    Get.back();

    AppLogger.d("Uploading ${selectedMedia.length} items");
    AppLogger.d("Media type: ${currentMediaType.value}");

    if (uploadType == 'channel') {
      NavigationHelper.toNamed(
        AppRoutes.athleteUploadChannelSelectScreen,
        arguments: {
          'sheetType': 'post-new',
          'isAthlete': true,
          'mediaType': currentMediaType.value ?? MediaType.image,
          'selectedMedia': selectedMedia,
        },
        transition: Transition.rightToLeft,
      );
    } else if (uploadType == 'story') {
      NavigationHelper.toNamed(
        AppRoutes.athleteUploadChannelSelectScreen,
        arguments: {
          'sheetType': 'story-new',
          'isAthlete': true,
          'mediaType': currentMediaType.value ?? MediaType.image,
          'selectedMedia': selectedMedia,
        },
        transition: Transition.rightToLeft,
      );
    } else if (uploadType == 'upload') {
      NavigationHelper.toNamed(
        AppRoutes.atheleteSendToStudioScreen,
        arguments: {
          'isAthlete': true,
          'mediaType': currentMediaType.value ?? MediaType.image,
          'selectedMedia': selectedMedia,
        },
        transition: Transition.rightToLeft,
      );
    }
    if (onUploadCallback != null) {
      onUploadCallback!(List.from(selectedMedia), uploadType);
    }
  }

  void resetSelection() {
    selectedMedia.clear();
    selectedMixed.clear();
    currentMediaType.value = null;
  }

  Function(List<SelectedMedia> media, String uploadType)? onUploadCallback;

  @override
  void onClose() {
    selectedMedia.clear();
    selectedMixed.clear();
    videoPlayerController?.dispose();
    super.onClose();
  }
}

// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/filter_screen/image_filter/image_filter_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as IMG;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class ImageFilterController extends GetxController {
  /// INPUT
  final List<SelectedMedia> selectedMedia;
  final Map<String, String> filters;

  ImageFilterController({
    required this.selectedMedia,
    required this.filters,
  });

  /// OBSERVABLES
  final RxBool isGeneratingThumbnails = false.obs;
  final RxBool isGeneratingTopImage = false.obs;
  final RxBool isVideoInitialized = false.obs;
  final RxBool isApplyingFilter = false.obs;

  final RxString topImagePath = "".obs; // For images
  final RxString currentVideoPath = "".obs; // For videos
  final RxString videoThumbnailPath = "".obs; // Single thumbnail for video

  final RxSet<String> selectedFilters = <String>{}.obs;

  final Map<String, String> thumbnailCache = {}; // filter → thumbnail path

  VideoPlayerController? videoController;

  int currentIndex = 0;
  String? originalImagePath; // Store original for faster filter switching
  String? originalVideoPath; // Store original video path

  @override
  void onInit() {
    super.onInit();
    initFirstMedia();
  }

  @override
  void onClose() {
    videoController?.dispose();
    super.onClose();
  }

  Future<void> initFirstMedia() async {
    if (selectedMedia.isEmpty) return;
    await onImageChanged(0);
  }

  // ------------------------------------------------------------------------
  // PAGE CHANGE HANDLER
  // ------------------------------------------------------------------------
  Future<void> onImageChanged(int index) async {
    currentIndex = index;

    final media = selectedMedia[index];
    selectedFilters.clear();
    thumbnailCache.clear();

    // Reset video state when changing pages
    isVideoInitialized(false);
    videoController?.dispose();
    videoController = null;

    if (media.type == MediaType.image) {
      topImagePath("");
      currentVideoPath("");
      videoThumbnailPath("");
      await generateTopImage(media);
      // Generate thumbnails in background
      generateImageThumbnails();
      return;
    }

    if (media.type == MediaType.video) {
      topImagePath("");
      await loadVideo(media);
      // Generate video thumbnail and filter previews in background
      generateVideoThumbnails();
    }
  }

  // ------------------------------------------------------------------------
  // IMAGE PROCESSING
  // ------------------------------------------------------------------------
  Future<void> generateTopImage(SelectedMedia media) async {
    isGeneratingTopImage(true);

    try {
      String path = '';

      if (media.file != null) {
        path = media.file!.path;
      } else if (media.networkUrl != null) {
        // Download network image
        final temp = await getTemporaryDirectory();
        final filePath =
            "${temp.path}/net_img_${DateTime.now().millisecondsSinceEpoch}.jpg";

        final file = File(filePath);
        final request = await HttpClient().getUrl(Uri.parse(media.networkUrl!));
        final response = await request.close();
        final bytes = await consolidateHttpClientResponseBytes(response);
        file.writeAsBytesSync(bytes);

        path = filePath;
      }

      if (path.isEmpty) return;

      originalImagePath = path; // Store original
      topImagePath(path);
    } catch (e) {
      print("Error generating top image: $e");
    } finally {
      isGeneratingTopImage(false);
    }
  }

  Future<void> applyMultipleImageFilters() async {
    if (originalImagePath == null || originalImagePath!.isEmpty) return;
    if (selectedFilters.isEmpty) {
      topImagePath(originalImagePath!);
      return;
    }

    isApplyingFilter(true);

    try {
      final temp = await getTemporaryDirectory();
      final output =
          "${temp.path}/filtered_${DateTime.now().millisecondsSinceEpoch}.jpg";

      // Use original image for better quality
      var img = IMG.decodeImage(File(originalImagePath!).readAsBytesSync());
      if (img == null) return;

      // Apply all selected filters in sequence
      for (final filterName in selectedFilters) {
        img = applyImageFilterToImage(img!, filterName);
      }

      File(output).writeAsBytesSync(IMG.encodeJpg(img!, quality: 95));
      topImagePath(output);
    } catch (e) {
      print("Error applying image filters: $e");
    } finally {
      isApplyingFilter(false);
    }
  }

  IMG.Image applyImageFilterToImage(IMG.Image img, String filterName) {
    switch (filterName.toLowerCase()) {
      case "grayscale":
      case "gray":
        return IMG.grayscale(img);
      case "invert":
        return IMG.invert(img);
      case "sepia":
        return IMG.sepia(img);
      case "vignette":
        return IMG.vignette(img);
      case "blur":
        return IMG.gaussianBlur(img, radius: 5);
      case "sharpen":
        return IMG.convolution(img, filter: [0, -1, 0, -1, 5, -1, 0, -1, 0]);
      case "emboss":
        return IMG.emboss(img);
      case "smooth":
        return IMG.smooth(img, weight: 10);
      default:
        return img;
    }
  }

  // ------------------------------------------------------------------------
  // FAST IMAGE THUMBNAIL GENERATION
  // ------------------------------------------------------------------------
  Future<void> generateImageThumbnails() async {
    if (originalImagePath == null || originalImagePath!.isEmpty) return;

    isGeneratingThumbnails(true);

    try {
      final originalImg =
          IMG.decodeImage(File(originalImagePath!).readAsBytesSync());
      if (originalImg == null) return;

      // Resize image for faster thumbnail generation
      final thumbnail = IMG.copyResize(originalImg, width: 300);

      final temp = await getTemporaryDirectory();

      // Generate thumbnails for each filter in parallel
      final futures = filters.entries.map((entry) async {
        final name = entry.key;

        // Apply the actual filter to thumbnail
        final filtered = applyImageFilterToImage(thumbnail, name);

        final thumbPath =
            "${temp.path}/thumb_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
        File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

        thumbnailCache[name] = thumbPath;
      }).toList();

      await Future.wait(futures);

      // Force UI update
      thumbnailCache.addAll({}); // Trigger observable
    } catch (e) {
      print("Error generating thumbnails: $e");
    } finally {
      isGeneratingThumbnails(false);
    }
  }

  // ------------------------------------------------------------------------
  // VIDEO LOADING LOGIC
  // ------------------------------------------------------------------------
  Future<void> loadVideo(SelectedMedia media) async {
    isGeneratingTopImage(true);
    isVideoInitialized(false);

    try {
      String path;

      if (media.file != null) {
        path = media.file!.path;
      } else if (media.networkUrl != null) {
        final temp = await getTemporaryDirectory();
        final filePath =
            "${temp.path}/net_video_${DateTime.now().millisecondsSinceEpoch}.mp4";

        final file = File(filePath);
        final request = await HttpClient().getUrl(Uri.parse(media.networkUrl!));
        final response = await request.close();
        final bytes = await consolidateHttpClientResponseBytes(response);
        await file.writeAsBytes(bytes);

        path = filePath;
      } else {
        return;
      }

      originalVideoPath = path; // Store original
      currentVideoPath(path);

      // Dispose old controller
      videoController?.dispose();

      // Initialize new controller
      videoController = VideoPlayerController.file(File(path));
      await videoController!.initialize();

      isVideoInitialized(true);
      videoController!.setLooping(true);
      videoController!.play();
    } catch (e) {
      print("Error loading video: $e");
      isVideoInitialized(false);
    } finally {
      isGeneratingTopImage(false);
    }
  }

  // ------------------------------------------------------------------------
  // VIDEO FILTERING - OPTIMIZED WITH MULTIPLE FILTERS
  // ------------------------------------------------------------------------
  Future<void> applyMultipleVideoFilters() async {
    if (originalVideoPath == null || originalVideoPath!.isEmpty) return;

    if (selectedFilters.isEmpty) {
      currentVideoPath(originalVideoPath!);
      await reinitializeVideo(originalVideoPath!);
      return;
    }

    isApplyingFilter(true);
    final wasPlaying = videoController?.value.isPlaying ?? false;

    try {
      videoController?.pause();

      // Build filter chain for multiple filters
      String filterChain = selectedFilters
          .map((name) {
            return filters[name] ?? "null";
          })
          .where((f) => f != "null")
          .join(",");

      if (filterChain.isEmpty) {
        filterChain = "null";
      }

      final temp = await getTemporaryDirectory();
      final output =
          "${temp.path}/vfilter_${DateTime.now().millisecondsSinceEpoch}.mp4";

      // Use faster preset and original video
      final cmd =
          "-i ${originalVideoPath!} -vf $filterChain -c:v libx264 -preset veryfast -crf 23 -c:a copy $output";

      print("FFmpeg command: $cmd");
      final session = await FFmpegKit.execute(cmd);
      final returnCode = await session.getReturnCode();

      if (!ReturnCode.isSuccess(returnCode)) {
        final output = await session.getOutput();
        print("FFmpeg error: $output");
        return;
      }

      currentVideoPath(output);
      await reinitializeVideo(output, playImmediately: wasPlaying);
    } catch (e) {
      print("Error applying video filters: $e");
    } finally {
      isApplyingFilter(false);
    }
  }

  Future<void> reinitializeVideo(String path,
      {bool playImmediately = false}) async {
    try {
      videoController?.dispose();
      videoController = VideoPlayerController.file(File(path));
      await videoController!.initialize();

      isVideoInitialized(true);
      videoController!.setLooping(true);

      if (playImmediately) {
        videoController!.play();
      }
    } catch (e) {
      print("Error reinitializing video: $e");
    }
  }

  // ------------------------------------------------------------------------
  // FAST VIDEO THUMBNAIL GENERATION
  // ------------------------------------------------------------------------
  Future<void> generateVideoThumbnails() async {
    if (originalVideoPath == null || originalVideoPath!.isEmpty) return;

    isGeneratingThumbnails(true);

    try {
      // First, generate ONE base thumbnail from video
      final temp = await getTemporaryDirectory();
      final baseThumbPath =
          "${temp.path}/base_thumb_${DateTime.now().millisecondsSinceEpoch}.jpg";

      // Extract frame at 1 second with smaller size for speed
      final extractCmd =
          "-i ${originalVideoPath!} -ss 00:00:01 -vframes 1 -vf scale=300:-1 $baseThumbPath";
      await FFmpegKit.execute(extractCmd);

      videoThumbnailPath(baseThumbPath);

      // Now apply filters to this ONE thumbnail image
      final baseImg = IMG.decodeImage(File(baseThumbPath).readAsBytesSync());
      if (baseImg == null) return;

      // Generate filter previews in parallel
      final futures = filters.entries.map((entry) async {
        final name = entry.key;

        // Apply image equivalent of video filter
        final filtered = applyImageFilterToImage(baseImg, name);

        final thumbPath =
            "${temp.path}/vthumb_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
        File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

        thumbnailCache[name] = thumbPath;
      }).toList();

      await Future.wait(futures);

      // Force UI update
      thumbnailCache.addAll({});
    } catch (e) {
      print("Error generating video thumbnails: $e");
    } finally {
      isGeneratingThumbnails(false);
    }
  }

  // ------------------------------------------------------------------------
  // FILTER TOGGLE (Add/Remove)
  // ------------------------------------------------------------------------
  Future<void> onFilterTap(String name) async {
    // Toggle filter selection
    if (selectedFilters.contains(name)) {
      selectedFilters.remove(name);
    } else {
      selectedFilters.add(name);
    }

    final media = selectedMedia[currentIndex];

    if (media.type == MediaType.image) {
      await applyMultipleImageFilters();
    } else {
      await applyMultipleVideoFilters();
    }
  }

  // ------------------------------------------------------------------------
  // CLEAR ALL FILTERS
  // ------------------------------------------------------------------------
  Future<void> clearAllFilters() async {
    selectedFilters.clear();

    final media = selectedMedia[currentIndex];

    if (media.type == MediaType.image) {
      await applyMultipleImageFilters();
    } else {
      await applyMultipleVideoFilters();
    }
  }

  // ------------------------------------------------------------------------
  // GET FINAL FILTERED MEDIA (for returning to previous screen)
  // ------------------------------------------------------------------------
  List<SelectedMedia> getFinalFilteredMedia() {
    final updatedMedia = <SelectedMedia>[];

    for (int i = 0; i < selectedMedia.length; i++) {
      final media = selectedMedia[i];

      // Only update the current media that was edited
      if (i == currentIndex) {
        if (media.type == MediaType.image && topImagePath.value.isNotEmpty) {
          // Return filtered image
          updatedMedia.add(
            SelectedMedia(
              file: File(topImagePath.value),
              type: MediaType.image,
              networkUrl: null,
            ),
          );
        } else if (media.type == MediaType.video &&
            currentVideoPath.value.isNotEmpty) {
          // Return filtered video
          updatedMedia.add(
            SelectedMedia(
              file: File(currentVideoPath.value),
              type: MediaType.video,
              networkUrl: null,
            ),
          );
        } else {
          updatedMedia.add(media);
        }
      } else {
        updatedMedia.add(media);
      }
    }

    return updatedMedia;
  }
}

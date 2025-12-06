// // // ignore_for_file: deprecated_member_use

// // import 'dart:io';
// // import 'package:athlete_elite/app/constants/app_colors.dart';
// // import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/filter_screen/image_filter/image_filter_controller.dart';
// // import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
// // import 'package:athlete_elite/app/utils/app_scaffold.dart';
// // import 'package:athlete_elite/app/widgets/AppText.dart';
// // import 'package:athlete_elite/app/widgets/common_back_button.dart';
// // import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
// // import 'package:ffmpeg_kit_flutter_new/return_code.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:image/image.dart' as IMG;
// // import 'package:path_provider/path_provider.dart';
// // import 'package:video_player/video_player.dart';

// // class ImageFilterController extends GetxController {
// //   /// INPUT
// //   final List<SelectedMedia> selectedMedia;
// //   final Map<String, String> filters;

// //   ImageFilterController({
// //     required this.selectedMedia,
// //     required this.filters,
// //   });

// //   /// OBSERVABLES
// //   final RxBool isGeneratingThumbnails = false.obs;
// //   final RxBool isGeneratingTopImage = false.obs;
// //   final RxBool isVideoInitialized = false.obs;
// //   final RxBool isApplyingFilter = false.obs;

// //   final RxString topImagePath = "".obs; // For images
// //   final RxString currentVideoPath = "".obs; // For videos
// //   final RxString videoThumbnailPath = "".obs; // Single thumbnail for video

// //   final RxSet<String> selectedFilters = <String>{}.obs;

// //   final Map<String, String> thumbnailCache = {}; // filter → thumbnail path

// //   VideoPlayerController? videoController;

// //   int currentIndex = 0;
// //   String? originalImagePath; // Store original for faster filter switching
// //   String? originalVideoPath; // Store original video path

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     initFirstMedia();
// //   }

// //   @override
// //   void onClose() {
// //     videoController?.dispose();
// //     super.onClose();
// //   }

// //   Future<void> initFirstMedia() async {
// //     if (selectedMedia.isEmpty) return;
// //     await onImageChanged(0);
// //   }

// //   // ------------------------------------------------------------------------
// //   // PAGE CHANGE HANDLER
// //   // ------------------------------------------------------------------------
// //   Future<void> onImageChanged(int index) async {
// //     currentIndex = index;

// //     final media = selectedMedia[index];
// //     selectedFilters.clear();
// //     thumbnailCache.clear();

// //     // Reset video state when changing pages
// //     isVideoInitialized(false);
// //     videoController?.dispose();
// //     videoController = null;

// //     if (media.type == MediaType.image) {
// //       topImagePath("");
// //       currentVideoPath("");
// //       videoThumbnailPath("");
// //       await generateTopImage(media);
// //       // Generate thumbnails in background
// //       generateImageThumbnails();
// //       return;
// //     }

// //     if (media.type == MediaType.video) {
// //       topImagePath("");
// //       await loadVideo(media);
// //       // Generate video thumbnail and filter previews in background
// //       generateVideoThumbnails();
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // IMAGE PROCESSING
// //   // ------------------------------------------------------------------------
// //   Future<void> generateTopImage(SelectedMedia media) async {
// //     isGeneratingTopImage(true);

// //     try {
// //       String path = '';

// //       if (media.file != null) {
// //         path = media.file!.path;
// //       } else if (media.networkUrl != null) {
// //         // Download network image
// //         final temp = await getTemporaryDirectory();
// //         final filePath =
// //             "${temp.path}/net_img_${DateTime.now().millisecondsSinceEpoch}.jpg";

// //         final file = File(filePath);
// //         final request = await HttpClient().getUrl(Uri.parse(media.networkUrl!));
// //         final response = await request.close();
// //         final bytes = await consolidateHttpClientResponseBytes(response);
// //         file.writeAsBytesSync(bytes);

// //         path = filePath;
// //       }

// //       if (path.isEmpty) return;

// //       originalImagePath = path; // Store original
// //       topImagePath(path);
// //     } catch (e) {
// //       print("Error generating top image: $e");
// //     } finally {
// //       isGeneratingTopImage(false);
// //     }
// //   }

// //   Future<void> applyMultipleImageFilters() async {
// //     if (originalImagePath == null || originalImagePath!.isEmpty) return;
// //     if (selectedFilters.isEmpty) {
// //       topImagePath(originalImagePath!);
// //       return;
// //     }

// //     isApplyingFilter(true);

// //     try {
// //       final temp = await getTemporaryDirectory();
// //       final output =
// //           "${temp.path}/filtered_${DateTime.now().millisecondsSinceEpoch}.jpg";

// //       // Use original image for better quality
// //       var img = IMG.decodeImage(File(originalImagePath!).readAsBytesSync());
// //       if (img == null) return;

// //       // Apply all selected filters in sequence
// //       for (final filterName in selectedFilters) {
// //         img = applyImageFilterToImage(img!, filterName);
// //       }

// //       File(output).writeAsBytesSync(IMG.encodeJpg(img!, quality: 95));
// //       topImagePath(output);
// //     } catch (e) {
// //       print("Error applying image filters: $e");
// //     } finally {
// //       isApplyingFilter(false);
// //     }
// //   }

// //   IMG.Image applyImageFilterToImage(IMG.Image img, String filterName) {
// //     switch (filterName.toLowerCase()) {
// //       case "grayscale":
// //       case "gray":
// //         return IMG.grayscale(img);
// //       case "invert":
// //         return IMG.invert(img);
// //       case "sepia":
// //         return IMG.sepia(img);
// //       case "vignette":
// //         return IMG.vignette(img);
// //       case "blur":
// //         return IMG.gaussianBlur(img, radius: 5);
// //       case "sharpen":
// //         return IMG.convolution(img, filter: [0, -1, 0, -1, 5, -1, 0, -1, 0]);
// //       case "emboss":
// //         return IMG.emboss(img);
// //       case "smooth":
// //         return IMG.smooth(img, weight: 10);
// //       default:
// //         return img;
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // FAST IMAGE THUMBNAIL GENERATION
// //   // ------------------------------------------------------------------------
// //   Future<void> generateImageThumbnails() async {
// //     if (originalImagePath == null || originalImagePath!.isEmpty) return;

// //     isGeneratingThumbnails(true);

// //     try {
// //       final originalImg =
// //           IMG.decodeImage(File(originalImagePath!).readAsBytesSync());
// //       if (originalImg == null) return;

// //       // Resize image for faster thumbnail generation
// //       final thumbnail = IMG.copyResize(originalImg, width: 300);

// //       final temp = await getTemporaryDirectory();

// //       // Generate thumbnails for each filter in parallel
// //       final futures = filters.entries.map((entry) async {
// //         final name = entry.key;

// //         // Apply the actual filter to thumbnail
// //         final filtered = applyImageFilterToImage(thumbnail, name);

// //         final thumbPath =
// //             "${temp.path}/thumb_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
// //         File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

// //         thumbnailCache[name] = thumbPath;
// //       }).toList();

// //       await Future.wait(futures);

// //       // Force UI update
// //       thumbnailCache.addAll({}); // Trigger observable
// //     } catch (e) {
// //       print("Error generating thumbnails: $e");
// //     } finally {
// //       isGeneratingThumbnails(false);
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // VIDEO LOADING LOGIC
// //   // ------------------------------------------------------------------------
// //   Future<void> loadVideo(SelectedMedia media) async {
// //     isGeneratingTopImage(true);
// //     isVideoInitialized(false);

// //     try {
// //       String path;

// //       if (media.file != null) {
// //         path = media.file!.path;
// //       } else if (media.networkUrl != null) {
// //         final temp = await getTemporaryDirectory();
// //         final filePath =
// //             "${temp.path}/net_video_${DateTime.now().millisecondsSinceEpoch}.mp4";

// //         final file = File(filePath);
// //         final request = await HttpClient().getUrl(Uri.parse(media.networkUrl!));
// //         final response = await request.close();
// //         final bytes = await consolidateHttpClientResponseBytes(response);
// //         await file.writeAsBytes(bytes);

// //         path = filePath;
// //       } else {
// //         return;
// //       }

// //       originalVideoPath = path; // Store original
// //       currentVideoPath(path);

// //       // Dispose old controller
// //       videoController?.dispose();

// //       // Initialize new controller
// //       videoController = VideoPlayerController.file(File(path));
// //       await videoController!.initialize();

// //       isVideoInitialized(true);
// //       videoController!.setLooping(true);
// //       videoController!.play();
// //     } catch (e) {
// //       print("Error loading video: $e");
// //       isVideoInitialized(false);
// //     } finally {
// //       isGeneratingTopImage(false);
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // VIDEO FILTERING - OPTIMIZED WITH MULTIPLE FILTERS
// //   // ------------------------------------------------------------------------
// //   Future<void> applyMultipleVideoFilters() async {
// //     if (originalVideoPath == null || originalVideoPath!.isEmpty) return;

// //     if (selectedFilters.isEmpty) {
// //       currentVideoPath(originalVideoPath!);
// //       await reinitializeVideo(originalVideoPath!);
// //       return;
// //     }

// //     isApplyingFilter(true);
// //     final wasPlaying = videoController?.value.isPlaying ?? false;

// //     try {
// //       videoController?.pause();

// //       // Build filter chain for multiple filters
// //       String filterChain = selectedFilters
// //           .map((name) {
// //             return filters[name] ?? "null";
// //           })
// //           .where((f) => f != "null")
// //           .join(",");

// //       if (filterChain.isEmpty) {
// //         filterChain = "null";
// //       }

// //       final temp = await getTemporaryDirectory();
// //       final output =
// //           "${temp.path}/vfilter_${DateTime.now().millisecondsSinceEpoch}.mp4";

// //       // Use faster preset and original video
// //       final cmd =
// //           "-i ${originalVideoPath!} -vf $filterChain -c:v libx264 -preset veryfast -crf 23 -c:a copy $output";

// //       print("FFmpeg command: $cmd");
// //       final session = await FFmpegKit.execute(cmd);
// //       final returnCode = await session.getReturnCode();

// //       if (!ReturnCode.isSuccess(returnCode)) {
// //         final output = await session.getOutput();
// //         print("FFmpeg error: $output");
// //         return;
// //       }

// //       currentVideoPath(output);
// //       await reinitializeVideo(output, playImmediately: wasPlaying);
// //     } catch (e) {
// //       print("Error applying video filters: $e");
// //     } finally {
// //       isApplyingFilter(false);
// //     }
// //   }

// //   Future<void> reinitializeVideo(String path,
// //       {bool playImmediately = false}) async {
// //     try {
// //       videoController?.dispose();
// //       videoController = VideoPlayerController.file(File(path));
// //       await videoController!.initialize();

// //       isVideoInitialized(true);
// //       videoController!.setLooping(true);

// //       if (playImmediately) {
// //         videoController!.play();
// //       }
// //     } catch (e) {
// //       print("Error reinitializing video: $e");
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // FAST VIDEO THUMBNAIL GENERATION
// //   // ------------------------------------------------------------------------
// //   Future<void> generateVideoThumbnails() async {
// //     if (originalVideoPath == null || originalVideoPath!.isEmpty) return;

// //     isGeneratingThumbnails(true);

// //     try {
// //       // First, generate ONE base thumbnail from video
// //       final temp = await getTemporaryDirectory();
// //       final baseThumbPath =
// //           "${temp.path}/base_thumb_${DateTime.now().millisecondsSinceEpoch}.jpg";

// //       // Extract frame at 1 second with smaller size for speed
// //       final extractCmd =
// //           "-i ${originalVideoPath!} -ss 00:00:01 -vframes 1 -vf scale=300:-1 $baseThumbPath";
// //       await FFmpegKit.execute(extractCmd);

// //       videoThumbnailPath(baseThumbPath);

// //       // Now apply filters to this ONE thumbnail image
// //       final baseImg = IMG.decodeImage(File(baseThumbPath).readAsBytesSync());
// //       if (baseImg == null) return;

// //       // Generate filter previews in parallel
// //       final futures = filters.entries.map((entry) async {
// //         final name = entry.key;

// //         // Apply image equivalent of video filter
// //         final filtered = applyImageFilterToImage(baseImg, name);

// //         final thumbPath =
// //             "${temp.path}/vthumb_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
// //         File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

// //         thumbnailCache[name] = thumbPath;
// //       }).toList();

// //       await Future.wait(futures);

// //       // Force UI update
// //       thumbnailCache.addAll({});
// //     } catch (e) {
// //       print("Error generating video thumbnails: $e");
// //     } finally {
// //       isGeneratingThumbnails(false);
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // FILTER TOGGLE (Add/Remove)
// //   // ------------------------------------------------------------------------
// //   Future<void> onFilterTap(String name) async {
// //     // Toggle filter selection
// //     if (selectedFilters.contains(name)) {
// //       selectedFilters.remove(name);
// //     } else {
// //       selectedFilters.add(name);
// //     }

// //     final media = selectedMedia[currentIndex];

// //     if (media.type == MediaType.image) {
// //       await applyMultipleImageFilters();
// //     } else {
// //       await applyMultipleVideoFilters();
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // CLEAR ALL FILTERS
// //   // ------------------------------------------------------------------------
// //   Future<void> clearAllFilters() async {
// //     selectedFilters.clear();

// //     final media = selectedMedia[currentIndex];

// //     if (media.type == MediaType.image) {
// //       await applyMultipleImageFilters();
// //     } else {
// //       await applyMultipleVideoFilters();
// //     }
// //   }

// //   // ------------------------------------------------------------------------
// //   // GET FINAL FILTERED MEDIA (for returning to previous screen)
// //   // ------------------------------------------------------------------------
// //   List<SelectedMedia> getFinalFilteredMedia() {
// //     final updatedMedia = <SelectedMedia>[];

// //     for (int i = 0; i < selectedMedia.length; i++) {
// //       final media = selectedMedia[i];

// //       // Only update the current media that was edited
// //       if (i == currentIndex) {
// //         if (media.type == MediaType.image && topImagePath.value.isNotEmpty) {
// //           // Return filtered image
// //           updatedMedia.add(
// //             SelectedMedia(
// //               file: File(topImagePath.value),
// //               type: MediaType.image,
// //               networkUrl: null,
// //             ),
// //           );
// //         } else if (media.type == MediaType.video &&
// //             currentVideoPath.value.isNotEmpty) {
// //           // Return filtered video
// //           updatedMedia.add(
// //             SelectedMedia(
// //               file: File(currentVideoPath.value),
// //               type: MediaType.video,
// //               networkUrl: null,
// //             ),
// //           );
// //         } else {
// //           updatedMedia.add(media);
// //         }
// //       } else {
// //         updatedMedia.add(media);
// //       }
// //     }

// //     return updatedMedia;
// //   }
// // }



// // ignore_for_file: deprecated_member_use

// import 'dart:io';
// import 'package:athlete_elite/app/constants/app_colors.dart';
// import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
// import 'package:athlete_elite/app/utils/app_scaffold.dart';
// import 'package:athlete_elite/app/widgets/AppText.dart';
// import 'package:athlete_elite/app/widgets/common_back_button.dart';
// import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter_new/return_code.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image/image.dart' as IMG;
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';

// // ======================== CONTROLLER ========================
// class EnhancedFilterController extends GetxController {
//   final List<SelectedMedia> selectedMedia;
//   final Map<String, String> filters;

//   EnhancedFilterController({
//     required this.selectedMedia,
//     required this.filters,
//   });

//   // Observables
//   final RxBool isGeneratingThumbnails = false.obs;
//   final RxBool isGeneratingTopImage = false.obs;
//   final RxBool isVideoInitialized = false.obs;
//   final RxBool isApplyingFilter = false.obs;

//   final RxString topImagePath = "".obs;
//   final RxString currentVideoPath = "".obs;

//   // Track filters applied to each media item
//   final Map<int, Set<String>> mediaFilters = {};
//   final RxSet<String> currentSelectedFilters = <String>{}.obs;

//   final Map<String, String> thumbnailCache = {};

//   // Store original paths for each media
//   final Map<int, String> originalPaths = {};
//   final Map<int, String> filteredPaths = {};

//   VideoPlayerController? videoController;
//   int currentIndex = 0;

//   @override
//   void onInit() {
//     super.onInit();
//     initFirstMedia();
//   }

//   @override
//   void onClose() {
//     videoController?.dispose();
//     super.onClose();
//   }

//   Future<void> initFirstMedia() async {
//     if (selectedMedia.isEmpty) return;
//     await onMediaChanged(0);
//   }

//   // ======================== PAGE CHANGE ========================
//   Future<void> onMediaChanged(int index) async {
//     currentIndex = index;
//     final media = selectedMedia[index];

//     thumbnailCache.clear();
//     videoController?.dispose();
//     videoController = null;
//     isVideoInitialized(false);

//     // Load previously applied filters for this media
//     currentSelectedFilters.value = mediaFilters[index] ?? {};

//     if (media.type == MediaType.image) {
//       topImagePath("");
//       currentVideoPath("");
//       await processImage(media, index);
//       generateImageThumbnails(index);
//     } else if (media.type == MediaType.video) {
//       topImagePath("");
//       await processVideo(media, index);
//       generateVideoThumbnails(index);
//     }
//   }

//   // ======================== IMAGE PROCESSING ========================
//   Future<void> processImage(SelectedMedia media, int index) async {
//     isGeneratingTopImage(true);

//     try {
//       String path = '';

//       if (media.file != null) {
//         path = media.file!.path;
//       } else if (media.networkUrl != null) {
//         path = await downloadFile(media.networkUrl!, 'image');
//       }

//       if (path.isEmpty) return;

//       // Store original path
//       if (!originalPaths.containsKey(index)) {
//         originalPaths[index] = path;
//       }

//       // If filters already applied, show filtered version
//       if (filteredPaths.containsKey(index)) {
//         topImagePath(filteredPaths[index]!);
//       } else {
//         topImagePath(originalPaths[index]!);
//       }
//     } catch (e) {
//       debugPrint("Error processing image: $e");
//     } finally {
//       isGeneratingTopImage(false);
//     }
//   }

//   Future<void> applyImageFilters() async {
//     final originalPath = originalPaths[currentIndex];
//     if (originalPath == null || originalPath.isEmpty) return;

//     if (currentSelectedFilters.isEmpty) {
//       // No filters - use original
//       topImagePath(originalPath);
//       filteredPaths.remove(currentIndex);
//       return;
//     }

//     isApplyingFilter(true);

//     try {
//       var img = IMG.decodeImage(File(originalPath).readAsBytesSync());
//       if (img == null) return;

//       // Apply all selected filters
//       for (final filterName in currentSelectedFilters) {
//         img = applyImageFilter(img!, filterName);
//       }

//       final temp = await getTemporaryDirectory();
//       final output =
//           "${temp.path}/filtered_${currentIndex}_${DateTime.now().millisecondsSinceEpoch}.jpg";

//       File(output).writeAsBytesSync(IMG.encodeJpg(img!, quality: 95));

//       topImagePath(output);
//       filteredPaths[currentIndex] = output;
//       mediaFilters[currentIndex] = Set.from(currentSelectedFilters);
//     } catch (e) {
//       debugPrint("Error applying image filters: $e");
//     } finally {
//       isApplyingFilter(false);
//     }
//   }

//   IMG.Image applyImageFilter(IMG.Image img, String filterName) {
//     switch (filterName.toLowerCase()) {
//       case "grayscale":
//       case "gray":
//         return IMG.grayscale(img);
//       case "invert":
//         return IMG.invert(img);
//       case "sepia":
//         return IMG.sepia(img);
//       case "vignette":
//         return IMG.vignette(img);
//       case "blur":
//         return IMG.gaussianBlur(img, radius: 5);
//       case "sharpen":
//         return IMG.convolution(img, filter: [0, -1, 0, -1, 5, -1, 0, -1, 0]);
//       case "emboss":
//         return IMG.emboss(img);
//       case "smooth":
//         return IMG.smooth(img, weight: 10);
//       default:
//         return img;
//     }
//   }

//   Future<void> generateImageThumbnails(int index) async {
//     final originalPath = originalPaths[index];
//     if (originalPath == null || originalPath.isEmpty) return;

//     isGeneratingThumbnails(true);

//     try {
//       final originalImg = IMG.decodeImage(File(originalPath).readAsBytesSync());
//       if (originalImg == null) return;

//       final thumbnail = IMG.copyResize(originalImg, width: 300);
//       final temp = await getTemporaryDirectory();

//       final futures = filters.entries.map((entry) async {
//         final name = entry.key;
//         final filtered = applyImageFilter(thumbnail, name);

//         final thumbPath =
//             "${temp.path}/thumb_${index}_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
//         File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

//         thumbnailCache[name] = thumbPath;
//       }).toList();

//       await Future.wait(futures);
//       thumbnailCache.addAll({});
//     } catch (e) {
//       debugPrint("Error generating thumbnails: $e");
//     } finally {
//       isGeneratingThumbnails(false);
//     }
//   }

//   // ======================== VIDEO PROCESSING ========================
//   Future<void> processVideo(SelectedMedia media, int index) async {
//     isGeneratingTopImage(true);
//     isVideoInitialized(false);

//     try {
//       String path;

//       if (media.file != null) {
//         path = media.file!.path;
//       } else if (media.networkUrl != null) {
//         path = await downloadFile(media.networkUrl!, 'video');
//       } else {
//         return;
//       }

//       // Store original path
//       if (!originalPaths.containsKey(index)) {
//         originalPaths[index] = path;
//       }

//       // Determine which path to play
//       String videoPath;
//       if (filteredPaths.containsKey(index)) {
//         videoPath = filteredPaths[index]!;
//       } else {
//         videoPath = originalPaths[index]!;
//       }

//       currentVideoPath(videoPath);
//       await initializeVideoPlayer(videoPath);
//     } catch (e) {
//       debugPrint("Error processing video: $e");
//       isVideoInitialized(false);
//     } finally {
//       isGeneratingTopImage(false);
//     }
//   }

//   Future<void> applyVideoFilters() async {
//     final originalPath = originalPaths[currentIndex];
//     if (originalPath == null || originalPath.isEmpty) return;

//     if (currentSelectedFilters.isEmpty) {
//       // No filters - use original
//       currentVideoPath(originalPath);
//       filteredPaths.remove(currentIndex);
//       await reinitializeVideo(originalPath);
//       return;
//     }

//     isApplyingFilter(true);
//     final wasPlaying = videoController?.value.isPlaying ?? false;

//     try {
//       videoController?.pause();

//       // Build filter chain
//       String filterChain = currentSelectedFilters
//           .map((name) => filters[name] ?? "null")
//           .where((f) => f != "null")
//           .join(",");

//       if (filterChain.isEmpty) filterChain = "null";

//       final temp = await getTemporaryDirectory();
//       final output =
//           "${temp.path}/vfilter_${currentIndex}_${DateTime.now().millisecondsSinceEpoch}.mp4";

//       final cmd =
//           "-i $originalPath -vf $filterChain -c:v libx264 -preset veryfast -crf 23 -c:a copy $output";

//       debugPrint("FFmpeg command: $cmd");
//       final session = await FFmpegKit.execute(cmd);
//       final returnCode = await session.getReturnCode();

//       if (!ReturnCode.isSuccess(returnCode)) {
//         final output = await session.getOutput();
//         debugPrint("FFmpeg error: $output");
//         return;
//       }

//       currentVideoPath(output);
//       filteredPaths[currentIndex] = output;
//       mediaFilters[currentIndex] = Set.from(currentSelectedFilters);

//       await reinitializeVideo(output, playImmediately: wasPlaying);
//     } catch (e) {
//       debugPrint("Error applying video filters: $e");
//     } finally {
//       isApplyingFilter(false);
//     }
//   }

//   Future<void> initializeVideoPlayer(String path) async {
//     try {
//       videoController?.dispose();
//       videoController = VideoPlayerController.file(File(path));
//       await videoController!.initialize();

//       isVideoInitialized(true);
//       videoController!.setLooping(true);
//       videoController!.play();
//     } catch (e) {
//       debugPrint("Error initializing video: $e");
//       isVideoInitialized(false);
//     }
//   }

//   Future<void> reinitializeVideo(String path,
//       {bool playImmediately = false}) async {
//     await initializeVideoPlayer(path);
//     if (playImmediately && videoController != null) {
//       videoController!.play();
//     }
//   }

//   Future<void> generateVideoThumbnails(int index) async {
//     final originalPath = originalPaths[index];
//     if (originalPath == null || originalPath.isEmpty) return;

//     isGeneratingThumbnails(true);

//     try {
//       final temp = await getTemporaryDirectory();
//       final baseThumbPath =
//           "${temp.path}/base_thumb_${index}_${DateTime.now().millisecondsSinceEpoch}.jpg";

//       final extractCmd =
//           "-i $originalPath -ss 00:00:01 -vframes 1 -vf scale=300:-1 $baseThumbPath";
//       await FFmpegKit.execute(extractCmd);

//       final baseImg = IMG.decodeImage(File(baseThumbPath).readAsBytesSync());
//       if (baseImg == null) return;

//       final futures = filters.entries.map((entry) async {
//         final name = entry.key;
//         final filtered = applyImageFilter(baseImg, name);

//         final thumbPath =
//             "${temp.path}/vthumb_${index}_${name}_${DateTime.now().millisecondsSinceEpoch}.jpg";
//         File(thumbPath).writeAsBytesSync(IMG.encodeJpg(filtered, quality: 75));

//         thumbnailCache[name] = thumbPath;
//       }).toList();

//       await Future.wait(futures);
//       thumbnailCache.addAll({});
//     } catch (e) {
//       debugPrint("Error generating video thumbnails: $e");
//     } finally {
//       isGeneratingThumbnails(false);
//     }
//   }

//   // ======================== FILTER ACTIONS ========================
//   Future<void> onFilterTap(String name) async {
//     if (currentSelectedFilters.contains(name)) {
//       currentSelectedFilters.remove(name);
//     } else {
//       currentSelectedFilters.add(name);
//     }

//     final media = selectedMedia[currentIndex];

//     if (media.type == MediaType.image) {
//       await applyImageFilters();
//     } else if (media.type == MediaType.video) {
//       await applyVideoFilters();
//     }
//   }

//   Future<void> clearAllFilters() async {
//     currentSelectedFilters.clear();

//     final media = selectedMedia[currentIndex];

//     if (media.type == MediaType.image) {
//       await applyImageFilters();
//     } else if (media.type == MediaType.video) {
//       await applyVideoFilters();
//     }
//   }

//   // ======================== FINAL RESULT ========================
//   List<SelectedMedia> getFinalFilteredMedia() {
//     final result = <SelectedMedia>[];

//     for (int i = 0; i < selectedMedia.length; i++) {
//       final media = selectedMedia[i];

//       // Check if this media has filtered version
//       if (filteredPaths.containsKey(i)) {
//         result.add(
//           SelectedMedia(
//             file: File(filteredPaths[i]!),
//             type: media.type,
//             networkUrl: null,
//           ),
//         );
//       } else {
//         // No filters applied - return original
//         if (originalPaths.containsKey(i)) {
//           result.add(
//             SelectedMedia(
//               file: File(originalPaths[i]!),
//               type: media.type,
//               networkUrl: null,
//             ),
//           );
//         } else {
//           result.add(media);
//         }
//       }
//     }

//     return result;
//   }

//   // ======================== HELPER ========================
//   Future<String> downloadFile(String url, String type) async {
//     final temp = await getTemporaryDirectory();
//     final ext = type == 'image' ? 'jpg' : 'mp4';
//     final filePath =
//         "${temp.path}/net_${type}_${DateTime.now().millisecondsSinceEpoch}.$ext";

//     final file = File(filePath);
//     final request = await HttpClient().getUrl(Uri.parse(url));
//     final response = await request.close();
//     final bytes = await consolidateHttpClientResponseBytes(response);
//     await file.writeAsBytes(bytes);

//     return filePath;
//   }
// }

// // ======================== UI SCREEN ========================
// class EnhancedImageFilterEditor extends StatefulWidget {
//   final List<SelectedMedia> selectedMedia;
//   final Map<String, String> filters;

//   const EnhancedImageFilterEditor({
//     super.key,
//     required this.selectedMedia,
//     required this.filters,
//   });

//   @override
//   State<EnhancedImageFilterEditor> createState() =>
//       _EnhancedImageFilterEditorState();
// }

// class _EnhancedImageFilterEditorState extends State<EnhancedImageFilterEditor> {
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(
//       EnhancedFilterController(
//         selectedMedia: widget.selectedMedia,
//         filters: widget.filters,
//       ),
//       tag: DateTime.now().toString(),
//     );

//     return WillPopScope(
//       onWillPop: () async {
//         // Return filtered media when back is pressed
//         Get.back(result: controller.getFinalFilteredMedia());
//         return false;
//       },
//       child: AppScaffold(
//         backgroundColor: AppColors.screenBackgroundColor,
//         body: Obx(() {
//           if (controller.isGeneratingTopImage.value &&
//               controller.topImagePath.isEmpty &&
//               controller.currentVideoPath.isEmpty) {
//             return const Center(
//               child: CircularProgressIndicator(color: Colors.white),
//             );
//           }

//           return Stack(
//             children: [
//               // Main media display
//               PageView.builder(
//                 controller: _pageController,
//                 itemCount: controller.selectedMedia.length,
//                 physics: const BouncingScrollPhysics(),
//                 onPageChanged: (index) {
//                   controller.onMediaChanged(index);
//                   setState(() => _currentIndex = index);
//                 },
//                 itemBuilder: (context, index) {
//                   final media = controller.selectedMedia[index];

//                   if (media.type == MediaType.image) {
//                     return _buildImageDisplay(controller);
//                   } else if (media.type == MediaType.video) {
//                     return _buildVideoDisplay(controller);
//                   }

//                   return const Center(
//                     child: Text(
//                       "Unsupported media type",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 },
//               ),

//               // Back button
//               Positioned(
//                 top: 50.h,
//                 left: 20.w,
//                 child: GestureDetector(
//                   onTap: () {
//                     Get.back(result: controller.getFinalFilteredMedia());
//                   },
//                   child: const CommonBackButton(),
//                 ),
//               ),

//               // Page indicator
//               if (widget.selectedMedia.length > 1)
//                 Positioned(
//                   top: 50.h,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//                       decoration: BoxDecoration(
//                         color: Colors.black54,
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                       child: AppText(
//                         "${_currentIndex + 1} / ${widget.selectedMedia.length}",
//                         fontSize: 14.sp,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//               // Navigation arrows
//               if (widget.selectedMedia.length > 1)
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildNavButton(
//                           icon: Icons.arrow_back_ios_new_rounded,
//                           onTap: () async {
//                             if (_currentIndex > 0) {
//                               _currentIndex--;
//                               await _pageController.animateToPage(
//                                 _currentIndex,
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                               setState(() {});
//                             }
//                           },
//                           enabled: _currentIndex > 0,
//                         ),
//                         _buildNavButton(
//                           icon: Icons.arrow_forward_ios_rounded,
//                           onTap: () async {
//                             if (_currentIndex <
//                                 widget.selectedMedia.length - 1) {
//                               _currentIndex++;
//                               await _pageController.animateToPage(
//                                 _currentIndex,
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.easeInOut,
//                               );
//                               setState(() {});
//                             }
//                           },
//                           enabled:
//                               _currentIndex < widget.selectedMedia.length - 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//               // Loading overlay
//               if (controller.isApplyingFilter.value)
//                 Container(
//                   color: Colors.black.withOpacity(0.7),
//                   child: Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const CircularProgressIndicator(color: Colors.white),
//                         SizedBox(height: 16.h),
//                         Text(
//                           "Applying filters...".tr,
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 16.sp),
//                         ),
//                         Obx(() {
//                           if (controller.currentSelectedFilters.isNotEmpty) {
//                             return Padding(
//                               padding: EdgeInsets.only(top: 8.h),
//                               child: Text(
//                                 "${controller.currentSelectedFilters.length} filter(s) selected",
//                                 style: TextStyle(
//                                     color: Colors.white70, fontSize: 14.sp),
//                               ),
//                             );
//                           }
//                           return const SizedBox.shrink();
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),

//               // Filter bottom sheet
//               _buildFilterBottomSheet(controller),
//             ],
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildImageDisplay(EnhancedFilterController controller) {
//     return Obx(() {
//       final path = controller.topImagePath.value;

//       if (path.isEmpty) {
//         return const Center(
//           child: CircularProgressIndicator(color: Colors.white),
//         );
//       }

//       return Center(
//         child: Image.file(
//           File(path),
//           fit: BoxFit.contain,
//           errorBuilder: (context, error, stackTrace) {
//             return Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.error, color: Colors.red, size: 50.sp),
//                   SizedBox(height: 10.h),
//                   Text(
//                     "Error loading image".tr,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }

//   Widget _buildVideoDisplay(EnhancedFilterController controller) {
//     return Obx(() {
//       if (!controller.isVideoInitialized.value ||
//           controller.videoController == null) {
//         return const Center(
//           child: CircularProgressIndicator(color: Colors.white),
//         );
//       }

//       return Center(
//         child: AspectRatio(
//           aspectRatio: controller.videoController!.value.aspectRatio,
//           child: VideoPlayer(controller.videoController!),
//         ),
//       );
//     });
//   }

//   Widget _buildNavButton({
//     required IconData icon,
//     required VoidCallback onTap,
//     required bool enabled,
//   }) {
//     return GestureDetector(
//       onTap: enabled ? onTap : null,
//       child: Container(
//         width: 45.w,
//         height: 45.w,
//         margin: EdgeInsets.symmetric(horizontal: 10.w),
//         decoration: BoxDecoration(
//           color: enabled
//               ? Colors.black.withOpacity(0.5)
//               : Colors.grey.withOpacity(0.2),
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           icon,
//           color: enabled ? Colors.white : Colors.grey,
//           size: 22.sp,
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterBottomSheet(EnhancedFilterController controller) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: double.infinity,
//         height: 0.32.sh,
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//         decoration: BoxDecoration(
//           color: AppColors.screenBackgroundColor.withOpacity(0.92),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.r),
//             topRight: Radius.circular(30.r),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Center(
//                     child: Text(
//                       "Filters".tr,
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.white,
//                         fontFamily:
//                             GoogleFonts.barlowSemiCondensed().fontFamily,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Obx(() => controller.currentSelectedFilters.isNotEmpty
//                     ? GestureDetector(
//                         onTap: () => controller.clearAllFilters(),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 12.w,
//                             vertical: 6.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.red.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(8.r),
//                             border: Border.all(color: Colors.red, width: 1),
//                           ),
//                           child: Text(
//                             "Clear All".tr,
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       )
//                     : SizedBox(width: 80.w)),
//               ],
//             ),

//             SizedBox(height: 8.h),

//             // Filter count
//             Obx(() {
//               if (controller.currentSelectedFilters.isEmpty) {
//                 return const SizedBox.shrink();
//               }
//               return Padding(
//                 padding: EdgeInsets.only(bottom: 8.h),
//                 child: Center(
//                   child: Text(
//                     "${controller.currentSelectedFilters.length} filter(s) applied",
//                     style: TextStyle(
//                       color: AppColors.lightRed,
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               );
//             }),

//             // Filter list
//             Expanded(
//               child: Obx(() {
//                 final filtersMap = controller.filters;
//                 final cache = controller.thumbnailCache;
//                 final isGenerating = controller.isGeneratingThumbnails.value;

//                 return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: filtersMap.length,
//                   padding: EdgeInsets.symmetric(horizontal: 8.w),
//                   itemBuilder: (context, index) {
//                     final name = filtersMap.keys.elementAt(index);
//                     final isSelected =
//                         controller.currentSelectedFilters.contains(name);
//                     final thumb = cache[name];

//                     return GestureDetector(
//                       onTap: () => controller.onFilterTap(name),
//                       child: Container(
//                         width: 75.w,
//                         margin: EdgeInsets.only(right: 12.w),
//                         child: Column(
//                           children: [
//                             Stack(
//                               children: [
//                                 AnimatedContainer(
//                                   duration: const Duration(milliseconds: 250),
//                                   height: 75.h,
//                                   width: 75.w,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: isSelected
//                                           ? AppColors.lightRed
//                                           : Colors.grey.shade700,
//                                       width: isSelected ? 3 : 1.5,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.r),
//                                     boxShadow: isSelected
//                                         ? [
//                                             BoxShadow(
//                                               color: AppColors.lightRed
//                                                   .withOpacity(0.3),
//                                               blurRadius: 8,
//                                               spreadRadius: 2,
//                                             ),
//                                           ]
//                                         : null,
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(12.r),
//                                     child: thumb != null && thumb.isNotEmpty
//                                         ? Image.file(
//                                             File(thumb),
//                                             fit: BoxFit.cover,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Container(
//                                                 color: Colors.grey.shade800,
//                                                 child: const Center(
//                                                   child: Icon(
//                                                     Icons.broken_image,
//                                                     color: Colors.white70,
//                                                     size: 30,
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           )
//                                         : Container(
//                                             color: Colors.grey.shade800,
//                                             child: Center(
//                                               child: isGenerating
//                                                   ? SizedBox(
//                                                       width: 20,
//                                                       height: 20,
//                                                       child:
//                                                           CircularProgressIndicator(
//                                                         strokeWidth: 2,
//                                                         color: Colors.white70,
//                                                       ),
//                                                     )
//                                                   : Icon(
//                                                       Icons.image,
//                                                       color: Colors.white70,
//                                                       size: 30,
//                                                     ),
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 // Checkmark
//                                 if (isSelected)
//                                   Positioned(
//                                     top: 4,
//                                     right: 4,
//                                     child: Container(
//                                       width: 24,
//                                       height: 24,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.lightRed,
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: Colors.white,
//                                           width: 2,
//                                         ),
//                                       ),
//                                       child: const Icon(
//                                         Icons.check,
//                                         color: Colors.white,
//                                         size: 16,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                             SizedBox(height: 6.h),
//                             Text(
//                               name,
//                               style: TextStyle(
//                                 color: isSelected
//                                     ? AppColors.lightRed
//                                     : Colors.white,
//                                 fontSize: 11.sp,
//                                 fontWeight: isSelected
//                                     ? FontWeight.bold
//                                     : FontWeight.normal,
//                               ),
//                               textAlign: TextAlign.center,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),

//             SizedBox(height: 12.h),

//             // Next button
//             Align(
//               alignment: Alignment.centerRight,
//               child: InkWell(
//                 onTap: () {
//                   final filteredMedia = controller.getFinalFilteredMedia();
//                   Get.back(result: filteredMedia);
//                 },
//                 child: Container(
//                   width: 110.w,
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//                   decoration: BoxDecoration(
//                     color: AppColors.black,
//                     border: Border.all(color: AppColors.lightRed, width: 1.5),
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: AppText(
//                     "Next".tr,
//                     color: AppColors.white,
//                     fontSize: 16.sp,
//                     textAlign: TextAlign.center,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

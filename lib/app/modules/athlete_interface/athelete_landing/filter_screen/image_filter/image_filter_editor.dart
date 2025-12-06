import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:photofilters/photofilters.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';

// Import your existing files
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';

class ImageFilterEditor extends StatefulWidget {
  final RxList<SelectedMedia> selectedMedia;
  final List<Filter> filters;

  const ImageFilterEditor({
    Key? key,
    required this.selectedMedia,
    required this.filters,
  }) : super(key: key);

  @override
  State<ImageFilterEditor> createState() => _ImageFilterEditorState();
}

class _ImageFilterEditorState extends State<ImageFilterEditor> {
  late PageController _pageController;
  int _currentIndex = 0;

  // Track which media items have filters applied
  final Map<int, FilteredMediaData> _filteredMediaMap = {};

  // Current preview filter (not yet applied)
  Filter? _previewFilter;
  bool _isProcessing = false;

  // Video controllers
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;

  // Cache for filter thumbnails
  final Map<String, Uint8List?> _filterThumbnailCache = {};
  Uint8List? _baseThumbnail; // Base thumbnail for current media

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _initMedia(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _disposeVideo();
    super.dispose();
  }

  Future<void> _initMedia(int index) async {
    _disposeVideo();

    final selected = widget.selectedMedia[index];

    // Check if we have a filtered version for this media
    final hasFilter = _filteredMediaMap.containsKey(index);
    final fileToPlay =
        hasFilter ? _filteredMediaMap[index]!.filteredFile : selected.file;

    if (selected.type == MediaType.video) {
      if (fileToPlay != null) {
        _videoController = VideoPlayerController.file(fileToPlay);
      } else if (selected.networkUrl != null) {
        _videoController = VideoPlayerController.network(selected.networkUrl!);
      }

      if (_videoController != null) {
        await _videoController!.initialize();
        setState(() => _isVideoInitialized = true);
        _videoController!.setLooping(true);
        _videoController!.play();
      }

      // Generate base thumbnail for filter previews
      await _generateBaseThumbnail(index);
    } else if (selected.type == MediaType.image) {
      // Generate base thumbnail for image filter previews
      await _generateBaseThumbnail(index);
    }
  }

  Future<void> _generateBaseThumbnail(int index) async {
    final selected = widget.selectedMedia[index];

    try {
      if (selected.type == MediaType.video) {
        // Generate video thumbnail
        final thumbnail = await VideoThumbnail.thumbnailData(
          video: selected.file!.path,
          imageFormat: ImageFormat.PNG,
          maxWidth: 200,
          quality: 75,
        );
        setState(() {
          _baseThumbnail = thumbnail;
          _filterThumbnailCache.clear(); // Clear cache when changing media
        });
      } else if (selected.type == MediaType.image) {
        // Load and resize image for thumbnail
        Uint8List? imageData;
        if (selected.file != null) {
          imageData = await selected.file!.readAsBytes();
        } else if (selected.networkUrl != null) {
          final httpClient = HttpClient();
          final request =
              await httpClient.getUrl(Uri.parse(selected.networkUrl!));
          final response = await request.close();
          imageData = await consolidateHttpClientResponseBytes(response);
          httpClient.close();
        }

        if (imageData != null) {
          // Decode and resize for thumbnail
          img.Image? image = img.decodeImage(imageData);
          if (image != null) {
            // Resize to thumbnail size
            img.Image thumbnail = img.copyResize(image, width: 200);
            setState(() {
              _baseThumbnail = Uint8List.fromList(img.encodePng(thumbnail));
              _filterThumbnailCache.clear();
            });
          }
        }
      }
    } catch (e) {
      print("Error generating thumbnail: $e");
    }
  }

  Future<Uint8List?> _generateFilterThumbnail(Filter filter) async {
    // Check cache first
    if (_filterThumbnailCache.containsKey(filter.name)) {
      return _filterThumbnailCache[filter.name];
    }

    if (_baseThumbnail == null) return null;

    try {
      // Decode the base thumbnail
      img.Image? thumbnailImage = img.decodePng(_baseThumbnail!);
      if (thumbnailImage == null) return null;

      // Apply filter to thumbnail
      final int width = thumbnailImage.width;
      final int height = thumbnailImage.height;
      final Uint8List pixels = thumbnailImage.getBytes();

      // Apply the filter
      filter.apply(pixels, width, height);

      // Create filtered image
      img.Image filteredThumb = img.Image.fromBytes(
        width,
        height,
        pixels,
      );

      // Encode back to bytes
      final filteredBytes = Uint8List.fromList(img.encodePng(filteredThumb));

      // Cache the result
      _filterThumbnailCache[filter.name] = filteredBytes;

      return filteredBytes;
    } catch (e) {
      print("Error generating filter thumbnail: $e");
      return null;
    }
  }

  void _disposeVideo() {
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;
    _isVideoInitialized = false;
  }

  Future<void> _applyFilterToCurrentMedia() async {
    if (_previewFilter == null || _isProcessing) return;

    setState(() => _isProcessing = true);

    try {
      final currentMedia = widget.selectedMedia[_currentIndex];

      if (currentMedia.type == MediaType.image) {
        await _applyImageFilter(currentMedia, _currentIndex);
      } else if (currentMedia.type == MediaType.video) {
        await _applyVideoFilter(currentMedia, _currentIndex);
      }

      Get.snackbar(
        "Success",
        "Filter applied successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.lightRed,
        colorText: Colors.white,
        duration: Duration(seconds: 1),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to apply filter: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() {
        _isProcessing = false;
        _previewFilter = null;
      });
    }
  }

  Future<void> _applyImageFilter(SelectedMedia media, int index) async {
    File? imageFile = media.file;
    Uint8List? imageData;

    // Load image data
    if (imageFile != null) {
      imageData = await imageFile.readAsBytes();
    } else if (media.networkUrl != null) {
      // Download network image
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse(media.networkUrl!));
      final response = await request.close();
      imageData = await consolidateHttpClientResponseBytes(response);
      httpClient.close();
    } else {
      throw Exception("No image source available");
    }

    // Decode image
    img.Image? image = img.decodeImage(imageData);
    if (image == null) throw Exception("Failed to decode image");

    // Convert Image to Uint8List bytes for filter application
    final int width = image.width;
    final int height = image.height;

    // Get pixel bytes from the image
    final Uint8List pixels = image.getBytes();

    // Apply filter to the pixel bytes
    _previewFilter!.apply(pixels, width, height);

    // Create new image from filtered pixels
    img.Image filteredImage = img.Image.fromBytes(width, height, pixels);

    // Save filtered image to temp file
    final tempDir = await getTemporaryDirectory();
    final fileName = 'filtered_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final filePath = path.join(tempDir.path, fileName);

    final file = File(filePath);
    await file.writeAsBytes(img.encodeJpg(filteredImage, quality: 95));

    // Store filtered data
    _filteredMediaMap[index] = FilteredMediaData(
      filteredFile: file,
      filterName: _previewFilter!.name,
      originalMedia: media,
    );

    setState(() {});
  }

  Future<void> _applyVideoFilter(SelectedMedia media, int index) async {
    if (media.file == null) {
      throw Exception("Video file not available");
    }

    // Get the FFmpeg filter command based on the filter name
    final ffmpegFilter = _getFFmpegFilterForName(_previewFilter!.name);

    // Create output file path
    final tempDir = await getTemporaryDirectory();
    final fileName =
        'filtered_video_${DateTime.now().millisecondsSinceEpoch}.mp4';
    final outputPath = path.join(tempDir.path, fileName);

    // Build FFmpeg command
    final command =
        '-i "${media.file!.path}" $ffmpegFilter -c:a copy "$outputPath"';

    // Show processing dialog
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.screenBackgroundColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: AppColors.lightRed),
                SizedBox(height: 20.h),
                AppText(
                  "Processing video filter...",
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    try {
      // Execute FFmpeg command
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      Get.back(); // Close processing dialog

      if (ReturnCode.isSuccess(returnCode)) {
        final outputFile = File(outputPath);
        if (await outputFile.exists()) {
          // Store filtered data
          _filteredMediaMap[index] = FilteredMediaData(
            filteredFile: outputFile,
            filterName: _previewFilter!.name,
            originalMedia: media,
          );

          // Reinitialize video player with filtered video immediately
          await _initMedia(index);

          setState(() {});
        } else {
          throw Exception("Output file not created");
        }
      } else {
        final failStackTrace = await session.getFailStackTrace();
        throw Exception("FFmpeg processing failed: $failStackTrace");
      }
    } catch (e) {
      Get.back(); // Close processing dialog if still open
      rethrow;
    }
  }

  String _getFFmpegFilterForName(String filterName) {
    // Map photofilters names to FFmpeg filter commands
    final filterMap = {
      'NoFilter': '-vf "null"',
      'AddictiveBlue': '-vf "colorbalance=bs=0.3:gs=0.1:rs=-0.1"',
      'AddictiveRed': '-vf "colorbalance=bs=-0.1:gs=0.1:rs=0.3"',
      'Aden':
          '-vf "eq=contrast=1.1:brightness=0.05,colorbalance=rs=0.2:gs=-0.1:bs=-0.1"',
      'Amaro': '-vf "eq=contrast=1.3:brightness=0.1:saturation=1.2"',
      'Ashby': '-vf "eq=contrast=1.2,colorbalance=rs=0.2:gs=0.1:bs=-0.2"',
      'Brannan':
          '-vf "eq=contrast=1.4:saturation=0.8,colorbalance=rs=0.1:gs=-0.05:bs=-0.1"',
      'Brooklyn': '-vf "eq=contrast=1.2,colorbalance=rs=0.1:bs=-0.1"',
      'Clarendon': '-vf "eq=brightness=0.1:contrast=1.2:saturation=1.3"',
      'Crema': '-vf "eq=contrast=1.1,colorbalance=rs=0.15:gs=0.05:bs=-0.05"',
      'Dogpatch': '-vf "eq=contrast=1.1:saturation=1.1,colorbalance=rs=0.1"',
      'Earlybird':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.2:gs=0.1:bs=-0.1,eq=saturation=1.1"',
      'F1977':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.15:gs=0.05:bs=-0.1,eq=saturation=1.2"',
      'Gingham': '-vf "eq=brightness=0.05:saturation=0.9"',
      'Ginza': '-vf "eq=contrast=1.2,colorbalance=bs=-0.1"',
      'Hefe':
          '-vf "eq=contrast=1.2:saturation=1.3,colorbalance=rs=0.1:gs=-0.05"',
      'Helena':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.1:gs=0.1:bs=0.1,eq=saturation=1.1"',
      'Hudson': '-vf "eq=contrast=1.2,colorbalance=rs=-0.1:gs=-0.05:bs=0.2"',
      'Inkwell': '-vf "colorchannelmixer=.3:.4:.3:0:.3:.4:.3:0:.3:.4:.3"',
      'Juno': '-vf "eq=contrast=1.1,colorbalance=rs=0.15:gs=0.1:bs=-0.05"',
      'Kelvin':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.2:gs=0.1:bs=-0.2,eq=saturation=1.2"',
      'Lark': '-vf "eq=brightness=0.05,colorbalance=rs=0.1:gs=-0.05"',
      'Lo-Fi': '-vf "eq=contrast=1.5:saturation=1.3"',
      'Ludwig': '-vf "eq=brightness=0.05,colorbalance=rs=0.05:bs=-0.05"',
      'Maven': '-vf "eq=saturation=1.2,colorbalance=gs=0.1"',
      'Mayfair': '-vf "eq=contrast=1.1,colorbalance=rs=0.1:gs=-0.05:bs=-0.1"',
      'Moon':
          '-vf "colorchannelmixer=.5:.5:.5:0:.5:.5:.5:0:.5:.5:.5,eq=brightness=-0.1"',
      'Nashville':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.2:gs=0.05:bs=-0.2,eq=saturation=1.2"',
      'Perpetua': '-vf "eq=brightness=0.05,colorbalance=gs=0.1"',
      'Reyes':
          '-vf "eq=brightness=0.05:saturation=0.85,colorbalance=rs=0.1:gs=0.05"',
      'Rise':
          '-vf "eq=brightness=0.05,colorbalance=rs=0.1:gs=0.05:bs=-0.05,eq=saturation=1.1"',
      'Sierra': '-vf "eq=contrast=1.1,colorbalance=rs=0.1:gs=-0.05:bs=-0.1"',
      'Skyline': '-vf "eq=contrast=1.2,colorbalance=bs=0.1"',
      'Slumber': '-vf "eq=saturation=0.9,colorbalance=rs=0.05:gs=0.05:bs=0.1"',
      'Stinson': '-vf "eq=brightness=0.1:saturation=0.9"',
      'Sutro':
          '-vf "eq=contrast=1.2:brightness=-0.1,colorbalance=rs=0.1:bs=-0.1"',
      'Toaster': '-vf "eq=contrast=1.2,colorbalance=rs=0.2:gs=0.05:bs=-0.2"',
      'Valencia':
          '-vf "eq=contrast=1.1,colorbalance=rs=0.1:gs=0.05:bs=-0.1,eq=saturation=1.1"',
      'Vesper': '-vf "eq=saturation=0.9,colorbalance=gs=0.1:bs=0.1"',
      'Walden': '-vf "eq=brightness=0.1,colorbalance=rs=0.1:gs=0.1:bs=0.1"',
      'Willow': '-vf "colorchannelmixer=.5:.5:.5:0:.5:.5:.5:0:.5:.5:.5"',
      'X-Pro II': '-vf "eq=contrast=1.3:saturation=1.2,colorbalance=rs=0.1"',
    };

    return filterMap[filterName] ?? '-vf "null"';
  }

  void _removeFilterFromCurrentMedia() {
    if (_filteredMediaMap.containsKey(_currentIndex)) {
      // Delete the filtered file if it exists
      final filteredData = _filteredMediaMap[_currentIndex]!;
      if (filteredData.filteredFile != null &&
          filteredData.filteredFile!.existsSync()) {
        filteredData.filteredFile!.deleteSync();
      }

      setState(() {
        _filteredMediaMap.remove(_currentIndex);
        _previewFilter = null;
      });

      // Reinitialize to show original
      _initMedia(_currentIndex);

      Get.snackbar(
        "Filter Removed",
        "Filter has been removed from this media",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
        duration: Duration(seconds: 1),
      );
    }
  }

  List<SelectedMedia> _buildResultMediaList() {
    List<SelectedMedia> resultList = [];

    for (int i = 0; i < widget.selectedMedia.length; i++) {
      if (_filteredMediaMap.containsKey(i)) {
        // Use filtered version
        final filteredData = _filteredMediaMap[i]!;
        resultList.add(SelectedMedia(
          file: filteredData.filteredFile,
          networkUrl: null,
          type: widget.selectedMedia[i].type,
        ));
      } else {
        // Use original
        resultList.add(widget.selectedMedia[i]);
      }
    }

    return resultList;
  }

  Widget _buildMediaView(int index) {
    final media = widget.selectedMedia[index];
    final hasFilter = _filteredMediaMap.containsKey(index);

    // Show filtered version if available
    if (hasFilter) {
      final filteredFile = _filteredMediaMap[index]!.filteredFile;
      if (filteredFile != null) {
        if (media.type == MediaType.image) {
          return Image.file(filteredFile, fit: BoxFit.contain);
        } else if (media.type == MediaType.video) {
          // Show filtered video
          if (_videoController != null && _isVideoInitialized) {
            return Center(
              child: AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
            );
          }
        }
      }
    }

    // Show original
    if (media.type == MediaType.image) {
      if (media.file != null) {
        return Image.file(media.file!, fit: BoxFit.contain);
      } else if (media.networkUrl != null) {
        return Image.network(media.networkUrl!, fit: BoxFit.contain);
      }
    }

    if (media.type == MediaType.video) {
      if (_videoController != null && _isVideoInitialized) {
        return Center(
          child: AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: VideoPlayer(_videoController!),
          ),
        );
      }
      return Center(child: CircularProgressIndicator(color: Colors.white));
    }

    return Container(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Stack(
        children: [
          // Main media view
          PageView.builder(
            controller: _pageController,
            itemCount: widget.selectedMedia.length,
            onPageChanged: (index) async {
              setState(() {
                _currentIndex = index;
                _previewFilter = null;
              });
              await _initMedia(index);
            },
            itemBuilder: (context, index) => _buildMediaView(index),
          ),

          // Top bar with back button and filter indicator
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                InkWell(
                  onTap: () {
                    // ✅ NEW: Stop video playback when going back
                    _videoController?.pause();
                    _disposeVideo();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),

                // Filter applied indicator
                if (_filteredMediaMap.containsKey(_currentIndex))
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.lightRed.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: Colors.white, size: 16.sp),
                        SizedBox(width: 4.w),
                        AppText(
                          _filteredMediaMap[_currentIndex]!.filterName,
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Navigation arrows (if multiple items)
          if (widget.selectedMedia.length > 1)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left arrow
                    if (_currentIndex > 0)
                      GestureDetector(
                        onTap: () async {
                          _currentIndex--;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      )
                    else
                      SizedBox(width: 55.w),

                    // Right arrow
                    if (_currentIndex < widget.selectedMedia.length - 1)
                      GestureDetector(
                        onTap: () async {
                          _currentIndex++;
                          await _pageController.animateToPage(
                            _currentIndex,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 45.w,
                          height: 45.w,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      )
                    else
                      SizedBox(width: 55.w),
                  ],
                ),
              ),
            ),

          // Bottom filter selection panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: AppColors.screenBackgroundColor.withOpacity(0.9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Column(
                children: [
                  // Action buttons
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remove filter button
                        if (_filteredMediaMap.containsKey(_currentIndex))
                          InkWell(
                            onTap: _removeFilterFromCurrentMedia,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.close,
                                      color: Colors.white, size: 18.sp),
                                  SizedBox(width: 5.w),
                                  AppText(
                                    "Remove",
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          SizedBox(),

                        // Apply/Done button
                        InkWell(
                          // onTap: _isProcessing
                          //     ? null
                          //     : () {
                          //         if (_previewFilter != null) {
                          //           _applyFilterToCurrentMedia();
                          //         } else {
                          //           // Return results
                          //           Navigator.pop(
                          //             context,
                          //             _buildResultMediaList(),
                          //           );
                          //         }
                          //       },
                          onTap: _isProcessing
                              ? null
                              : () {
                                  if (_previewFilter != null) {
                                    _applyFilterToCurrentMedia();
                                  } else {
                                    // ✅ NEW: Stop video playback before returning
                                    _videoController?.pause();
                                    _disposeVideo();

                                    Navigator.pop(
                                        context, _buildResultMediaList());
                                  }
                                },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightRed,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: _isProcessing
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        _previewFilter != null
                                            ? Icons.check
                                            : Icons.done_all,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                      SizedBox(width: 5.w),
                                      AppText(
                                        _previewFilter != null
                                            ? "Apply"
                                            : "Done",
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Filter thumbnails
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: widget.filters.length,
                      itemBuilder: (context, index) {
                        final filter = widget.filters[index];
                        final isSelected = _previewFilter?.name == filter.name;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _previewFilter = filter;
                            });
                          },
                          child: Container(
                            width: 80.w,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70.w,
                                  height: 70.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.lightRed
                                          : Colors.white.withOpacity(0.3),
                                      width: isSelected ? 3 : 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.r),
                                    child: _buildFilterThumbnail(filter),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                AppText(
                                  filter.name,
                                  color: isSelected
                                      ? AppColors.lightRed
                                      : Colors.white,
                                  fontSize: 11.sp,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterThumbnail(Filter filter) {
    final currentMedia = widget.selectedMedia[_currentIndex];

    // Show filter preview for both images and videos
    if (filter.name == 'NoFilter') {
      // Show original thumbnail for "No Filter"
      if (_baseThumbnail != null) {
        return Image.memory(_baseThumbnail!, fit: BoxFit.cover);
      }
    } else {
      // Show filtered thumbnail
      return FutureBuilder<Uint8List?>(
        future: _generateFilterThumbnail(filter),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Image.memory(snapshot.data!, fit: BoxFit.cover);
          }

          // Show base thumbnail while loading
          if (_baseThumbnail != null) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.memory(_baseThumbnail!, fit: BoxFit.cover),
                Container(
                  color: Colors.black26,
                  child: Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // Fallback: Show filter name initial
          return Container(
            color: Colors.grey[800],
            child: Center(
              child: Text(
                filter.name[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      );
    }

    // Fallback for when no base thumbnail is available
    if (currentMedia.type == MediaType.image) {
      if (currentMedia.file != null) {
        return Image.file(currentMedia.file!, fit: BoxFit.cover);
      } else if (currentMedia.networkUrl != null) {
        return Image.network(currentMedia.networkUrl!, fit: BoxFit.cover);
      }
    }

    return Container(
      color: Colors.grey[800],
      child: Center(
        child: Text(
          filter.name[0].toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Data class to store filtered media information
class FilteredMediaData {
  final File? filteredFile;
  final String filterName;
  final SelectedMedia originalMedia;

  FilteredMediaData({
    this.filteredFile,
    required this.filterName,
    required this.originalMedia,
  });
}

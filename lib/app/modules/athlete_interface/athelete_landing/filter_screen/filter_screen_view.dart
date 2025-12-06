import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class ImageFilterEditors extends StatefulWidget {
  final List<String> selectedImages;
  final Map<String, String> filters;
  final void Function(void Function()) setModalState;
  final List<String> selectedFilters;

  const ImageFilterEditors({
    super.key,
    required this.selectedImages,
    required this.filters,
    required this.setModalState,
    required this.selectedFilters,
  });

  @override
  State<ImageFilterEditors> createState() => _ImageFilterEditorState();
}

class _ImageFilterEditorState extends State<ImageFilterEditors> {
  int currentImageIndex = 0;
  Map<String, String> thumbnailCache = {};
  String? topImagePath;
  bool isGeneratingTopImage = false;
  bool isGeneratingThumbnails = false;

  @override
  void initState() {
    super.initState();
    _initializeEditor();
  }

  Future<void> _initializeEditor() async {
    await _copyCurrentAssetToTemp();
    await _generateAllThumbnails();
    await _updateTopImage();
  }

  Future<void> _copyCurrentAssetToTemp() async {
    final dir = await getTemporaryDirectory();
    final tempPath = '${dir.path}/current_source_$currentImageIndex.jpg';

    final data = await DefaultAssetBundle.of(
      context,
    ).load(widget.selectedImages[currentImageIndex]);
    final file = File(tempPath);
    await file.writeAsBytes(data.buffer.asUint8List());

    setState(() => topImagePath = tempPath);
  }

  Future<void> _generateAllThumbnails() async {
    setState(() => isGeneratingThumbnails = true);

    final dir = await getTemporaryDirectory();
    final sourcePath = topImagePath ?? widget.selectedImages[currentImageIndex];

    for (String filterName in widget.filters.keys) {
      if (!thumbnailCache.containsKey(filterName)) {
        final filterExpression = widget.filters[filterName]!;
        final outputPath =
            '${dir.path}/thumb_${filterName}_${DateTime.now().millisecondsSinceEpoch}.jpg';

        final cmd =
            '-i "$sourcePath" -vf "$filterExpression,scale=120:-1" -q:v 2 -y "$outputPath"';

        final session = await FFmpegKit.execute(cmd);
        final returnCode = await session.getReturnCode();

        if (ReturnCode.isSuccess(returnCode)) {
          setState(() => thumbnailCache[filterName] = outputPath);
        }
      }
    }

    setState(() => isGeneratingThumbnails = false);
  }

  Future<void> _updateTopImage() async {
    if (widget.selectedFilters.isEmpty) {
      await _copyCurrentAssetToTemp();
      return;
    }

    setState(() => isGeneratingTopImage = true);

    final dir = await getTemporaryDirectory();

    final data = await DefaultAssetBundle.of(
      context,
    ).load(widget.selectedImages[currentImageIndex]);
    final sourceFile = File(
      '${dir.path}/source_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await sourceFile.writeAsBytes(data.buffer.asUint8List());

    final outputPath =
        '${dir.path}/filtered_top_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final combinedFilters =
        widget.selectedFilters.map((f) => widget.filters[f]).join(',');

    final cmd =
        '-i "${sourceFile.path}" -vf "$combinedFilters" -q:v 2 -y "$outputPath"';

    final session = await FFmpegKit.execute(cmd);
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      setState(() {
        topImagePath = outputPath;
        isGeneratingTopImage = false;
      });
    } else {
      setState(() => isGeneratingTopImage = false);
    }
  }

  void _onFilterTap(String filterName) async {
    widget.setModalState(() {
      if (widget.selectedFilters.contains(filterName)) {
        widget.selectedFilters.remove(filterName);
      } else {
        widget.selectedFilters.add(filterName);
      }
    });

    await _updateTopImage();
  }

  void _onImagePageChanged(int index) async {
    setState(() {
      currentImageIndex = index;
      topImagePath = null;
      thumbnailCache.clear();
    });

    widget.setModalState(() {
      widget.selectedFilters.clear();
    });

    await _initializeEditor();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Filter Preview'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: MediaQuery.of(context).size.height * 0.43,
          margin: const EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.selectedImages.length,
                onPageChanged: _onImagePageChanged,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: topImagePath != null
                          ? Image.file(
                              File(topImagePath!),
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
              if (isGeneratingTopImage)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
              if (widget.selectedFilters.isNotEmpty)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.selectedFilters.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Select Filters'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: widget.filters.isEmpty
              ? Center(
                  child: Text(
                    'No filters available'.tr,
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: widget.filters.keys.length,
                  itemBuilder: (context, index) {
                    final filterName = widget.filters.keys.elementAt(index);
                    final isSelected = widget.selectedFilters.contains(
                      filterName,
                    );
                    final thumbnailPath = thumbnailCache[filterName];

                    return GestureDetector(
                      onTap: () => _onFilterTap(filterName),
                      child: Container(
                        width: 95,
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              height: 85,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.grey[700]!,
                                  width: isSelected ? 3 : 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    thumbnailPath != null
                                        ? Image.file(
                                            File(thumbnailPath),
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                Container(
                                              color: Colors.grey[800],
                                              child: const Icon(
                                                Icons.error_outline,
                                                color: Colors.white54,
                                                size: 24,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            color: Colors.grey[800],
                                            child: const Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.white54,
                                                ),
                                              ),
                                            ),
                                          ),
                                    if (isSelected)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.3),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              filterName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color:
                                    isSelected ? Colors.blue : Colors.white70,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        const SizedBox(height: 16),
        if (widget.selectedFilters.isNotEmpty)
          Center(
            child: TextButton.icon(
              onPressed: () async {
                widget.setModalState(() {
                  widget.selectedFilters.clear();
                });
                await _updateTopImage();
              },
              icon: const Icon(Icons.clear_all, color: Colors.redAccent),
              label: Text(
                'Clear All Filters'.tr,
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
      ],
    );
  }
}

class VideoFilterEditor extends StatefulWidget {
  final String selectedVideo;
  final Map<String, String> filters;
  final void Function(void Function()) setModalState;
  final List<String> selectedFilters;

  const VideoFilterEditor({
    super.key,
    required this.selectedVideo,
    required this.filters,
    required this.setModalState,
    required this.selectedFilters,
  });

  @override
  State<VideoFilterEditor> createState() => _VideoFilterEditorState();
}

class _VideoFilterEditorState extends State<VideoFilterEditor> {
  Map<String, String> thumbnailCache = {};
  String? topVideoPath;
  VideoPlayerController? topVideoController;
  Map<String, VideoPlayerController> thumbnailControllers = {};

  bool isGeneratingTopVideo = false;
  bool isGeneratingThumbnails = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initializeEditor();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _disposeAllControllers();
    super.dispose();
  }

  void _disposeAllControllers() {
    topVideoController?.dispose();
    topVideoController = null;

    for (var controller in thumbnailControllers.values) {
      controller.dispose();
    }
    thumbnailControllers.clear();
  }

  Future<void> _initializeEditor() async {
    try {
      await _copyCurrentAssetToTemp();
      await _generateAllThumbnails();
      await _updateTopVideo();
    } catch (e) {
      if (!_isDisposed && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading video: $e')));
      }
    }
  }

  Future<void> _copyCurrentAssetToTemp() async {
    if (_isDisposed) return;

    final dir = await getTemporaryDirectory();
    final tempPath =
        '${dir.path}/current_source_video_${DateTime.now().millisecondsSinceEpoch}.mp4';

    final data = await DefaultAssetBundle.of(
      context,
    ).load(widget.selectedVideo);
    final file = File(tempPath);
    await file.writeAsBytes(data.buffer.asUint8List());

    if (!_isDisposed && mounted) {
      setState(() => topVideoPath = tempPath);
      await _initializeTopVideoPlayer(tempPath);
    }
  }

  Future<void> _initializeTopVideoPlayer(String path) async {
    if (_isDisposed || !mounted) return;

    try {
      topVideoController?.dispose();
      topVideoController = VideoPlayerController.file(File(path));
      await topVideoController!.initialize();

      if (!_isDisposed && mounted) {
        topVideoController!.setLooping(true);
        topVideoController!.setVolume(0);
        topVideoController!.play();
        setState(() {});
      }
    } catch (e) {
      topVideoController?.dispose();
      topVideoController = null;
    }
  }

  Future<void> _generateAllThumbnails() async {
    if (_isDisposed || !mounted) return;

    setState(() => isGeneratingThumbnails = true);

    final dir = await getTemporaryDirectory();
    final sourcePath = topVideoPath ?? widget.selectedVideo;

    int processed = 0;
    final filterList = widget.filters.keys.toList();

    for (int i = 0; i < filterList.length; i++) {
      if (_isDisposed || !mounted) break;

      final filterName = filterList[i];
      if (!thumbnailCache.containsKey(filterName)) {
        try {
          final filterExpression = widget.filters[filterName]!;
          final outputPath =
              '${dir.path}/thumb_${filterName}_${DateTime.now().millisecondsSinceEpoch}.mp4';

          final cmd =
              '-i "$sourcePath" -t 2 -vf "$filterExpression,scale=160:-2:flags=fast_bilinear,format=yuv420p" -c:v libx264 -preset ultrafast -crf 35 -an -y "$outputPath"';

          final session = await FFmpegKit.execute(cmd);
          final returnCode = await session.getReturnCode();

          if (ReturnCode.isSuccess(returnCode) &&
              File(outputPath).existsSync()) {
            if (_isDisposed || !mounted) break;

            setState(() => thumbnailCache[filterName] = outputPath);

            try {
              final controller = VideoPlayerController.file(File(outputPath));
              await controller.initialize();

              if (!_isDisposed && mounted) {
                controller.setLooping(true);
                controller.setVolume(0);
                controller.play();
                thumbnailControllers[filterName] = controller;
                setState(() {});
              } else {
                controller.dispose();
              }
            } catch (e) {
              // Ignore thumbnail player errors
            }
          }

          processed++;

          if (processed % 3 == 0) {
            await Future.delayed(const Duration(milliseconds: 100));
          }
        } catch (e) {
          // Ignore thumbnail generation errors
        }
      }
    }

    if (!_isDisposed && mounted) {
      setState(() => isGeneratingThumbnails = false);
    }
  }

  Future<void> _updateTopVideo() async {
    if (_isDisposed || !mounted) return;

    if (widget.selectedFilters.isEmpty) {
      await _copyCurrentAssetToTemp();
      return;
    }

    setState(() => isGeneratingTopVideo = true);

    try {
      final dir = await getTemporaryDirectory();

      final data = await DefaultAssetBundle.of(
        context,
      ).load(widget.selectedVideo);
      final sourceFile = File(
        '${dir.path}/source_${DateTime.now().millisecondsSinceEpoch}.mp4',
      );
      await sourceFile.writeAsBytes(data.buffer.asUint8List());

      final outputPath =
          '${dir.path}/filtered_top_${DateTime.now().millisecondsSinceEpoch}.mp4';

      final combinedFilters =
          widget.selectedFilters.map((f) => widget.filters[f]).join(',');

      final cmd =
          '-i "${sourceFile.path}" -vf "$combinedFilters,format=yuv420p" -c:v libx264 -preset ultrafast -crf 23 -an -movflags +faststart -y "$outputPath"';

      final session = await FFmpegKit.execute(cmd);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode) && File(outputPath).existsSync()) {
        if (!_isDisposed && mounted) {
          setState(() {
            topVideoPath = outputPath;
            isGeneratingTopVideo = false;
          });
          await _initializeTopVideoPlayer(outputPath);
        }
      } else {
        if (!_isDisposed && mounted) {
          setState(() => isGeneratingTopVideo = false);
        }
      }
    } catch (e) {
      if (!_isDisposed && mounted) {
        setState(() => isGeneratingTopVideo = false);
      }
    }
  }

  void _onFilterTap(String filterName) async {
    if (_isDisposed || !mounted) return;

    widget.setModalState(() {
      if (widget.selectedFilters.contains(filterName)) {
        widget.selectedFilters.remove(filterName);
      } else {
        widget.selectedFilters.add(filterName);
      }
    });

    await _updateTopVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 320,
          margin: const EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: topVideoController != null &&
                          topVideoController!.value.isInitialized &&
                          !_isDisposed
                      ? AspectRatio(
                          aspectRatio: topVideoController!.value.aspectRatio,
                          child: VideoPlayer(topVideoController!),
                        )
                      : Container(
                          color: Colors.grey[800],
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ),
              if (isGeneratingTopVideo)
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(height: 12),
                          Text(
                            'Applying filters...'.tr,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (widget.selectedFilters.isNotEmpty)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.selectedFilters.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Select Filters'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: widget.filters.isEmpty
              ? Center(
                  child: Text(
                    'No filters available'.tr,
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: widget.filters.keys.length,
                  itemBuilder: (context, index) {
                    final filterName = widget.filters.keys.elementAt(index);
                    final isSelected = widget.selectedFilters.contains(
                      filterName,
                    );
                    final thumbnailPath = thumbnailCache[filterName];
                    final thumbnailController =
                        thumbnailControllers[filterName];

                    return GestureDetector(
                      onTap: () => _onFilterTap(filterName),
                      child: Container(
                        width: 95,
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              height: 85,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.grey[700]!,
                                  width: isSelected ? 3 : 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    if (thumbnailController != null &&
                                        thumbnailController
                                            .value.isInitialized &&
                                        !_isDisposed)
                                      FittedBox(
                                        fit: BoxFit.cover,
                                        child: SizedBox(
                                          width: thumbnailController
                                              .value.size.width,
                                          height: thumbnailController
                                              .value.size.height,
                                          child: VideoPlayer(
                                            thumbnailController,
                                          ),
                                        ),
                                      )
                                    else
                                      Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (isSelected)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.3),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              filterName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color:
                                    isSelected ? Colors.blue : Colors.white70,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        const SizedBox(height: 16),
        if (widget.selectedFilters.isNotEmpty)
          Center(
            child: TextButton.icon(
              onPressed: () async {
                widget.setModalState(() {
                  widget.selectedFilters.clear();
                });
                await _updateTopVideo();
              },
              icon: const Icon(Icons.clear_all, color: Colors.redAccent),
              label: Text(
                'Clear All Filters'.tr,
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
      ],
    );
  }
}

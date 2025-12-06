import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/story_view/latest_story_response.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_button.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StoryViewerScreen extends StatefulWidget {
  final bool isAthlete;
  final List<StoryItem> stories;
  final int initialIndex;

  const StoryViewerScreen({
    super.key,
    required this.stories,
    required this.initialIndex,
    required this.isAthlete,
  });

  @override
  _StoryViewerScreenState createState() => _StoryViewerScreenState();
}

class _StoryViewerScreenState extends State<StoryViewerScreen>
    with TickerProviderStateMixin {
  late PageController pageController;
  late int currentIndex;

  VideoPlayerController? videoController;
  AnimationController? progressController;

  bool isPaused = false; // ⭐ ADDED

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pageController = PageController(initialPage: currentIndex);
    _loadCurrentStory();
  }

  @override
  void dispose() {
    videoController?.dispose();
    progressController?.dispose();
    pageController.dispose();
    super.dispose();
  }

  // ----------------------------------------------------
  // LOAD CURRENT STORY
  // ----------------------------------------------------
  Future<void> _loadCurrentStory() async {
    final story = widget.stories[currentIndex];

    progressController?.dispose();
    videoController?.dispose();

    progressController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: story.mediaType == "video" ? 8 : (story.duration ?? 15),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _nextStory();
        }
      });

    if (story.mediaType == "video") {
      videoController = VideoPlayerController.network(
        story.mediaUrl,
        httpHeaders: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
          'Referer': Uri.parse(story.mediaUrl).origin,
          'Accept': '*/*',
        },
      );

      await videoController!.initialize();
      videoController!.play();
      setState(() {});

      if (!widget.isAthlete) {
        final fanController = Get.isRegistered()
            ? Get.find<FanLandingController>()
            : Get.put(FanLandingController());
        fanController.updateStoryViewedStatus(story.id ?? "");
      } else {
        final athleteController = Get.find<AtheleteHomeController>();
        await athleteController.getAthleteStoryView(story.id ?? "");
      }

      progressController!.duration =
          videoController!.value.duration == Duration.zero
              ? const Duration(seconds: 8)
              : videoController!.value.duration;

      progressController!.forward(from: 0);
    } else {
      progressController!.forward(from: 0);
    }

    setState(() {});
  }

  void _pauseStory() {
    if (isPaused) return;
    isPaused = true;

    progressController?.stop();
    videoController?.pause();

    setState(() {});
  }

  void _resumeStory() {
    if (!isPaused) return;
    isPaused = false;

    progressController?.forward();
    videoController?.play();

    setState(() {});
  }

  // ----------------------------------------------------
  // NAVIGATION
  // ----------------------------------------------------
  void _nextStory() {
    if (currentIndex < widget.stories.length - 1) {
      currentIndex++;
      pageController.jumpToPage(currentIndex);
      _loadCurrentStory();
    } else {
      Navigator.pop(context);
    }
  }

  void _previousStory() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.jumpToPage(currentIndex);
      _loadCurrentStory();
    }
  }

  // ----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final story = widget.stories[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onLongPress: _pauseStory, // ⭐ ADDED
        onLongPressUp: _resumeStory, // ⭐ ADDED
        child: Stack(
          children: [
            // ---------------------------
            // CONTENT VIEW
            // ---------------------------
            PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                final story = widget.stories[index];

                if (story.mediaType == "video" && videoController != null) {
                  return Center(
                    child: AspectRatio(
                      aspectRatio: videoController?.value.aspectRatio ?? 16 / 9,
                      child: VideoPlayer(videoController!),
                    ),
                  );
                }

                return Image.network(
                  story.mediaUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),

            // ---------------------------
            // TAPPABLE ZONES
            // ---------------------------
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _previousStory,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _nextStory,
                  ),
                ),
              ],
            ),

            // --------------------------------------------------
            // TOP BAR: dp + name + progress indicators
            // --------------------------------------------------
            Positioned(
              top: 40,
              left: 12,
              right: 12,
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: progressController!,
                    builder: (context, child) {
                      return Row(
                        children: widget.stories.map((s) {
                          int idx = widget.stories.indexOf(s);

                          double value;
                          if (idx < currentIndex) {
                            value = 1;
                          } else if (idx == currentIndex) {
                            value = progressController!.value;
                          } else {
                            value = 0;
                          }

                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: LinearProgressIndicator(
                                value: value,
                                backgroundColor: Colors.white30,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CommonBackButton())
                ],
              ),
            ),

            Visibility(
              visible: widget.isAthlete,
              child: Positioned(
                bottom: 90,
                left: 20,
                child: Row(
                  children: [
                    CommonButton(
                      text:
                          "${Get.find<AtheleteHomeController>().storyViewsCount.value} Views",
                      onPressed: () => _showViewsList(
                          context, Get.find<AtheleteHomeController>()),
                      icon: "eye_open",
                      iconColor: Colors.black,
                      color: Colors.white,
                      fontSize: 13,
                      width: 135,
                    ),
                    const SizedBox(width: 10),
                    CommonButton(
                      text: "Delete".tr,
                      onPressed: () {
                        CustomDialogbox.showConfirmation(
                          title: "Are you sure?",
                          cancelText: "Cancel",
                          confirmText: "Delete Story".tr,
                          onConfirm: () {
                            Get.find<AtheleteHomeController>()
                                .deleteStoryByAthlete(story.id ?? "");
                          },
                          onCancel: () {},
                        );
                      },
                      icon: "delete",
                      iconColor: Colors.white,
                      color: Colors.red,
                      textColor: Colors.white,
                      fontSize: 13,
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------
            // CAPTION
            // ---------------------------
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          Get.arguments["athleteProfile"] ?? "",
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        Get.arguments["athleteName"] ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    story.caption ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showViewsList(BuildContext context, AtheleteHomeController controller) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 3.0,
        minWidth: MediaQuery.of(context).size.width,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      backgroundColor: AppColors.screenBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Obx(() {
          final viewers = controller.storyViewers;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Center(
                  child: Text(
                    "View By".tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 20),

                // If no views → show empty message
                if (viewers.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(Icons.remove_red_eye_outlined,
                            size: 40, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "No views yet".tr,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                else
                  // Show dynamic viewers list
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: viewers.length,
                      itemBuilder: (context, index) {
                        final v = viewers[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              // Profile Image
                              CircleAvatar(
                                radius: 22,
                                backgroundImage: (v.profilePic != null &&
                                        v.profilePic!.isNotEmpty)
                                    ? NetworkImage(v.profilePic!)
                                    : null,
                                child: (v.profilePic == null ||
                                        v.profilePic!.isEmpty)
                                    ? const Icon(Icons.person)
                                    : null,
                              ),

                              const SizedBox(width: 12),

                              // Name
                              Expanded(
                                child: Text(
                                  v.name ?? "Unknown",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        });
      },
    );
  }
}

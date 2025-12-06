// // // video_reel_screen_full.dart
// // import 'dart:async';
// // import 'package:athlete_elite/app/constants/api_endpoints.dart';
// // import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
// // import 'package:athlete_elite/app/data/providers/api_provider.dart';
// // import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
// // import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
// // import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/action_model/comments_model.dart';
// // import 'package:athlete_elite/app/utils/app_logger.dart';
// // import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
// // import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
// // import 'package:athlete_elite/app/widgets/custom_dialogbox.dart'
// //     show CustomDialogbox;
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:video_player/video_player.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // // Replace these imports with your app imports
// // import 'package:athlete_elite/app/constants/app_colors.dart';
// // import 'package:athlete_elite/app/widgets/AppText.dart';
// // import 'package:athlete_elite/app/widgets/common_back_button.dart';
// // import 'package:athlete_elite/app/widgets/custom_toast.dart';

// // // ----------------------------- Models -----------------------------
// // class ReelModel {
// //   final String id;
// //   final String videoUrl;
// //   final String thumbnailUrl;
// //   final String caption;

// //   bool isLiked;
// //   int likesCount;
// //   int commentsCount;

// //   RxList<CommentItem> comments = <CommentItem>[].obs;
// //   RxBool commentsLoading = true.obs;

// //   ReelModel({
// //     required this.id,
// //     required this.videoUrl,
// //     required this.thumbnailUrl,
// //     required this.caption,
// //     this.isLiked = false,
// //     this.likesCount = 0,
// //     this.commentsCount = 5,
// //   });
// // }

// // // ----------------------------- Controller -----------------------------
// // class VideoReelsController extends GetxController {
// //   final List<PreviewItem> reelsData;
// //   VideoReelsController(this.reelsData);

// //   ApiProvider apiProvider =
// //       Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

// //   final PageController pageController = PageController();
// //   final RxInt currentPage = 0.obs;
// //   final RxBool showComments = false.obs;
// //   final TextEditingController commentController = TextEditingController();

// //   // Keep mapped controllers to indexes to cache players
// //   final Map<int, VideoPlayerController> _videoControllerCache = {};
// //   final Map<int, bool> _isBuffering = {};
// //   final RxList<ReelModel> reels = <ReelModel>[].obs;
// //   final sendCommentLoading = false.obs;
// //   final shareChannelIsLoading = false.obs;

// //   // Double-tap heart animation state
// //   final RxInt heartIndex = RxInt(-1);

// //   @override
// //   void onInit() {
// //     super.onInit();

// //     // Map your PreviewItem -> ReelModel
// //     reels.value = reelsData.asMap().entries.map((entry) {
// //       final item = entry.value;
// //       // adjust field names as necessary
// //       return ReelModel(
// //         id: item.id,
// //         videoUrl: item.mediaUrl ?? '',
// //         thumbnailUrl: item.thumbnailUrl ?? '',
// //         caption: item.caption ?? item.title ?? '',
// //         likesCount: item.likesCount ?? 0,
// //         commentsCount: item.commentsCount ?? 0,
// //         // isLiked: item.?? false,
// //       );
// //     }).toList();

// //     // Preload first, second controllers
// //     _preloadControllers(initialIndex: 0);

// //     pageController.addListener(_onPageChanged);
// //   }

// //   void _onPageChanged() {
// //     final page = (pageController.page ?? 0).round();
// //     if (currentPage.value != page) {
// //       pauseVideo(currentPage.value);
// //       currentPage.value = page;
// //       showComments.value = false;
// //       _playVideo(page);
// //       _preloadControllers(initialIndex: page);
// //     }
// //   }

// //   // Preload current, previous, next into cache to allow smooth transitions
// //   void _preloadControllers({required int initialIndex}) {
// //     final indicesToEnsure = <int>{
// //       initialIndex - 1,
// //       initialIndex,
// //       initialIndex + 1,
// //     };
// //     for (final idx in indicesToEnsure) {
// //       if (idx >= 0 && idx < reels.length) {
// //         _ensureController(idx);
// //       }
// //     }

// //     // Dispose far away controllers to conserve memory (keep 5 around max)
// //     final keep = {
// //       initialIndex - 2,
// //       initialIndex - 1,
// //       initialIndex,
// //       initialIndex + 1,
// //       initialIndex + 2
// //     };
// //     final keys = List<int>.from(_videoControllerCache.keys);
// //     for (final k in keys) {
// //       if (!keep.contains(k)) {
// //         _videoControllerCache[k]?.dispose();
// //         _videoControllerCache.remove(k);
// //       }
// //     }
// //   }

// //   // Ensure controller exists and initialized
// //   Future<void> _ensureController(int index) async {
// //     if (_videoControllerCache.containsKey(index)) return;
// //     final url = reels[index].videoUrl;
// //     final controller = VideoPlayerController.network(
// //       url,
// //       httpHeaders: {
// //         'User-Agent':
// //             'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
// //         'Referer': Uri.parse(url).origin,
// //         'Accept': '*/*',
// //       },
// //     );
// //     _videoControllerCache[index] = controller;
// //     _isBuffering[index] = true;
// //     try {
// //       await controller.initialize();
// //       controller.setLooping(true);
// //       _isBuffering[index] = false;
// //       // Auto play only if it's current page
// //       if (index == currentPage.value) {
// //         controller.play();
// //       }
// //       update();
// //     } catch (e) {
// //       _isBuffering[index] = false;
// //       debugPrint('Video init error for index $index : $e');
// //     }
// //   }

// //   VideoPlayerController? controllerForIndex(int index) {
// //     return _videoControllerCache[index];
// //   }

// //   bool isBuffering(int index) {
// //     if (_isBuffering[index] == true) {
// //       reels.refresh();
// //       return true;
// //     }
// //     return _isBuffering[index] ?? false;
// //   }

// //   void _playVideo(int index) {
// //     final c = controllerForIndex(index);
// //     if (c != null && c.value.isInitialized) {
// //       c.play();
// //     } else {
// //       _ensureController(index).then((_) {
// //         controllerForIndex(index)?.play();
// //       });
// //     }
// //   }

// //   void pauseVideo(int index) {
// //     final c = controllerForIndex(index);
// //     if (c != null && c.value.isPlaying) c.pause();
// //   }

// //   void togglePlayPause(int index) {
// //     final c = controllerForIndex(index);
// //     if (c == null) return;
// //     if (c.value.isPlaying) {
// //       c.pause();
// //     } else {
// //       c.play();
// //     }
// //     update();
// //   }

// //   void toggleMute(int index) {
// //     final c = controllerForIndex(index);
// //     if (c == null) return;
// //     final isMuted = c.value.volume == 0;
// //     c.setVolume(isMuted ? 1.0 : 0.0);
// //     update();
// //   }

// //   Future<bool> postCommentForChannel(String id) async {
// //     AppLogger.d("the id of the channel: $id");
// //     final result = await apiProvider.post(
// //         "${ApiEndpoints.postNewCommentForChannel}$id/comment",
// //         {"content": commentController.text},
// //         isLoading: sendCommentLoading);

// //     if (result.success) {
// //       AppLogger.d(result.data);
// //       return result.success;
// //     }

// //     AppLogger.d(result.error);
// //     return false;
// //   }

// //   Future<bool> postReactForCommentForChannel(String id, String emoji) async {
// //     AppLogger.d("the id of the channel: $id");
// //     final result = await apiProvider.post(
// //         "${ApiEndpoints.reactCommentForChannel}$id/react",
// //         {"emoji": emoji == "LIKE" ? "❤️" : ""});

// //     if (result.success) {
// //       AppLogger.d(result.data);
// //       return result.success;
// //     }

// //     AppLogger.d(result.error);
// //     return false;
// //   }

// //   Future<bool> updateLikeCountForChannel(String id) async {
// //     AppLogger.d("the id of the channel: $id");
// //     final result = await apiProvider
// //         .post("${ApiEndpoints.updateLikeCountForChannel}$id/like", {});

// //     if (result.success) {
// //       AppLogger.d(result.data);
// //       return result.success;
// //     }

// //     AppLogger.d(result.error);
// //     return false;
// //   }

// //   Future<void> getAllCommentsForChannel(String id, int reelIndex) async {
// //     final reel = reels[reelIndex];
// //     reel.commentsLoading.value = true;

// //     final result = await apiProvider
// //         .get("${ApiEndpoints.getAllCommentsForChannel}$id/comments");

// //     if (result.success) {
// //       final response = CommentsResponse.fromJson(result.data);
// //       reel.commentsCount = response.data.commentsCount;
// //       reel.comments.assignAll(response.data.comments);
// //     } else {
// //       AppLogger.d(result.error);
// //     }

// //     reel.commentsLoading.value = false;
// //   }

// //   String timeAgo(String isoString) {
// //     try {
// //       final dt = DateTime.parse(isoString).toLocal();
// //       return dt.timeAgo();
// //     } catch (_) {
// //       return "";
// //     }
// //   }

// //   Future<void> toggleCommentReaction(int reelIndex, int commentIndex) async {
// //     final comment = reels[reelIndex].comments[commentIndex];
// //     final newReaction = comment.userReaction == "LIKE" ? null : "LIKE";

// //     final success =
// //         await postReactForCommentForChannel(comment.id, newReaction ?? "");

// //     if (success) {
// //       // Create a new updated comment using copyWith
// //       final updatedComment = comment.copyWith(
// //         userReaction: newReaction,
// //         isReacted: comment.isReacted,
// //         reactionsCount: newReaction == "LIKE"
// //             ? comment.reactionsCount + 1
// //             : comment.reactionsCount - 1,
// //       );

// //       // Replace in the reactive list
// //       reels[reelIndex].comments[commentIndex] = updatedComment;

// //       // Refresh UI
// //       reels[reelIndex].comments.refresh();
// //     }
// //   }

// //   Future<void> shareChannelLink(int index) async {
// //     final reel = reels[index];
// //     shareChannelIsLoading.value = true;

// //     try {
// //       final result = await apiProvider.post(
// //         "${ApiEndpoints.shareChannel}${reel.id}/share",
// //         {},
// //         isLoading: shareChannelIsLoading,
// //       );

// //       AppLogger.d("the share result: ${result.data}");

// //       if (result.success && result.data != null) {
// //         final data = result.data['data']; // inner data map

// //         final publicUrl = fixCorruptedUrl(data?['publicUrl']) as String?;

// //         if (publicUrl != null && publicUrl.isNotEmpty) {
// //           await Share.share(
// //             'Check out this Channel : ${fixCorruptedUrl(publicUrl)}',
// //             subject: 'Athlete Video',
// //           );
// //         } else {
// //           CustomToast.show('Failed to get share link');
// //         }
// //       } else {
// //         CustomToast.show('Failed to generate share link');
// //       }
// //     } catch (e) {
// //       AppLogger.d('Share error: $e');
// //       CustomToast.show('Something went wrong');
// //     } finally {
// //       shareChannelIsLoading.value = false;
// //     }
// //   }

// //   void toggleLike(int index) {
// //     final r = reels[index];
// //     r.isLiked = !r.isLiked;
// //     r.likesCount += r.isLiked ? 1 : -1;
// //     reels.refresh();
// //   }

// //   void showHeartAnimationAt(int index) {
// //     heartIndex.value = index;
// //     Future.delayed(const Duration(milliseconds: 600), () {
// //       heartIndex.value = -1;
// //     });
// //   }

// //   // COMMENTS - simple local add
// //   void addComment(int reelIndex) {
// //     final text = commentController.text.trim();
// //     if (text.isEmpty) return;
// //     postCommentForChannel(reels[reelIndex].id).then((value) async {
// //       reels[reelIndex].commentsCount += 1;
// //       commentController.clear();
// //       await getAllCommentsForChannel(reels[reelIndex].id, reelIndex);
// //       reels.refresh();
// //     });
// //   }

// //   // SHARE helpers (placeholder)
// //   void shareLink(int index) {
// //     // Use share_plus or platform channels to share - placeholder:
// //     CustomToast.show("Share link: ${reels[index].videoUrl}");
// //   }

// //   @override
// //   void onClose() {
// //     for (final c in _videoControllerCache.values) {
// //       try {
// //         c.dispose();
// //       } catch (_) {}
// //     }
// //     pageController.dispose();
// //     commentController.dispose();
// //     super.onClose();
// //   }
// // }

// // class VideoReelScreenFull extends StatelessWidget {
// //   final bool isAthlete;
// //   final List<PreviewItem> reelsData;
// //   final int startIndex;

// //   const VideoReelScreenFull({
// //     super.key,
// //     required this.isAthlete,
// //     required this.reelsData,
// //     this.startIndex = 0,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = Get.put(VideoReelsController(reelsData));
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       controller.pageController.jumpToPage(startIndex);
// //       controller.currentPage.value = startIndex;
// //       controller._preloadControllers(initialIndex: startIndex);
// //     });

// //     return Scaffold(
// //       backgroundColor: AppColors.screenBackgroundColor,
// //       body: Obx(() {
// //         if (controller.reels.isEmpty) {
// //           return const Center(child: CircularProgressIndicator());
// //         }

// //         return PageView.builder(
// //           controller: controller.pageController,
// //           scrollDirection: Axis.vertical,
// //           itemCount: controller.reels.length,
// //           itemBuilder: (context, index) {
// //             return _ReelPage(
// //               index: index,
// //               reel: controller.reels[index],
// //               controller: controller,
// //             );
// //           },
// //         );
// //       }),
// //     );
// //   }
// // }

// // // ----------------------------- Single Reel Page -----------------------------
// // class _ReelPage extends StatefulWidget {
// //   final int index;
// //   final ReelModel reel;
// //   final VideoReelsController controller;
// //   const _ReelPage({
// //     required this.index,
// //     required this.reel,
// //     required this.controller,
// //   });

// //   @override
// //   State<_ReelPage> createState() => _ReelPageState();
// // }

// // class _ReelPageState extends State<_ReelPage>
// //     with SingleTickerProviderStateMixin {
// //   late final VideoReelsController ctrl;
// //   late final int index;
// //   late AnimationController _heartAnimController;
// //   late AtheleteHomeController home;
// //   late AtheleteLandingController landingController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     home = Get.isRegistered()
// //         ? Get.find<AtheleteHomeController>()
// //         : Get.put(AtheleteHomeController());
// //     landingController = Get.isRegistered()
// //         ? Get.find<AtheleteLandingController>()
// //         : Get.put(AtheleteLandingController());
// //     ctrl = widget.controller;
// //     index = widget.index;

// //     _heartAnimController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 500),
// //     );

// //     // ensure this index controller is ready (if not preloaded)
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       ctrl._ensureController(index);
// //       // also ensure neighbors
// //       ctrl._ensureController(index + 1);
// //       ctrl._ensureController(index - 1);
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _heartAnimController.dispose();
// //     super.dispose();
// //   }

// //   void _onDoubleTap() {
// //     ctrl.updateLikeCountForChannel(widget.reel.id).then((value) {
// //       if (value) {
// //         ctrl.toggleLike(index);
// //         ctrl.showHeartAnimationAt(index);
// //         _heartAnimController
// //           ..reset()
// //           ..forward();
// //         HapticFeedback.mediumImpact();
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final reel = ctrl.reels[index];

// //     return Obx(() {
// //       final vp = ctrl.controllerForIndex(index);
// //       final isInitialized = vp?.value.isInitialized ?? false;
// //       final isPlaying = vp?.value.isPlaying ?? false;
// //       final isMuted = vp != null ? (vp.value.volume == 0) : false;
// //       bool buffering = false;

// //       WidgetsBinding.instance.addPostFrameCallback((_) {
// //         buffering = ctrl.isBuffering(index);
// //       });

// //       return GestureDetector(
// //         behavior: HitTestBehavior.opaque,
// //         onDoubleTap: _onDoubleTap,
// //         onTap: () => ctrl.togglePlayPause(index),
// //         onLongPress: () => ctrl.pauseVideo(index),
// //         onLongPressUp: () => ctrl._playVideo(index),
// //         child: Stack(
// //           children: [
// //             Positioned(
// //               right: 10.w,
// //               top: 50.h,
// //               child: PopupMenuButton<String>(
// //                 color: const Color(0xFF1A1A1A),
// //                 elevation: 12,
// //                 constraints: BoxConstraints(maxWidth: 140.w),
// //                 offset: const Offset(-10, 40),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                   side: BorderSide(color: AppColors.white, width: 1),
// //                 ),
// //                 onSelected: (value) {
// //                    if (value == 'archive') {
// //                     landingController
// //                         .uploadChannelToarchive(reel.id)
// //                         .then((success) {
// //                       if (success) {
// //                         ctrl.removeReelAndNavigate(index);
// //                         CustomToast.show("Channel archived successfully!");
// //                       } else {
// //                         CustomToast.show("Failed to archive channel");
// //                       }
// //                     }).onError((error, stackTrace) {
// //                       AppLogger.d("error: $error $stackTrace");
// //                       CustomToast.show("Error archiving channel");
// //                     });
// //                   } else if (value == 'delete') {
// //                     CustomDialogbox.showConfirmation(
// //                       title: "Are you sure?",
// //                       cancelText: "Cancel",
// //                       confirmText: "Delete Channel",
// //                       onConfirm: () {
// //                         // controller.deleteBrandPoster(id).then((value) {
// //                         //   CustomToast.show("Poster Deleted Successfully!");
// //                         //   controller.getAthleteChannelCategories();
// //                         //   controller.update();
// //                         //   mediaPickerController.selectedImages.clear();
// //                         // });
// //                       },
// //                       onCancel: () => Get.back(),
// //                     );
// //                   }
// //                 },
// //                 itemBuilder: (context) => [
// //                   commonMenuPopupItem(
// //                     value: 'archive',
// //                     icon: "reschedule",
// //                     text: "Archive",
// //                     borderColor: AppColors.primaryColor,
// //                   ),
// //                   commonMenuPopupItem(
// //                     value: 'delete',
// //                     icon: "delete",
// //                     text: "Delete",
// //                     borderColor: AppColors.red,
// //                     textColor: AppColors.red,
// //                     iconColor: AppColors.red,
// //                   ),
// //                 ],
// //                 icon: Container(
// //                   padding: EdgeInsets.all(6.w),
// //                   decoration: BoxDecoration(
// //                     color: AppColors.primaryColor.withOpacity(0.3),
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: const Icon(
// //                     Icons.more_horiz,
// //                     color: AppColors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),

// //             Positioned.fill(
// //               child: isInitialized
// //                   ? Center(
// //                       child: AspectRatio(
// //                         aspectRatio: vp!.value.aspectRatio,
// //                         child: VideoPlayer(vp),
// //                       ),
// //                     )
// //                   : reel.thumbnailUrl.isNotEmpty
// //                       ? Image.network(
// //                           reel.thumbnailUrl,
// //                           fit: BoxFit.cover,
// //                           width: double.infinity,
// //                           height: double.infinity,
// //                           loadingBuilder: (context, child, prog) {
// //                             if (prog == null) return child;
// //                             return const Center(
// //                                 child: CircularProgressIndicator(
// //                               backgroundColor: AppColors.primaryColor,
// //                             ));
// //                           },
// //                         )
// //                       : Container(color: Colors.black),
// //             ),

// //             if (buffering)
// //               const Center(
// //                   child: CircularProgressIndicator(
// //                 backgroundColor: AppColors.primaryColor,
// //               )),

// //             Positioned(
// //               left: 0,
// //               right: 0,
// //               bottom: 8.h,
// //               child: _TopProgressBar(
// //                 controller: vp,
// //                 isInitialized: isInitialized,
// //               ),
// //             ),

// //             Positioned(top: 40.h, left: 12.w, child: CommonBackButton()),

// //             Positioned(
// //               left: 16.w,
// //               bottom: 120.h,
// //               right: 100.w,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   AppText(
// //                     home.landingController.athleteUser.value?.name ?? '',
// //                     fontSize: 15.sp,
// //                     color: AppColors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                   SizedBox(height: 8.h),
// //                   AppText(
// //                     reel.caption,
// //                     fontSize: 14.sp,
// //                     color: AppColors.white.withOpacity(0.9),
// //                     maxLines: 3,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             // Right side action column
// //             Positioned(
// //               right: 12.w,
// //               bottom: 120.h,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   // Like
// //                   _ActionButton(
// //                     icon: Icons.thumb_up_rounded,
// //                     active: reel.isLiked,
// //                     label: ctrl._formatCount(reel.likesCount),
// //                     onTap: () {
// //                       ctrl
// //                           .updateLikeCountForChannel(widget.reel.id)
// //                           .then((value) {
// //                         if (value) {
// //                           ctrl.toggleLike(index);
// //                         }
// //                       });
// //                     },
// //                   ),
// //                   SizedBox(height: 12.h),

// //                   // Comment
// //                   _ActionButton(
// //                     icon: Icons.mode_comment_outlined,
// //                     active: false,
// //                     label: ctrl._formatCount(reel.commentsCount),
// //                     onTap: () {
// //                       ctrl.showComments.value = true;

// //                       Future.delayed(const Duration(milliseconds: 200), () {});
// //                     },
// //                   ),
// //                   SizedBox(height: 12.h),

// //                   Obx(() {
// //                     final isLoading =
// //                         widget.controller.shareChannelIsLoading.value;
// //                     return GestureDetector(
// //                       onTap: isLoading
// //                           ? null
// //                           : () {
// //                               widget.controller.shareChannelLink(index);
// //                             },
// //                       child: Container(
// //                         padding: EdgeInsets.all(10.w),
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.circle,
// //                           color: isLoading
// //                               ? Colors.grey.withOpacity(0.3)
// //                               : AppColors.white.withOpacity(0.1),
// //                         ),
// //                         child: isLoading
// //                             ? SizedBox(
// //                                 width: 16.w,
// //                                 height: 16.w,
// //                                 child: CircularProgressIndicator(
// //                                   strokeWidth: 2,
// //                                   color: AppColors.primaryColor,
// //                                 ),
// //                               )
// //                             : Icon(Icons.share_outlined, color: Colors.white),
// //                       ),
// //                     );
// //                   }),

// //                   SizedBox(height: 12.h),
// //                   // Obx(
// //                   //   () => GestureDetector(
// //                   //     onTap: () => ctrl.toggleMute(index),
// //                   //     child: Container(
// //                   //       padding: EdgeInsets.all(8.w),
// //                   //       decoration: BoxDecoration(
// //                   //         color: AppColors.white.withOpacity(0.06),
// //                   //         shape: BoxShape.circle,
// //                   //       ),
// //                   //       child: Icon(
// //                   //         isMuted ? Icons.volume_off : Icons.volume_up,
// //                   //         color: AppColors.white,
// //                   //         size: 22.sp,
// //                   //       ),
// //                   //     ),
// //                   //   ),
// //                   // ),
// //                 ],
// //               ),
// //             ),
// //             Positioned.fill(
// //               child: Obx(() {
// //                 final show = ctrl.heartIndex.value == index;
// //                 return IgnorePointer(
// //                   ignoring: true,
// //                   child: AnimatedOpacity(
// //                     opacity: show ? 1.0 : 0.0,
// //                     duration: const Duration(milliseconds: 300),
// //                     child: Center(
// //                       child: ScaleTransition(
// //                         scale: Tween(begin: 0.8, end: 1.4).animate(
// //                             CurvedAnimation(
// //                                 parent: _heartAnimController,
// //                                 curve: Curves.elasticOut)),
// //                         child: Icon(Icons.thumb_up_rounded,
// //                             size: 120, color: Colors.white.withOpacity(0.85)),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }),
// //             ),

// //             // Comments sheet
// //             if (ctrl.showComments.value)
// //               _CommentsSheet(controller: ctrl, reelIndex: index),
// //           ],
// //         ),
// //       );
// //     });
// //   }
// // }

// // class _TopProgressBar extends StatefulWidget {
// //   final VideoPlayerController? controller;
// //   final bool isInitialized;

// //   const _TopProgressBar({
// //     required this.controller,
// //     required this.isInitialized,
// //   });

// //   @override
// //   State<_TopProgressBar> createState() => _TopProgressBarState();
// // }

// // class _TopProgressBarState extends State<_TopProgressBar> {
// //   Timer? _timer;
// //   double _position = 0.0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     if (widget.controller != null) {
// //       _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
// //         if (!mounted) return;
// //         final c = widget.controller!;
// //         if (c.value.isInitialized) {
// //           setState(() {
// //             _position = c.value.position.inMilliseconds /
// //                 (c.value.duration.inMilliseconds == 0
// //                     ? 1
// //                     : c.value.duration.inMilliseconds);
// //           });
// //         }
// //       });
// //     }
// //   }

// //   @override
// //   void didUpdateWidget(covariant _TopProgressBar oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (oldWidget.controller != widget.controller) {
// //       _timer?.cancel();
// //       _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
// //         if (!mounted) return;
// //         final c = widget.controller;
// //         if (c != null && c.value.isInitialized) {
// //           setState(() {
// //             _position = c.value.position.inMilliseconds /
// //                 (c.value.duration.inMilliseconds == 0
// //                     ? 1
// //                     : c.value.duration.inMilliseconds);
// //           });
// //         }
// //       });
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _timer?.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return LinearProgressIndicator(
// //       value: widget.isInitialized ? _position.clamp(0.0, 1.0) : 0.0,
// //       backgroundColor: AppColors.white.withOpacity(0.12),
// //       valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
// //       minHeight: 4.h,
// //     );
// //   }
// // }

// // class _CommentsSheet extends StatefulWidget {
// //   final VideoReelsController controller;
// //   final int reelIndex;

// //   const _CommentsSheet({
// //     required this.controller,
// //     required this.reelIndex,
// //   });

// //   @override
// //   State<_CommentsSheet> createState() => _CommentsSheetState();
// // }

// // class _CommentsSheetState extends State<_CommentsSheet> {
// //   late final FocusNode _focusNode;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _focusNode = FocusNode();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       // _focusNode.requestFocus();
// //       widget.controller.getAllCommentsForChannel(
// //           widget.controller.reels[widget.reelIndex].id, widget.reelIndex);
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _focusNode.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final ctrl = widget.controller;
// //     final reel = ctrl.reels[widget.reelIndex];

// //     return Positioned(
// //       left: 0,
// //       right: 0,
// //       bottom: 0,
// //       height: 0.45.sh,
// //       child: GestureDetector(
// //         onTap: () {},
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: AppColors.screenBackgroundColor.withOpacity(0.95),
// //             borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
// //           ),
// //           child: Column(
// //             children: [
// //               SizedBox(height: 8.h),
// //               Container(
// //                   width: 40.w,
// //                   height: 4.h,
// //                   decoration: BoxDecoration(
// //                       color: AppColors.white.withOpacity(0.3),
// //                       borderRadius: BorderRadius.circular(2.r))),
// //               SizedBox(height: 8.h),
// //               Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.w),
// //                 child: Row(
// //                   children: [
// //                     AppText("${ctrl._formatCount(reel.commentsCount)} Comments",
// //                         fontSize: 16.sp,
// //                         color: AppColors.white,
// //                         fontWeight: FontWeight.bold),
// //                     const Spacer(),
// //                     IconButton(
// //                       onPressed: () {
// //                         ctrl.showComments.value = false;
// //                       },
// //                       icon: Icon(Icons.close, color: AppColors.white),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //               Divider(color: AppColors.white.withOpacity(0.12)),

// //               // COMMENT LIST
// //               Expanded(
// //                 child: Obx(() {
// //                   if (reel.commentsLoading.value) {
// //                     return ListView.builder(
// //                         padding: EdgeInsets.symmetric(
// //                             horizontal: 16.w, vertical: 8.h),
// //                         itemCount: 6,
// //                         itemBuilder: (context, idx) => commentShimmerItem());
// //                   }

// //                   return ListView.builder(
// //                     padding:
// //                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
// //                     itemCount: reel.comments.length,
// //                     itemBuilder: (context, idx) {
// //                       final c = reel.comments[idx];
// //                       return commentItem(
// //                         c: c,
// //                         reelIndex: widget.reelIndex,
// //                         commentIndex: idx,
// //                         ctrl: ctrl,
// //                       );
// //                     },
// //                   );
// //                 }),
// //               ),

// //               // COMMENT INPUT
// //               Container(
// //                 padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
// //                 decoration: BoxDecoration(
// //                   color: AppColors.screenBackgroundColor,
// //                   border: Border(
// //                       top:
// //                           BorderSide(color: AppColors.white.withOpacity(0.06))),
// //                 ),
// //                 child: SafeArea(
// //                   top: false,
// //                   child: Row(
// //                     children: [
// //                       Expanded(
// //                         child: TextField(
// //                           controller: ctrl.commentController,
// //                           focusNode: _focusNode,
// //                           style: TextStyle(
// //                               color: AppColors.white, fontSize: 14.sp),
// //                           decoration: InputDecoration(
// //                             hintText: "Add a comment...".tr,
// //                             hintStyle: TextStyle(
// //                                 color: AppColors.white.withOpacity(0.5)),
// //                             border: InputBorder.none,
// //                             isDense: true,
// //                           ),
// //                         ),
// //                       ),
// //                       Obx(() {
// //                         if (ctrl.sendCommentLoading.value) {
// //                           return Container(
// //                             padding: EdgeInsets.all(10.w),
// //                             child: const CircularProgressIndicator(
// //                               color: AppColors.primaryColor,
// //                             ),
// //                           );
// //                         }
// //                         return GestureDetector(
// //                           onTap: () {
// //                             ctrl.addComment(widget.reelIndex);
// //                           },
// //                           child: Container(
// //                             padding: EdgeInsets.all(10.w),
// //                             decoration: BoxDecoration(
// //                                 color: AppColors.primaryColor,
// //                                 shape: BoxShape.circle),
// //                             child: Icon(Icons.send, color: Colors.black),
// //                           ),
// //                         );
// //                       })
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget commentItem({
// //     required CommentItem c,
// //     required int reelIndex,
// //     required int commentIndex,
// //     required VideoReelsController ctrl,
// //   }) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(vertical: 10.h),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           CircleAvatar(
// //             radius: 18.r,
// //             backgroundImage: c.user.profilePicture != null
// //                 ? NetworkImage(c.user.profilePicture!)
// //                 : null,
// //             backgroundColor: Colors.grey,
// //           ),
// //           SizedBox(width: 12.w),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Row(
// //                       children: [
// //                         AppText(c.user.name,
// //                             fontSize: 13.sp,
// //                             color: AppColors.white,
// //                             fontWeight: FontWeight.w600),
// //                         SizedBox(width: 8.w),
// //                         AppText(
// //                           ctrl.timeAgo(c.createdAt),
// //                           fontSize: 11.sp,
// //                           color: AppColors.white.withOpacity(0.5),
// //                         ),
// //                       ],
// //                     ),
// //                     Row(
// //                       children: [
// //                         GestureDetector(
// //                           onTap: () => ctrl.toggleCommentReaction(
// //                               reelIndex, commentIndex),
// //                           child: AnimatedContainer(
// //                             duration: const Duration(milliseconds: 200),
// //                             padding: EdgeInsets.symmetric(
// //                                 horizontal: 8, vertical: 4),
// //                             child: Row(
// //                               children: [
// //                                 Icon(
// //                                   Icons.favorite,
// //                                   size: 16,
// //                                   color: c.userReaction == "LIKE" ||
// //                                           c.isReacted == true
// //                                       ? AppColors.primaryColor
// //                                       : Colors.white38,
// //                                 ),
// //                                 SizedBox(width: 4),
// //                                 AppText(c.reactionsCount.toString(),
// //                                     fontSize: 12,
// //                                     color: AppColors.white.withOpacity(0.7)),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(width: 18),
// //                         if (c.repliesCount > 0)
// //                           AppText(
// //                             "View replies (${c.repliesCount})",
// //                             fontSize: 12,
// //                             color: AppColors.primaryColor,
// //                           ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 6.h),
// //                 AppText(
// //                   c.content,
// //                   fontSize: 13.sp,
// //                   color: AppColors.white.withOpacity(0.9),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _ActionButton extends StatelessWidget {
// //   final IconData icon;
// //   final bool active;
// //   final String label;
// //   final VoidCallback onTap;
// //   const _ActionButton({
// //     required this.icon,
// //     required this.active,
// //     required this.label,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         GestureDetector(
// //           onTap: onTap,
// //           child: Container(
// //             padding: EdgeInsets.all(8.w),
// //             decoration: BoxDecoration(
// //               color: AppColors.white.withOpacity(0.04),
// //               shape: BoxShape.circle,
// //             ),
// //             child: Icon(icon,
// //                 color: active ? Colors.red : AppColors.white, size: 28.sp),
// //           ),
// //         ),
// //         if (label.isNotEmpty) ...[
// //           SizedBox(height: 6.h),
// //           AppText(label, fontSize: 12.sp, color: AppColors.white),
// //         ],
// //       ],
// //     );
// //   }
// // }

// // class _ShareButton extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final VoidCallback onTap;
// //   const _ShareButton(
// //       {required this.icon, required this.label, required this.onTap});
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Column(
// //         children: [
// //           Container(
// //             width: 64.w,
// //             height: 64.w,
// //             decoration: BoxDecoration(
// //                 color: AppColors.white.withOpacity(0.06),
// //                 borderRadius: BorderRadius.circular(12.r)),
// //             child: Icon(icon, color: AppColors.white),
// //           ),
// //           SizedBox(height: 8.h),
// //           AppText(label, fontSize: 12.sp, color: AppColors.white),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // extension _FormatCount on VideoReelsController {
// //   String _formatCount(int count) {
// //     if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
// //     if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
// //     return count.toString();
// //   }
// // }

// // Widget commentShimmerItem() {
// //   return Row(
// //     children: [
// //       Container(
// //         width: 36,
// //         height: 36,
// //         decoration: BoxDecoration(
// //           color: Colors.white12,
// //           borderRadius: BorderRadius.circular(18),
// //         ),
// //       ),
// //       SizedBox(width: 12),
// //       Expanded(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               height: 12,
// //               width: 120,
// //               color: Colors.white12,
// //             ),
// //             SizedBox(height: 8),
// //             Container(
// //               height: 12,
// //               width: double.infinity,
// //               color: Colors.white10,
// //             ),
// //           ],
// //         ),
// //       )
// //     ],
// //   );
// // }

// // video_reel_screen_full.dart
// import 'dart:async';
// import 'package:athlete_elite/app/constants/api_endpoints.dart';
// import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
// import 'package:athlete_elite/app/data/providers/api_provider.dart';
// import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
// import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
// import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/action_model/comments_model.dart';
// import 'package:athlete_elite/app/utils/app_logger.dart';
// import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
// import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
// import 'package:athlete_elite/app/widgets/custom_dialogbox.dart'
//     show CustomDialogbox;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// // Replace these imports with your app imports
// import 'package:athlete_elite/app/constants/app_colors.dart';
// import 'package:athlete_elite/app/widgets/AppText.dart';
// import 'package:athlete_elite/app/widgets/common_back_button.dart';
// import 'package:athlete_elite/app/widgets/custom_toast.dart';

// // ----------------------------- Models -----------------------------
// class ReelModel {
//   final String id;
//   final String videoUrl;
//   final String thumbnailUrl;
//   final String caption;

//   bool isLiked;
//   int likesCount;
//   int commentsCount;

//   RxList<CommentItem> comments = <CommentItem>[].obs;
//   RxBool commentsLoading = true.obs;

//   ReelModel({
//     required this.id,
//     required this.videoUrl,
//     required this.thumbnailUrl,
//     required this.caption,
//     this.isLiked = false,
//     this.likesCount = 0,
//     this.commentsCount = 5,
//   });
// }

// // ----------------------------- Controller -----------------------------
// class VideoReelsController extends GetxController {
//   final List<PreviewItem> reelsData;
//   VideoReelsController(this.reelsData);

//   ApiProvider apiProvider =
//       Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

//   final PageController pageController = PageController();
//   final RxInt currentPage = 0.obs;
//   final RxBool showComments = false.obs;
//   final TextEditingController commentController = TextEditingController();

//   // Keep mapped controllers to indexes to cache players
//   final Map<int, VideoPlayerController> _videoControllerCache = {};
//   final Map<int, bool> _isBuffering = {};
//   final RxList<ReelModel> reels = <ReelModel>[].obs;
//   final sendCommentLoading = false.obs;
//   final shareChannelIsLoading = false.obs;

//   // Double-tap heart animation state
//   final RxInt heartIndex = RxInt(-1);
//   final RxBool isRetrying = false.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     // Map your PreviewItem -> ReelModel
//     reels.value = reelsData.asMap().entries.map((entry) {
//       final item = entry.value;
//       // adjust field names as necessary
//       return ReelModel(
//         id: item.id,
//         videoUrl: item.mediaUrl ?? '',
//         thumbnailUrl: item.thumbnailUrl ?? '',
//         caption: item.caption ?? item.title ?? '',
//         likesCount: item.likesCount ?? 0,
//         commentsCount: item.commentsCount ?? 0,
//         // isLiked: item.?? false,
//       );
//     }).toList();

//     // Preload first, second controllers
//     _preloadControllers(initialIndex: 0);

//     pageController.addListener(_onPageChanged);
//   }

//   void _onPageChanged() {
//     final page = (pageController.page ?? 0).round();
//     if (currentPage.value != page) {
//       pauseVideo(currentPage.value);
//       currentPage.value = page;
//       showComments.value = false;
//       _playVideo(page);
//       _preloadControllers(initialIndex: page);
//     }
//   }

//   // Preload current, previous, next into cache to allow smooth transitions
//   void _preloadControllers({required int initialIndex}) {
//     final indicesToEnsure = <int>{
//       initialIndex - 1,
//       initialIndex,
//       initialIndex + 1,
//     };
//     for (final idx in indicesToEnsure) {
//       if (idx >= 0 && idx < reels.length) {
//         _ensureController(idx);
//       }
//     }

//     // Dispose far away controllers to conserve memory (keep 5 around max)
//     final keep = {
//       initialIndex - 2,
//       initialIndex - 1,
//       initialIndex,
//       initialIndex + 1,
//       initialIndex + 2
//     };
//     final keys = List<int>.from(_videoControllerCache.keys);
//     for (final k in keys) {
//       if (!keep.contains(k)) {
//         _videoControllerCache[k]?.dispose();
//         _videoControllerCache.remove(k);
//       }
//     }
//   }

//   // Ensure controller exists and initialized
//   Future<void> _ensureController(int index) async {
//     if (_videoControllerCache.containsKey(index)) return;
//     final url = reels[index].videoUrl;
//     final controller = VideoPlayerController.network(
//       url,
//       httpHeaders: {
//         'User-Agent':
//             'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
//         'Referer': Uri.parse(url).origin,
//         'Accept': '*/*',
//       },
//     );
//     _videoControllerCache[index] = controller;
//     _isBuffering[index] = true;

//     int retryCount = 0;
//     const maxRetries = 3;

//     while (retryCount < maxRetries) {
//       try {
//         await controller.initialize();
//         controller.setLooping(true);
//         _isBuffering[index] = false;
//         // Auto play only if it's current page
//         if (index == currentPage.value) {
//           controller.play();
//         }
//         update();
//         break; // Success, exit retry loop
//       } catch (e) {
//         retryCount++;
//         AppLogger.d(
//             'Video init error for index $index (attempt $retryCount): $e');

//         if (retryCount < maxRetries) {
//           // Wait before retrying
//           await Future.delayed(Duration(seconds: retryCount));
//         } else {
//           // Max retries reached
//           _isBuffering[index] = false;
//           CustomToast.show('Failed to load video. Please try again.');
//           update();
//         }
//       }
//     }
//   }

//   VideoPlayerController? controllerForIndex(int index) {
//     return _videoControllerCache[index];
//   }

//   bool isBuffering(int index) {
//     if (_isBuffering[index] == true) {
//       reels.refresh();
//       return true;
//     }
//     return _isBuffering[index] ?? false;
//   }

//   void _playVideo(int index) {
//     final c = controllerForIndex(index);
//     if (c != null && c.value.isInitialized) {
//       c.play();
//     } else {
//       _ensureController(index).then((_) {
//         final controller = controllerForIndex(index);
//         if (controller != null && controller.value.isInitialized) {
//           controller.play();
//         }
//       });
//     }
//   }

//   Future<void> retryVideoLoad(int index) async {
//     isRetrying.value = true;

//     // Dispose existing controller if any
//     final existing = _videoControllerCache[index];
//     if (existing != null) {
//       await existing.dispose();
//       _videoControllerCache.remove(index);
//     }

//     // Try to reinitialize
//     await _ensureController(index);

//     isRetrying.value = false;
//   }

//   void pauseVideo(int index) {
//     final c = controllerForIndex(index);
//     if (c != null && c.value.isPlaying) c.pause();
//   }

//   void togglePlayPause(int index) {
//     final c = controllerForIndex(index);
//     if (c == null) return;
//     if (c.value.isPlaying) {
//       c.pause();
//     } else {
//       c.play();
//     }
//     update();
//   }

//   void toggleMute(int index) {
//     final c = controllerForIndex(index);
//     if (c == null) return;
//     final isMuted = c.value.volume == 0;
//     c.setVolume(isMuted ? 1.0 : 0.0);
//     update();
//   }

//   void removeReelAndNavigate(int index) {
//     // Pause and dispose the current video controller
//     pauseVideo(index);
//     _videoControllerCache[index]?.dispose();
//     _videoControllerCache.remove(index);

//     // Remove the reel from the list
//     reels.removeAt(index);

//     if (reels.isEmpty) {
//       // No more reels, go back
//       Get.back();
//       return;
//     }

//     // If we removed the last item, go to the previous one
//     if (index >= reels.length) {
//       final newIndex = reels.length - 1;
//       pageController.jumpToPage(newIndex);
//       currentPage.value = newIndex;
//       _preloadControllers(initialIndex: newIndex);
//       _playVideo(newIndex);
//     } else {
//       // Stay at the same index (which now shows the next reel)
//       currentPage.value = index;
//       _preloadControllers(initialIndex: index);
//       _playVideo(index);
//     }
//   }

//   Future<bool> postCommentForChannel(String id) async {
//     AppLogger.d("the id of the channel: $id");
//     final result = await apiProvider.post(
//         "${ApiEndpoints.postNewCommentForChannel}$id/comment",
//         {"content": commentController.text},
//         isLoading: sendCommentLoading);

//     if (result.success) {
//       AppLogger.d(result.data);
//       return result.success;
//     }

//     AppLogger.d(result.error);
//     return false;
//   }

//   Future<bool> postReactForCommentForChannel(String id, String emoji) async {
//     AppLogger.d("the id of the channel: $id");
//     final result = await apiProvider.post(
//         "${ApiEndpoints.reactCommentForChannel}$id/react",
//         {"emoji": emoji == "LIKE" ? "❤️" : ""});

//     if (result.success) {
//       AppLogger.d(result.data);
//       return result.success;
//     }

//     AppLogger.d(result.error);
//     return false;
//   }

//   Future<bool> updateLikeCountForChannel(String id) async {
//     AppLogger.d("the id of the channel: $id");
//     final result = await apiProvider
//         .post("${ApiEndpoints.updateLikeCountForChannel}$id/like", {});

//     if (result.success) {
//       AppLogger.d(result.data);
//       return result.success;
//     }

//     AppLogger.d(result.error);
//     return false;
//   }

//   Future<void> getAllCommentsForChannel(String id, int reelIndex) async {
//     final reel = reels[reelIndex];
//     reel.commentsLoading.value = true;

//     final result = await apiProvider
//         .get("${ApiEndpoints.getAllCommentsForChannel}$id/comments");

//     if (result.success) {
//       final response = CommentsResponse.fromJson(result.data);
//       reel.commentsCount = response.data.commentsCount;
//       reel.comments.assignAll(response.data.comments);
//     } else {
//       AppLogger.d(result.error);
//     }

//     reel.commentsLoading.value = false;
//   }

//   String timeAgo(String isoString) {
//     try {
//       final dt = DateTime.parse(isoString).toLocal();
//       return dt.timeAgo();
//     } catch (_) {
//       return "";
//     }
//   }

//   Future<void> toggleCommentReaction(int reelIndex, int commentIndex) async {
//     final comment = reels[reelIndex].comments[commentIndex];
//     final newReaction = comment.userReaction == "LIKE" ? null : "LIKE";

//     final success =
//         await postReactForCommentForChannel(comment.id, newReaction ?? "");

//     if (success) {
//       // Create a new updated comment using copyWith
//       final updatedComment = comment.copyWith(
//         userReaction: newReaction,
//         isReacted: comment.isReacted,
//         reactionsCount: newReaction == "LIKE"
//             ? comment.reactionsCount + 1
//             : comment.reactionsCount - 1,
//       );

//       // Replace in the reactive list
//       reels[reelIndex].comments[commentIndex] = updatedComment;

//       // Refresh UI
//       reels[reelIndex].comments.refresh();
//     }
//   }

//   Future<void> shareChannelLink(int index) async {
//     final reel = reels[index];
//     shareChannelIsLoading.value = true;

//     try {
//       final result = await apiProvider.post(
//         "${ApiEndpoints.shareChannel}${reel.id}/share",
//         {},
//         isLoading: shareChannelIsLoading,
//       );

//       AppLogger.d("the share result: ${result.data}");

//       if (result.success && result.data != null) {
//         final data = result.data['data']; // inner data map

//         final publicUrl = fixCorruptedUrl(data?['publicUrl']) as String?;

//         if (publicUrl != null && publicUrl.isNotEmpty) {
//           await Share.share(
//             'Check out this Channel : ${fixCorruptedUrl(publicUrl)}',
//             subject: 'Athlete Video',
//           );
//         } else {
//           CustomToast.show('Failed to get share link');
//         }
//       } else {
//         CustomToast.show('Failed to generate share link');
//       }
//     } catch (e) {
//       AppLogger.d('Share error: $e');
//       CustomToast.show('Something went wrong');
//     } finally {
//       shareChannelIsLoading.value = false;
//     }
//   }

//   void toggleLike(int index) {
//     final r = reels[index];
//     r.isLiked = !r.isLiked;
//     r.likesCount += r.isLiked ? 1 : -1;
//     reels.refresh();
//   }

//   void showHeartAnimationAt(int index) {
//     heartIndex.value = index;
//     Future.delayed(const Duration(milliseconds: 600), () {
//       heartIndex.value = -1;
//     });
//   }

//   // COMMENTS - simple local add
//   void addComment(int reelIndex) {
//     final text = commentController.text.trim();
//     if (text.isEmpty) return;
//     postCommentForChannel(reels[reelIndex].id).then((value) async {
//       reels[reelIndex].commentsCount += 1;
//       commentController.clear();
//       await getAllCommentsForChannel(reels[reelIndex].id, reelIndex);
//       reels.refresh();
//     });
//   }

//   // SHARE helpers (placeholder)
//   void shareLink(int index) {
//     // Use share_plus or platform channels to share - placeholder:
//     CustomToast.show("Share link: ${reels[index].videoUrl}");
//   }

//   Future<void> downloadReel(int index) async {
//     try {
//       CustomToast.show("Downloading video...");

//       // Note: This is a placeholder. You'll need to implement actual download logic
//       // using packages like dio, http, or flutter_downloader
//       // and request storage permissions

//       final reel = reels[index];
//       // Example: await downloadVideo(reel.videoUrl, reel.id);

//       CustomToast.show("Video downloaded successfully!");
//     } catch (e) {
//       AppLogger.d('Download error: $e');
//       CustomToast.show("Failed to download video");
//     }
//   }

//   @override
//   void onClose() {
//     for (final c in _videoControllerCache.values) {
//       try {
//         c.dispose();
//       } catch (_) {}
//     }
//     pageController.dispose();
//     commentController.dispose();
//     super.onClose();
//   }
// }

// class VideoReelScreenFull extends StatelessWidget {
//   final bool isAthlete;
//   final List<PreviewItem> reelsData;
//   final int startIndex;

//   const VideoReelScreenFull({
//     super.key,
//     required this.isAthlete,
//     required this.reelsData,
//     this.startIndex = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(VideoReelsController(reelsData));
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.pageController.jumpToPage(startIndex);
//       controller.currentPage.value = startIndex;
//       controller._preloadControllers(initialIndex: startIndex);
//     });

//     return Scaffold(
//       backgroundColor: AppColors.screenBackgroundColor,
//       body: Obx(() {
//         if (controller.reels.isEmpty) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return PageView.builder(
//           controller: controller.pageController,
//           scrollDirection: Axis.vertical,
//           itemCount: controller.reels.length,
//           itemBuilder: (context, index) {
//             return _ReelPage(
//               index: index,
//               reel: controller.reels[index],
//               controller: controller,
//             );
//           },
//         );
//       }),
//     );
//   }
// }

// // ----------------------------- Single Reel Page -----------------------------
// class _ReelPage extends StatefulWidget {
//   final int index;
//   final ReelModel reel;
//   final VideoReelsController controller;
//   const _ReelPage({
//     required this.index,
//     required this.reel,
//     required this.controller,
//   });

//   @override
//   State<_ReelPage> createState() => _ReelPageState();
// }

// class _ReelPageState extends State<_ReelPage>
//     with SingleTickerProviderStateMixin {
//   late final VideoReelsController ctrl;
//   late final int index;
//   late AnimationController _heartAnimController;
//   late AtheleteHomeController home;
//   late AtheleteLandingController landingController;

//   @override
//   void initState() {
//     super.initState();
//     home = Get.isRegistered()
//         ? Get.find<AtheleteHomeController>()
//         : Get.put(AtheleteHomeController());
//     landingController = Get.isRegistered()
//         ? Get.find<AtheleteLandingController>()
//         : Get.put(AtheleteLandingController());
//     ctrl = widget.controller;
//     index = widget.index;

//     _heartAnimController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     // ensure this index controller is ready (if not preloaded)
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ctrl._ensureController(index);
//       // also ensure neighbors
//       ctrl._ensureController(index + 1);
//       ctrl._ensureController(index - 1);
//     });
//   }

//   @override
//   void dispose() {
//     _heartAnimController.dispose();
//     super.dispose();
//   }

//   void _onDoubleTap() {
//     ctrl.updateLikeCountForChannel(widget.reel.id).then((value) {
//       if (value) {
//         ctrl.toggleLike(index);
//         ctrl.showHeartAnimationAt(index);
//         _heartAnimController
//           ..reset()
//           ..forward();
//         HapticFeedback.mediumImpact();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final reel = ctrl.reels[index];

//     return Obx(() {
//       final vp = ctrl.controllerForIndex(index);
//       final isInitialized = vp?.value.isInitialized ?? false;
//       final isPlaying = vp?.value.isPlaying ?? false;
//       final isMuted = vp != null ? (vp.value.volume == 0) : false;
//       bool buffering = false;

//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         buffering = ctrl.isBuffering(index);
//       });

//       return GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onDoubleTap: _onDoubleTap,
//         onTap: () => ctrl.togglePlayPause(index),
//         onLongPress: () => ctrl.pauseVideo(index),
//         onLongPressUp: () => ctrl._playVideo(index),
//         child: Stack(
//           children: [
//             Positioned(
//               right: 10.w,
//               top: 50.h,
//               child: PopupMenuButton<String>(
//                 color: const Color(0xFF1A1A1A),
//                 elevation: 12,
//                 constraints: BoxConstraints(maxWidth: 140.w),
//                 offset: const Offset(-10, 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   side: BorderSide(color: AppColors.white, width: 1),
//                 ),
//                 onSelected: (value) {
//                   if (value == 'archive') {
//                     landingController
//                         .uploadChannelToarchive(reel.id)
//                         .then((success) {
//                       if (success) {
//                         ctrl.removeReelAndNavigate(index);
//                         CustomToast.show("Channel archived successfully!");
//                       } else {
//                         CustomToast.show("Failed to archive channel");
//                       }
//                     }).onError((error, stackTrace) {
//                       AppLogger.d("error: $error $stackTrace");
//                       CustomToast.show("Error archiving channel");
//                     });
//                   } else if (value == 'delete') {
//                     CustomDialogbox.showConfirmation(
//                       title: "Are you sure?",
//                       cancelText: "Cancel",
//                       confirmText: "Delete Channel",
//                       onConfirm: () {
//                         landingController
//                             .deleteChannelFromUpload(reel.id)
//                             .then((success) {
//                           if (success) {
//                             ctrl.removeReelAndNavigate(index);
//                             CustomToast.show("Channel deleted successfully!");
//                           } else {
//                             CustomToast.show("Failed to delete channel");
//                           }
//                         });
//                       },
//                       onCancel: () => Get.back(),
//                     );
//                   }
//                 },
//                 itemBuilder: (context) => [
//                   commonMenuPopupItem(
//                     value: 'archive',
//                     icon: "reschedule",
//                     text: "Archive",
//                     borderColor: AppColors.primaryColor,
//                   ),
//                   commonMenuPopupItem(
//                     value: 'delete',
//                     icon: "delete",
//                     text: "Delete",
//                     borderColor: AppColors.red,
//                     textColor: AppColors.red,
//                     iconColor: AppColors.red,
//                   ),
//                 ],
//                 icon: Container(
//                   padding: EdgeInsets.all(6.w),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryColor.withOpacity(0.3),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.more_horiz,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),
//             ),

//             Positioned.fill(
//               child: isInitialized
//                   ? Center(
//                       child: AspectRatio(
//                         aspectRatio: vp!.value.aspectRatio,
//                         child: VideoPlayer(vp),
//                       ),
//                     )
//                   : reel.thumbnailUrl.isNotEmpty
//                       ? Stack(
//                           children: [
//                             Image.network(
//                               reel.thumbnailUrl,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                               height: double.infinity,
//                               loadingBuilder: (context, child, prog) {
//                                 if (prog == null) return child;
//                                 return const Center(
//                                     child: CircularProgressIndicator(
//                                   backgroundColor: AppColors.primaryColor,
//                                 ));
//                               },
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   color: Colors.black,
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Icon(Icons.error_outline,
//                                             color: Colors.white, size: 48),
//                                         SizedBox(height: 16),
//                                         AppText(
//                                           "Failed to load video",
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                         ),
//                                         SizedBox(height: 16),
//                                         ElevatedButton.icon(
//                                           onPressed: () =>
//                                               ctrl.retryVideoLoad(index),
//                                           icon: Icon(Icons.refresh),
//                                           label: Text("Retry"),
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor:
//                                                 AppColors.primaryColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             if (!isInitialized && !buffering)
//                               Center(
//                                 child: ElevatedButton.icon(
//                                   onPressed: () => ctrl.retryVideoLoad(index),
//                                   icon: Icon(Icons.play_arrow),
//                                   label: Text("Load Video"),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: AppColors.primaryColor,
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 24, vertical: 12),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         )
//                       : Container(
//                           color: Colors.black,
//                           child: Center(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(Icons.videocam_off,
//                                     color: Colors.white, size: 48),
//                                 SizedBox(height: 16),
//                                 AppText(
//                                   "Video unavailable",
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//             ),

//             if (buffering)
//               const Center(
//                   child: CircularProgressIndicator(
//                 backgroundColor: AppColors.primaryColor,
//               )),

//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 8.h,
//               child: _TopProgressBar(
//                 controller: vp,
//                 isInitialized: isInitialized,
//               ),
//             ),

//             Positioned(top: 40.h, left: 12.w, child: CommonBackButton()),

//             Positioned(
//               left: 16.w,
//               bottom: 120.h,
//               right: 100.w,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     home.landingController.athleteUser.value?.name ?? '',
//                     fontSize: 15.sp,
//                     color: AppColors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   SizedBox(height: 8.h),
//                   AppText(
//                     reel.caption,
//                     fontSize: 14.sp,
//                     color: AppColors.white.withOpacity(0.9),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),

//             // Right side action column
//             Positioned(
//               right: 12.w,
//               bottom: 120.h,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Like
//                   _ActionButton(
//                     icon: Icons.thumb_up_rounded,
//                     active: reel.isLiked,
//                     label: ctrl._formatCount(reel.likesCount),
//                     onTap: () {
//                       ctrl
//                           .updateLikeCountForChannel(widget.reel.id)
//                           .then((value) {
//                         if (value) {
//                           ctrl.toggleLike(index);
//                         }
//                       });
//                     },
//                   ),
//                   SizedBox(height: 12.h),

//                   // Comment
//                   _ActionButton(
//                     icon: Icons.mode_comment_outlined,
//                     active: false,
//                     label: ctrl._formatCount(reel.commentsCount),
//                     onTap: () {
//                       ctrl.showComments.value = true;

//                       Future.delayed(const Duration(milliseconds: 200), () {});
//                     },
//                   ),
//                   SizedBox(height: 12.h),

//                   Obx(() {
//                     final isLoading =
//                         widget.controller.shareChannelIsLoading.value;
//                     return GestureDetector(
//                       onTap: isLoading
//                           ? null
//                           : () {
//                               widget.controller.shareChannelLink(index);
//                             },
//                       child: Container(
//                         padding: EdgeInsets.all(10.w),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: isLoading
//                               ? Colors.grey.withOpacity(0.3)
//                               : AppColors.white.withOpacity(0.1),
//                         ),
//                         child: isLoading
//                             ? SizedBox(
//                                 width: 16.w,
//                                 height: 16.w,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   color: AppColors.primaryColor,
//                                 ),
//                               )
//                             : Icon(Icons.share_outlined,
//                                 color: Colors.white, size: 22.sp),
//                       ),
//                     );
//                   }),

//                   SizedBox(height: 12.h),

//                   // Download button
//                   GestureDetector(
//                     onTap: () => ctrl.downloadReel(index),
//                     child: Container(
//                       padding: EdgeInsets.all(10.w),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppColors.white.withOpacity(0.1),
//                       ),
//                       child: Icon(
//                         Icons.download_rounded,
//                         color: Colors.white,
//                         size: 22.sp,
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 12.h),
//                   // Obx(
//                   //   () => GestureDetector(
//                   //     onTap: () => ctrl.toggleMute(index),
//                   //     child: Container(
//                   //       padding: EdgeInsets.all(8.w),
//                   //       decoration: BoxDecoration(
//                   //         color: AppColors.white.withOpacity(0.06),
//                   //         shape: BoxShape.circle,
//                   //       ),
//                   //       child: Icon(
//                   //         isMuted ? Icons.volume_off : Icons.volume_up,
//                   //         color: AppColors.white,
//                   //         size: 22.sp,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             Positioned.fill(
//               child: Obx(() {
//                 final show = ctrl.heartIndex.value == index;
//                 return IgnorePointer(
//                   ignoring: true,
//                   child: AnimatedOpacity(
//                     opacity: show ? 1.0 : 0.0,
//                     duration: const Duration(milliseconds: 300),
//                     child: Center(
//                       child: ScaleTransition(
//                         scale: Tween(begin: 0.8, end: 1.4).animate(
//                             CurvedAnimation(
//                                 parent: _heartAnimController,
//                                 curve: Curves.elasticOut)),
//                         child: Icon(Icons.thumb_up_rounded,
//                             size: 120, color: Colors.white.withOpacity(0.85)),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),

//             // Comments sheet
//             if (ctrl.showComments.value)
//               _CommentsSheet(controller: ctrl, reelIndex: index),
//           ],
//         ),
//       );
//     });
//   }
// }

// class _TopProgressBar extends StatefulWidget {
//   final VideoPlayerController? controller;
//   final bool isInitialized;

//   const _TopProgressBar({
//     required this.controller,
//     required this.isInitialized,
//   });

//   @override
//   State<_TopProgressBar> createState() => _TopProgressBarState();
// }

// class _TopProgressBarState extends State<_TopProgressBar> {
//   Timer? _timer;
//   double _position = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.controller != null) {
//       _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
//         if (!mounted) return;
//         final c = widget.controller!;
//         if (c.value.isInitialized) {
//           setState(() {
//             _position = c.value.position.inMilliseconds /
//                 (c.value.duration.inMilliseconds == 0
//                     ? 1
//                     : c.value.duration.inMilliseconds);
//           });
//         }
//       });
//     }
//   }

//   @override
//   void didUpdateWidget(covariant _TopProgressBar oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.controller != widget.controller) {
//       _timer?.cancel();
//       _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
//         if (!mounted) return;
//         final c = widget.controller;
//         if (c != null && c.value.isInitialized) {
//           setState(() {
//             _position = c.value.position.inMilliseconds /
//                 (c.value.duration.inMilliseconds == 0
//                     ? 1
//                     : c.value.duration.inMilliseconds);
//           });
//         }
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LinearProgressIndicator(
//       value: widget.isInitialized ? _position.clamp(0.0, 1.0) : 0.0,
//       backgroundColor: AppColors.white.withOpacity(0.12),
//       valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
//       minHeight: 4.h,
//     );
//   }
// }

// class _CommentsSheet extends StatefulWidget {
//   final VideoReelsController controller;
//   final int reelIndex;

//   const _CommentsSheet({
//     required this.controller,
//     required this.reelIndex,
//   });

//   @override
//   State<_CommentsSheet> createState() => _CommentsSheetState();
// }

// class _CommentsSheetState extends State<_CommentsSheet> {
//   late final FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // _focusNode.requestFocus();
//       widget.controller.getAllCommentsForChannel(
//           widget.controller.reels[widget.reelIndex].id, widget.reelIndex);
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = widget.controller;
//     final reel = ctrl.reels[widget.reelIndex];

//     return Positioned(
//       left: 0,
//       right: 0,
//       bottom: 0,
//       height: 0.45.sh,
//       child: GestureDetector(
//         onTap: () {},
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColors.screenBackgroundColor.withOpacity(0.95),
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 8.h),
//               Container(
//                   width: 40.w,
//                   height: 4.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(2.r))),
//               SizedBox(height: 8.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Row(
//                   children: [
//                     AppText("${ctrl._formatCount(reel.commentsCount)} Comments",
//                         fontSize: 16.sp,
//                         color: AppColors.white,
//                         fontWeight: FontWeight.bold),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         ctrl.showComments.value = false;
//                       },
//                       icon: Icon(Icons.close, color: AppColors.white),
//                     )
//                   ],
//                 ),
//               ),
//               Divider(color: AppColors.white.withOpacity(0.12)),

//               // COMMENT LIST
//               Expanded(
//                 child: Obx(() {
//                   if (reel.commentsLoading.value) {
//                     return ListView.builder(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.w, vertical: 8.h),
//                         itemCount: 6,
//                         itemBuilder: (context, idx) => commentShimmerItem());
//                   }

//                   return ListView.builder(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                     itemCount: reel.comments.length,
//                     itemBuilder: (context, idx) {
//                       final c = reel.comments[idx];
//                       return commentItem(
//                         c: c,
//                         reelIndex: widget.reelIndex,
//                         commentIndex: idx,
//                         ctrl: ctrl,
//                       );
//                     },
//                   );
//                 }),
//               ),

//               // COMMENT INPUT
//               Container(
//                 padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
//                 decoration: BoxDecoration(
//                   color: AppColors.screenBackgroundColor,
//                   border: Border(
//                       top:
//                           BorderSide(color: AppColors.white.withOpacity(0.06))),
//                 ),
//                 child: SafeArea(
//                   top: false,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: ctrl.commentController,
//                           focusNode: _focusNode,
//                           style: TextStyle(
//                               color: AppColors.white, fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             hintText: "Add a comment...".tr,
//                             hintStyle: TextStyle(
//                                 color: AppColors.white.withOpacity(0.5)),
//                             border: InputBorder.none,
//                             isDense: true,
//                           ),
//                         ),
//                       ),
//                       Obx(() {
//                         if (ctrl.sendCommentLoading.value) {
//                           return Container(
//                             padding: EdgeInsets.all(10.w),
//                             child: const CircularProgressIndicator(
//                               color: AppColors.primaryColor,
//                             ),
//                           );
//                         }
//                         return GestureDetector(
//                           onTap: () {
//                             ctrl.addComment(widget.reelIndex);
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(10.w),
//                             decoration: BoxDecoration(
//                                 color: AppColors.primaryColor,
//                                 shape: BoxShape.circle),
//                             child: Icon(Icons.send, color: Colors.black),
//                           ),
//                         );
//                       })
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget commentItem({
//     required CommentItem c,
//     required int reelIndex,
//     required int commentIndex,
//     required VideoReelsController ctrl,
//   }) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.h),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 18.r,
//             backgroundImage: c.user.profilePicture != null
//                 ? NetworkImage(c.user.profilePicture!)
//                 : null,
//             backgroundColor: Colors.grey,
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         AppText(c.user.name,
//                             fontSize: 13.sp,
//                             color: AppColors.white,
//                             fontWeight: FontWeight.w600),
//                         SizedBox(width: 8.w),
//                         AppText(
//                           ctrl.timeAgo(c.createdAt),
//                           fontSize: 11.sp,
//                           color: AppColors.white.withOpacity(0.5),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => ctrl.toggleCommentReaction(
//                               reelIndex, commentIndex),
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 200),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 4),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.favorite,
//                                   size: 16,
//                                   color: c.userReaction == "LIKE" ||
//                                           c.isReacted == true
//                                       ? AppColors.primaryColor
//                                       : Colors.white38,
//                                 ),
//                                 SizedBox(width: 4),
//                                 AppText(c.reactionsCount.toString(),
//                                     fontSize: 12,
//                                     color: AppColors.white.withOpacity(0.7)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 18),
//                         if (c.repliesCount > 0)
//                           AppText(
//                             "View replies (${c.repliesCount})",
//                             fontSize: 12,
//                             color: AppColors.primaryColor,
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 6.h),
//                 AppText(
//                   c.content,
//                   fontSize: 13.sp,
//                   color: AppColors.white.withOpacity(0.9),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ActionButton extends StatelessWidget {
//   final IconData icon;
//   final bool active;
//   final String label;
//   final VoidCallback onTap;
//   const _ActionButton({
//     required this.icon,
//     required this.active,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             padding: EdgeInsets.all(8.w),
//             decoration: BoxDecoration(
//               color: AppColors.white.withOpacity(0.04),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon,
//                 color: active ? Colors.red : AppColors.white, size: 28.sp),
//           ),
//         ),
//         if (label.isNotEmpty) ...[
//           SizedBox(height: 6.h),
//           AppText(label, fontSize: 12.sp, color: AppColors.white),
//         ],
//       ],
//     );
//   }
// }

// class _ShareButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onTap;
//   const _ShareButton(
//       {required this.icon, required this.label, required this.onTap});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             width: 64.w,
//             height: 64.w,
//             decoration: BoxDecoration(
//                 color: AppColors.white.withOpacity(0.06),
//                 borderRadius: BorderRadius.circular(12.r)),
//             child: Icon(icon, color: AppColors.white),
//           ),
//           SizedBox(height: 8.h),
//           AppText(label, fontSize: 12.sp, color: AppColors.white),
//         ],
//       ),
//     );
//   }
// }

// extension _FormatCount on VideoReelsController {
//   String _formatCount(int count) {
//     if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
//     if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
//     return count.toString();
//   }
// }

// Widget commentShimmerItem() {
//   return Row(
//     children: [
//       Container(
//         width: 36,
//         height: 36,
//         decoration: BoxDecoration(
//           color: Colors.white12,
//           borderRadius: BorderRadius.circular(18),
//         ),
//       ),
//       SizedBox(width: 12),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 12,
//               width: 120,
//               color: Colors.white12,
//             ),
//             SizedBox(height: 8),
//             Container(
//               height: 12,
//               width: double.infinity,
//               color: Colors.white10,
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }

// video_reel_screen_full.dart
import 'dart:async';
import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/action_model/comments_model.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart'
    show CustomDialogbox;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Replace these imports with your app imports
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';

// ----------------------------- Models -----------------------------
class ReelModel {
  final String id;
  final String videoUrl;
  final String thumbnailUrl;
  final String caption;

  bool isLiked;
  int likesCount;
  int commentsCount;

  RxList<CommentItem> comments = <CommentItem>[].obs;
  RxBool commentsLoading = true.obs;

  ReelModel({
    required this.id,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.caption,
    this.isLiked = false,
    this.likesCount = 0,
    this.commentsCount = 5,
  });
}

// ----------------------------- Controller -----------------------------
class VideoReelsController extends GetxController {
  final List<PreviewItem> reelsData;
  VideoReelsController(this.reelsData);

  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxBool showComments = false.obs;
  final TextEditingController commentController = TextEditingController();

  // Keep mapped controllers to indexes to cache players
  final Map<int, VideoPlayerController> _videoControllerCache = {};
  final Map<int, bool> _isBuffering = {};
  final RxList<ReelModel> reels = <ReelModel>[].obs;
  final sendCommentLoading = false.obs;
  final shareChannelIsLoading = false.obs;

  // Double-tap heart animation state
  final RxInt heartIndex = RxInt(-1);
  final RxBool isRetrying = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Map your PreviewItem -> ReelModel
    reels.value = reelsData.asMap().entries.map((entry) {
      final item = entry.value;
      // adjust field names as necessary
      return ReelModel(
        id: item.id,
        videoUrl: item.mediaUrl ?? '',
        thumbnailUrl: item.thumbnailUrl ?? '',
        caption: item.caption ?? item.title ?? '',
        likesCount: item.likesCount ?? 0,
        commentsCount: item.commentsCount ?? 0,
        // isLiked: item.?? false,
      );
    }).toList();

    // Preload first, second controllers
    _preloadControllers(initialIndex: 0);

    pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (pageController.page ?? 0).round();
    if (currentPage.value != page) {
      pauseVideo(currentPage.value);
      currentPage.value = page;
      showComments.value = false;

      // Force reload if controller doesn't exist or failed previously
      if (!_videoControllerCache.containsKey(page)) {
        _ensureController(page);
      } else {
        _playVideo(page);
      }

      _preloadControllers(initialIndex: page);
    }
  }

  // Preload current, previous, next into cache to allow smooth transitions
  void _preloadControllers({required int initialIndex}) {
    final indicesToEnsure = <int>{
      initialIndex - 1,
      initialIndex,
      initialIndex + 1,
    };
    for (final idx in indicesToEnsure) {
      if (idx >= 0 && idx < reels.length) {
        _ensureController(idx);
      }
    }

    // Dispose far away controllers to conserve memory (keep 5 around max)
    final keep = {
      initialIndex - 2,
      initialIndex - 1,
      initialIndex,
      initialIndex + 1,
      initialIndex + 2
    };
    final keys = List<int>.from(_videoControllerCache.keys);
    for (final k in keys) {
      if (!keep.contains(k)) {
        _videoControllerCache[k]?.dispose();
        _videoControllerCache.remove(k);
      }
    }
  }

  // Ensure controller exists and initialized
  Future<void> _ensureController(int index) async {
    // if (_videoControllerCache.containsKey(index)) return;

    // final url = reels[index].videoUrl;

    // // Check if URL is empty or invalid
    // if (url.isEmpty) {
    //   _isBuffering[index] = false;
    //   AppLogger.d('Empty video URL for index $index');
    //   update();
    //   return;
    // }

      if (reels.isEmpty || index < 0 || index >= reels.length) {
      AppLogger.d(
          "Cannot load controller. reels length = ${reels.length}, requested index = $index");
      return;
    }

    if (_videoControllerCache.containsKey(index)) return;

    final url = reels[index].videoUrl;

    if (url.isEmpty) {
      _isBuffering[index] = false;
      AppLogger.d('Empty video URL for index $index');
      update();
      return;
    }

    _isBuffering[index] = true;

    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        // Dispose old controller if exists during retry
        if (retryCount > 0) {
          final oldController = _videoControllerCache[index];
          if (oldController != null) {
            await oldController.dispose();
            _videoControllerCache.remove(index);
          }
          // Wait before retry with exponential backoff
          await Future.delayed(Duration(milliseconds: 500 * retryCount));
        }

        // Create new controller with updated headers
        final controller = VideoPlayerController.networkUrl(
          Uri.parse(url),
          httpHeaders: {
            'User-Agent':
                'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36',
            'Accept': '*/*',
            'Accept-Encoding': 'identity',
            'Connection': 'keep-alive',
            'Range': 'bytes=0-',
          },
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );

        _videoControllerCache[index] = controller;

        await controller.initialize();

        // Check if controller is actually initialized
        if (!controller.value.isInitialized) {
          throw Exception('Controller failed to initialize');
        }

        controller.setLooping(true);
        controller.setVolume(1.0);

        _isBuffering[index] = false;

        // Auto play only if it's current page
        if (index == currentPage.value) {
          await controller.play();
        }

        update();
        AppLogger.d('✅ Video loaded successfully for index $index');
        break; // Success, exit retry loop
      } catch (e) {
        retryCount++;
        final errorMsg = e.toString();
        AppLogger.d(
            'Video init error for index $index (attempt $retryCount): $errorMsg');

        // Check if it's a 403 error
        final is403Error =
            errorMsg.contains('403') || errorMsg.contains('Forbidden');

        if (retryCount >= maxRetries) {
          // Max retries reached
          _isBuffering[index] = false;
          _videoControllerCache.remove(index);

          if (is403Error) {
            CustomToast.show('Video access denied. Please refresh.');
          } else {
            CustomToast.show('Failed to load video. Tap to retry.');
          }
          update();
        }
      }
    }
  }

  VideoPlayerController? controllerForIndex(int index) {
    return _videoControllerCache[index];
  }

  bool isBuffering(int index) {
    if (_isBuffering[index] == true) {
      reels.refresh();
      return true;
    }
    return _isBuffering[index] ?? false;
  }

  void _playVideo(int index) {
    final c = controllerForIndex(index);
    if (c != null && c.value.isInitialized) {
      c.play();
    } else {
      _ensureController(index).then((_) {
        final controller = controllerForIndex(index);
        if (controller != null && controller.value.isInitialized) {
          controller.play();
        }
      });
    }
  }

  Future<void> retryVideoLoad(int index) async {
    if (isRetrying.value) return; // Prevent multiple retry attempts

    isRetrying.value = true;
    _isBuffering[index] = true;
    update();

    try {
      // Dispose existing controller if any
      final existing = _videoControllerCache[index];
      if (existing != null) {
        await existing.dispose();
        _videoControllerCache.remove(index);
      }

      // Small delay to ensure cleanup
      await Future.delayed(const Duration(milliseconds: 300));

      // Try to reinitialize
      await _ensureController(index);

      // If successful and it's the current page, play it
      if (index == currentPage.value) {
        final controller = controllerForIndex(index);
        if (controller != null && controller.value.isInitialized) {
          await controller.play();
          CustomToast.show('Video loaded successfully');
        }
      }
    } catch (e) {
      AppLogger.d('Retry error: $e');
      CustomToast.show('Failed to load video');
    } finally {
      isRetrying.value = false;
      _isBuffering[index] = false;
      update();
    }
  }

  void pauseVideo(int index) {
    final c = controllerForIndex(index);
    if (c != null && c.value.isPlaying) c.pause();
  }

  void togglePlayPause(int index) {
    final c = controllerForIndex(index);
    if (c == null) return;
    if (c.value.isPlaying) {
      c.pause();
    } else {
      c.play();
    }
    update();
  }

  void toggleMute(int index) {
    final c = controllerForIndex(index);
    if (c == null) return;
    final isMuted = c.value.volume == 0;
    c.setVolume(isMuted ? 1.0 : 0.0);
    update();
  }

  void removeReelAndNavigate(int index) {
    // Pause and dispose the current video controller
    pauseVideo(index);
    _videoControllerCache[index]?.dispose();
    _videoControllerCache.remove(index);

    // Remove the reel from the list
    reels.removeAt(index);

    if (reels.isEmpty) {
      // No more reels, go back
      Get.back();
      return;
    }

    // If we removed the last item, go to the previous one
    if (index >= reels.length) {
      final newIndex = reels.length - 1;
      pageController.jumpToPage(newIndex);
      currentPage.value = newIndex;
      _preloadControllers(initialIndex: newIndex);
      _playVideo(newIndex);
    } else {
      // Stay at the same index (which now shows the next reel)
      currentPage.value = index;
      _preloadControllers(initialIndex: index);
      _playVideo(index);
    }
  }

  Future<bool> postCommentForChannel(String id) async {
    AppLogger.d("the id of the channel: $id");
    final result = await apiProvider.post(
        "${ApiEndpoints.postNewCommentForChannel}$id/comment",
        {"content": commentController.text},
        isLoading: sendCommentLoading);

    if (result.success) {
      AppLogger.d(result.data);
      return result.success;
    }

    AppLogger.d(result.error);
    return false;
  }

  Future<bool> postReactForCommentForChannel(String id, String emoji) async {
    AppLogger.d("the id of the channel: $id");
    final result = await apiProvider.post(
        "${ApiEndpoints.reactCommentForChannel}$id/react",
        {"emoji": emoji == "LIKE" ? "❤️" : ""});

    if (result.success) {
      AppLogger.d(result.data);
      return result.success;
    }

    AppLogger.d(result.error);
    return false;
  }

  Future<bool> updateLikeCountForChannel(String id) async {
    AppLogger.d("the id of the channel: $id");
    final result = await apiProvider
        .post("${ApiEndpoints.updateLikeCountForChannel}$id/like", {});

    if (result.success) {
      AppLogger.d(result.data);
      return result.success;
    }

    AppLogger.d(result.error);
    return false;
  }

  Future<void> getAllCommentsForChannel(String id, int reelIndex) async {
    final reel = reels[reelIndex];
    reel.commentsLoading.value = true;

    final result = await apiProvider
        .get("${ApiEndpoints.getAllCommentsForChannel}$id/comments");

    if (result.success) {
      final response = CommentsResponse.fromJson(result.data);
      reel.commentsCount = response.data.commentsCount;
      reel.comments.assignAll(response.data.comments);
    } else {
      AppLogger.d(result.error);
    }

    reel.commentsLoading.value = false;
  }

  String timeAgo(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      return dt.timeAgo();
    } catch (_) {
      return "";
    }
  }

  Future<void> toggleCommentReaction(int reelIndex, int commentIndex) async {
    final comment = reels[reelIndex].comments[commentIndex];
    final newReaction = comment.userReaction == "LIKE" ? null : "LIKE";

    final success =
        await postReactForCommentForChannel(comment.id, newReaction ?? "");

    if (success) {
      // Create a new updated comment using copyWith
      final updatedComment = comment.copyWith(
        userReaction: newReaction,
        isReacted: comment.isReacted,
        reactionsCount: newReaction == "LIKE"
            ? comment.reactionsCount + 1
            : comment.reactionsCount - 1,
      );

      // Replace in the reactive list
      reels[reelIndex].comments[commentIndex] = updatedComment;

      // Refresh UI
      reels[reelIndex].comments.refresh();
    }
  }

  Future<void> shareChannelLink(int index) async {
    final reel = reels[index];
    shareChannelIsLoading.value = true;

    try {
      final result = await apiProvider.post(
        "${ApiEndpoints.shareChannel}${reel.id}/share",
        {},
        isLoading: shareChannelIsLoading,
      );

      AppLogger.d("the share result: ${result.data}");

      if (result.success && result.data != null) {
        final data = result.data['data']; // inner data map

        final publicUrl = fixCorruptedUrl(data?['publicUrl']) as String?;

        if (publicUrl != null && publicUrl.isNotEmpty) {
          await Share.share(
            'Check out this Channel : ${fixCorruptedUrl(publicUrl)}',
            subject: 'Athlete Video',
          );
        } else {
          CustomToast.show('Failed to get share link');
        }
      } else {
        CustomToast.show('Failed to generate share link');
      }
    } catch (e) {
      AppLogger.d('Share error: $e');
      CustomToast.show('Something went wrong');
    } finally {
      shareChannelIsLoading.value = false;
    }
  }

  void toggleLike(int index) {
    final r = reels[index];
    r.isLiked = !r.isLiked;
    r.likesCount += r.isLiked ? 1 : -1;
    reels.refresh();
  }

  void showHeartAnimationAt(int index) {
    heartIndex.value = index;
    Future.delayed(const Duration(milliseconds: 600), () {
      heartIndex.value = -1;
    });
  }

  // COMMENTS - simple local add
  void addComment(int reelIndex) {
    final text = commentController.text.trim();
    if (text.isEmpty) return;
    postCommentForChannel(reels[reelIndex].id).then((value) async {
      reels[reelIndex].commentsCount += 1;
      commentController.clear();
      await getAllCommentsForChannel(reels[reelIndex].id, reelIndex);
      reels.refresh();
    });
  }

  // SHARE helpers (placeholder)
  void shareLink(int index) {
    // Use share_plus or platform channels to share - placeholder:
    CustomToast.show("Share link: ${reels[index].videoUrl}");
  }

  Future<void> downloadReel(int index) async {
    try {
      CustomToast.show("Downloading video...");

      // Note: This is a placeholder. You'll need to implement actual download logic
      // using packages like dio, http, or flutter_downloader
      // and request storage permissions

      final reel = reels[index];
      // Example: await downloadVideo(reel.videoUrl, reel.id);

      CustomToast.show("Video downloaded successfully!");
    } catch (e) {
      AppLogger.d('Download error: $e');
      CustomToast.show("Failed to download video");
    }
  }

  @override
  void onClose() {
    for (final c in _videoControllerCache.values) {
      try {
        c.dispose();
      } catch (_) {}
    }
    pageController.dispose();
    commentController.dispose();
    super.onClose();
  }
}

class VideoReelScreenFull extends StatelessWidget {
  final bool isAthlete;
  final List<PreviewItem> reelsData;
  final int startIndex;
  final String comesFrom;

  const VideoReelScreenFull({
    super.key,
    required this.isAthlete,
    required this.reelsData,
    this.startIndex = 0,
    required this.comesFrom,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideoReelsController(reelsData));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.pageController.jumpToPage(startIndex);
      controller.currentPage.value = startIndex;
      controller._preloadControllers(initialIndex: startIndex);
    });

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Obx(() {
        if (controller.reels.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return PageView.builder(
          controller: controller.pageController,
          scrollDirection: Axis.vertical,
          itemCount: controller.reels.length,
          itemBuilder: (context, index) {
            return _ReelPage(
              index: index,
              reel: controller.reels[index],
              controller: controller,
              comesFrom: comesFrom,
            );
          },
        );
      }),
    );
  }
}

// ----------------------------- Single Reel Page -----------------------------
class _ReelPage extends StatefulWidget {
  final int index;
  final ReelModel reel;
  final VideoReelsController controller;
  final String comesFrom;
  const _ReelPage({
    required this.index,
    required this.reel,
    required this.controller,
    required this.comesFrom,
  });

  @override
  State<_ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<_ReelPage>
    with SingleTickerProviderStateMixin {
  late final VideoReelsController ctrl;
  late final int index;
  late AnimationController _heartAnimController;
  late AtheleteHomeController home;
  late AtheleteLandingController landingController;

  @override
  void initState() {
    super.initState();
    home = Get.isRegistered()
        ? Get.find<AtheleteHomeController>()
        : Get.put(AtheleteHomeController());
    landingController = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    ctrl = widget.controller;
    index = widget.index;

    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // ensure this index controller is ready (if not preloaded)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ctrl._ensureController(index);
      // also ensure neighbors
      ctrl._ensureController(index + 1);
      ctrl._ensureController(index - 1);
    });
  }

  @override
  void dispose() {
    _heartAnimController.dispose();
    super.dispose();
  }

  void _onDoubleTap() {
    ctrl.updateLikeCountForChannel(widget.reel.id).then((value) {
      if (value) {
        ctrl.toggleLike(index);
        ctrl.showHeartAnimationAt(index);
        _heartAnimController
          ..reset()
          ..forward();
        HapticFeedback.mediumImpact();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final reel = ctrl.reels[index];

    print("the reel is comes from ${widget.comesFrom}");

    return Obx(() {
      final vp = ctrl.controllerForIndex(index);
      final isInitialized = vp?.value.isInitialized ?? false;
      final isPlaying = vp?.value.isPlaying ?? false;
      final isMuted = vp != null ? (vp.value.volume == 0) : false;
      bool buffering = false;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        buffering = ctrl.isBuffering(index);
      });

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: _onDoubleTap,
        onTap: () => ctrl.togglePlayPause(index),
        onLongPress: () => ctrl.pauseVideo(index),
        onLongPressUp: () => ctrl._playVideo(index),
        child: Stack(
          children: [
            if (widget.comesFrom != "archived")
              Positioned(
                right: 10.w,
                top: 50.h,
                child: PopupMenuButton<String>(
                  color: const Color(0xFF1A1A1A),
                  elevation: 12,
                  constraints: BoxConstraints(maxWidth: 140.w),
                  offset: const Offset(-10, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: AppColors.white, width: 1),
                  ),
                  onSelected: (value) {
                    if (value == 'archive') {
                      landingController
                          .uploadChannelToarchive(reel.id)
                          .then((success) {
                        if (success) {
                          ctrl.removeReelAndNavigate(index);
                          CustomToast.show("Channel archived successfully!");
                          if (widget.comesFrom == "upload_section") {
                            home.onGetAllUploadChannels();
                          } else if (widget.comesFrom ==
                              "athlete_landing_content_library") {
                            landingController.getAllAthleteChannelsByCategory();
                          } else if (widget.comesFrom == "draft_section") {
                            home.getAllDraftChannelList(isRefresh: true);
                          } else if (widget.comesFrom == "scheduled") {
                            home.getAllScheduleChannelList(isRefresh: true);
                          }
                        } else {
                          CustomToast.show("Failed to archive channel");
                        }
                      }).onError((error, stackTrace) {
                        AppLogger.d("error: $error $stackTrace");
                        CustomToast.show("Error archiving channel");
                      });
                    } else if (value == 'delete') {
                      CustomDialogbox.showConfirmation(
                        title: "Are you sure?",
                        cancelText: "Cancel",
                        confirmText: "Delete Channel",
                        onConfirm: () {
                          landingController
                              .deleteChannelFromUpload(reel.id)
                              .then((success) {
                            if (success) {
                              ctrl.removeReelAndNavigate(index);
                              CustomToast.show("Channel deleted successfully!");
                              if (widget.comesFrom == "upload_section") {
                                home.onGetAllUploadChannels();
                              } else if (widget.comesFrom ==
                                  "athlete_landing_content_library") {
                                landingController
                                    .getAllAthleteChannelsByCategory();
                              } else if (widget.comesFrom == "draft_section") {
                                home.getAllDraftChannelList(isRefresh: true);
                              } else if (widget.comesFrom == "scheduled") {
                                home.getAllScheduleChannelList(isRefresh: true);
                              }
                            } else {
                              CustomToast.show("Failed to delete channel");
                            }
                          });
                        },
                        onCancel: () => Get.back(),
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    commonMenuPopupItem(
                      value: 'archive',
                      icon: "reschedule",
                      text: "Archive",
                      borderColor: AppColors.primaryColor,
                    ),
                    commonMenuPopupItem(
                      value: 'delete',
                      icon: "delete",
                      text: "Delete",
                      borderColor: AppColors.red,
                      textColor: AppColors.red,
                      iconColor: AppColors.red,
                    ),
                  ],
                  icon: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

            Positioned.fill(
              child: isInitialized
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: vp!.value.aspectRatio,
                        child: VideoPlayer(vp),
                      ),
                    )
                  : reel.thumbnailUrl.isNotEmpty
                      ? Stack(
                          children: [
                            Image.network(
                              reel.thumbnailUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              loadingBuilder: (context, child, prog) {
                                if (prog == null) return child;
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ));
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.black,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.error_outline,
                                            color: Colors.white, size: 48),
                                        SizedBox(height: 16),
                                        AppText(
                                          "Failed to load content",
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        SizedBox(height: 8),
                                        AppText(
                                          "Tap to retry",
                                          color: Colors.white54,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (!isInitialized && !buffering)
                              Positioned.fill(
                                child: Material(
                                  color: Colors.black38,
                                  child: InkWell(
                                    onTap: () => ctrl.retryVideoLoad(index),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24.w, vertical: 16.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 8,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.refresh,
                                                color: Colors.white,
                                                size: 24.sp),
                                            SizedBox(width: 8.w),
                                            AppText(
                                              "Tap to Load Video",
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      : Container(
                          color: Colors.black,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => ctrl.retryVideoLoad(index),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.videocam_off,
                                        color: Colors.white, size: 48),
                                    SizedBox(height: 16),
                                    AppText(
                                      "Video unavailable",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    SizedBox(height: 8),
                                    AppText(
                                      "Tap to retry",
                                      color: Colors.white54,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
            ),

            if (buffering || ctrl.isRetrying.value)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                    if (ctrl.isRetrying.value) ...[
                      SizedBox(height: 16.h),
                      AppText(
                        "Loading video...",
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ],
                  ],
                ),
              ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              child: _TopProgressBar(
                controller: vp,
                isInitialized: isInitialized,
              ),
            ),

            Positioned(top: 40.h, left: 12.w, child: CommonBackButton()),

            Positioned(
              left: 16.w,
              bottom: 30.h,
              right: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 13.r,
                      backgroundImage: Image.network(landingController
                                  .homeSectionResponse
                                  .value
                                  ?.data
                                  .profilePicture ??
                              "")
                          .image,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 12.w),
                    AppText(
                      home.landingController.athleteUser.value?.name ?? '',
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ]),
                  SizedBox(height: 8.h),
                  AppText(
                    reel.caption,
                    fontSize: 14.sp,
                    color: AppColors.white.withOpacity(0.9),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Right side action column
            Positioned(
              right: 12.w,
              bottom: 120.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Like
                  _ActionButton(
                    icon: Icons.thumb_up_rounded,
                    active: reel.isLiked,
                    label: ctrl._formatCount(reel.likesCount),
                    onTap: () {
                      ctrl
                          .updateLikeCountForChannel(widget.reel.id)
                          .then((value) {
                        if (value) {
                          ctrl.toggleLike(index);
                        }
                      });
                    },
                  ),
                  SizedBox(height: 12.h),

                  // Comment
                  _ActionButton(
                    icon: Icons.mode_comment_outlined,
                    active: false,
                    label: ctrl._formatCount(reel.commentsCount),
                    onTap: () {
                      ctrl.showComments.value = true;

                      Future.delayed(const Duration(milliseconds: 200), () {});
                    },
                  ),
                  SizedBox(height: 12.h),

                  Obx(() {
                    final isLoading =
                        widget.controller.shareChannelIsLoading.value;
                    return GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              widget.controller.shareChannelLink(index);
                            },
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isLoading
                              ? Colors.grey.withOpacity(0.3)
                              : AppColors.white.withOpacity(0.1),
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 16.w,
                                height: 16.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primaryColor,
                                ),
                              )
                            : Icon(Icons.share_outlined,
                                color: Colors.white, size: 22.sp),
                      ),
                    );
                  }),

                  SizedBox(height: 12.h),

                  // Download button
                  GestureDetector(
                    onTap: () => ctrl.downloadReel(index),
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),
                  // Obx(
                  //   () => GestureDetector(
                  //     onTap: () => ctrl.toggleMute(index),
                  //     child: Container(
                  //       padding: EdgeInsets.all(8.w),
                  //       decoration: BoxDecoration(
                  //         color: AppColors.white.withOpacity(0.06),
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Icon(
                  //         isMuted ? Icons.volume_off : Icons.volume_up,
                  //         color: AppColors.white,
                  //         size: 22.sp,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Positioned.fill(
              child: Obx(() {
                final show = ctrl.heartIndex.value == index;
                return IgnorePointer(
                  ignoring: true,
                  child: AnimatedOpacity(
                    opacity: show ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Center(
                      child: ScaleTransition(
                        scale: Tween(begin: 0.8, end: 1.4).animate(
                            CurvedAnimation(
                                parent: _heartAnimController,
                                curve: Curves.elasticOut)),
                        child: Icon(Icons.thumb_up_rounded,
                            size: 120, color: Colors.white.withOpacity(0.85)),
                      ),
                    ),
                  ),
                );
              }),
            ),

            // Comments sheet
            if (ctrl.showComments.value)
              _CommentsSheet(controller: ctrl, reelIndex: index),
          ],
        ),
      );
    });
  }
}

class _TopProgressBar extends StatefulWidget {
  final VideoPlayerController? controller;
  final bool isInitialized;

  const _TopProgressBar({
    required this.controller,
    required this.isInitialized,
  });

  @override
  State<_TopProgressBar> createState() => _TopProgressBarState();
}

class _TopProgressBarState extends State<_TopProgressBar> {
  Timer? _timer;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
        if (!mounted) return;
        final c = widget.controller!;
        if (c.value.isInitialized) {
          setState(() {
            _position = c.value.position.inMilliseconds /
                (c.value.duration.inMilliseconds == 0
                    ? 1
                    : c.value.duration.inMilliseconds);
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant _TopProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
        if (!mounted) return;
        final c = widget.controller;
        if (c != null && c.value.isInitialized) {
          setState(() {
            _position = c.value.position.inMilliseconds /
                (c.value.duration.inMilliseconds == 0
                    ? 1
                    : c.value.duration.inMilliseconds);
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.isInitialized ? _position.clamp(0.0, 1.0) : 0.0,
      backgroundColor: AppColors.white.withOpacity(0.12),
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
      minHeight: 4.h,
    );
  }
}

class _CommentsSheet extends StatefulWidget {
  final VideoReelsController controller;
  final int reelIndex;

  const _CommentsSheet({
    required this.controller,
    required this.reelIndex,
  });

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _focusNode.requestFocus();
      widget.controller.getAllCommentsForChannel(
          widget.controller.reels[widget.reelIndex].id, widget.reelIndex);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = widget.controller;
    final reel = ctrl.reels[widget.reelIndex];

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 0.45.sh,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.screenBackgroundColor.withOpacity(0.95),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2.r))),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    AppText("${ctrl._formatCount(reel.commentsCount)} Comments",
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ctrl.showComments.value = false;
                      },
                      icon: Icon(Icons.close, color: AppColors.white),
                    )
                  ],
                ),
              ),
              Divider(color: AppColors.white.withOpacity(0.12)),

              // COMMENT LIST
              Expanded(
                child: Obx(() {
                  if (reel.commentsLoading.value) {
                    return ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        itemCount: 6,
                        itemBuilder: (context, idx) => commentShimmerItem());
                  }

                  return ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: reel.comments.length,
                    itemBuilder: (context, idx) {
                      final c = reel.comments[idx];
                      return commentItem(
                        c: c,
                        reelIndex: widget.reelIndex,
                        commentIndex: idx,
                        ctrl: ctrl,
                      );
                    },
                  );
                }),
              ),

              // COMMENT INPUT
              Container(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
                decoration: BoxDecoration(
                  color: AppColors.screenBackgroundColor,
                  border: Border(
                      top:
                          BorderSide(color: AppColors.white.withOpacity(0.06))),
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: ctrl.commentController,
                          focusNode: _focusNode,
                          style: TextStyle(
                              color: AppColors.white, fontSize: 14.sp),
                          decoration: InputDecoration(
                            hintText: "Add a comment...".tr,
                            hintStyle: TextStyle(
                                color: AppColors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      Obx(() {
                        if (ctrl.sendCommentLoading.value) {
                          return Container(
                            padding: EdgeInsets.all(10.w),
                            child: const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            ctrl.addComment(widget.reelIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle),
                            child: Icon(Icons.send, color: Colors.black),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentItem({
    required CommentItem c,
    required int reelIndex,
    required int commentIndex,
    required VideoReelsController ctrl,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundImage: c.user.profilePicture != null
                ? NetworkImage(c.user.profilePicture!)
                : null,
            backgroundColor: Colors.grey,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppText(c.user.name,
                            fontSize: 13.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                        SizedBox(width: 8.w),
                        AppText(
                          ctrl.timeAgo(c.createdAt),
                          fontSize: 11.sp,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => ctrl.toggleCommentReaction(
                              reelIndex, commentIndex),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 16,
                                  color: c.userReaction == "LIKE" ||
                                          c.isReacted == true
                                      ? AppColors.primaryColor
                                      : Colors.white38,
                                ),
                                SizedBox(width: 4),
                                AppText(c.reactionsCount.toString(),
                                    fontSize: 12,
                                    color: AppColors.white.withOpacity(0.7)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                        if (c.repliesCount > 0)
                          AppText(
                            "View replies (${c.repliesCount})",
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                AppText(
                  c.content,
                  fontSize: 13.sp,
                  color: AppColors.white.withOpacity(0.9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final bool active;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({
    required this.icon,
    required this.active,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.04),
              shape: BoxShape.circle,
            ),
            child: Icon(icon,
                color: active ? Colors.red : AppColors.white, size: 28.sp),
          ),
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 6.h),
          AppText(label, fontSize: 12.sp, color: AppColors.white),
        ],
      ],
    );
  }
}

class _ShareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ShareButton(
      {required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12.r)),
            child: Icon(icon, color: AppColors.white),
          ),
          SizedBox(height: 8.h),
          AppText(label, fontSize: 12.sp, color: AppColors.white),
        ],
      ),
    );
  }
}

extension _FormatCount on VideoReelsController {
  String _formatCount(int count) {
    if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
    return count.toString();
  }
}

Widget commentShimmerItem() {
  return Row(
    children: [
      Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12,
              width: 120,
              color: Colors.white12,
            ),
            SizedBox(height: 8),
            Container(
              height: 12,
              width: double.infinity,
              color: Colors.white10,
            ),
          ],
        ),
      )
    ],
  );
}

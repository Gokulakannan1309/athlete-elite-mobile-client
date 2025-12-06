// // ----------------------------- Models -----------------------------
// import 'dart:async';

// import 'package:athlete_elite/app/constants/api_endpoints.dart';
// import 'package:athlete_elite/app/constants/app_colors.dart';
// import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
// import 'package:athlete_elite/app/data/providers/api_provider.dart';
// import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/action_model/comments_model.dart';
// import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
// import 'package:athlete_elite/app/modules/fan_interface/video_reel_view/action_model/comments_response_fan_view.dart';
// import 'package:athlete_elite/app/utils/app_logger.dart';
// import 'package:athlete_elite/app/widgets/AppText.dart';
// import 'package:athlete_elite/app/widgets/common_back_button.dart';
// import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
// import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
// import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
// import 'package:athlete_elite/app/widgets/custom_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:video_player/video_player.dart';

// class ReelModel {
//   final String id;
//   final String videoUrl;
//   final String thumbnailUrl;
//   final String caption;

//   bool isLiked;
//   int likesCount;
//   int commentsCount;

//   RxList<CommentItemFanView> comments = <CommentItemFanView>[].obs;
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
//   final List<PreviewItemForFan> reelsData;
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

//   @override
//   void onInit() {
//     super.onInit();

//     reels.value = reelsData.asMap().entries.map((entry) {
//       final item = entry.value;

//       return ReelModel(
//         id: item.id,
//         videoUrl: item.mediaUrl ?? '',
//         thumbnailUrl: item.thumbnailUrl ?? '',
//         caption: item.caption ?? item.title ?? '',
//         likesCount: item.likesCount ?? 0,
//         commentsCount: item.commentsCount ?? 0,
//         isLiked: item.isLiked ?? false,
//       );
//     }).toList();

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
//     // final controller = VideoPlayerController.network(url);
//     final controller = VideoPlayerController.networkUrl(
//       Uri.parse(url),
//       httpHeaders: {
//         'User-Agent':
//             'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
//         'Referer': Uri.parse(url).origin,
//         'Accept': '*/*',
//       },
//     );

//     _videoControllerCache[index] = controller;
//     _isBuffering[index] = true;
//     try {
//       await controller.initialize();
//       controller.setLooping(true);
//       _isBuffering[index] = false;
//       // Auto play only if it's current page
//       if (index == currentPage.value) {
//         controller.play();
//       }
//       update();
//     } catch (e) {
//       _isBuffering[index] = false;
//       debugPrint('Video init error for index $index : $e');
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
//         controllerForIndex(index)?.play();
//       });
//     }
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

//   Future<bool> postCommentForChannel(String channelId) async {
//     AppLogger.d("the id of the channel: $channelId");
//     final result = await apiProvider.post(
//         "${ApiEndpoints.actionChannelInFanView}$channelId/comment",
//         queryParameters: {
//           "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
//         },
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
//         "${ApiEndpoints.reactCommentInFanView}$id/react",
//         queryParameters: {
//           "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
//         },
//         {
//           "emoji": emoji == "LIKE" ? "❤️" : ""
//         });

//     if (result.success) {
//       AppLogger.d(result.data);
//       return result.success;
//     }

//     AppLogger.d(result.error);
//     return false;
//   }

//   Future<bool> updateLikeCountForChannel(String channelId) async {
//     AppLogger.d("the id of the channel: $channelId");
//     final result = await apiProvider.post(
//         "${ApiEndpoints.actionChannelInFanView}$channelId/like",
//         queryParameters: {
//           "userId": Get.find<FanLandingController>().fanUser.value?.id
//         },
//         {});

//     AppLogger.d(
//         "the fan id : ${Get.find<FanLandingController>().fanUser.value?.id}");

//     AppLogger.d("the like result: ${result.data}");

//     if (result.success) {
//       AppLogger.d(result.data);
//       return result.success;
//     }

//     AppLogger.d(result.error);
//     return false;
//   }

//   final Map<int, int> _commentPages = {}; // Track current page for each reel
//   final Map<int, bool> _hasMoreComments =
//       {}; // Track if more comments available
//   final Map<int, bool> _loadingMoreComments = {};

//   Future<void> getAllCommentsForChannel(String channelId, int reelIndex,
//       {bool loadMore = false}) async {
//     final reel = reels[reelIndex];

//     // Initialize tracking variables if not present
//     if (!_commentPages.containsKey(reelIndex)) {
//       _commentPages[reelIndex] = 1;
//       _hasMoreComments[reelIndex] = true;
//     }

//     // Prevent multiple simultaneous loads
//     if (_loadingMoreComments[reelIndex] == true) return;

//     // Check if we have more comments to load
//     if (loadMore && _hasMoreComments[reelIndex] == false) return;

//     if (loadMore) {
//       _loadingMoreComments[reelIndex] = true;
//     } else {
//       reel.commentsLoading.value = true;
//       _commentPages[reelIndex] = 1; // Reset to first page
//     }

//     final currentPage = _commentPages[reelIndex]!;

//     final result = await apiProvider.get(
//         "${ApiEndpoints.actionChannelInFanView}$channelId/comments",
//         query: {
//           "userId": Get.find<FanLandingController>().fanUser.value?.id ?? '',
//           "page": currentPage,
//           "limit": 10
//         });

//     if (result.success) {
//       try {
//         final response = CommentsResponseFanView.fromJson(result.data);

//         // Update total comments count
//         reel.commentsCount = response.data.comments.length;

//         if (loadMore) {
//           // Append new comments to existing list
//           reel.comments.addAll(response.data.comments);
//         } else {
//           // Replace with new comments (initial load)
//           reel.comments.assignAll(response.data.comments);
//         }

//         // Check if there are more comments to load
//         final totalPages = (response.data.comments.length / 10).ceil();
//         _hasMoreComments[reelIndex] = currentPage < totalPages;

//         // Increment page number for next load
//         if (_hasMoreComments[reelIndex] == true) {
//           _commentPages[reelIndex] = currentPage + 1;
//         }
//       } catch (e, st) {
//         AppLogger.d("Error parsing comments: $e and $st");
//       }
//     } else {
//       AppLogger.d(result.error);
//     }

//     reel.commentsLoading.value = false;
//     _loadingMoreComments[reelIndex] = false;
//   }

// // Add this new method to load more comments
//   Future<void> loadMoreComments(int reelIndex) async {
//     final reel = reels[reelIndex];
//     await getAllCommentsForChannel(reel.id, reelIndex, loadMore: true);
//   }

//   // Future<void> getAllCommentsForChannel(String channelId, int reelIndex) async {
//   //   final reel = reels[reelIndex];
//   //   reel.commentsLoading.value = true;

//   //   final result = await apiProvider.get(
//   //       "${ApiEndpoints.actionChannelInFanView}$channelId/comments",
//   //       query: {
//   //         "userId": Get.find<FanLandingController>().fanUser.value?.id ?? '',
//   //         "page": 1,
//   //         "limit": 10
//   //       });

//   //   if (result.success) {
//   //     final response = CommentsResponse.fromJson(result.data);
//   //     reel.commentsCount = response.data.commentsCount;
//   //     reel.comments.assignAll(response.data.comments);
//   //   } else {
//   //     AppLogger.d(result.error);
//   //   }

//   //   reel.commentsLoading.value = false;
//   // }

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
//         "${ApiEndpoints.actionChannelInFanView}${reel.id}/share",
//         queryParameters: {
//           "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
//         },
//         {},
//         isLoading: shareChannelIsLoading,
//       );

//       AppLogger.d("the share result: ${result.data}");

//       if (result.success && result.data != null) {
//         final data = result.data['data'];
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

// class VideoReelScreenFanView extends StatelessWidget {
//   final bool isAthlete;
//   final List<PreviewItemForFan> reelsData;
//   final int startIndex;

//   const VideoReelScreenFanView({
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
//   // late FanLandingController home;

//   @override
//   void initState() {
//     super.initState();
//     // home = Get.isRegistered()
//     //     ? Get.find<FanLandingController>()
//     //     : Get.put(FanLandingController());
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
//             Positioned.fill(
//               child: isInitialized
//                   ? Center(
//                       child: AspectRatio(
//                         aspectRatio: vp!.value.aspectRatio,
//                         child: VideoPlayer(vp),
//                       ),
//                     )
//                   : reel.thumbnailUrl.isNotEmpty
//                       ? Image.network(
//                           reel.thumbnailUrl,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: double.infinity,
//                           loadingBuilder: (context, child, prog) {
//                             if (prog == null) return child;
//                             return const Center(
//                                 child: CircularProgressIndicator(
//                               backgroundColor: AppColors.primaryColor,
//                             ));
//                           },
//                         )
//                       : Container(color: Colors.black),
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
//               child: TopProgressBar(
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
//                     "Gokul Athlete",
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
//                             : Icon(Icons.share_outlined, color: Colors.white),
//                       ),
//                     );
//                   }),

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

// class TopProgressBar extends StatefulWidget {
//   final VideoPlayerController? controller;
//   final bool isInitialized;

//   const TopProgressBar({
//     required this.controller,
//     required this.isInitialized,
//   });

//   @override
//   State<TopProgressBar> createState() => TopProgressBarState();
// }

// class TopProgressBarState extends State<TopProgressBar> {
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
//   void didUpdateWidget(covariant TopProgressBar oldWidget) {
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

//               Expanded(
//                 child: Obx(() {
//                   if (reel.commentsLoading.value && reel.comments.isEmpty) {
//                     return ListView.builder(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                       itemCount: 6,
//                       itemBuilder: (context, idx) => commentShimmerItem(),
//                     );
//                   }

//                   return NotificationListener<ScrollNotification>(
//                     onNotification: (ScrollNotification scrollInfo) {
//                       // Load more when scrolled to 80% of the list
//                       if (scrollInfo.metrics.pixels >=
//                           scrollInfo.metrics.maxScrollExtent * 0.8) {
//                         final hasMore =
//                             ctrl._hasMoreComments[widget.reelIndex] ?? false;
//                         final isLoading =
//                             ctrl._loadingMoreComments[widget.reelIndex] ??
//                                 false;

//                         if (hasMore && !isLoading) {
//                           ctrl.loadMoreComments(widget.reelIndex);
//                         }
//                       }
//                       return false;
//                     },
//                     child: ListView.builder(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                       itemCount: reel.comments.length +
//                           ((ctrl._hasMoreComments[widget.reelIndex] ?? false)
//                               ? 1
//                               : 0),
//                       itemBuilder: (context, idx) {
//                         // Show loading indicator at the end if loading more
//                         if (idx == reel.comments.length) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(vertical: 16.h),
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: AppColors.primaryColor,
//                                 strokeWidth: 2,
//                               ),
//                             ),
//                           );
//                         }

//                         final c = reel.comments[idx];
//                         return commentItem(
//                           c: c,
//                           reelIndex: widget.reelIndex,
//                           commentIndex: idx,
//                           ctrl: ctrl,
//                         );
//                       },
//                     ),
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
//     required CommentItemFanView c,
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
//                           ctrl.timeAgo(c.createdAt.toString()),
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



// ----------------------------- Models -----------------------------
import 'dart:async';

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/video_reel_view/action_model/comments_response_fan_view.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_back_button.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

enum VideoState { loading, ready, playing, paused, error, buffering }

class ReelModel {
  final String id;
  final String videoUrl;
  final String thumbnailUrl;
  final String caption;

  bool isLiked;
  int likesCount;
  int commentsCount;

  RxList<CommentItemFanView> comments = <CommentItemFanView>[].obs;
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
  final List<PreviewItemForFan> reelsData;
  VideoReelsController(this.reelsData);

  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxBool showComments = false.obs;
  final TextEditingController commentController = TextEditingController();

  // Video controller cache with state tracking
  final Map<int, VideoPlayerController> _videoControllerCache = {};
  final Map<int, Rx<VideoState>> _videoStates = {};
  final Map<int, String?> _videoErrors = {};
  final RxList<ReelModel> reels = <ReelModel>[].obs;
  final sendCommentLoading = false.obs;
  final shareChannelIsLoading = false.obs;

  // Double-tap heart animation state
  final RxInt heartIndex = RxInt(-1);

  @override
  void onInit() {
    super.onInit();

    reels.value = reelsData.asMap().entries.map((entry) {
      final item = entry.value;

      return ReelModel(
        id: item.id,
        videoUrl: item.mediaUrl ?? '',
        thumbnailUrl: item.thumbnailUrl ?? '',
        caption: item.caption ?? item.title ?? '',
        likesCount: item.likesCount ?? 0,
        commentsCount: item.commentsCount ?? 0,
        isLiked: item.isLiked ?? false,
      );
    }).toList();

    _preloadControllers(initialIndex: 0);

    pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (pageController.page ?? 0).round();
    if (currentPage.value != page) {
      pauseVideo(currentPage.value);
      currentPage.value = page;
      showComments.value = false;
      _playVideo(page);
      _preloadControllers(initialIndex: page);
    }
  }

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

    // Dispose far away controllers to conserve memory
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
        _videoStates.remove(k);
        _videoErrors.remove(k);
      }
    }
  }

  Future<void> _ensureController(int index) async {
    if (_videoControllerCache.containsKey(index)) return;
    
    final url = reels[index].videoUrl;
    if (url.isEmpty) {
      _videoStates[index] = VideoState.error.obs;
      _videoErrors[index] = 'Invalid video URL';
      return;
    }

    _videoStates[index] = VideoState.loading.obs;
    
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(url),
      httpHeaders: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Referer': Uri.parse(url).origin,
        'Accept': '*/*',
      },
    );

    _videoControllerCache[index] = controller;

    // Add buffering listener
    controller.addListener(() {
      if (!controller.value.isInitialized) return;
      
      if (controller.value.isBuffering) {
        _videoStates[index]?.value = VideoState.buffering;
      } else if (controller.value.isPlaying) {
        _videoStates[index]?.value = VideoState.playing;
      } else {
        _videoStates[index]?.value = VideoState.paused;
      }
      update();
    });

    try {
      await controller.initialize().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('Video initialization timeout');
        },
      );
      
      controller.setLooping(true);
      _videoStates[index]?.value = VideoState.ready;
      _videoErrors[index] = null;
      
      // Auto play only if it's current page
      if (index == currentPage.value) {
        controller.play();
        _videoStates[index]?.value = VideoState.playing;
      }
      update();
    } catch (e) {
      _videoStates[index]?.value = VideoState.error;
      _videoErrors[index] = 'Failed to load video';
      AppLogger.d('Video init error for index $index : $e');
      update();
    }
  }

  VideoPlayerController? controllerForIndex(int index) {
    return _videoControllerCache[index];
  }

  VideoState getVideoState(int index) {
    return _videoStates[index]?.value ?? VideoState.loading;
  }

  String? getVideoError(int index) {
    return _videoErrors[index];
  }

  void retryVideo(int index) {
    _videoControllerCache[index]?.dispose();
    _videoControllerCache.remove(index);
    _videoStates.remove(index);
    _videoErrors.remove(index);
    _ensureController(index).then((_) {
      if (index == currentPage.value) {
        _playVideo(index);
      }
    });
  }

  void _playVideo(int index) {
    final c = controllerForIndex(index);
    if (c != null && c.value.isInitialized) {
      c.play();
      _videoStates[index]?.value = VideoState.playing;
    } else if (getVideoState(index) == VideoState.error) {
      // Don't auto-retry on error, wait for user action
      return;
    } else {
      _ensureController(index).then((_) {
        controllerForIndex(index)?.play();
        _videoStates[index]?.value = VideoState.playing;
      });
    }
  }

  void pauseVideo(int index) {
    final c = controllerForIndex(index);
    if (c != null && c.value.isPlaying) {
      c.pause();
      _videoStates[index]?.value = VideoState.paused;
    }
  }

  void togglePlayPause(int index) {
    final c = controllerForIndex(index);
    if (c == null) return;
    if (c.value.isPlaying) {
      c.pause();
      _videoStates[index]?.value = VideoState.paused;
    } else {
      c.play();
      _videoStates[index]?.value = VideoState.playing;
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

  Future<bool> postCommentForChannel(String channelId) async {
    AppLogger.d("the id of the channel: $channelId");
    final result = await apiProvider.post(
        "${ApiEndpoints.actionChannelInFanView}$channelId/comment",
        queryParameters: {
          "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
        },
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
        "${ApiEndpoints.reactCommentInFanView}$id/react",
        queryParameters: {
          "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
        },
        {
          "emoji": emoji == "LIKE" ? "❤️" : ""
        });

    if (result.success) {
      AppLogger.d(result.data);
      return result.success;
    }

    AppLogger.d(result.error);
    return false;
  }

  Future<bool> updateLikeCountForChannel(String channelId) async {
    AppLogger.d("the id of the channel: $channelId");
    final result = await apiProvider.post(
        "${ApiEndpoints.actionChannelInFanView}$channelId/like",
        queryParameters: {
          "userId": Get.find<FanLandingController>().fanUser.value?.id
        },
        {});

    AppLogger.d(
        "the fan id : ${Get.find<FanLandingController>().fanUser.value?.id}");

    AppLogger.d("the like result: ${result.data}");

    if (result.success) {
      AppLogger.d(result.data);
      return result.success;
    }

    AppLogger.d(result.error);
    return false;
  }

  final Map<int, int> _commentPages = {};
  final Map<int, bool> _hasMoreComments = {};
  final Map<int, bool> _loadingMoreComments = {};

  Future<void> getAllCommentsForChannel(String channelId, int reelIndex,
      {bool loadMore = false}) async {
    final reel = reels[reelIndex];

    if (!_commentPages.containsKey(reelIndex)) {
      _commentPages[reelIndex] = 1;
      _hasMoreComments[reelIndex] = true;
    }

    if (_loadingMoreComments[reelIndex] == true) return;

    if (loadMore && _hasMoreComments[reelIndex] == false) return;

    if (loadMore) {
      _loadingMoreComments[reelIndex] = true;
    } else {
      reel.commentsLoading.value = true;
      _commentPages[reelIndex] = 1;
    }

    final currentPage = _commentPages[reelIndex]!;

    final result = await apiProvider.get(
        "${ApiEndpoints.actionChannelInFanView}$channelId/comments",
        query: {
          "userId": Get.find<FanLandingController>().fanUser.value?.id ?? '',
          "page": currentPage,
          "limit": 10
        });

    if (result.success) {
      try {
        final response = CommentsResponseFanView.fromJson(result.data);

        reel.commentsCount = response.data.comments.length;

        if (loadMore) {
          reel.comments.addAll(response.data.comments);
        } else {
          reel.comments.assignAll(response.data.comments);
        }

        final totalPages = (response.data.comments.length / 10).ceil();
        _hasMoreComments[reelIndex] = currentPage < totalPages;

        if (_hasMoreComments[reelIndex] == true) {
          _commentPages[reelIndex] = currentPage + 1;
        }
      } catch (e, st) {
        AppLogger.d("Error parsing comments: $e and $st");
      }
    } else {
      AppLogger.d(result.error);
    }

    reel.commentsLoading.value = false;
    _loadingMoreComments[reelIndex] = false;
  }

  Future<void> loadMoreComments(int reelIndex) async {
    final reel = reels[reelIndex];
    await getAllCommentsForChannel(reel.id, reelIndex, loadMore: true);
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
      final updatedComment = comment.copyWith(
        userReaction: newReaction,
        isReacted: comment.isReacted,
        reactionsCount: newReaction == "LIKE"
            ? comment.reactionsCount + 1
            : comment.reactionsCount - 1,
      );

      reels[reelIndex].comments[commentIndex] = updatedComment;
      reels[reelIndex].comments.refresh();
    }
  }

  Future<void> shareChannelLink(int index) async {
    final reel = reels[index];
    shareChannelIsLoading.value = true;

    try {
      final result = await apiProvider.post(
        "${ApiEndpoints.actionChannelInFanView}${reel.id}/share",
        queryParameters: {
          "userId": Get.find<FanLandingController>().fanUser.value?.id ?? ''
        },
        {},
        isLoading: shareChannelIsLoading,
      );

      AppLogger.d("the share result: ${result.data}");

      if (result.success && result.data != null) {
        final data = result.data['data'];
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

  void shareLink(int index) {
    CustomToast.show("Share link: ${reels[index].videoUrl}");
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

class VideoReelScreenFanView extends StatelessWidget {
  final bool isAthlete;
  final List<PreviewItemForFan> reelsData;
  final int startIndex;

  const VideoReelScreenFanView({
    super.key,
    required this.isAthlete,
    required this.reelsData,
    this.startIndex = 0,
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
          physics: const BouncingScrollPhysics(),
          itemCount: controller.reels.length,
          itemBuilder: (context, index) {
            return _ReelPage(
              index: index,
              reel: controller.reels[index],
              controller: controller,
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
  const _ReelPage({
    required this.index,
    required this.reel,
    required this.controller,
  });

  @override
  State<_ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<_ReelPage>
    with SingleTickerProviderStateMixin {
  late final VideoReelsController ctrl;
  late final int index;
  late AnimationController _heartAnimController;

  @override
  void initState() {
    super.initState();
    ctrl = widget.controller;
    index = widget.index;

    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ctrl._ensureController(index);
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

    return Obx(() {
      final vp = ctrl.controllerForIndex(index);
      final videoState = ctrl.getVideoState(index);
      final isInitialized = vp?.value.isInitialized ?? false;
      final isMuted = vp != null ? (vp.value.volume == 0) : false;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: _onDoubleTap,
        onTap: () {
          if (videoState == VideoState.error) {
            ctrl.retryVideo(index);
          } else {
            ctrl.togglePlayPause(index);
          }
        },
        onLongPress: () => ctrl.pauseVideo(index),
        onLongPressUp: () => ctrl._playVideo(index),
        child: Stack(
          children: [
            // Video or thumbnail
            Positioned.fill(
              child: isInitialized
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: vp!.value.aspectRatio,
                        child: VideoPlayer(vp),
                      ),
                    )
                  : reel.thumbnailUrl.isNotEmpty
                      ? Image.network(
                          reel.thumbnailUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (context, child, prog) {
                            if (prog == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: prog.expectedTotalBytes != null
                                    ? prog.cumulativeBytesLoaded /
                                        prog.expectedTotalBytes!
                                    : null,
                                color: AppColors.primaryColor,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stack) {
                            return Container(
                              color: Colors.black,
                              child: Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 64,
                                  color: Colors.white38,
                                ),
                              ),
                            );
                          },
                        )
                      : Container(color: Colors.black),
            ),

            // Loading state
            if (videoState == VideoState.loading)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      strokeWidth: 3,
                    ),
                    SizedBox(height: 16.h),
                    AppText(
                      "Loading video...".tr,
                      fontSize: 14.sp,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ],
                ),
              ),

            // Buffering state
            if (videoState == VideoState.buffering)
              Center(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    strokeWidth: 3,
                  ),
                ),
              ),

            // Error state
            if (videoState == VideoState.error)
              Center(
                child: Container(
                  padding: EdgeInsets.all(24.w),
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64.sp,
                        color: Colors.redAccent,
                      ),
                      SizedBox(height: 16.h),
                      AppText(
                        ctrl.getVideoError(index) ?? "Failed to load video".tr,
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      AppText(
                        "Tap to retry".tr,
                        fontSize: 14.sp,
                        color: AppColors.white.withOpacity(0.7),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton.icon(
                        onPressed: () => ctrl.retryVideo(index),
                        icon: Icon(Icons.refresh),
                        label: Text("Retry".tr),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Play/Pause indicator
            if (isInitialized && videoState != VideoState.error)
              Center(
                child: AnimatedOpacity(
                  opacity: videoState == VideoState.paused ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 56.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            // Progress bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 8.h,
              child: TopProgressBar(
                controller: vp,
                isInitialized: isInitialized,
              ),
            ),

            // Back button
            Positioned(top: 40.h, left: 12.w, child: CommonBackButton()),

            // Caption and username
            Positioned(
              left: 16.w,
              bottom: 120.h,
              right: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Gokul Athlete",
                    fontSize: 15.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
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

                  _ActionButton(
                    icon: Icons.mode_comment_outlined,
                    active: false,
                    label: ctrl._formatCount(reel.commentsCount),
                    onTap: () {
                      ctrl.showComments.value = true;
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
                            : Icon(Icons.share_outlined, color: Colors.white),
                      ),
                    );
                  }),
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

class TopProgressBar extends StatefulWidget {
  final VideoPlayerController? controller;
  final bool isInitialized;

  const TopProgressBar({
    required this.controller,
    required this.isInitialized,
  });

  @override
  State<TopProgressBar> createState() => TopProgressBarState();
}

class TopProgressBarState extends State<TopProgressBar> {
  Timer? _timer;
  double _position = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (widget.controller != null) {
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
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
  void didUpdateWidget(covariant TopProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _startTimer();
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
              Expanded(
                child: Obx(() {
                  if (reel.commentsLoading.value && reel.comments.isEmpty) {
                    return ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      itemCount: 6,
                      itemBuilder: (context, idx) => commentShimmerItem(),
                    );
                  }

                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent * 0.8) {
                        final hasMore =
                            ctrl._hasMoreComments[widget.reelIndex] ?? false;
                        final isLoading =
                            ctrl._loadingMoreComments[widget.reelIndex] ??
                                false;

                        if (hasMore && !isLoading) {
                          ctrl.loadMoreComments(widget.reelIndex);
                        }
                      }
                      return false;
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      itemCount: reel.comments.length +
                          ((ctrl._hasMoreComments[widget.reelIndex] ?? false)
                              ? 1
                              : 0),
                      itemBuilder: (context, idx) {
                        if (idx == reel.comments.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        }

                        final c = reel.comments[idx];
                        return commentItem(
                          c: c,
                          reelIndex: widget.reelIndex,
                          commentIndex: idx,
                          ctrl: ctrl,
                        );
                      },
                    ),
                  );
                }),
              ),
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
                            child: SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                color: AppColors.primaryColor,
                                strokeWidth: 2,
                              ),
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
                            child: Icon(
                              Icons.send,
                              color: Colors.black,
                              size: 20.sp,
                            ),
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
    required CommentItemFanView c,
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
            child: c.user.profilePicture == null
                ? Icon(Icons.person, size: 20.sp, color: Colors.white)
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: AppText(c.user.name,
                                fontSize: 13.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(width: 8.w),
                          AppText(
                            ctrl.timeAgo(c.createdAt.toString()),
                            fontSize: 11.sp,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ],
                      ),
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
                                if (c.reactionsCount > 0) ...[
                                  SizedBox(width: 4),
                                  AppText(c.reactionsCount.toString(),
                                      fontSize: 12,
                                      color: AppColors.white.withOpacity(0.7)),
                                ],
                              ],
                            ),
                          ),
                        ),
                        if (c.repliesCount > 0) ...[
                          SizedBox(width: 8.w),
                          AppText(
                            "View replies (${c.repliesCount})",
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                        ],
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

extension _FormatCount on VideoReelsController {
  String _formatCount(int count) {
    if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
    return count.toString();
  }
}

Widget commentShimmerItem() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 12.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

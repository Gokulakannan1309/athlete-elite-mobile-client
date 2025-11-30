import 'dart:io';
import 'dart:typed_data';

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_category_model.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/private_community/private_community_post_list_response.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/add_intro_edit_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/video_reel_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/athlete_profile_view_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/utils/app_scaffold.dart';
import 'package:athlete_elite/app/widgets/AppText.dart';
import 'package:athlete_elite/app/widgets/common_menu_popup_item.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:athlete_elite/app/widgets/custom_dialogbox.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' hide Config;
import '../../../routes/app_routes.dart';
import '../../../routes/navigation_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

// class AthleteProfileView extends GetView<AthleteProfileViewController> {
//   final bool isAthlete;
//   const AthleteProfileView({super.key, required this.isAthlete});

//   @override
//   Widget build(BuildContext context) {
//     MediaPickerController mediaPickerController = Get.isRegistered()
//         ? Get.find<MediaPickerController>()
//         : Get.put(MediaPickerController());
//     return AppScaffold(
//       backgroundColor: AppColors.screenBackgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 15.h),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Text(
//                         controller.fanLandingController.athleteFanview.value
//                                 ?.data.athlete.name
//                                 .toUpperCase() ??
//                             "",
//                         style: TextStyle(
//                           fontFamily: GoogleFonts.anton().fontFamily,
//                           fontSize: 28.sp,
//                           color: const Color(0xFF999999),
//                           letterSpacing: 1.5,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Visibility(
//                         visible: !isAthlete,
//                         child: InkWell(
//                           onTap: () {
//                             // controller.updateTrackSingleAthlete(
//                             //     controller.athleteUser.value?.id ?? "");
//                           },
//                           child: Container(
//                             height: 50.h,
//                             width: 70.w,
//                             decoration: BoxDecoration(
//                               color: AppColors.lightWhite,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: AppText(
//                                 "Track",
//                                 color: AppColors.black,
//                                 fontSize: 16.sp,
//                                 textAlign: TextAlign.center,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           NavigationHelper.toNamed(
//                             AppRoutes.atheleteAddStoryScreen,
//                             arguments: {'isAthlete': isAthlete},
//                             transition: Transition.rightToLeft,
//                           );
//                         },
//                         child: Obx(() {
//                           return Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: AppColors.primaryColor,
//                                     width: 1.5,
//                                   ),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(30),
//                                   child: controller.isHomeIntroLoading.value
//                                       ? shimmerBox(
//                                           w: 110.w, h: 110.w, radius: 30)
//                                       : controller.homeSectionResponse.value
//                                                   ?.data.profilePicture !=
//                                               null
//                                           ? controller.profilePicture.value
//                                                   .startsWith("http")
//                                               ? Image.network(
//                                                   controller
//                                                       .profilePicture.value,
//                                                   fit: BoxFit.cover,
//                                                   width: 110.w,
//                                                   height: 110.h,
//                                                   errorBuilder: (context, error,
//                                                       stackTrace) {
//                                                     AppLogger.d(
//                                                         "the profile error is $error and stack trace is $stackTrace");
//                                                     return Image.asset(
//                                                       "assets/images/profile.png",
//                                                       fit: BoxFit.cover,
//                                                       width: 110.w,
//                                                       height: 110.h,
//                                                     );
//                                                   },
//                                                   loadingBuilder: (context,
//                                                       child, loadingProgress) {
//                                                     if (loadingProgress ==
//                                                         null) {
//                                                       return child;
//                                                     }
//                                                     return shimmerBox(
//                                                         w: 110.w,
//                                                         h: 110.w,
//                                                         radius: 30);
//                                                   },
//                                                 )
//                                               : shimmerBox(
//                                                   w: 110.w,
//                                                   h: 110.w,
//                                                   radius: 30)
//                                           : Image.asset(
//                                               "assets/images/profile.png",
//                                               fit: BoxFit.cover,
//                                               width: 110.w,
//                                               height: 110.h,
//                                             ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               controller.getAllAthleteFansList().then((value) {
//                                 if (value) {
//                                   NavigationHelper.toNamed(
//                                     AppRoutes.atheleteFanListScreen,
//                                     arguments: {'isAthlete': isAthlete},
//                                     transition: Transition.rightToLeft,
//                                   );
//                                 }
//                               }).onError((error, stackTrace) {
//                                 AppLogger.d(
//                                     "the error is $error and stack trace is $stackTrace");
//                               });
//                             },
//                             child: Visibility(
//                               visible: !controller.isHomeIntroLoading.value,
//                               child: AppText(
//                                 controller.athleteFanCount.value,
//                                 underlineOffset: 0.2,
//                                 fontSize: 16.sp,
//                                 useCustomUnderline: true,
//                                 textDecoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 5.h),
//                           AppText("Fans", fontSize: 14.sp),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12.h),
//                   Column(
//                     children: [
//                       AppText(
//                         "I've been entertaining since I was a kid.",
//                         textAlign: TextAlign.center,
//                         fontSize: 12.sp,
//                         color: AppColors.white.withOpacity(0.8),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           AppText(
//                             "Track me @ My show - ",
//                             textAlign: TextAlign.center,
//                             fontSize: 12.sp,
//                             color: AppColors.white.withOpacity(0.8),
//                           ),
//                           AppText(
//                             "Good Trouble",
//                             textDecoration: TextDecoration.underline,
//                             useCustomUnderline: true,
//                             underlineOffset: 0.2,
//                             textAlign: TextAlign.center,
//                             fontSize: 12.sp,
//                             color: AppColors.primaryColor,
//                           ),
//                         ],
//                       ),
//                       AppText(
//                         "NK Foundation",
//                         textAlign: TextAlign.center,
//                         fontSize: 12.sp,
//                         color: AppColors.white.withOpacity(0.8),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15.h),
//                   Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         buildTab("home", 0, controller.selectedTab.value),
//                         buildTab("content", 1, controller.selectedTab.value),
//                         buildTab("comment", 2, controller.selectedTab.value),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 15.h),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 switch (controller.selectedTab.value) {
//                   case 0:
//                     return buildHomeTab(controller);
//                   case 1:
//                     return buildCategoryContentTab(controller);
//                   case 2:
//                     return buildCommentReactionTab();
//                   default:
//                     return buildHomeTab(controller);
//                 }
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTab(String icon, int index, int selectedTab) {
//     final isSelected = selectedTab == index;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => controller.changeTab(index),
//         child: Column(
//           children: [
//             Image.asset("assets/icons/$icon.png", height: 27.sp, width: 27.sp),
//             SizedBox(height: 4.h),
//             Container(
//               width: double.infinity,
//               height: 2.h,
//               color: isSelected ? AppColors.primaryColor : Colors.transparent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildHomeTab(AtheleteLandingController controller) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             controller.homeSectionResponse.value?.data.heading?.toUpperCase() ??
//                 "",
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: AppColors.lightGray.withOpacity(0.6),
//               fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Obx(() {
//             if (controller.isHomeIntroLoading.value) {
//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     smallCardShimmer(),
//                     SizedBox(width: 10.w),
//                     smallCardShimmer(),
//                   ],
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   smallCard(controller.profilePicture.value, "INTRO", false,
//                       false, false),
//                   SizedBox(width: 10.w),
//                   smallCard(
//                     controller.favMomentThumbnail.value,
//                     "FAVE SPORTS MOMENT",
//                     false,
//                     true,
//                     controller.favMomentThumbnail.value.isEmpty &&
//                         (controller.homeSectionResponse.value?.data
//                                 .favSportsMoments.isNotEmpty ??
//                             false),
//                   )
//                 ],
//               ),
//             );
//           }),
//           SizedBox(height: 25.h),
//           Text(
//             "TOP CATEGORIES",
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: AppColors.lightGray.withOpacity(0.6),
//               fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Obx(() {
//             if (controller.isHomeCategoriesLoading.value) {
//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                       3,
//                       (index) => Row(
//                             children: [
//                               largeCardShimmer(),
//                               SizedBox(width: 10.w),
//                             ],
//                           )),
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(controller.categories.length, (index) {
//                   final category = controller.categories[index];
//                   return Row(
//                     children: [
//                       largeCard(
//                           category.posterUrl, category.name, category.id ?? ""),
//                       if (index != controller.categories.length - 1)
//                         SizedBox(width: 10.w),
//                     ],
//                   );
//                 }),
//               ),
//             );
//           }),
//           SizedBox(height: 25.h),
//           Text(
//             "THE BRANDS",
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: AppColors.lightGray.withOpacity(0.6),
//               fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Obx(() {
//             if (controller.isHomeBrandsLoading.value) {
//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                       4,
//                       (index) => Row(
//                             children: [
//                               smallCardShimmer(),
//                               SizedBox(width: 10.w),
//                             ],
//                           )),
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(controller.brands.length, (index) {
//                   final brand = controller.brands[index];
//                   return Row(
//                     children: [
//                       smallCard(brand.posterUrl, brand.name.toUpperCase(), true,
//                           false, false,
//                           id: brand.id),
//                       if (index != controller.brands.length - 1)
//                         SizedBox(width: 10.w),
//                     ],
//                   );
//                 }),
//               ),
//             );
//           }),
//           SizedBox(height: 20.h),
//           Obx(() {
//             final homeData = controller.homeSectionResponse.value?.data;

//             // ⭐ PUT THIS HERE (before using enabledItems)
//             final enabledItems =
//                 controller.getEnabledSocialMedia(homeData?.findAthlete);

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20.h),
//                 Text(
//                   "FIND ${controller.athleteUser.value?.name}".toUpperCase(),
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     color: AppColors.lightGray.withOpacity(0.6),
//                     fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 20.h),

//                 // ⭐ Now you can safely use enabledItems
//                 SizedBox(
//                   height: 70,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: enabledItems.length,
//                     separatorBuilder: (_, __) => SizedBox(width: 15),
//                     itemBuilder: (context, index) {
//                       final item = enabledItems[index];

//                       final url = homeData?.findAthlete?.toJson()[item.key];

//                       return InkWell(
//                         onTap: () {
//                           if (url != null && url.isNotEmpty)
//                             openSocialLink(url);
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: item.color.withOpacity(0.2),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: item.image,
//                             ),
//                             SizedBox(height: 5),
//                             Text(item.name, style: TextStyle(fontSize: 12)),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   void openSocialLink(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       print("Could not launch $url");
//     }
//   }

//   Widget buildCategoryContentTab(AtheleteLandingController controller) {
//     return Obx(() {
//       if (controller.isHomeContentLibraryLoading.value) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 180.h,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 6,
//                   separatorBuilder: (_, __) => SizedBox(width: 12.w),
//                   itemBuilder: (_, __) {
//                     return shimmerBox(
//                       w: 130.w,
//                       h: 180.h,
//                       radius: 12,
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               SizedBox(
//                 height: 180.h,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 6,
//                   separatorBuilder: (_, __) => SizedBox(width: 12.w),
//                   itemBuilder: (_, __) {
//                     return shimmerBox(
//                       w: 130.w,
//                       h: 180.h,
//                       radius: 12,
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               SizedBox(
//                 height: 180.h,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 6,
//                   separatorBuilder: (_, __) => SizedBox(width: 12.w),
//                   itemBuilder: (_, __) {
//                     return shimmerBox(
//                       w: 130.w,
//                       h: 180.h,
//                       radius: 12,
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               SizedBox(
//                 height: 180.h,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 6,
//                   separatorBuilder: (_, __) => SizedBox(width: 12.w),
//                   itemBuilder: (_, __) {
//                     return shimmerBox(
//                       w: 130.w,
//                       h: 180.h,
//                       radius: 12,
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20.h),
//             ],
//           ),
//         );
//       }

//       if (controller.contentCategoryList.isEmpty &&
//           !controller.isHomeContentLibraryLoading.value) {
//         return Center(
//           child: Text(
//             "No Content Found",
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: AppColors.lightGray.withOpacity(0.6),
//               fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         );
//       }

//       return ListView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         itemCount: controller.contentCategoryList.length,
//         itemBuilder: (context, index) {
//           final categoryChannel = controller.contentCategoryList[index];
//           return categorySection(
//               index, categoryChannel.categoryName, categoryChannel.channels);
//         },
//       );
//     });
//   }

//   Widget buildCommentReactionTab() {
//     return Obx(() {
//       final posts = controller.privateCommunityPostList.value?.data.items ?? [];
//       if (posts.isEmpty) {
//         return Center(
//             child:
//                 AppText("No Thoughts", color: Colors.white54, fontSize: 14.sp));
//       }

//       return ListView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           final item = posts[index];

//           return Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildPostCard(item),
//                 _buildReactionCard(item),
//                 if (index != posts.length - 1) SizedBox(height: 20.h),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }

//   Widget _buildReactionCard(PrivateCommunityPost item) {
//     if (item.reactions.isEmpty) return const SizedBox.shrink();

//     return Padding(
//       padding: EdgeInsets.only(top: 8.h),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: item.reactions.entries.map((entry) {
//             final emoji = entry.key;
//             final count = entry.value;
//             final userReacted = item.userReaction == emoji;

//             return Padding(
//               padding: EdgeInsets.only(right: 8.w),
//               child: GestureDetector(
//                 onTap: () => controller.toggleReaction(item.id, emoji),
//                 child: Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//                   decoration: BoxDecoration(
//                     color: userReacted
//                         ? Colors.teal.withOpacity(0.25)
//                         : const Color(0xFF2A2A2A),
//                     borderRadius: BorderRadius.circular(16.r),
//                     border: Border.all(
//                       color:
//                           userReacted ? Colors.teal : const Color(0xFF3A3A3A),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(emoji, style: TextStyle(fontSize: 16.sp)),
//                       SizedBox(width: 4.w),
//                       Text(
//                         count.toString(),
//                         style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.bold,
//                           color: userReacted ? Colors.teal : Colors.grey[400],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildPostCard(PrivateCommunityPost item) {
//     return GestureDetector(
//       onLongPress: () => _showWhatsAppEmojiSelector(Get.context!, item.id),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: const Color(0xFF1D1D1D),
//           borderRadius: BorderRadius.circular(12.r),
//           boxShadow: [
//             // Right shadow
//             BoxShadow(
//               color: Colors.black.withOpacity(0.7),
//               blurRadius: 6,
//               spreadRadius: 0,
//               offset: const Offset(4, 0), // → right
//             ),
//             // Bottom shadow
//             BoxShadow(
//               color: Colors.black.withOpacity(0.7),
//               blurRadius: 6,
//               spreadRadius: 0,
//               offset: const Offset(0, 4), // ↓ bottom
//             ),
//           ],
//         ),
//         child: AppText(
//           item.content,
//           fontSize: 14.sp,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   void _showWhatsAppEmojiSelector(BuildContext context, String commentId) {
//     final RenderBox renderBox = context.findRenderObject() as RenderBox;
//     final offset = renderBox.localToGlobal(Offset.zero);
//     final size = renderBox.size;

//     showDialog(
//       context: context,
//       barrierColor: Colors.transparent,
//       barrierDismissible: true,
//       builder: (context) {
//         return Stack(
//           children: [
//             Positioned(
//               top: 260.h,
//               left: 16.w,
//               right: 16.w,
//               child: Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ...controller.quickEmojis.take(7).map((emoji) {
//                         return GestureDetector(
//                           onTap: () {
//                             controller.toggleReaction(commentId, emoji);
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(8.w),
//                             child: Text(
//                               emoji,
//                               style: TextStyle(fontSize: 20.sp),
//                             ),
//                           ),
//                         );
//                       }),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                           _showFullEmojiPicker(context, commentId);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(8.w),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             size: 20.sp,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showFullEmojiPicker(BuildContext context, String commentId) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Container(
//         height: MediaQuery.of(context).size.height * 0.45,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.r),
//             topRight: Radius.circular(20.r),
//           ),
//         ),
//         child: Column(
//           children: [
//             // Header
//             Container(
//               padding: EdgeInsets.all(16.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Choose Reaction',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(height: 1.h),

//             // Emoji Picker
//             Expanded(
//               child: EmojiPicker(
//                 onEmojiSelected: (category, emoji) {
//                   controller.toggleReaction(commentId, emoji.emoji);
//                   Navigator.pop(context);
//                 },
//                 config: Config(
//                   height: 256,
//                   checkPlatformCompatibility: true,
//                   emojiViewConfig: EmojiViewConfig(
//                     emojiSizeMax: 28.sp,
//                     columns: 7,
//                     verticalSpacing: 0,
//                     horizontalSpacing: 0,
//                   ),
//                   categoryViewConfig: const CategoryViewConfig(
//                     indicatorColor: Colors.teal,
//                     iconColorSelected: Colors.teal,
//                   ),
//                   bottomActionBarConfig: const BottomActionBarConfig(
//                     enabled: false,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget categorySection(
//     int categoryIndex,
//     String title,
//     List<ChannelUIModel> channels,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText(
//           title,
//           fontSize: 13.sp,
//           color: Colors.grey.shade400,
//           fontWeight: FontWeight.w500,
//         ),
//         SizedBox(height: 10.h),
//         SizedBox(
//           height: 180.h,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: channels.length,
//             itemBuilder: (context, index) {
//               final channel = channels[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 10.w),
//                 child: GestureDetector(
//                   onTap: () {
//                     final categories = controller
//                             .contentLibrarySummary.value?.data.categories ??
//                         [];

//                     // ensure safety
//                     if (categoryIndex < categories.length) {
//                       final reels = categories[categoryIndex].preview;

//                       NavigationHelper.toNamed(
//                         AppRoutes.athleteVideoReelView,
//                         arguments: {
//                           'isAthlete': isAthlete,
//                           'reels': reels,
//                           'startIndex': index,
//                           'categoryIndex': categoryIndex,
//                         },
//                         transition: Transition.rightToLeft,
//                       );
//                     }
//                   },
//                   child: Container(
//                     width: 130.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                         image: FileImage(File(channel.thumbnail)),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(height: 20.h),
//       ],
//     );
//   }

//   Widget postCard(String text) {
//     return Container(
//       padding: EdgeInsets.all(7.h),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1D1D1D),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppText(
//             text,
//             fontSize: 13.sp,
//             color: AppColors.white,
//             fontWeight: FontWeight.w400,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget reactionCard(Map<String, int> reactions) {
//     return Column(
//       children: [
//         // Wrap(
//         //   spacing: 10.w,
//         //   runSpacing: 6.h,
//         //   children: reactions.entries.map((entry) {
//         //     final emoji = controller.emojiMap[entry.key] ?? '✨';
//         //     return reaction(emoji, entry.value);
//         //   }).toList(),
//         // ),
//       ],
//     );
//   }

//   Widget reaction(String emoji, int count) {
//     return Container(
//       margin: EdgeInsets.only(top: 7.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1D1D1D),
//         borderRadius: BorderRadius.circular(7),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(emoji, style: TextStyle(fontSize: 12.sp)),
//             SizedBox(width: 13.w),
//             AppText(
//               count.toString(),
//               fontSize: 12.sp,
//               color: Colors.white.withOpacity(0.9),
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget smallCard(
//     String imageUrl,
//     String title,
//     bool isBrand,
//     bool isfavMoment,
//     bool isLoading, {
//     String id = '',
//   }) {
//     MediaPickerController mediaPickerController = Get.isRegistered()
//         ? Get.find<MediaPickerController>()
//         : Get.put(MediaPickerController());
//     return SizedBox(
//       width: 175.w,
//       child: isfavMoment && isLoading
//           ? smallCardShimmer()
//           : Stack(
//               children: [
//                 Container(
//                   height: 125.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: controller.getImageProvider(imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.9),
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(12),
//                         bottomRight: Radius.circular(12),
//                       ),
//                     ),
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//                     child: AppText(
//                       title,
//                       fontSize: 11.sp,
//                       color: AppColors.lightGray.withOpacity(0.8),
//                       fontWeight: FontWeight.bold,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: isBrand,
//                   child: Positioned(
//                     right: -2.w,
//                     top: -2.h,
//                     child: PopupMenuButton<String>(
//                       color: const Color(0xFF1A1A1A),
//                       elevation: 12,
//                       constraints: BoxConstraints(maxWidth: 140.w),
//                       offset: const Offset(-10, 40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         side: BorderSide(color: AppColors.white, width: 1),
//                       ),
//                       onSelected: (value) {
//                         if (value == 'upload') {
//                           mediaPickerController.pickSingleImage().then((value) {
//                             if (value) {
//                               controller.uploadBrandPoster(id).then((value) {
//                                 CustomToast.show(
//                                     "Poster Uploaded Successfully!");
//                                 controller.getAthleteChannelCategories();
//                                 controller.update();
//                                 mediaPickerController.selectedImages.clear();
//                               });
//                             }
//                           }).onError((error, stackTrace) {
//                             AppLogger.e(error.toString(), stackTrace);
//                           });
//                         } else if (value == 'delete') {
//                           CustomDialogbox.showConfirmation(
//                             title: "Are you sure?",
//                             cancelText: "Cancel",
//                             confirmText: "Delete Image",
//                             onConfirm: () {
//                               controller.deleteBrandPoster(id).then((value) {
//                                 CustomToast.show(
//                                     "Poster Deleted Successfully!");
//                                 controller.getAthleteChannelCategories();
//                                 controller.update();
//                                 mediaPickerController.selectedImages.clear();
//                               });
//                             },
//                             onCancel: () => Get.back(),
//                           );
//                         }
//                       },
//                       itemBuilder: (context) => [
//                         commonMenuPopupItem(
//                           value: 'upload',
//                           icon: "share",
//                           text: "Upload Image",
//                           borderColor: AppColors.primaryColor,
//                         ),
//                         commonMenuPopupItem(
//                           value: 'delete',
//                           icon: "delete",
//                           text: "Delete Image",
//                           borderColor: AppColors.red,
//                           textColor: AppColors.red,
//                           iconColor: AppColors.red,
//                         ),
//                       ],
//                       icon: Container(
//                         padding: EdgeInsets.all(6.w),
//                         decoration: BoxDecoration(
//                           color: AppColors.primaryColor.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child:
//                             Image.asset("assets/icons/edit.png", height: 15.h),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: !isBrand,
//                   child: Positioned(
//                     right: -2.w,
//                     top: -2.h,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: () {
//                           if (title == "INTRO") {
//                             NavigationHelper.toNamed(
//                               AppRoutes.atheleteAddIntroScreen,
//                               arguments: {'isAthlete': isAthlete},
//                               transition: Transition.rightToLeft,
//                             );
//                           } else {
//                             NavigationHelper.toNamed(
//                               AppRoutes.atheletefavSportsSelectScreen,
//                               arguments: {'isAthlete': isAthlete},
//                               transition: Transition.rightToLeft,
//                             );
//                           }
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(5.w),
//                           decoration: BoxDecoration(
//                             color: AppColors.primaryColor.withOpacity(0.3),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Image.asset("assets/icons/edit.png",
//                               height: 15.h),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   Widget smallCardShimmer() {
//     return Shimmer.fromColors(
//       baseColor: const Color(0xFF2A2A2A),
//       highlightColor: const Color(0xFF3A3A3A),
//       child: Container(
//         width: 175.w,
//         height: 125.h,
//         decoration: BoxDecoration(
//           color: const Color(0xFF2A2A2A),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }

//   Widget largeCardShimmer() {
//     return Shimmer.fromColors(
//       baseColor: const Color(0xFF2A2A2A),
//       highlightColor: const Color(0xFF3A3A3A),
//       child: Container(
//         width: 140.w,
//         height: 200.h,
//         decoration: BoxDecoration(
//           color: const Color(0xFF2A2A2A),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: AppColors.primaryColor, width: 2),
//         ),
//       ),
//     );
//   }

//   Widget largeCard(String imageUrl, String title, String id) {
//     MediaPickerController mediaPickerController = Get.isRegistered()
//         ? Get.find<MediaPickerController>()
//         : Get.put(MediaPickerController());
//     return Stack(
//       children: [
//         Container(
//           width: 140.w,
//           height: 200.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: AppColors.primaryColor, width: 0.8),
//             image: DecorationImage(
//               image: imageUrl.startsWith("http")
//                   ? NetworkImage(imageUrl)
//                   : AssetImage(imageUrl) as ImageProvider,
//               fit: BoxFit.contain,
//             ),
//           ),
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.7),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               ),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//             child: AppText(
//               title,
//               fontSize: 12.sp,
//               color: AppColors.lightGray.withOpacity(0.6),
//               fontWeight: FontWeight.bold,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//         Positioned(
//           right: -2.w,
//           top: -2.h,
//           child: PopupMenuButton<String>(
//             color: const Color(0xFF1A1A1A),
//             elevation: 12,
//             constraints: BoxConstraints(maxWidth: 140.w),
//             offset: const Offset(-10, 40),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//               side: BorderSide(color: AppColors.white, width: 1),
//             ),
//             onSelected: (value) {
//               if (value == 'upload') {
//                 mediaPickerController.pickSingleImage().then((value) {
//                   if (value) {
//                     controller.uploadCategoryPoster(id).then((value) {
//                       CustomToast.show("Poster Uploaded Successfully!");
//                       controller.getAthleteChannelCategories();
//                       controller.update();
//                       mediaPickerController.selectedImages.clear();
//                     });
//                   }
//                 }).onError((error, stackTrace) {
//                   AppLogger.e(error.toString(), stackTrace);
//                 });
//               } else if (value == 'delete') {
//                 CustomDialogbox.showConfirmation(
//                   title: "Are you sure?",
//                   cancelText: "Cancel",
//                   confirmText: "Delete Image",
//                   onConfirm: () {
//                     controller.deleteCategoryPoster(id).then((value) {
//                       CustomToast.show("Poster Deleted Successfully!");
//                       controller.getAthleteChannelCategories();
//                       controller.update();
//                       mediaPickerController.selectedImages.clear();
//                     });
//                   },
//                   onCancel: () => Get.back(),
//                 );
//               }
//             },
//             itemBuilder: (context) => [
//               commonMenuPopupItem(
//                 value: 'upload',
//                 icon: "share",
//                 text: "Upload Image",
//                 borderColor: AppColors.primaryColor,
//               ),
//               commonMenuPopupItem(
//                 value: 'delete',
//                 icon: "delete",
//                 text: "Delete Image",
//                 borderColor: AppColors.red,
//                 textColor: AppColors.red,
//                 iconColor: AppColors.red,
//               ),
//             ],
//             icon: Container(
//               padding: EdgeInsets.all(6.w),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Image.asset("assets/icons/edit.png", height: 15.h),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SocialLink extends StatelessWidget {
//   final SocialMediaItem item;

//   const SocialLink({
//     super.key,
//     required this.item,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//             padding: EdgeInsets.all(8.r),
//             width: 48.w,
//             height: 48.h,
//             margin: EdgeInsets.all(8.w),
//             decoration: BoxDecoration(
//               color: Color(0xFFCC5533).withOpacity(0.15),
//               borderRadius: BorderRadius.circular(15.r),
//             ),
//             child: item.image),
//       ],
//     );
//   }
// }

class AthleteProfileView extends GetView<AthleteProfileViewController> {
  final bool isAthlete;
  const AthleteProfileView({super.key, required this.isAthlete});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        controller
                                .athleteIntroFanView.value?.data?.athlete?.name
                                .toString()
                                .toUpperCase() ??
                            "",
                        style: TextStyle(
                          fontFamily: GoogleFonts.anton().fontFamily,
                          fontSize: 28.sp,
                          color: const Color(0xFF999999),
                          letterSpacing: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() {
                        final isTracked = controller.fanLandingController
                                .athleteFanview.value?.data?.isTracked ??
                            false;

                        final athleteId = controller
                                .athleteIntroFanView.value?.data?.athlete?.id ??
                            "";

                        final isLoading = controller.tackAthleteIsLoading.value;

                        return InkWell(
                          onTap: isLoading
                              ? null
                              : () {
                                  if (isTracked) {
                                    controller.untrackSingleAthlete(athleteId);
                                  } else {
                                    controller.updateTrackSingleAthlete(
                                        controller
                                                .fanLandingController
                                                .athleteFanview
                                                .value
                                                ?.data
                                                .athlete
                                                .id ??
                                            "");
                                  }
                                },
                          child: Container(
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: isTracked
                                  ? AppColors.lightRed
                                  : AppColors.lightWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: isLoading
                                  ? SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: isTracked
                                            ? AppColors.lightWhite
                                            : AppColors.black,
                                      ),
                                    )
                                  : AppText(
                                      isTracked ? "Untrack" : "Track",
                                      color: isTracked
                                          ? AppColors.lightWhite
                                          : AppColors.black,
                                      fontSize: 16.sp,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w400,
                                    ),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: controller.introViewIsLoading.value
                                ? shimmerBox(w: 110.w, h: 110.w, radius: 30)
                                : controller.athleteIntroFanView.value?.data
                                            ?.athlete?.profilePicture !=
                                        null
                                    ? Image.network(
                                        controller
                                                .athleteIntroFanView
                                                .value
                                                ?.data
                                                ?.athlete
                                                ?.profilePicture ??
                                            "",
                                        fit: BoxFit.cover,
                                        width: 110.w,
                                        height: 110.h,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/profile.png",
                                            fit: BoxFit.cover,
                                            width: 110.w,
                                            height: 110.h,
                                          );
                                        },
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return shimmerBox(
                                              w: 110.w, h: 110.w, radius: 30);
                                        },
                                      )
                                    : Image.asset(
                                        "assets/images/profile.png",
                                        fit: BoxFit.cover,
                                        width: 110.w,
                                        height: 110.h,
                                      ),
                          ),
                        );
                      }),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Visibility(
                              visible: !controller.introViewIsLoading.value,
                              child: AppText(
                                "${controller.fanLandingController.athleteFanview.value?.data?.followerCount ?? 0}",
                                underlineOffset: 0.2,
                                fontSize: 16.sp,
                                useCustomUnderline: true,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          AppText("Fans", fontSize: 14.sp),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Obx(() {
                    return Column(
                      children: [
                        AppText(
                          controller.athleteIntroFanView.value?.data?.athlete
                                  ?.bio ??
                              "",
                          textAlign: TextAlign.center,
                          fontSize: 12.sp,
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 15.h),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildTab("home", 0, controller.selectedTab.value),
                        buildTab("content", 1, controller.selectedTab.value),
                        buildTab("comment", 2, controller.selectedTab.value),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return buildHomeTab(controller);
                  case 1:
                    return buildCategoryContentTab(controller);
                  case 2:
                    return buildCommentReactionTab();
                  default:
                    return buildHomeTab(controller);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String icon, int index, int selectedTab) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Column(
          children: [
            Image.asset("assets/icons/$icon.png", height: 27.sp, width: 27.sp),
            SizedBox(height: 4.h),
            Container(
              width: double.infinity,
              height: 2.h,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeTab(AthleteProfileViewController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GET TO KNOW ME",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.lightGray.withOpacity(0.6),
              fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Obx(() {
            if (controller.introViewIsLoading.value) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    smallCardShimmer(),
                    SizedBox(width: 10.w),
                    smallCardShimmer(),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (controller
                          .athleteIntroFanView.value?.data?.intro?.mediaUrl !=
                      null)
                    smallCard(
                      controller.athleteIntroFanView.value?.data?.intro
                              ?.mediaUrl ??
                          "",
                      "INTRO",
                      () {
                        final intro =
                            controller.athleteIntroFanView.value?.data?.intro;
                        if (intro != null) {
                          Get.to(() => FullScreenVideoPlayer(
                                videoUrl: fixCorruptedUrl(intro.mediaUrl ?? ""),
                              ));
                        }
                      },
                    ),
                  SizedBox(width: 10.w),
                  if (controller.athleteFavMomentsFanView.value?.data
                          ?.favoriteMoments?.isNotEmpty ==
                      true)
                    smallCard(
                      controller.athleteFavMomentsFanView.value?.data
                              ?.favoriteMoments?.first.mediaUrl ??
                          "",
                      "FAVE SPORTS MOMENT",
                      () {
                        final moments = controller.athleteFavMomentsFanView
                                .value?.data?.favoriteMoments ??
                            [];
                        if (moments.isNotEmpty) {
                          Get.to(
                            () => FullScreenVideoPlayer(
                              videoUrl:
                                  fixCorruptedUrl(moments.first.mediaUrl ?? ""),
                            ),
                          );
                        }
                      },
                    ),
                ],
              ),
            );
          }),
          SizedBox(height: 25.h),
          Text(
            "TOP CATEGORIES",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.lightGray.withOpacity(0.6),
              fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Obx(() {
            if (controller.homeCategoriesIsLoading.value) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Row(
                            children: [
                              largeCardShimmer(),
                              SizedBox(width: 10.w),
                            ],
                          )),
                ),
              );
            }

            final categories =
                controller.athleteCategoriesFanView.value?.data?.categories ??
                    [];

            if (categories.isEmpty) {
              return AppText(
                "No categories available",
                fontSize: 14.sp,
                color: AppColors.lightGray.withOpacity(0.6),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return Row(
                    children: [
                      largeCard(
                        category.posterUrl ?? "",
                        category.name ?? "",
                        () {
                          _navigateToCategoryChannels(
                              controller, category.name ?? "", index);
                        },
                      ),
                      if (index != categories.length - 1) SizedBox(width: 10.w),
                    ],
                  );
                }),
              ),
            );
          }),
          SizedBox(height: 25.h),
          Text(
            "THE BRANDS",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.lightGray.withOpacity(0.6),
              fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Obx(() {
            if (controller.homeBrandsIsLoading.value) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      4,
                      (index) => Row(
                            children: [
                              smallCardShimmer(),
                              SizedBox(width: 10.w),
                            ],
                          )),
                ),
              );
            }

            final brands =
                controller.athleteBrandsFanView.value?.data?.brands ?? [];

            if (brands.isEmpty) {
              return AppText(
                "No brands available",
                fontSize: 14.sp,
                color: AppColors.lightGray.withOpacity(0.6),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(brands.length, (index) {
                  final brand = brands[index];
                  return Row(
                    children: [
                      smallCard(
                        brand.posterUrl ?? "",
                        brand.name?.toUpperCase() ?? "",
                        () {
                          _navigateToBrandChannels(
                              controller, brand.name ?? "", index);
                        },
                      ),
                      if (index != brands.length - 1) SizedBox(width: 10.w),
                    ],
                  );
                }),
              ),
            );
          }),
          SizedBox(height: 20.h),
          Obx(() {
            final socialLinks =
                controller.athleteSocialLinksFanView.value?.data?.socialLinks;

            if (socialLinks == null) return SizedBox.shrink();

            final enabledItems = _getEnabledSocialMedia(socialLinks);

            if (enabledItems.isEmpty) return SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "FIND ${controller.athleteIntroFanView.value?.data?.athlete?.name ?? ""}"
                      .toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.lightGray.withOpacity(0.6),
                    fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: enabledItems.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15),
                    itemBuilder: (context, index) {
                      final item = enabledItems[index];
                      return InkWell(
                        onTap: () {
                          if (item.url != null && item.url!.isNotEmpty) {
                            openSocialLink(item.url!);
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: item.color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: item.image,
                            ),
                            SizedBox(height: 5),
                            Text(item.name, style: TextStyle(fontSize: 12.sp)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _navigateToCategoryChannels(
      AthleteProfileViewController controller, String categoryId, int index) {
    controller
        .getAthleteProfileViewCategoriesById(
      controller.athleteIntroFanView.value?.data?.athlete?.id ?? "",
      categoryId,
    )
        .then((_) {
      final channels =
          controller.athleteCategoryChannelsFanView.value?.data?.channels ?? [];
      if (channels.isNotEmpty) {
        final previewList = channels
            .map((e) => PreviewItemForFan(
                id: e.id ?? "",
                title: e.title ?? "",
                caption: e.caption ?? "",
                mediaUrl: fixCorruptedUrl(e.mediaUrl!) ?? "",
                categoryId: "" ?? "",
                status: "" ?? "",
                type: "" ?? "",
                isArchived: false,
                publishedAt: e.publishedAt ?? "",
                likesCount: e.likesCount ?? 0,
                commentsCount: e.commentsCount ?? 0,
                createdAt: '',
                updatedAt: '',
                media: []))
            .toList();

        NavigationHelper.toNamed(
          AppRoutes.athleteVideoReelViewForFan,
          arguments: {
            'isAthlete': isAthlete,
            'reels': previewList,
            'startIndex': 0,
          },
          transition: Transition.rightToLeft,
        );
      }
    });
  }

  void _navigateToBrandChannels(
      AthleteProfileViewController controller, String brandId, int index) {
    controller
        .getAthleteProfileViewBrandsById(
      controller.athleteIntroFanView.value?.data?.athlete?.id ?? "",
      brandId,
    )
        .then((_) {
      final channels =
          controller.athleteBrandChannelsFanView.value?.data?.channels ?? [];
      if (channels.isNotEmpty) {
        final previewList = channels
            .map((e) => PreviewItemForFan(
                id: e.id ?? "",
                title: e.title ?? "",
                caption: e.caption ?? "",
                mediaUrl: fixCorruptedUrl(e.mediaUrl!) ?? "",
                categoryId: "",
                status: '',
                type: '',
                isArchived: false,
                publishedAt: e.publishedAt ?? "",
                likesCount: e.likesCount ?? 0,
                commentsCount: e.commentsCount ?? 0,
                createdAt: '',
                updatedAt: '',
                media: []))
            .toList();

        NavigationHelper.toNamed(
          AppRoutes.athleteVideoReelViewForFan,
          arguments: {
            'isAthlete': isAthlete,
            'reels': previewList,
            'startIndex': 0,
          },
          transition: Transition.rightToLeft,
        );
      }
    });
  }

  List<SocialMediaItem> _getEnabledSocialMedia(dynamic socialLinks) {
    final allItems = [
      SocialMediaItem(
        name: 'Instagram',
        key: 'instagram',
        url: socialLinks?.instagram,
        image: Image.asset('assets/icons/insta.png', width: 24, height: 24),
        color: Colors.pink,
      ),
      SocialMediaItem(
        name: 'Spotify',
        key: 'spotify',
        url: socialLinks?.spotify,
        image: Image.asset('assets/icons/spotify.png', width: 24, height: 24),
        color: Colors.green,
      ),
      SocialMediaItem(
        name: 'YouTube',
        key: 'youtube',
        url: socialLinks?.youtube,
        image: Image.asset('assets/icons/youtube.png', width: 24, height: 24),
        color: Colors.red,
      ),
      SocialMediaItem(
        name: 'TikTok',
        key: 'tiktok',
        url: socialLinks?.tiktok,
        image: Image.asset('assets/icons/tiktok.png', width: 24, height: 24),
        color: Colors.black,
      ),
      // SocialMediaItem(
      //   name: 'X',
      //   key: 'x',
      //   url: socialLinks?.x,
      //   image: Image.asset('assets/icons/x.png', width: 24, height: 24),
      //   color: Colors.blue,
      // ),
    ];

    return allItems
        .where((item) => item.url != null && item.url!.isNotEmpty)
        .toList();
  }

  void openSocialLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppLogger.e("Could not launch $url");
    }
  }

  Widget buildCategoryContentTab(AthleteProfileViewController controller) {
    return Obx(() {
      if (controller.contentLibraryIsLoading.value) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              4,
              (index) => Column(
                children: [
                  SizedBox(
                    height: 180.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      separatorBuilder: (_, __) => SizedBox(width: 12.w),
                      itemBuilder: (_, __) {
                        return shimmerBox(
                          w: 130.w,
                          h: 180.h,
                          radius: 12,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      }

      final categories =
          controller.athleteContentLibraryFanView.value?.data?.categories ?? [];
      final brands =
          controller.athleteContentLibraryFanView.value?.data?.brands ?? [];

      if (categories.isEmpty && brands.isEmpty) {
        return Center(
          child: Text(
            "No Content Found",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.lightGray.withOpacity(0.6),
              fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: categories.length + brands.length,
        itemBuilder: (context, index) {
          if (index < categories.length) {
            final category = categories[index];
            return categorySection(
              category.name ?? "",
              category.channels ?? [],
            );
          } else {
            final brand = brands[index - categories.length];
            return categorySection(
              brand.name ?? "",
              brand.channels ?? [],
            );
          }
        },
      );
    });
  }

  Widget buildCommentReactionTab() {
    return Obx(() {
      if (controller.communityPostsIsLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        );
      }

      final posts =
          controller.athleteCommunityPostsFanView.value?.data?.posts ?? [];

      if (posts.isEmpty) {
        if (controller.athleteCommunityPostsFanView.value?.data?.isTracked ==
            false) {
          return Center(
            child: AppText("Track to see exclusive thoughts",
                color: Colors.white54, fontSize: 14.sp),
          );
        } else {
          return Center(
            child:
                AppText("No Thoughts", color: Colors.white54, fontSize: 14.sp),
          );
        }
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final item = posts[index];

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPostCard(item),
                _buildReactionCard(item),
                if (index != posts.length - 1) SizedBox(height: 20.h),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildReactionCard(dynamic item) {
    final reactions = item.reactions ?? {};
    if (reactions.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: reactions.entries.map<Widget>((entry) {
            final emoji = entry.key;
            final count = entry.value;
            final userReacted = item.userReaction == emoji;

            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () => controller.toggleReaction(item.id, emoji),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: userReacted
                        ? Colors.teal.withOpacity(0.25)
                        : const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color:
                          userReacted ? Colors.teal : const Color(0xFF3A3A3A),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(emoji, style: TextStyle(fontSize: 16.sp)),
                      SizedBox(width: 4.w),
                      Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: userReacted ? Colors.teal : Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPostCard(dynamic item) {
    return GestureDetector(
      onLongPress: () => _showWhatsAppEmojiSelector(Get.context!, item.id),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 6,
              spreadRadius: 0,
              offset: const Offset(4, 0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 6,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: AppText(
          item.content ?? "",
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showWhatsAppEmojiSelector(BuildContext context, String commentId) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 260.h,
              left: 16.w,
              right: 16.w,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...controller.quickEmojis.take(7).map((emoji) {
                        return GestureDetector(
                          onTap: () {
                            controller.toggleReaction(commentId, emoji);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            child: Text(
                              emoji,
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                        );
                      }),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _showFullEmojiPicker(context, commentId);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 20.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showFullEmojiPicker(BuildContext context, String commentId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Reaction',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(height: 1.h),
            Expanded(
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  controller.toggleReaction(commentId, emoji.emoji);
                  Navigator.pop(context);
                },
                config: Config(
                  height: 256,
                  checkPlatformCompatibility: true,
                  emojiViewConfig: EmojiViewConfig(
                    emojiSizeMax: 28.sp,
                    columns: 7,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                  ),
                  categoryViewConfig: const CategoryViewConfig(
                    indicatorColor: Colors.teal,
                    iconColorSelected: Colors.teal,
                  ),
                  bottomActionBarConfig: const BottomActionBarConfig(
                    enabled: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categorySection(String title, List<dynamic> channels) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          fontSize: 13.sp,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: channels.length,
            itemBuilder: (context, index) {
              final channel = channels[index];
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: () {
                    final previewList = channels
                        .map((e) => PreviewItemForFan(
                            id: e.id ?? "",
                            title: e.title ?? "",
                            caption: e.caption ?? "",
                            mediaUrl: fixCorruptedUrl(e.mediaUrl!) ?? "",
                            categoryId: "" ?? "",
                            status: "" ?? "",
                            type: "" ?? "",
                            isArchived: false,
                            publishedAt: e.publishedAt ?? "",
                            likesCount: e.likesCount ?? 0,
                            commentsCount: e.commentsCount ?? 0,
                            createdAt: '',
                            updatedAt: '',
                            media: []))
                        .toList();

                    NavigationHelper.toNamed(
                      AppRoutes.athleteVideoReelViewForFan,
                      arguments: {
                        'isAthlete': isAthlete,
                        'reels': previewList,
                        'startIndex': index,
                      },
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: FutureBuilder<Uint8List?>(
                    future: controller.generateThumbnail(
                        fixCorruptedUrl(channel.mediaUrl) ?? ""),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return shimmerBox(
                          w: 130.w,
                          h: 180.h,
                          radius: 12,
                        );
                      }

                      return Container(
                        width: 130.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[900],
                          image: snapshot.hasData && snapshot.data != null
                              ? DecorationImage(
                                  image: MemoryImage(snapshot.data!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: !snapshot.hasData || snapshot.data == null
                            ? Icon(
                                Icons.play_circle_outline,
                                color: Colors.white54,
                                size: 40.sp,
                              )
                            : null,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget smallCard(String imageUrl, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 175.w,
        child: FutureBuilder<Uint8List?>(
          future: imageUrl.endsWith('.mp4') || imageUrl.endsWith('.mov')
              ? controller.generateThumbnail(fixCorruptedUrl(imageUrl))
              : null,
          builder: (context, snapshot) {
            ImageProvider? imageProvider;

            // Handle image or video thumbnail
            if (imageUrl.endsWith('.mp4') || imageUrl.endsWith('.mov')) {
              if (snapshot.hasData && snapshot.data != null) {
                imageProvider = MemoryImage(snapshot.data!);
              }
            } else if (imageUrl.startsWith('http')) {
              imageProvider = NetworkImage(imageUrl);
            } else {
              imageProvider = const AssetImage("assets/images/profile.png");
            }

            return Container(
              height: 125.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[900],
                image: imageProvider != null
                    ? DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  // Shimmer only if NO imageProvider
                  if (imageProvider == null)
                    Positioned.fill(
                      child: shimmerBox(
                        w: 175.w,
                        h: 125.h,
                        radius: 12,
                      ),
                    ),

                  // Title at the bottom ALWAYS
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 6.h,
                      ),
                      child: AppText(
                        title,
                        maxLines: 2,
                        fontSize: 11.sp,
                        color: AppColors.lightGray.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget smallCardShimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2A2A),
      highlightColor: const Color(0xFF3A3A3A),
      child: Container(
        width: 175.w,
        height: 125.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget largeCardShimmer() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2A2A),
      highlightColor: const Color(0xFF3A3A3A),
      child: Container(
        width: 140.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }

  Widget largeCard(String imageUrl, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor, width: 0.8),
          image: imageUrl.isNotEmpty && imageUrl.startsWith("http")
              ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                )
              : null,
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: AppText(
            title,
            fontSize: 12.sp,
            maxLines: 2,
            color: AppColors.lightGray.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SocialMediaItem {
  final String name;
  final String key;
  final String? url;
  final Widget image;
  final Color color;

  SocialMediaItem({
    required this.name,
    required this.key,
    this.url,
    required this.image,
    required this.color,
  });
}

// class Preview {
//   final String id;
//   final String mediaUrl;
//   final String mediaType;
//   final String? thumbnailUrl;

//   Preview({
//     required this.id,
//     required this.mediaUrl,
//     required this.mediaType,
//     this.thumbnailUrl,
//   });
// }

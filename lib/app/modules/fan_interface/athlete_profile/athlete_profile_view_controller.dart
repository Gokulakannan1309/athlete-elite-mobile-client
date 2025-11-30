import 'dart:typed_data';

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/athlete_profile/get_athlete/athlete_profile_fanview_response.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_community_post_fan_view_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_content_library_fan_view_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_fav_moment_fan_view.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_home_brands_Id_channel.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_home_brands_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_home_categories_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_home_category_Id_channel_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_intro_response_fan_view.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/sub_models/athlete_social_link_fan_view_response.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

// class AthleteProfileViewController extends GetxController {
//   ApiProvider apiProvider =
//       Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

//   FanLandingController fanLandingController = Get.isRegistered()
//       ? Get.find<FanLandingController>()
//       : Get.put(FanLandingController());

//   Rx<AthleteIntroResponseFanView?> athleteIntroFanView = Rx(null);
//   final introViewIsLoading = false.obs;
//   Rx<AthleteFavMomentResponseFanView?> athleteFavMomentsFanView = Rx(null);
//   final favMomentIsLoading = false.obs;
//   Rx<AthleteCategoriesResponseFanView?> athleteCategoriesFanView = Rx(null);
//   final homeCategoriesIsLoading = false.obs;
//   Rx<AthleteCategoryChannelsResponseFanView?> athleteCategoryChannelsFanView =
//       Rx(null);
//   final homeCategoriesChannelsIsLoading = false.obs;
//   Rx<AthleteBrandsResponseFanView?> athleteBrandsFanView = Rx(null);
//   final homeBrandsIsLoading = false.obs;
//   Rx<AthleteBrandChannelsResponseFanView?> athleteBrandChannelsFanView =
//       Rx(null);
//   final homeBrandsChannelsIsLoading = false.obs;
//   Rx<AthleteSocialLinksResponseFanView?> athleteSocialLinksFanView = Rx(null);
//   final socialLinksIsLoading = false.obs;
//   Rx<AthleteContentLibraryResponseFanView?> athleteContentLibraryFanView =
//       Rx(null);
//   final contentLibraryIsLoading = false.obs;
//   Rx<AthleteCommunityPostsResponseFanView?> athleteCommunityPostsFanView =
//       Rx(null);
//   final communityPostsIsLoading = false.obs;

//   final tackAthleteIsLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   Future<void> updateTrackSingleAthlete(String athleteId) async {
//     final result = await apiProvider.post(
//       ApiEndpoints.trackSingleAthleteProfile,
//       {
//         "userId": fanLandingController.fanUser.value?.id,
//         "athleteId": athleteId
//       },
//       isLoading: tackAthleteIsLoading,
//     );

//     if (result.success) {
//       AppLogger.d(result.data);
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewIntro(String athleteId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/intro',
//       isLoading: introViewIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//       },
//     );

//     if (result.success) {
//       // Parse into model
//       final introResponse =
//           AthleteIntroResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d("Athlete Name: ${introResponse.data?.athlete?.name}");
//       AppLogger.d("Intro Media: ${introResponse.data?.intro?.mediaUrl}");

//       athleteIntroFanView.value = introResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewFavMoment(String athleteId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/favorite-moment',
//       isLoading: favMomentIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//       },
//     );

//     if (result.success) {
//       final favMomentResponse =
//           AthleteFavMomentResponseFanView.fromJson(result.data ?? {});
//       AppLogger.d(
//           "Fav Moments Count: ${favMomentResponse.data?.favoriteMoments?.length}");
//       AppLogger.d(
//           "First media URL: ${favMomentResponse.data?.favoriteMoments?.first.mediaUrl}");

//       athleteFavMomentsFanView.value = favMomentResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewCategories(String athleteId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/categories',
//       isLoading: homeCategoriesIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//       },
//     );

//     if (result.success) {
//       final categoriesResponse =
//           AthleteCategoriesResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d(
//           "Category Count: ${categoriesResponse.data?.categories?.length}");

//       athleteCategoriesFanView.value = categoriesResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewCategoriesById(
//       String athleteId, String categoryId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/categories/$categoryId/channels',
//       isLoading: homeCategoriesChannelsIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//         "page": 1,
//         "limit": 10
//       },
//     );

//     if (result.success) {
//       final channelResponse =
//           AthleteCategoryChannelsResponseFanView.fromJson(result.data ?? {});

//       // Log some values
//       AppLogger.d("Channels count: ${channelResponse.data?.channels?.length}");
//       AppLogger.d(
//           "First Title: ${channelResponse.data?.channels?.first.title}");

//       // Store into RX variable
//       athleteCategoryChannelsFanView.value = channelResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewBrands(String athleteId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/brands',
//       isLoading: homeBrandsIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//       },
//     );

//     if (result.success) {
//       final brandsResponse =
//           AthleteBrandsResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d("Brands count: ${brandsResponse.data?.brands?.length}");
//       AppLogger.d(
//           "First Brand Name: ${brandsResponse.data?.brands?.first.name}");

//       athleteBrandsFanView.value = brandsResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewBrandsById(String athleteId, String brandId,
//       {int page = 1, int limit = 10}) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/brands/$brandId/channels',
//       isLoading: homeBrandsChannelsIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//         "page": page,
//         "limit": limit
//       },
//     );

//     if (result.success) {
//       final response =
//           AthleteBrandChannelsResponseFanView.fromJson(result.data ?? {});

//       // Log counts
//       AppLogger.d("Brand Channels count: ${response.data?.channels?.length}");
//       AppLogger.d("Has more pages: ${response.data?.pagination?.hasMore}");

//       // Store in controller
//       athleteBrandChannelsFanView.value = response;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteSocialLinksForFanView(String athleteId) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/social-links',
//       isLoading: socialLinksIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//       },
//     );

//     if (result.success) {
//       final socialLinksResponse =
//           AthleteSocialLinksResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d(
//           "Spotify Link: ${socialLinksResponse.data?.socialLinks?.spotify}");
//       AppLogger.d(
//           "Instagram Link: ${socialLinksResponse.data?.socialLinks?.instagram}");

//       athleteSocialLinksFanView.value = socialLinksResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewContentLibrary(String athleteId,
//       {int page = 1, int limit = 10}) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/content-library',
//       isLoading: contentLibraryIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//         "page": page,
//         "limit": limit,
//       },
//     );

//     if (result.success) {
//       final contentLibraryResponse =
//           AthleteContentLibraryResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d(
//           "Categories count: ${contentLibraryResponse.data?.categories?.length}");
//       AppLogger.d(
//           "Brands count: ${contentLibraryResponse.data?.brands?.length}");

//       athleteContentLibraryFanView.value = contentLibraryResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }

//   Future<void> getAthleteProfileViewCommunityPost(String athleteId,
//       {int page = 1, int limit = 10}) async {
//     final result = await apiProvider.get(
//       '${ApiEndpoints.getAthleteProfileByFan}$athleteId/community',
//       isLoading: communityPostsIsLoading,
//       query: {
//         "userId": fanLandingController.fanUser.value?.id,
//         "page": page,
//         "limit": limit,
//       },
//     );

//     if (result.success) {
//       final communityResponse =
//           AthleteCommunityPostsResponseFanView.fromJson(result.data ?? {});

//       AppLogger.d("Posts count: ${communityResponse.data?.posts?.length}");
//       AppLogger.d("Is Tracked: ${communityResponse.data?.isTracked}");
//       AppLogger.d(
//           "Has more pages: ${communityResponse.data?.pagination?.hasMore}");

//       athleteCommunityPostsFanView.value = communityResponse;
//     } else {
//       AppLogger.d('Error: ${result.message}');
//     }
//   }
// }

class AthleteProfileViewController extends GetxController {
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  FanLandingController fanLandingController = Get.isRegistered()
      ? Get.find<FanLandingController>()
      : Get.put(FanLandingController());

  Rx<AthleteIntroResponseFanView?> athleteIntroFanView = Rx(null);
  final introViewIsLoading = false.obs;
  Rx<AthleteFavMomentResponseFanView?> athleteFavMomentsFanView = Rx(null);
  final favMomentIsLoading = false.obs;
  Rx<AthleteCategoriesResponseFanView?> athleteCategoriesFanView = Rx(null);
  final homeCategoriesIsLoading = false.obs;
  Rx<AthleteCategoryChannelsResponseFanView?> athleteCategoryChannelsFanView =
      Rx(null);
  final homeCategoriesChannelsIsLoading = false.obs;
  Rx<AthleteBrandsResponseFanView?> athleteBrandsFanView = Rx(null);
  final homeBrandsIsLoading = false.obs;
  Rx<AthleteBrandChannelsResponseFanView?> athleteBrandChannelsFanView =
      Rx(null);
  final homeBrandsChannelsIsLoading = false.obs;
  Rx<AthleteSocialLinksResponseFanView?> athleteSocialLinksFanView = Rx(null);
  final socialLinksIsLoading = false.obs;
  Rx<AthleteContentLibraryResponseFanView?> athleteContentLibraryFanView =
      Rx(null);
  final contentLibraryIsLoading = false.obs;
  Rx<AthleteCommunityPostsResponseFanView?> athleteCommunityPostsFanView =
      Rx(null);
  final communityPostsIsLoading = false.obs;

  final tackAthleteIsLoading = false.obs;
  final selectedTab = 0.obs;

  RxMap<String, Uint8List?> thumbnailCache = <String, Uint8List?>{}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  Future<Uint8List?> generateThumbnail(String videoPath) async {
    if (thumbnailCache.containsKey(videoPath)) {
      return thumbnailCache[videoPath];
    }

    try {
      final thumbnail = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.PNG,
        maxWidth: 200,
        quality: 75,
      );
      thumbnailCache[videoPath] = thumbnail;
      return thumbnail;
    } catch (e) {
      AppLogger.e('Error generating thumbnail: $e');
      return null;
    }
  }

  Future<void> updateTrackSingleAthlete(String athleteId) async {
    final result = await apiProvider.post(
      ApiEndpoints.trackSingleAthleteProfile,
      {
        "userId": fanLandingController.fanUser.value?.id,
        "athleteId": athleteId
      },
      isLoading: tackAthleteIsLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      await getAthleteAfterTrack(
          fanLandingController.athleteFanview.value?.data.athlete.id ?? "");
      await getAthleteProfileViewCommunityPost(
          fanLandingController.athleteFanview.value?.data.athlete.id ?? "");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteAfterTrack(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/profile',
      query: {"userId": fanLandingController.fanUser.value?.id},
    );

    if (result.success) {
      AppLogger.d("the get athlete result is: ${result.data}");

      fanLandingController.athleteFanview.value =
          AthleteProfileFanviewResponse.fromJson(result.data);
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> untrackSingleAthlete(String athleteId) async {
    final result = await apiProvider.delete(
      ApiEndpoints.untrackSingleAthleteProfile,
      data: {
        "userId": fanLandingController.fanUser.value?.id,
        "athleteId": athleteId
      },
      isLoading: tackAthleteIsLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      Get.back();
      await fanLandingController.getAthlete(athleteId);
      await getAthleteProfileViewCommunityPost(
          fanLandingController.athleteFanview.value?.data.athlete.id ?? "");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewIntro(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/intro',
      isLoading: introViewIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
      },
    );

    if (result.success) {
      final introResponse =
          AthleteIntroResponseFanView.fromJson(result.data ?? {});

      AppLogger.d("Athlete Name: ${introResponse.data?.athlete?.name}");
      AppLogger.d("Intro Media: ${introResponse.data?.intro?.mediaUrl}");

      athleteIntroFanView.value = introResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewFavMoment(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/favorite-moment',
      isLoading: favMomentIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
      },
    );

    if (result.success) {
      final favMomentResponse =
          AthleteFavMomentResponseFanView.fromJson(result.data ?? {});
      AppLogger.d(
          "Fav Moments Count: ${favMomentResponse.data?.favoriteMoments?.length}");

      athleteFavMomentsFanView.value = favMomentResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewCategories(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/categories',
      isLoading: homeCategoriesIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
      },
    );

    if (result.success) {
      final categoriesResponse =
          AthleteCategoriesResponseFanView.fromJson(result.data ?? {});

      AppLogger.d(
          "Category Count: ${categoriesResponse.data?.categories?.length}");

      athleteCategoriesFanView.value = categoriesResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewCategoriesById(
      String athleteId, String categoryId,
      {int page = 1, int limit = 10}) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/categories/$categoryId/channels',
      isLoading: homeCategoriesChannelsIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
        "page": page,
        "limit": limit
      },
    );

    if (result.success) {
      final channelResponse =
          AthleteCategoryChannelsResponseFanView.fromJson(result.data ?? {});

      AppLogger.d("Channels count: ${channelResponse.data?.channels?.length}");

      athleteCategoryChannelsFanView.value = channelResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewBrands(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/brands',
      isLoading: homeBrandsIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
      },
    );

    if (result.success) {
      final brandsResponse =
          AthleteBrandsResponseFanView.fromJson(result.data ?? {});

      AppLogger.d("Brands count: ${brandsResponse.data?.brands?.length}");

      athleteBrandsFanView.value = brandsResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewBrandsById(String athleteId, String brandId,
      {int page = 1, int limit = 10}) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/brands/$brandId/channels',
      isLoading: homeBrandsChannelsIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
        "page": page,
        "limit": limit
      },
    );

    if (result.success) {
      final response =
          AthleteBrandChannelsResponseFanView.fromJson(result.data ?? {});

      AppLogger.d("Brand Channels count: ${response.data?.channels?.length}");
      AppLogger.d("Has more pages: ${response.data?.pagination?.hasMore}");

      athleteBrandChannelsFanView.value = response;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteSocialLinksForFanView(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/social-links',
      isLoading: socialLinksIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
      },
    );

    if (result.success) {
      final socialLinksResponse =
          AthleteSocialLinksResponseFanView.fromJson(result.data ?? {});

      AppLogger.d(
          "Spotify Link: ${socialLinksResponse.data?.socialLinks?.spotify}");

      athleteSocialLinksFanView.value = socialLinksResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewContentLibrary(String athleteId,
      {int page = 1, int limit = 10}) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/content-library',
      isLoading: contentLibraryIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
        "page": page,
        "limit": limit,
      },
    );

    if (result.success) {
      final contentLibraryResponse =
          AthleteContentLibraryResponseFanView.fromJson(result.data ?? {});

      AppLogger.d(
          "Categories count: ${contentLibraryResponse.data?.categories?.length}");

      athleteContentLibraryFanView.value = contentLibraryResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAthleteProfileViewCommunityPost(String athleteId,
      {int page = 1, int limit = 10}) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/community',
      isLoading: communityPostsIsLoading,
      query: {
        "userId": fanLandingController.fanUser.value?.id,
        "page": page,
        "limit": limit,
      },
    );

    if (result.success) {
      final communityResponse =
          AthleteCommunityPostsResponseFanView.fromJson(result.data ?? {});

      AppLogger.d("Posts count: ${communityResponse.data?.posts?.length}");

      athleteCommunityPostsFanView.value = communityResponse;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> toggleReaction(
    String postId,
    String emoji,
  ) async {
    final result = await apiProvider.post(
      '${ApiEndpoints.getAthleteProfileByFan}$postId/community/react',
      {
        "userId": fanLandingController.fanUser.value?.id,
        "emoji": emoji,
      },
    );

    if (result.success) {
      await getAthleteProfileViewCommunityPost(
          fanLandingController.athleteFanview.value?.data.athlete.id ?? "");
    }
  }

  List<String> quickEmojis = ['❤️', '👍', '😂', '😮', '😢', '🔥', '👏'];
}

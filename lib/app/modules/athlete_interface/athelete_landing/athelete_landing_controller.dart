import 'dart:io';

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/athlete_fans_list/fans_list.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_category_model.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/home_section/home_section_details.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/private_community/private_community_post_list_response.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/settings_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data/models/category.dart';

class AtheleteLandingController extends GetxController {
  late final bool isAthlete;
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  var selectedTab = 0.obs;
  final aboutMeController = TextEditingController();
  final addDescriptionForStudio = TextEditingController();
  final captionForNewPost = TextEditingController();
  final editCaptionController = TextEditingController();
  final profileIsLoading = false.obs;
  final gotoChannelIsLoading = false.obs;
  RxString introThumbnail = "".obs;
  RxString backendIntroUrl = "".obs;
  RxString backendFaveSportsMomentUrl = "".obs;
  var introVideoPath = "".obs;
  var favMomentVideoPath = "".obs;
  RxBool isIntroPlaying = false.obs;
  VideoPlayerController? introController;
  RxString favMomentThumbnail = "".obs;
  RxString profilePicture = "".obs;
  RxString athleteFanCount = "".obs;
  RxString athleteBio = "".obs;

  Rxn<HomeSectionResponse> homeSectionResponse = Rxn<HomeSectionResponse>();

  Rxn<ContentLibrarySummaryResponse> contentLibrarySummary =
      Rxn<ContentLibrarySummaryResponse>();

  Rxn<PrivateCommunityPostListResponse> privateCommunityPostList =
      Rxn<PrivateCommunityPostListResponse>();

  RxList<CategoryUIModel> contentCategoryList = <CategoryUIModel>[].obs;

  Rx<IntroData?> intro = Rx<IntroData?>(null);

  RxList<String> aboutMe = <String>[].obs;

  Rx<FavSportsMoment?> favSportsMoments = Rx<FavSportsMoment?>(null);

  Rxn<AthleteUser> athleteUser = Rxn<AthleteUser>();

  RxList<Category> categories = <Category>[].obs;
  RxList<Brand> brands = <Brand>[].obs;

  Rx<FansListResponse?> fansList = Rx<FansListResponse?>(null);

  final isHomeIntroLoading = false.obs;
  final isHomeCategoriesLoading = false.obs;
  final isHomeContentLibraryLoading = false.obs;
  final isPrivateComunityLoading = false.obs;
  final sendPrivateCommunityPostLoading = false.obs;
  final isHomeBrandsLoading = false.obs;
  final isFavMomentLoading = false.obs;
  final isFansListLoading = false.obs;

  var isLoadingMoreFansList = false.obs;
  var hasMoreFansList = true.obs;
  late ScrollController fansScrollController;

  RxInt selectedIconInReel = 0.obs;
  var aboutItems = <String>[].obs;

  var fansListSearch = TextEditingController();
  var fansListPage = 1.obs;
  var fansLimit = 10.obs;

  RxInt selectedHour = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    isAthlete = args?['isAthlete'] ?? 'default';

    print("isAthlete in controller => $isAthlete");

    if (isAthlete) {
      ever(selectedTab, (tab) {
        if (tab == 1) {
          getAllAthleteChannelsByCategory();
        }
        if (tab == 2) {
          getAllPrivateCommunityPostList();
        }
      });
      getLoggedInUser();
      initializeDetailsofGoToChannel();
      getAllPrivateCommunityPostList();
      getAthleteChannelCategories();
      getAthleteChannelBrands();
      getAllAthleteChannelsByCategory();
      aboutItems.value = List<String>.from(aboutMe);
      fansScrollController = ScrollController();
      fansScrollController.addListener(fansListPaginationListener);
      getAllCategories();
      getAllBrands();
    }
  }

  @override
  void onClose() {
    introController?.dispose();
    super.onClose();
  }

  void getLoggedInUser() {
    final athleteBox = Hive.box<AthleteUser>('athlete_user');
    final loggedAthlete = athleteBox.get('current_user');

    if (loggedAthlete != null) {
      athleteUser.value = loggedAthlete;
    }
  }

  List<SocialMediaItem> getEnabledSocialMedia(FindAthlete? findAthlete) {
    if (findAthlete == null) return [];

    final Map<String, String?> apiMap = {
      "spotify": findAthlete.spotify,
      "youtube": findAthlete.youtube,
      "instagram": findAthlete.instagram,
      "fameMe": findAthlete.fameMe,
      "facebook": findAthlete.facebook,
      "tiktok": findAthlete.tiktok,
      "twitter": findAthlete.twitter,
    };

    return socialMediaList.where((item) {
      final url = apiMap[item.key];
      return url != null && url.isNotEmpty;
    }).toList();
  }

  final List<SocialMediaItem> socialMediaList = [
    SocialMediaItem(
      name: 'Spotify',
      image: Image.asset("assets/icons/spotify.png", height: 27, width: 27),
      color: Color(0xFF25D366),
      urlHint: 'https://spotify.com/yourusername',
      key: 'spotify',
    ),
    SocialMediaItem(
      name: 'Youtube',
      image: Image.asset("assets/icons/youtube.png", height: 27, width: 27),
      color: Color(0xFFFF0000),
      urlHint: 'https://youtube.com/@yourchannel',
      key: 'youtube',
    ),
    SocialMediaItem(
      name: 'Instagram',
      image: Image.asset("assets/icons/insta.png", height: 27, width: 27),
      color: Color(0xFFE4405F),
      urlHint: 'https://instagram.com/yourusername',
      key: 'instagram',
    ),
    SocialMediaItem(
      name: 'Pinterest',
      image: Image.asset("assets/icons/linkme.png", height: 27, width: 27),
      color: Color(0xFFE60023),
      urlHint: 'https://in.pinterest.com',
      key: 'pinterest',
    ),
    SocialMediaItem(
      name: 'Facebook',
      image: Image.asset("assets/icons/fb.png", height: 27, width: 27),
      color: Color(0xFF1877F2),
      urlHint: 'https://facebook.com/your.username',
      key: 'facebook',
    ),
    SocialMediaItem(
      name: 'TikTok',
      image: Image.asset("assets/icons/tiktok.png", height: 27, width: 27),
      color: Colors.black,
      urlHint: 'https://www.tiktok.com/@yourusername',
      key: 'tiktok',
    ),
    SocialMediaItem(
      name: 'X',
      image: Image.asset("assets/icons/twitter.png", height: 27, width: 27),
      color: Colors.white,
      urlHint: 'https://x.com/yourusername',
      key: 'twitter', // FIX key for X
    ),
  ];

  Future<void> playIntroVideo(String url) async {
    isIntroPlaying.value = true;

    introController = VideoPlayerController.networkUrl(
      Uri.parse(url),
      httpHeaders: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Referer': Uri.parse(url).origin,
        'Accept': '*/*',
      },
    );

    await introController!.initialize();
    introController!.play();
    introController!.setLooping(true);

    update();
  }

  void pauseIntroVideo() {
    introController?.pause();
    isIntroPlaying.value = false;
  }

  Future<bool> initializeDetailsofGoToChannel() async {
    final result = await apiProvider.get(
      ApiEndpoints.homeSectionDetailsOfGoToChannel,
      isLoading: isHomeIntroLoading,
    );

    if (result.success) {
      homeSectionResponse.value = HomeSectionResponse.fromJson(result.data);

      AppLogger.d(
          "the result of initializeDetailsofGoToChannel is ${result.data}");

      if (homeSectionResponse.value != null) {
        profilePicture.value =
            fixCorruptedUrl(homeSectionResponse.value!.data.profilePicture);
        aboutMe.assignAll(homeSectionResponse.value!.data.aboutMe ?? []);
        athleteFanCount.value =
            homeSectionResponse.value!.data.fansCount.toString();
        athleteBio.value = homeSectionResponse.value!.data?.bio ?? "ss";

        if (homeSectionResponse.value!.data.intro != null) {
          backendIntroUrl.value = fixCorruptedUrl(
              homeSectionResponse.value?.data.intro?.mediaUrl ?? "");

          introThumbnail.value = await _generateVideoThumbnail(
            fixCorruptedUrl(homeSectionResponse.value!.data.intro!.mediaUrl),
          );
        }

        if (homeSectionResponse.value!.data.favSportsMoments.isNotEmpty) {
          isFavMomentLoading.value = true;
          favMomentThumbnail.value = await _generateVideoThumbnail(
            fixCorruptedUrl(homeSectionResponse
                .value!.data.favSportsMoments.first.mediaUrl),
          );
          backendFaveSportsMomentUrl.value = fixCorruptedUrl(
            homeSectionResponse.value!.data.favSportsMoments.first.mediaUrl,
          );
          isFavMomentLoading.value = false;
        }
        return result.success;
      }
      return result.success;
    } else {
      AppLogger.d(
          "the result of initializeDetailsofGoToChannel is ${result.message}");
      return false;
    }
  }

  ImageProvider getImageProvider(String url) {
    if (url.isEmpty) {
      return const AssetImage("assets/images/get_to_know.png");
    }

    if (url.startsWith("/data") || File(url).existsSync()) {
      return FileImage(File(url));
    }

    if (url.startsWith("http")) {
      return NetworkImage(url);
    }

    return AssetImage(url);
  }

  Future<String> _generateVideoThumbnail(String url) async {
    return await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";
  }

  Future<bool> uploadCategoryPoster(String categoryId) async {
    AppLogger.d("uploadCategoryPoster $categoryId");
    final mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());

    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return false;
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.patch(
      '${ApiEndpoints.updateCategoryPoster}$categoryId/poster',
      formData,
      isLoading: isHomeCategoriesLoading,
    );

    if (result.success) {
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> deleteCategoryPoster(String categoryId) async {
    final result = await apiProvider.delete(
      "${ApiEndpoints.deleteCategoryPoster}$categoryId/poster",
      isLoading: isHomeCategoriesLoading,
    );

    if (result.success) {
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> deleteBrandPoster(String brandId) async {
    final result = await apiProvider.delete(
      ApiEndpoints.deleteBrandPoster,
      isLoading: isHomeBrandsLoading,
    );

    if (result.success) {
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> uploadBrandPoster(String brandId) async {
    final mediaPickerController = Get.find<MediaPickerController>();

    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return false;
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.patch(
      ApiEndpoints.updateBrandPoster,
      formData,
      isLoading: isHomeBrandsLoading,
    );

    if (result.success) {
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  void fansListPaginationListener() {
    if (fansScrollController.position.pixels >=
            fansScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreFansList.value &&
        hasMoreFansList.value) {
      loadMoreFansList();
    }
  }

  Future<void> loadMoreFansList() async {
    if (!hasMoreFansList.value) return;

    isLoadingMoreFansList.value = true;
    fansListPage.value++;

    await getAllAthleteFansList(isRefresh: false);
    isLoadingMoreFansList.value = false;
  }

  Future<bool> getAllAthleteFansList({bool isRefresh = true}) async {
    if (isRefresh) {
      fansListPage.value = 1;
      fansList.value = null;
      hasMoreFansList.value = true;
    }
    final result = await apiProvider.get(
      ApiEndpoints.getAllAthleteFansList,
      query: {
        'search': fansListSearch.text.trim(),
        'page': fansListPage.value.toString(),
        'limit': fansLimit.value.toString(),
      },
      isLoading: isFansListLoading,
    );

    if (result.success) {
      fansList.value = FansListResponse.fromJson(result.data);
      return result.success;
    } else {
      AppLogger.e(result.error);
      return false;
    }
  }

  Future<bool> getAllAthleteChannelsByCategory() async {
    isHomeContentLibraryLoading.value = true;

    try {
      final result = await apiProvider.get(
        ApiEndpoints.getAllAthleteChannelsByCategory,
        // isLoading: isHomeContentLibraryLoading,
      );

      if (!result.success) {
        AppLogger.e(result.error);
        return false;
      }
      AppLogger.d('API Response: ${result.data}'); // Log to debug

      final response = ContentLibrarySummaryResponse.fromJson(result.data);
      contentLibrarySummary.value = response;

      contentCategoryList.clear();

      for (final category in response.data.categories) {
        List<ChannelUIModel> channels = [];

        for (final preview in category.preview) {
          // Skip if essential data is missing
          if (preview.mediaUrl == null || preview.mediaUrl!.isEmpty) {
            AppLogger.w(
                'Skipping preview with null/empty mediaUrl for id: ${preview.id}');
            continue;
          }

          try {
            final thumb = await _generateVideoThumbnail(
                fixCorruptedUrl(preview.mediaUrl!));

            channels.add(ChannelUIModel(
              title: preview.title ?? 'Untitled',
              thumbnail: thumb,
              videoUrl: preview.mediaUrl!,
            ));
          } catch (e) {
            AppLogger.e(
                'Error generating thumbnail for ${preview.mediaUrl}: $e');
            // Continue with next preview instead of breaking the entire loop
            continue;
          }
        }

        // Only add category if it has valid channels
        if (channels.isNotEmpty) {
          contentCategoryList.add(
            CategoryUIModel(
              categoryName: category.categoryName ?? 'Untitled',
              channels: channels,
            ),
          );
        } else {
          AppLogger.w(
              'Category ${category.categoryName} has no valid channels');
        }
      }

      AppLogger.d(
          'Successfully loaded ${contentCategoryList.length} categories');
      isHomeContentLibraryLoading.value = false;
      return true;
    } catch (e, stackTrace) {
      AppLogger.e('Error parsing content library: $e');
      AppLogger.e('Stack trace: $stackTrace');
      isHomeContentLibraryLoading.value = false;
      return false;
    } finally {
      isHomeContentLibraryLoading.value = false;
    }
  }

  Future<bool> getAllPrivateCommunityPostList() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllPrivateCommunityListForAthlete,
      isLoading: isPrivateComunityLoading,
    );

    if (result.success) {
      privateCommunityPostList.value =
          PrivateCommunityPostListResponse.fromJson(result.data);
      return true;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> updateAthleteAboutMe() async {
    final result = await apiProvider.patch(
      ApiEndpoints.updateAtheleteaboutMe,
      {"entries": aboutItems},
      isLoading: isHomeIntroLoading,
    );
    if (result.success) {
      aboutMe.value = List<String>.from(aboutItems);
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> uploadFavSportMoment() async {
    MediaPickerController mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());
    final XFile? video = await mediaPickerController.picker
        .pickVideo(source: ImageSource.gallery);

    if (video != null) {
      mediaPickerController.currentMediaType.value = MediaType.video;
      mediaPickerController.selectedMedia.value = [
        SelectedMedia(file: File(video.path), type: MediaType.video),
      ];
      favMomentThumbnail.value = await _generateVideoThumbnail(video.path);
      favMomentVideoPath.value = video.path;

      final filePath = favMomentVideoPath.value;

      if (filePath.isEmpty) {
        AppLogger.d("No file path found for mobile upload");
        return false;
      }

      final file = await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      );

      final formData = FormData.fromMap({
        'file': file,
      });

      final result = await apiProvider.post(
        ApiEndpoints.addFavesportsmoments,
        formData,
        isLoading: isHomeIntroLoading,
      );
      if (result.success) {
        await initializeDetailsofGoToChannel();
        update();
        AppLogger.d("Added favSportMoment");
        return result.success;
      } else {
        AppLogger.d(result.error);
        return false;
      }

      // mediaPickerController.showBottomSheet(false, false, true);
    }
    return false;
  }

  Future<bool> deleteAthleteFavSportMoment() async {
    final result = await apiProvider.delete(
      ApiEndpoints.deleteFavSportsMoments +
          homeSectionResponse.value!.data.favSportsMoments.first.id.toString(),
      isLoading: isHomeIntroLoading,
    );

    if (result.success) {
      backendFaveSportsMomentUrl.value = "";
      favMomentThumbnail.value = "";
      favMomentVideoPath.value = "";
      await initializeDetailsofGoToChannel();
      update();
      AppLogger.d("Deleted favSportMoment");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> updateAthleteIntroVideo() async {
    final filePath = introVideoPath.value;

    if (filePath.isEmpty) {
      AppLogger.d("No file path found for mobile upload");
      return;
    }

    final file = await MultipartFile.fromFile(
      filePath,
      filename: filePath.split('/').last,
    );

    final formData = FormData.fromMap({
      'file': file,
    });

    final result = await apiProvider.post(
      ApiEndpoints.updateAtheleteIntroVideo,
      formData,
      isLoading: isHomeIntroLoading,
    );

    if (result.success) {
      final intro = result.data?['intro'];
      final newUrl = intro?['mediaUrl'] ?? "";

      if (newUrl.isNotEmpty) {
        backendIntroUrl.value = newUrl;
        AppLogger.d("Updated backendIntroUrl: $newUrl");
      } else {
        AppLogger.d("No mediaUrl found in response");
      }
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteChannelCategories() async {
    final result = await apiProvider.get(
        ApiEndpoints.getAthleteChannelCategories,
        isLoading: isHomeCategoriesLoading);

    if (result.success) {
      final List list = result.data["data"];
      categories.assignAll(list.map((e) => Category.fromJson(e)).toList());
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteChannelBrands() async {
    final result = await apiProvider.get(ApiEndpoints.getAthleteChannelBrands,
        isLoading: isHomeBrandsLoading);

    AppLogger.d("The brand result is: ${result.data}");

    if (result.success) {
      final List list = result.data["data"];
      brands.assignAll(list.map((e) => Brand.fromJson(e)).toList());
    } else {
      AppLogger.d(result.error);
    }
  }

  void addItem() {
    if (aboutMeController.text.trim().isEmpty) {
      CustomToast.show("Please enter something before adding");
      return;
    }

    aboutItems.add(aboutMeController.text.trim());
    aboutMeController.clear();
  }

  void removeItem(int index) {
    aboutItems.removeAt(index);
  }

  Future<void> uploadProfileImage() async {
    final mediaPickerController = Get.find<MediaPickerController>();

    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return;
    }

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.post(
      ApiEndpoints.athleteSetProfileImage,
      formData,
      isLoading: profileIsLoading,
    );

    if (result.success) {
      AppLogger.d("Profile Uploaded → ${result.data}");
      mediaPickerController.selectedImages.clear();
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  // Mock data with reactions
  final adviceItems = <Map<String, dynamic>>[
    {
      'id': 1,
      'text': 'Great advice on productivity! Thanks for sharing.',
      'reactions': <String, dynamic>{
        'summary': {
          '👍': {'count': 5, 'userReacted': false},
          '❤️': {'count': 3, 'userReacted': true},
          '😊': {'count': 2, 'userReacted': false},
        }
      }
    },
    {
      'id': 2,
      'text': 'I completely agree with your perspective on this matter.',
      'reactions': <String, dynamic>{
        'summary': {
          '👍': {'count': 8, 'userReacted': true},
          '🔥': {'count': 4, 'userReacted': false},
        }
      }
    },
    {
      'id': 3,
      'text': 'This is really helpful information for beginners.',
      'reactions': <String, dynamic>{
        'summary': {
          '❤️': {'count': 6, 'userReacted': false},
          '😊': {'count': 3, 'userReacted': false},
          '👏': {'count': 2, 'userReacted': false},
        }
      }
    },
  ].obs;

  final quickEmojis = ['👍', '❤️', '😊', '😮', '😢', '🙏', '👏'];

  void toggleReaction(String commentId, String emoji) {
    AppLogger.d("toggleReaction $commentId $emoji");
    final itemIndex = adviceItems.indexWhere((item) => item['id'] == commentId);
    if (itemIndex == -1) return;

    final item = adviceItems[itemIndex];
    final reactions = item['reactions'] as Map<String, dynamic>;
    final summary = reactions['summary'] as Map<String, dynamic>;

    if (summary.containsKey(emoji) && summary[emoji]['userReacted'] == true) {
      _deleteReaction(summary, emoji);
    } else {
      _removeOldUserReaction(summary);
      _addReaction(summary, emoji);
    }

    adviceItems.refresh();
  }

  void _deleteReaction(Map<String, dynamic> summary, String emoji) {
    if (summary[emoji]['count'] > 1) {
      summary[emoji]['count']--;
      summary[emoji]['userReacted'] = false;
    } else {
      summary.remove(emoji);
    }
  }

  void _removeOldUserReaction(Map<String, dynamic> summary) {
    try {
      final oldEmoji = summary.keys.firstWhere(
        (key) => summary[key]['userReacted'] == true,
      );
      if (oldEmoji != null) {
        _deleteReaction(summary, oldEmoji);
      }
    } catch (e) {
      // No element found, continue
    }
  }

  void _addReaction(Map<String, dynamic> summary, String emoji) {
    if (summary.containsKey(emoji)) {
      summary[emoji]['count']++;
      summary[emoji]['userReacted'] = true;
    } else {
      summary[emoji] = {'count': 1, 'userReacted': true};
    }
  }

  // Change tab
  void changeTab(int index) {
    selectedTab.value = index;
  }

  Future<void> removeFanFromTrack(String fanId) async {
    final result = await apiProvider.delete(
      "${ApiEndpoints.removeFanFromTrack}$fanId",
    );

    if (result.success) {
      AppLogger.d("Fan removed from track");
      CustomToast.show("Successfully fan removed from track");
      getAllAthleteFansList(isRefresh: true);
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<bool> deleteChannelFromUpload(String id) async {
    final result = await apiProvider.delete(
      "${ApiEndpoints.deleteChannelFromUpload}$id",
    );

    if (result.success) {
      AppLogger.d("Channel deleted from upload");
      return result.success;
      // getAllAthleteChannelsList(isRefresh: true);
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> uploadChannelToarchive(String channelId) async {
    final result = await apiProvider.patch(
      "${ApiEndpoints.postChannelToArchive}$channelId/archive",
      {},
    );

    if (result.success) {
      AppLogger.d("Channel uploaded to archive");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> deleteChannelFromArchive(String id) async {
    final result = await apiProvider.delete(
      "${ApiEndpoints.deleteChannelFromArchive}$id",
    );

    if (result.success) {
      AppLogger.d("Channel deleted from archive");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> restoreChannelFromarchive(String channelId) async {
    final result = await apiProvider.patch(
      "${ApiEndpoints.restoreChannelFromArchive}$channelId/restore",
      {},
    );

    if (result.success) {
      AppLogger.d("Channel restored to archive");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  // Update reaction count
  void updateReaction(int postIndex, String reactionType) {
    if (postIndex < adviceItems.length) {
      final reactions = adviceItems[postIndex]['reactions'] as Map<String, int>;
      reactions[reactionType] = (reactions[reactionType] ?? 0) + 1;
      adviceItems.refresh();
    }
  }

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<BrandItem> brandItems = <BrandItem>[].obs;

  Future<void> getAllCategories() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllCategories,
      isLoading: isHomeCategoriesLoading,
    );

    AppLogger.d("the result : $result");

    if (result.success) {
      // Fix: Access the nested data object first
      final data = result.data["data"];

      if (data != null && data["items"] != null) {
        final items = data["items"] as List;

        allCategories.assignAll(
          items.map((e) => CategoryModel.fromJson(e)).toList(),
        );
      } else {
        AppLogger.d("No categories found in response");
      }
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAllBrands() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllBrands,
      isLoading: isHomeCategoriesLoading,
    );

    AppLogger.d("the result : $result");

    if (result.success) {
      // Fix: Access the nested data object first
      final data = result.data["data"];

      if (data != null && data["items"] != null) {
        final items = data["items"] as List;

        // Parse each item in the list
        brandItems
            .assignAll(items.map((item) => BrandItem.fromJson(item)).toList());
      } else {
        AppLogger.d("No items found in response");
      }
    } else {
      AppLogger.d(result.error);
    }
  }

  RxList<String> selectedCategoryIds = <String>[].obs;
  RxList<String> selectedBrandIds = <String>[].obs;

  void toggleCategorySelection(int index) {
    final categoryId = allCategories[index].id;

    if (selectedCategoryIds.contains(categoryId)) {
      selectedCategoryIds.remove(categoryId);
    } else {
      selectedCategoryIds.add(categoryId);
    }

    AppLogger.d("selectedCategoryIds: $selectedCategoryIds");
  }

  void toggleBrandSelection(int index) {
    final brandId = brandItems[index].id;
    if (selectedBrandIds.contains(brandId)) {
      selectedBrandIds.remove(brandId);
    } else {
      selectedBrandIds.add(brandId ?? "");
    }

    AppLogger.d("selectedBrandIds: $selectedBrandIds");
  }
}

class CategoryModel {
  final String id;
  final String name;
  final String imageData;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageData,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      imageData: json['imageData'] ?? "",
    );
  }
}

class BrandResponse {
  final bool status;
  final int statusCode;
  final String message;
  final List<BrandItem> items;

  BrandResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.items,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      status: json["status"],
      statusCode: json["statusCode"],
      message: json["message"],
      items: (json["data"]["items"] as List)
          .map((e) => BrandItem.fromJson(e))
          .toList(),
    );
  }
}

class BrandItem {
  final String? id;
  final String? name;
  final String? imageData;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BrandItem({
    this.id,
    this.name,
    this.imageData,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandItem.fromJson(Map<String, dynamic> json) {
    return BrandItem(
      id: json["id"] as String?,
      name: json["name"] as String?,
      imageData: json["imageData"] as String?,
      createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
    );
  }

}

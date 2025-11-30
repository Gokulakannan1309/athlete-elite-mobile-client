import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/draft_channel/draft_model_details.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/schedule/schedule_model.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/upload_channel/upload_channel_response.dart'
    hide PreviewItem;
import 'package:athlete_elite/app/data/models/content_studio/content_studio_response.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:video_thumbnail/video_thumbnail.dart';

class AtheleteHomeController extends GetxController {
  late final bool isAthlete;
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  AtheleteLandingController landingController = Get.isRegistered()
      ? Get.find<AtheleteLandingController>()
      : Get.put(AtheleteLandingController());
  var selectedOuterTab = 0.obs;
  var selectedInnerTab = 0.obs;
  Rxn<ContentStudioResponse> contentStudioResponse =
      Rxn<ContentStudioResponse>();

  final Map<String, String> thumbnailCache = {};

  var draftChannelSearch = TextEditingController();
  var draftPage = 1.obs;
  var draftLimit = 10.obs;
  var uploadPage = 1.obs;
  var uploadLimit = 10.obs;
  bool canLoadMore = true;
  final isDraftChannelLoading = false.obs;
  RxBool isUploadsLoading = false.obs;
  ScrollController uploadsScrollController = ScrollController();
  RxBool isUploadingMore = false.obs;
  final isScheduleLoading = false.obs;
  final isReschedulingLoading = false.obs;
  final isContentStudioListingLoading = false.obs;
  final postNowIsLoading = false.obs;
  final saveDraftIsLoading = false.obs;
  final editContentIsLoading = false.obs;
  final scheduleNowIsLoading = false.obs;
  final addYourThoughtsController = TextEditingController();

  RxList<DraftCategoryItem> draftCategories = <DraftCategoryItem>[].obs;
  RxMap<String, String> generatedDraftThumbnails = <String, String>{}.obs;
  Map<String, dynamic> getAthleteStory = <String, dynamic>{}.obs;

  Future<String> generateDraftVideoThumbnail(String url) async {
    if (generatedDraftThumbnails.containsKey(url)) {
      return generatedDraftThumbnails[url]!;
    }

    final thumbPath = await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";

    generatedDraftThumbnails[url] = thumbPath;

    return thumbPath;
  }

  RxList<CategoryGroup> uploadCategories = <CategoryGroup>[].obs;
  RxList<BrandGroup> uploadBrands = <BrandGroup>[].obs;
  RxList<PreviewItem> scheduleItems = <PreviewItem>[].obs;
  final captionForNewStory = TextEditingController();
  final isStoryUploadLoading = false.obs;

  RxMap<String, String> generatedUploadThumbnails = <String, String>{}.obs;

  Future<String> generateUploadVideoThumbnail(String url) async {
    if (generatedUploadThumbnails.containsKey(url)) {
      return generatedUploadThumbnails[url]!;
    }

    final thumb = await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";

    generatedUploadThumbnails[url] = thumb;
    return thumb;
  }

  RxMap<String, String> generatedScheduleThumbnails = <String, String>{}.obs;

  Future<String> generateScheduleVideoThumbnail(String url) async {
    if (generatedScheduleThumbnails.containsKey(url)) {
      return generatedScheduleThumbnails[url]!;
    }

    final thumb = await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";

    generatedScheduleThumbnails[url] = thumb;
    return thumb;
  }

  var isLoadingMoreDraft = false.obs;
  var hasMoreDraft = true.obs;

  var isLoadingMoreSchedule = false.obs;
  var hasMoreSchedule = true.obs;

  late ScrollController draftScrollController;
  late ScrollController scheduleScrollController;

  var scheduleChannelSearch = TextEditingController();
  var schedulePage = 1.obs;
  var scheduleLimit = 10.obs;

  var notifications = <NotificationItemForAthlete>[].obs;
  var myContent = <ContentItems>[].obs;
  var sentContent = <ContentItems>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    isAthlete = args?['isAthlete'] ?? 'default';

    print("isAthlete in controller => $isAthlete");
    if (isAthlete) {
      ever(selectedInnerTab, (tab) {
        if (tab == 1) {
          onGetAllUploadChannels();
        } else if (tab == 0) {
          getAllDraftChannelList();
        } else if (tab == 2) {
          getAllScheduleChannelList(isRefresh: false);
        }
      });
      ever(selectedOuterTab, (tab) {
        if (tab == 3) {
          getAthleteAllContentStudio();
        }
      });
      draftScrollController = ScrollController();
      draftScrollController.addListener(paginationListener);

      uploadsScrollController.addListener(() {
        if (uploadsScrollController.position.pixels >=
                uploadsScrollController.position.maxScrollExtent - 200 &&
            !isUploadingMore.value &&
            canLoadMore) {
          loadMoreUploads();
        }
      });

      getAllDraftChannelList();
      scheduleScrollController = ScrollController();
      scheduleScrollController.addListener(schedulePaginationListener);

      loadNotifications();
    }
  }

  @override
  onReady() {
    super.onReady();
    if (isAthlete) {
      landingController.getAllCategories();
      landingController.getAllBrands();
      landingController.getAllPrivateCommunityPostList();
    }
  }

  void paginationListener() {
    if (draftScrollController.position.pixels >=
            draftScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreDraft.value &&
        hasMoreDraft.value) {
      loadMoreDrafts();
    }
  }

  Future<void> getAllDraftChannelList({bool isRefresh = true}) async {
    if (isRefresh) {
      draftPage.value = 1;
      draftCategories.clear();
      hasMoreDraft.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllAthleteDraftChannelList,
      isLoading: isDraftChannelLoading,
      query: {
        'search': draftChannelSearch.text.trim(),
        'type': 'CHANNEL',
        'page': draftPage.value.toString(),
        'limit': draftLimit.value.toString(),
      },
    );

    if (result.success) {
      final data = DraftResponse.fromJson(result.data);

      /// ADD ALL CATEGORY BLOCKS
      draftCategories.addAll(data.data.items);

      AppLogger.d("draftCategories length: ${draftCategories}");

      if (data.data.meta.page >= data.data.meta.totalPages) {
        hasMoreDraft.value = false;
      }
    }
  }

  Future<void> loadMoreDrafts() async {
    if (!hasMoreDraft.value) return;

    isLoadingMoreDraft.value = true;
    draftPage.value++;

    await getAllDraftChannelList(isRefresh: false);
    isLoadingMoreDraft.value = false;
  }

  void schedulePaginationListener() {
    if (scheduleScrollController.position.pixels >=
            scheduleScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreSchedule.value &&
        hasMoreSchedule.value) {
      loadMoreSchedule();
    }
  }

  Future<void> loadMoreUploads() async {
    uploadPage++;
    isUploadingMore.value = true;

    final result = await apiProvider.get(
        ApiEndpoints.getAllAthleteUploadChannels,
        query: {"page": "$uploadPage", "limit": "$uploadLimit"});

    if (result.success) {
      final data = UploadChannelResponse.fromJson(result.data['data']);

      if (data.categories.isEmpty && data.brands.isEmpty) {
        canLoadMore = false;
      } else {
        uploadCategories.addAll(data.categories);
        uploadBrands.addAll(data.brands);
      }
    }

    isUploadingMore.value = false;
  }

  PreviewItem modelToPreview(ScheduleItem item) {
    return PreviewItem(
      id: item.id,
      title: item.title ?? "",
      caption: item.caption ?? "",
      mediaUrl: item.mediaUrl ?? "",
      thumbnailUrl: item.thumbnailUrl,
      categoryId: "" ?? "",
      status: item.status ?? "",
      type: item.type ?? "",
      isArchived: item.isArchived ?? false,
      scheduledAt: item.scheduledAt,
      publishedAt: item.publishedAt ?? "",
      likesCount: item.likesCount ?? 0,
      commentsCount: item.commentsCount ?? 0,
      createdAt: item.createdAt ?? "",
      updatedAt: item.updatedAt ?? "",
      media: [],
    );
  }

  Future<void> getAllScheduleChannelList({bool isRefresh = true}) async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllAthleteScheduleChannels,
      isLoading: isScheduleLoading,
      query: {
        'search': scheduleChannelSearch.text.trim(),
        'type': 'ALL',
        'page': schedulePage.value.toString(),
        'limit': scheduleLimit.value.toString(),
      },
    );

    if (result.success) {
      final response = ScheduleResponse.fromJson(result.data);

      final items = response.data.items;
      final previewList =
          response.data.items.map((item) => modelToPreview(item)).toList();
      scheduleItems.assignAll(previewList);

      // safe pagination
      final meta = response.data.meta;
      if (meta != null) {
        if (meta.page >= meta.totalPages) {
          hasMoreSchedule.value = false;
        }
      }
    }
  }

  Future<void> loadMoreSchedule() async {
    if (!hasMoreSchedule.value) return;

    isLoadingMoreSchedule.value = true;
    schedulePage.value++;

    await getAllScheduleChannelList(isRefresh: false);
    isLoadingMoreSchedule.value = false;
  }

  Future<void> postAthleteChannelFromSchedule(PreviewItem item) async {
    final result = await apiProvider.post(
      '${ApiEndpoints.postAthleteChannelFromSchedule}${item.id}/post-now',
      {},
      isLoading: isScheduleLoading,
    );

    if (result.success) {
      Get.back();
      CustomToast.show("Channel Created Successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  String formatWithOffset(DateTime dt) {
    final offset = dt.timeZoneOffset;
    final hours = offset.inHours.toString().padLeft(2, '0');
    final minutes = (offset.inMinutes % 60).toString().padLeft(2, '0');
    final sign = offset.isNegative ? '-' : '+';

    return "${dt.year.toString().padLeft(4, '0')}-"
        "${dt.month.toString().padLeft(2, '0')}-"
        "${dt.day.toString().padLeft(2, '0')}T"
        "${dt.hour.toString().padLeft(2, '0')}:"
        "${dt.minute.toString().padLeft(2, '0')}:00"
        "$sign$hours:$minutes";
  }

  Future<void> onReScheduleChannel(PreviewItem item) async {
    AtheleteLandingController controller = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    final selectedDate = controller.selectedDate; // DateTime
    final hour = controller.selectedHour.value; // int

    if (selectedDate == null || hour == 0) {
      CustomToast.show("Please select date and time");
      return;
    }

    // Create a new DateTime with selected hour and minute
    final scheduledDateTime = DateTime(selectedDate.value.year,
        selectedDate.value.month, selectedDate.value.day, hour);

    // Convert to local timezone ISO string
    final formattedDateTime = scheduledDateTime.toLocal().toIso8601String();

    AppLogger.d("Formatted: $formattedDateTime");
    final result = await apiProvider.patch(
        '${ApiEndpoints.postAthleteChannelFromSchedule}${item.id}/reschedule',
        {'scheduledAt': item.scheduledAt},
        isLoading: isReschedulingLoading);

    if (result.success) {
      getAllScheduleChannelList();
      Get.back();
      CustomToast.show("Channel Rescheduled Successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteAllContentStudio() async {
    isContentStudioListingLoading.value = true;

    final result = await apiProvider.get(
      ApiEndpoints.getAthleteAllContentStudio,
      isLoading: isContentStudioListingLoading,
    );

    if (result.success) {
      contentStudioResponse.value = ContentStudioResponse.fromJson(result.data);

      AppLogger.d("getAthleteAllContentStudio: ${contentStudioResponse.value}");
    } else {
      AppLogger.d(result.error);
    }

    isContentStudioListingLoading.value = false;
  }

  Future<void> createNewPrivateCommunityThought() async {
    final result = await apiProvider.post(
      ApiEndpoints.postNewThoughtByAthlete,
      {"content": addYourThoughtsController.text},
      isLoading: landingController.sendPrivateCommunityPostLoading,
    );

    if (result.success) {
      addYourThoughtsController.clear();
      landingController.privateCommunityPostList.value =
          landingController.privateCommunityPostList.value!.copyWith(
        data: landingController.privateCommunityPostList.value!.data.copyWith(
          items: [],
        ),
      );

      landingController.getAllPrivateCommunityPostList();
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<String> generateThumbnail(ContentItem item) async {
    final firstMedia = item.uploadedMedia.first;

    // Cache
    if (thumbnailCache.containsKey(firstMedia.url)) {
      return thumbnailCache[firstMedia.url]!;
    }

    // VIDEO → generate thumbnail
    if (firstMedia.mediaType == "VIDEO") {
      final thumb = await VideoThumbnail.thumbnailFile(
        video: firstMedia.url,
        imageFormat: ImageFormat.PNG,
        maxHeight: 200,
        quality: 100,
      );

      if (thumb != null) {
        thumbnailCache[firstMedia.url] = thumb;
        return thumb;
      }
    }

    // IMAGE → return URL directly
    thumbnailCache[firstMedia.url] = firstMedia.url;
    return firstMedia.url;
  }

  Future<void> deleteAthleteChannelFromSchedule(PreviewItem item) async {
    final result = await apiProvider.delete(
      '${ApiEndpoints.deleteAthleteChannelFromSchedule}${item.id}',
      isLoading: isScheduleLoading,
    );

    if (result.success) {
      CustomToast.show("Channel Deleted Successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> onEditDraftChannel(PreviewItem item) async {
    AppLogger.d(
        "editCaptionController text: ${landingController.editCaptionController.text}");
    final result = await apiProvider.patch(
        "${ApiEndpoints.updateDraftChannelPost}/${item.id}",
        {
          'caption': landingController.editCaptionController.text,
        },
        isLoading: saveDraftIsLoading);

    AppLogger.d(result.data);

    if (result.success) {
      Get.back();
      CustomToast.show("Changes Saved Successfully");
      draftCategories.clear();
      draftPage.value = 1;
      hasMoreDraft.value = true;
      await getAllDraftChannelList();
    } else {
      Get.back();
      AppLogger.e("${result.error}");
    }
  }

  Future<void> onPostDraftChannel(PreviewItem item) async {
    final result = await apiProvider.post(
        "${ApiEndpoints.postDraftChannelPost}/${item.id}/post-now", {},
        isLoading: postNowIsLoading);

    AppLogger.d("postDraftChannel: ${result.data['data']}");

    if (result.success) {
      CustomToast.show("Post Uploaded Successfully!");
      draftCategories.clear();
      draftPage.value = 1;
      hasMoreDraft.value = true;
      await getAllDraftChannelList();
    } else {
      AppLogger.e("${result.error}");
    }
  }

  Future<void> onDeleteDraftChannel(PreviewItem item) async {
    final result = await apiProvider.delete(
        "${ApiEndpoints.postDraftChannelPost}/${item.id}",
        isLoading: isDraftChannelLoading);

    AppLogger.d("Delete DraftChannel: ${result.data}");

    if (result.success) {
      CustomToast.show("Channel Deleted Successfully");
      draftCategories.clear();
      draftPage.value = 1;
      hasMoreDraft.value = true;
      await getAllDraftChannelList();
    } else {
      AppLogger.e("${result.error}");
    }
  }

  Future<void> onGetAllUploadChannels() async {
    isUploadsLoading.value = true;

    final result = await apiProvider.get(
        ApiEndpoints.getAllAthleteUploadChannels,
        query: {"page": "1", "limit": "$uploadLimit"});

    if (result.success) {
      final data = UploadChannelResponse.fromJson(result.data['data']);

      uploadCategories.assignAll(data.categories);
      uploadBrands.assignAll(data.brands);

      canLoadMore = data.categories.length == uploadLimit;
    }

    isUploadsLoading.value = false;
  }

  void loadNotifications() {
    notifications.assignAll([
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "Summary of Cheers on Post 1",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "Summary of Comments on Post 1",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "Your New Content Studio Drops are ready!",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "You have 225 New Fans this week",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "New Feature Available - check out …",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "@ Noval Djokovic has joined Atlete",
      ),
      NotificationItemForAthlete(
        iconPath: "assets/images/profile.png",
        message: "Your New Content Studio Drops are ready!",
      ),
    ]);
  }

  void changeOuterTab(int index) {
    selectedOuterTab.value = index;
  }

  void changeInsideTab(int index) {
    selectedInnerTab.value = index;
  }

  var routineItems = <Map<String, dynamic>>[
    {
      'title': 'ROUTINE',
      'images': [
        'assets/images/routine.png',
        'assets/images/profile.png',
        'assets/images/get_to_know.png',
        'assets/images/routine.png',
      ],
    },
    {
      'title': 'ADVICE',
      'images': [
        'assets/images/advice.png',
        'assets/images/sports.png',
        'assets/images/profile.png',
        'assets/images/advice.png',
      ],
    },
    {
      'title': 'RECOVERY',
      'images': [
        'assets/images/sports.png',
        'assets/images/routine.png',
        'assets/images/get_to_know.png',
        'assets/images/sports.png',
      ],
    },
  ].obs;

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

  void toggleReaction(int commentId, String emoji) {
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

  Future<bool> uploadContentStudio() async {
    final mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());

    final picked = mediaPickerController.selectedMixed.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return false;
    }

    final formData = FormData.fromMap({
      "description": landingController.addDescriptionForStudio.text,
      "files": await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });
    final result = await apiProvider.post(
        ApiEndpoints.updateContentStudio, formData,
        isLoading: isContentStudioListingLoading);

    AppLogger.d("result of post content studio: ${result.data}");

    if (result.success) {
      AppLogger.d("Content Studio Uploaded → ${result.data}");
      await getAthleteAllContentStudio();
      mediaPickerController.selectedMixed.clear();
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<bool> postNewChannelViaDirectUpload(
      String actionType, RxBool loading) async {
    final mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());

    final picked = mediaPickerController.selectedMixed.first;
    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return false;
    }
    String? scheduledAt;

    if (actionType == "SCHEDULE") {
      final selectedDate = landingController.selectedDate;
      final hour = landingController.selectedHour.value;

      if (selectedDate == null || hour == null) {
        CustomToast.show("Please select date and time");
        return false;
      }
      final scheduledDateTime = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        hour,
      );
      scheduledAt = scheduledDateTime.toLocal().toIso8601String();
    }
    final Map<String, dynamic> body = {
      "action": actionType,
      "caption": landingController.captionForNewPost.text,
      "category": landingController.selectedCategoryIds,
      "files": await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    };

    if (scheduledAt != null) {
      body["scheduledAt"] = scheduledAt;
    }
    if (landingController.selectedBrandIds.isNotEmpty) {
      body["brand"] = landingController.selectedBrandIds;
    }

    final formData = FormData.fromMap(body);

    final result = await apiProvider.post(
      ApiEndpoints.postNewChannelViaDirectUpload,
      formData,
      isLoading: loading,
    );

    AppLogger.d("result of post content studio: ${result.data}");

    if (result.success) {
      await onGetAllUploadChannels();
      NavigationHelper.offAllNamed(
        AppRoutes.atheleteHomeScreen,
        arguments: {'isAthlete': true},
        transition: Transition.rightToLeft,
      );
      mediaPickerController.selectedMixed.clear();
      return true;
    }

    AppLogger.d(result.error);
    return false;
  }

  Future<bool> uploadStoryForAthlete(
    String actionType,
    RxBool loading,
  ) async {
    final mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());

    final picked = mediaPickerController.selectedMixed.first;
    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return false;
    }
    String? scheduledAt;

    if (actionType == "SCHEDULE") {
      final getDate = landingController.selectedDate;
      final hour = landingController.selectedHour.value;

      if (landingController.selectedDate == null || hour == null) {
        CustomToast.show("Please select date and time");
        return false;
      }
      final scheduledDateTime = DateTime(
        getDate.value.year,
        getDate.value.month,
        getDate.value.day,
        hour,
      );
      scheduledAt = scheduledDateTime.toLocal().toIso8601String();
    }
    final Map<String, dynamic> body = {
      "action": actionType,
      "caption": captionForNewStory.text,
      "files": await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    };

    if (scheduledAt != null) {
      body["scheduledAt"] = scheduledAt;
    }
    final formData = FormData.fromMap(body);
    final result = await apiProvider.post(
      ApiEndpoints.postNewStoryByAthlete,
      formData,
      isLoading: loading,
    );
    if (result.success) {
      AppLogger.d("The result of new story is: ${result.data}");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> deleteStoryByAthlete(String storyId) async {
    final result = await apiProvider.delete(
      "${ApiEndpoints.deleteStoryByAthlete}$storyId",
      isLoading: isStoryUploadLoading,
    );
    if (result.success) {
      AppLogger.d("The result of delete story is: ${result.data}");
      // getAllAthleteStories();
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAllAthleteStories() async {
    final result =
        await apiProvider.get(ApiEndpoints.getUploadedStoryViewForAthlete);

    if (result.success) {
      // OUTER VALUE
      final outer = result.data["data"];

      // stories list
      final List<Map<String, dynamic>> stories =
          List<Map<String, dynamic>>.from(outer["stories"] ?? []);

      // total count
      final int count = outer["count"] ?? 0;

      // store final structure
      final Map<String, dynamic> storyChannel = {
        "stories": stories,
        "count": count,
      };

      getAthleteStory = storyChannel;

      AppLogger.d(storyChannel);
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteStoryView(String storyId) async {
    final result = await apiProvider.get(
      "${ApiEndpoints.getAthleteStoryViews}$storyId/views",
    );
    if (result.success) {
      final List list = result.data["data"];
      // stories.assignAll(list.map((e) => Story.fromJson(e)).toList());
    } else {
      AppLogger.d(result.error);
    }
  }
}

class ContentItems {
  final String imagePath;
  ContentItems({required this.imagePath});
}

class NotificationItemForAthlete {
  final String iconPath;
  final String message;
  final void Function()? onTap;

  NotificationItemForAthlete({
    required this.iconPath,
    required this.message,
    this.onTap,
  });
}

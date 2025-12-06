import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/content_library/content_library_summary.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/draft_channel/draft_model_details.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/notification_model/athlete_notification_response.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/schedule/schedule_model.dart';
import 'package:athlete_elite/app/data/models/athlete_interface/response_model/upload_channel/upload_channel_response.dart'
    hide PreviewItem;
import 'package:athlete_elite/app/data/models/content_studio/content_studio_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/story_view/latest_story_response.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/story_view/story_viewer_screen.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_type_enum.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
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

  var isNewUploadFilterApplied = false.obs;
  RxList<SelectedMedia> newUploadedFilterMediaList = <SelectedMedia>[].obs;

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
  RxList<AthleteStory> athleteStories = <AthleteStory>[].obs;
  RxList<NotificationItemForAthlete> notifications =
      <NotificationItemForAthlete>[].obs;
  final isAthleteNotificationsLoading = false.obs;

  RxInt storyViewsCount = 0.obs;

  RxList<StoryViewer> storyViewers = <StoryViewer>[].obs;

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

  var myContent = <ContentItems>[].obs;
  var sentContent = <ContentItems>[].obs;

  final athleteNotificationsPage = 1.obs;
  final hasMoreAthleteNotifications = true.obs;
  late ScrollController athleteNotificationsScrollController;
  final isLoadingMoreAthleteNotifications = false.obs;

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
        if (tab == 1) {
          onGetAllAthleteNotifications();
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

      athleteNotificationsScrollController = ScrollController();
      athleteNotificationsScrollController
          .addListener(paginationListenerForAllAthleteNotifications);
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
        'type': 'ALL',
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
      isLiked: item.isLiked ?? false,
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

  Future<void> markAllNotificationAsRead() async {
    final result = await apiProvider
        .patch(ApiEndpoints.markAllAthleteNotificationsAsRead, {});

    if (result.success) {
      AppLogger.d("Notification marked as read: ${result.data}");
      await onGetAllAthleteNotifications();
    } else {
      AppLogger.e("Failed to mark notification as read: ${result.error}");
    }
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    final result = await apiProvider.patch(
        '${ApiEndpoints.markAthleteNotificationAsRead}$notificationId/read',
        {});

    if (result.success) {
      AppLogger.d("Notification marked as read: $notificationId");
      CustomToast.show("Notification marked as read");
      await onGetAllAthleteNotifications();
    } else {
      AppLogger.e("Failed to mark notification as read: ${result.error}");
    }
  }

  Future<void> onGetAllAthleteNotifications({bool isRefresh = true}) async {
    try {
      if (isRefresh) {
        athleteNotificationsPage.value = 1;
        notifications.clear();
        hasMoreAthleteNotifications.value = true;
      }
      final result = await apiProvider.get(
        ApiEndpoints.getAthleteNotifications,
        query: {
          'page': athleteNotificationsPage.value.toString(),
          'limit': '10',
        },
        isLoading: isAthleteNotificationsLoading,
      );

      AppLogger.d("Athlete Notifications: ${result.data}");

      if (result.success) {
        final data = AthleteNotificationData.fromJson(result.data['data']);

        notifications.assignAll(
          data.items
              .map((item) => NotificationItemForAthlete.fromApi(item, this))
              .toList(),
        );
        if (data.meta.page >= data.meta.totalPages) {
          hasMoreAthleteNotifications.value = false;
        }
      }
    } catch (e) {
      AppLogger.e("Notification Error: $e");
    }
  }

  void paginationListenerForAllAthleteNotifications() {
    if (athleteNotificationsScrollController.position.pixels >=
            athleteNotificationsScrollController.position.maxScrollExtent -
                200 &&
        !isLoadingMoreAthleteNotifications.value &&
        hasMoreAthleteNotifications.value) {
      loadMoreAllAthleteNotifications();
    }
  }

  Future<void> loadMoreAllAthleteNotifications() async {
    if (isLoadingMoreAthleteNotifications.value) return;

    isLoadingMoreAthleteNotifications.value = true;
    athleteNotificationsPage.value += 1;
    await onGetAllAthleteNotifications(isRefresh: false);
    isLoadingMoreAthleteNotifications.value = false;
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
      "categoryId": landingController.selectedCategoryIds,
      "files": await MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    };

    if (scheduledAt != null) {
      body["scheduledAt"] = scheduledAt;
    }
    if (landingController.selectedBrandIds.isNotEmpty) {
      body["brandId"] = landingController.selectedBrandIds;
    }

    final formData = FormData.fromMap(body);

    AppLogger.d("formData for direct upload: ${body.toString()}");

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
      landingController.captionForNewPost.clear();
      mediaPickerController.clearVideos();
      mediaPickerController.selectedImages.clear();
      mediaPickerController.selectedVideos.clear();
      if (scheduledAt != null) {
        landingController.selectedDate = DateTime.now().obs;
        landingController.selectedHour = 0.obs;
        mediaPickerController.selectedMixed.clear();
        mediaPickerController.clearVideos();
        mediaPickerController.selectedImages.clear();
        mediaPickerController.selectedVideos.clear();
      }
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
      landingController.captionForNewPost.clear();
      mediaPickerController.selectedMixed.clear();
      landingController.captionForNewPost.clear();
      mediaPickerController.clearVideos();
      mediaPickerController.selectedImages.clear();
      mediaPickerController.selectedVideos.clear();
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
      Get.back();
      await getAllAthleteStories();
      // getAllAthleteStories();
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAllAthleteStories() async {
    final result =
        await apiProvider.get(ApiEndpoints.getUploadedStoryViewForAthlete);

    if (result.success) {
      final outer = result.data["data"];
      AppLogger.d("Fetched Stories Data: ${result.data}");
      final List list = outer["stories"] ?? [];

      final parsedStories =
          list.map((json) => AthleteStory.fromJson(json)).toList();

      athleteStories.assignAll(parsedStories);
      AppLogger.d("Fetched Stories: ${athleteStories}");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteStoryView(String storyId) async {
    final result = await apiProvider.get(
      "${ApiEndpoints.getAthleteStoryViews}$storyId/views",
    );

    if (result.success) {
      AppLogger.d("Fetched Story Views Data: ${result.data}");

      final response = StoryViewResponse.fromJson(result.data);

      // Now you have:
      // response.storyId
      // response.viewsCount
      // response.views (List<StoryViewer>)

      storyViewsCount.value = response.viewsCount;
      storyViewers.assignAll(response.views);
    } else {
      AppLogger.d(result.error);
    }
  }
}

class StoryViewer {
  final String userId;
  final String? name;
  final String? profilePic;
  final String? viewedAt;

  StoryViewer({
    required this.userId,
    this.name,
    this.profilePic,
    this.viewedAt,
  });

  factory StoryViewer.fromJson(Map<String, dynamic> json) {
    return StoryViewer(
      userId: json['userId'] ?? "",
      name: json['name'],
      profilePic: json['profilePic'],
      viewedAt: json['viewedAt'],
    );
  }
}

class StoryViewResponse {
  final String storyId;
  final int viewsCount;
  final List<StoryViewer> views;

  StoryViewResponse({
    required this.storyId,
    required this.viewsCount,
    required this.views,
  });

  factory StoryViewResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return StoryViewResponse(
      storyId: data['storyId'] ?? "",
      viewsCount: (data['viewsCount'] ?? 0).toInt(),
      views: (data['views'] as List? ?? [])
          .map((e) => StoryViewer.fromJson(e))
          .toList(),
    );
  }
}

class ContentItems {
  final String imagePath;
  ContentItems({required this.imagePath});
}

class AthleteStory {
  final String id;
  final String? caption;
  final String? mediaType;
  final String mediaUrl;
  final String? thumbnailUrl;
  final int duration;
  final int likesCount;
  final int commentsCount;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final List<StoryMedia> media;

  AthleteStory({
    required this.id,
    this.caption,
    this.mediaType,
    required this.mediaUrl,
    this.thumbnailUrl,
    this.duration = 0,
    this.likesCount = 0,
    this.commentsCount = 0,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.media,
  });

  factory AthleteStory.fromJson(Map<String, dynamic> json) {
    return AthleteStory(
      id: json["id"] ?? "",
      caption: json["caption"],
      mediaType: json["mediaType"],
      mediaUrl: json["mediaUrl"] ?? "",
      thumbnailUrl: json["thumbnailUrl"],
      duration:
          (json["duration"] ?? 0) is num ? (json["duration"] ?? 0).toInt() : 0,
      likesCount: (json["likesCount"] ?? 0).toInt(),
      commentsCount: (json["commentsCount"] ?? 0).toInt(),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      publishedAt: json["publishedAt"] ?? "",
      media: (json["media"] as List<dynamic>? ?? [])
          .map((e) => StoryMedia.fromJson(e))
          .toList(),
    );
  }
}

class StoryMedia {
  final String id;
  final String url;
  final String? thumbnailUrl;
  final int duration;
  final int sortOrder;
  final String createdAt;
  final String updatedAt;

  StoryMedia({
    required this.id,
    required this.url,
    this.thumbnailUrl,
    this.duration = 0,
    this.sortOrder = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoryMedia.fromJson(Map<String, dynamic> json) {
    return StoryMedia(
      id: json["id"] ?? "",
      url: json["url"] ?? "",
      thumbnailUrl: json["thumbnailUrl"],
      duration:
          (json["duration"] ?? 0) is num ? (json["duration"] ?? 0).toInt() : 0,
      sortOrder: (json["sortOrder"] ?? 0).toInt(),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
    );
  }
}

class NotificationItemForAthlete {
  final String message;
  final String iconPath;
  final VoidCallback? onTap;

  NotificationItemForAthlete({
    required this.message,
    required this.iconPath,
    this.onTap,
  });

  factory NotificationItemForAthlete.fromApi(
      NotificationItem item, AtheleteHomeController controller) {
    return NotificationItemForAthlete(
      message: item.message ?? "",
      iconPath: item.actor.profilePicture ?? "",
      onTap: () {
        controller.markNotificationAsRead(item.id);
        // final previewList = modelToNotificationPreview(item);

        // NavigationHelper.toNamed(
        //   AppRoutes.athleteVideoReelView,
        //   arguments: {
        //     'isAthlete': true,
        //     'reels': previewList,
        //     'startIndex': 0,
        //   },
        //   transition: Transition.rightToLeft,
        // );
      },
    );
  }

  // static PreviewItem modelToNotificationPreview(NotificationItem item) {
  //   return PreviewItem(
  //     id: item.id,
  //     title: item.channel.title ?? "",
  //     caption: item.channel.title ?? "",
  //     mediaUrl: item.channel. ?? "",
  //     thumbnailUrl: item.thumbnailUrl,
  //     categoryId: "" ?? "",
  //     status: item.status ?? "",
  //     type: item.type ?? "",
  //     isArchived: item.isArchived ?? false,
  //     scheduledAt: item.scheduledAt,
  //     publishedAt: item.publishedAt ?? "",
  //     likesCount: item.likesCount ?? 0,
  //     isLiked: item.isLiked ?? false,
  //     commentsCount: item.commentsCount ?? 0,
  //     createdAt: item.createdAt ?? "",
  //     updatedAt: item.updatedAt ?? "",
  //     media: [],
  //   );
  // }

  static String _getIconFromType(String type) {
    switch (type) {
      case "CHANNEL_COMMENT":
        return "assets/icons/comment.png";
      case "CHANNEL_LIKE":
        return "assets/icons/like.png";
      default:
        return "assets/icons/notification.png";
    }
  }
}

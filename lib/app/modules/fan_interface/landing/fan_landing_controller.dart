import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/athlete_profile/get_athlete/athlete_profile_fanview_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/brand_content_response/brand_content_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/brand_list/brand_list_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/category_content_response/category_content_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/category_list/category_list_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/fan_all_athletes_list/athletes_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/infinite_content_response/infinite_content_response.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/latest_channel/latest_channel_response.dart'
    show LatestChannelItem, LatestChannelResponse;
import 'package:athlete_elite/app/data/models/fan_interface/response_model/notification_model/fan_notification_response_model.dart'
    hide Athlete;
import 'package:athlete_elite/app/data/models/fan_interface/response_model/story_view/latest_story_response.dart'
    hide Athlete;
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data/models/category.dart';

class FanLandingController extends GetxController {
  // var selectedOuterTab = 0.obs;
  // var selectedInnerTab = 0.obs;

  // void changeOuterTab(int index) {
  //   selectedOuterTab.value = index;
  // }

  // void changeInsideTab(int index) {
  //   selectedInnerTab.value = index;
  // }

  // ApiProvider apiProvider =
  //     Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  // RxList<Athlete> searchedAthletes = <Athlete>[].obs;
  // Rxn<FanUserModel> fanUser = Rxn<FanUserModel>();

  // Rxn<UserDetailsResponse> userDetails = Rxn<UserDetailsResponse>();

  // RxList<LatestChannelItem> latestChannel = <LatestChannelItem>[].obs;

  // RxList<LatestChannelItem> categoriesList = <LatestChannelItem>[].obs;
  // RxList<LatestChannelItem> athleteStoriesView = <LatestChannelItem>[].obs;

  // late ScrollController latestChannelScrollController;

  // late ScrollController categoriesListScrollController;

  // var hasMorelatestChannel = true.obs;
  // var isLoadingMoreLatestChannel = false.obs;

  // var hasMoreCategoriesList = true.obs;
  // var isLoadingMoreCategoriesList = false.obs;

  // final searchAthleteListPage = 1.obs;
  // final searchAthleteLimit = 10;

  // final latestChannelContentPage = 1.obs;
  // final getAllLatestChannelLoading = false.obs;

  // final athleteStoriesViewContentPage = 1.obs;
  // final getAllathleteStoriesViewLoading = false.obs;

  // var hasMoreAthleteStoriesView = true.obs;
  // var isLoadingMoreAthleteStoriesView = false.obs;

  // final categoryListContentPage = 1.obs;
  // final getAllcategoryListLoading = false.obs;

  // var isLoadingMoreSearchedAthletes = false.obs;

  // late ScrollController searchedAthletesScrollController;

  // late ScrollController athleteStoriesViewScrollController;

  // var hasMoreSearchedAthletes = true.obs;

  // final getAllSearchedAthletesLoading = false.obs;

  // /// search
  // TextEditingController athleteSearchQuery = TextEditingController();

  // final isSearching = false.obs;

  // final fanDetailsLoading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getLoggedInUser();
  //   getfanDetails();
  //   getAllAthleteStoriesView();
  //   getAllLatestContent();
  //   getAllCategoryContent();

  //   searchedAthletesScrollController = ScrollController();
  //   searchedAthletesScrollController
  //       .addListener(paginationListenerForAllSearchedAthletes);

  //   latestChannelScrollController = ScrollController();
  //   latestChannelScrollController
  //       .addListener(paginationListenerForAllLatestContent);

  //   categoriesListScrollController = ScrollController();
  //   categoriesListScrollController
  //       .addListener(paginationListenerForAllCategoriesList);

  //   athleteStoriesViewScrollController = ScrollController();
  //   athleteStoriesViewScrollController
  //       .addListener(paginationListenerForAllCategoriesList);
  // }

  // void getLoggedInUser() {
  //   final fanBox = Hive.box<FanUserModel>('fan_user');
  //   final loggedfan = fanBox.get('current_user');

  //   if (loggedfan != null) {
  //     fanUser.value = loggedfan;
  //   }
  // }

  // Future<void> getfanDetails() async {
  //   final result = await apiProvider.get(ApiEndpoints.getfanDetails,
  //       isLoading: fanDetailsLoading,
  //       query: {'userId': fanUser.value?.id?.toString() ?? ''});
  //   if (result.success) {
  //     userDetails.value = UserDetailsResponse.fromJson(result.data);
  //   }

  //   if (result.error != null) {
  //     AppLogger.d(result.error);
  //   }
  // }

  // Future<void> getAllCategoryContent({bool isRefresh = true}) async {
  //   if (isRefresh) {
  //     categoryListContentPage.value = 1;
  //     categoriesList.clear();
  //     hasMoreCategoriesList.value = true;
  //   }

  //   final result = await apiProvider.get(
  //     ApiEndpoints.getAllCategoriesForFan,
  //     query: {'userId': fanUser.value?.id ?? ''},
  //     isLoading: getAllcategoryListLoading,
  //   );

  //   if (result.success) {
  //     final parsed = LatestChannelResponse.fromJson(result.data);

  //     categoriesList.addAll(parsed.data.channels);

  //     if (parsed.data.pagination.currentPage >=
  //         parsed.data.pagination.totalPages) {
  //       hasMoreCategoriesList.value = false;
  //     }
  //   }
  // }

  // void paginationListenerForAllCategoriesList() {
  //   if (categoriesListScrollController.position.pixels >=
  //           categoriesListScrollController.position.maxScrollExtent - 200 &&
  //       !isLoadingMoreCategoriesList.value &&
  //       hasMoreCategoriesList.value) {
  //     loadMoreAllCategoriesList();
  //   }
  // }

  // Future<void> loadMoreAllCategoriesList() async {
  //   if (isLoadingMoreCategoriesList.value) return;

  //   isLoadingMoreCategoriesList.value = true;

  //   categoryListContentPage.value += 1;

  //   await getAllCategoryContent(isRefresh: false);

  //   isLoadingMoreCategoriesList.value = false;
  // }

  // Future<void> getAllAthleteStoriesView({bool isRefresh = true}) async {
  //   if (isRefresh) {
  //     athleteStoriesViewContentPage.value = 1;
  //     athleteStoriesView.clear();
  //     hasMoreAthleteStoriesView.value = true;
  //   }

  //   final result = await apiProvider.get(
  //     ApiEndpoints.getAllAthleteStoriesInFanView,
  //     query: {'userId': fanUser.value?.id ?? ''},
  //     isLoading: getAllathleteStoriesViewLoading,
  //   );

  //   if (result.success) {
  //     final parsed = LatestChannelResponse.fromJson(result.data);

  //     athleteStoriesView.addAll(parsed.data.channels);

  //     if (parsed.data.pagination.currentPage >=
  //         parsed.data.pagination.totalPages) {
  //       hasMoreAthleteStoriesView.value = false;
  //     }
  //   }
  // }

  // void paginationListenerForAllAthleteStoriesView() {
  //   if (athleteStoriesViewScrollController.position.pixels >=
  //           athleteStoriesViewScrollController.position.maxScrollExtent - 200 &&
  //       !isLoadingMoreAthleteStoriesView.value &&
  //       hasMoreAthleteStoriesView.value) {
  //     loadMoreAllAthleteStoriesView();
  //   }
  // }

  // Future<void> loadMoreAllAthleteStoriesView() async {
  //   if (isLoadingMoreAthleteStoriesView.value) return;

  //   isLoadingMoreAthleteStoriesView.value = true;

  //   athleteStoriesViewContentPage.value += 1;

  //   await getAllAthleteStoriesView(isRefresh: false);

  //   isLoadingMoreAthleteStoriesView.value = false;
  // }

  // Map<String, String> thumbnailCache = {};

  // Future<String> getThumbnail(String url) async {
  //   if (thumbnailCache.containsKey(url)) {
  //     return thumbnailCache[url]!;
  //   }

  //   final thumb = await VideoThumbnail.thumbnailFile(
  //         video: url,
  //         imageFormat: ImageFormat.PNG,
  //         maxHeight: 200,
  //         quality: 100,
  //       ) ??
  //       "";

  //   thumbnailCache[url] = thumb;
  //   return thumb;
  // }

  // Future<void> getAllLatestContent({bool isRefresh = true}) async {
  //   if (isRefresh) {
  //     latestChannelContentPage.value = 1;
  //     latestChannel.clear();
  //     hasMorelatestChannel.value = true;
  //   }

  //   final result = await apiProvider.get(
  //     ApiEndpoints.getLatestContent,
  //     query: {
  //       'userId': fanUser.value?.id ?? '',
  //       'page': latestChannelContentPage.toString(),
  //       'limit': 10
  //     },
  //     isLoading: getAllLatestChannelLoading,
  //   );

  //   if (result.success) {
  //     final parsed = LatestChannelResponse.fromJson(result.data);

  //     latestChannel.addAll(parsed.data.channels);

  //     if (parsed.data.pagination.currentPage >=
  //         parsed.data.pagination.totalPages) {
  //       hasMorelatestChannel.value = false;
  //     }
  //   }
  // }

  // void paginationListenerForAllLatestContent() {
  //   if (latestChannelScrollController.position.pixels >=
  //           latestChannelScrollController.position.maxScrollExtent - 200 &&
  //       !isLoadingMoreLatestChannel.value &&
  //       hasMorelatestChannel.value) {
  //     loadMoreAllLatestContent();
  //   }
  // }

  // Future<void> loadMoreAllLatestContent() async {
  //   if (isLoadingMoreLatestChannel.value) return;

  //   isLoadingMoreLatestChannel.value = true;

  //   latestChannelContentPage.value += 1;

  //   await getAllLatestContent(isRefresh: false);

  //   isLoadingMoreLatestChannel.value = false;
  // }

  // void paginationListenerForAllSearchedAthletes() {
  //   if (searchedAthletesScrollController.position.pixels >=
  //           searchedAthletesScrollController.position.maxScrollExtent - 200 &&
  //       !isLoadingMoreSearchedAthletes.value &&
  //       hasMoreSearchedAthletes.value) {
  //     loadMoreAllSearchedAthletes();
  //   }
  // }

  // Future<void> loadMoreAllSearchedAthletes() async {
  //   if (!hasMoreSearchedAthletes.value || isLoadingMoreSearchedAthletes.value)
  //     return;

  //   isLoadingMoreSearchedAthletes.value = true;

  //   searchAthleteListPage.value += 1;

  //   await getAllAthleteSearchList(isRefresh: false);

  //   isLoadingMoreSearchedAthletes.value = false;
  // }

  // Future<void> getAllAthleteSearchList({bool isRefresh = true}) async {
  //   final queryText = athleteSearchQuery.text.trim();

  //   if (queryText.isEmpty) return;

  //   if (isRefresh) {
  //     searchAthleteListPage.value = 1;
  //     searchedAthletes.clear();
  //     hasMoreSearchedAthletes.value = true;
  //   }

  //   final result = await apiProvider.get(
  //     ApiEndpoints.getSearchedAthletes,
  //     isLoading: getAllSearchedAthletesLoading,
  //     query: {
  //       'query': queryText,
  //       'userId': fanUser.value?.id ?? '',
  //       'page': searchAthleteListPage.value.toString(),
  //       'limit': searchAthleteLimit.toString(),
  //     },
  //   );

  //   AppLogger.d(result.data);

  //   if (result.success) {
  //     final data = AthletesResponse.fromJson(result.data);

  //     searchedAthletes.addAll(data.data.formatted ?? []);

  //     if (data.data.pagination.currentPage >= data.data.pagination.totalPages) {
  //       hasMoreSearchedAthletes.value = false;
  //     }
  //   }
  // }

  // void onSearchChanged(String value) {
  //   if (value.trim().isEmpty) {
  //     searchedAthletes.clear();
  //     hasMoreSearchedAthletes.value = false;
  //     return; // ❌ Do NOT hit API when empty
  //   }

  //   // Reset pagination
  //   searchAthleteListPage.value = 1;
  //   hasMoreSearchedAthletes.value = true;

  //   // Call API
  //   getAllAthleteSearchList(isRefresh: true);
  // }

  var selectedOuterTab = 0.obs;
  var selectedInnerTab = 0.obs;

  void changeOuterTab(int index) => selectedOuterTab.value = index;
  void changeInsideTab(int index) => selectedInnerTab.value = index;

  /// ----------------------------
  /// API PROVIDER
  /// ----------------------------
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());

  RxList<Athlete> searchedAthletes = <Athlete>[].obs;
  RxList<ContentItem> allChannelCategory = <ContentItem>[].obs;
  Rxn<FanUserModel> fanUser = Rxn<FanUserModel>();
  Rxn<UserDetailsResponse> userDetails = Rxn<UserDetailsResponse>();

  RxList<LatestChannelItem> latestChannel = <LatestChannelItem>[].obs;
  RxList<CategoryItem> categoriesList = <CategoryItem>[].obs;
  RxList<CategoryItem> sportsCategories = <CategoryItem>[].obs;
  RxList<BrandItem> sportsBrands = <BrandItem>[].obs;
  RxList<StoryChannel> athleteStoriesView = <StoryChannel>[].obs;
  RxList<Map<String, dynamic>> sportVisionList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> sportAllTrackAthletes =
      <Map<String, dynamic>>[].obs;

  /// ----------------------------
  /// PAGINATION STATES
  /// ----------------------------
  var hasMoreLatestChannel = true.obs;
  var hasMoreFanNotifications = true.obs;
  var isLoadingMoreLatestChannel = false.obs;
  var isLoadingMoreFanNotifications = false.obs;

  var hasMoreCategoriesList = true.obs;
  var isLoadingMoreCategoriesList = false.obs;

  var hasMoreAthleteStoriesView = true.obs;
  var isLoadingMoreAthleteStoriesView = false.obs;

  var hasMoreSearchedAthletes = true.obs;
  var isLoadingMoreSearchedAthletes = false.obs;

  var hasMoreAllChannelCategory = true.obs;
  var isLoadingMoreAllChannelCategory = false.obs;

  /// ----------------------------
  /// PAGE COUNTERS
  /// ----------------------------
  final latestChannelContentPage = 1.obs;
  final fanNotificationsPage = 1.obs;
  final categoryListContentPage = 1.obs;
  final athleteStoriesViewContentPage = 1.obs;

  final searchAthleteListPage = 1.obs;
  final searchAthleteLimit = 10;

  final allChannelCategoryPage = 1.obs;
  final allChannelCategoryLimit = 10;

  /// ----------------------------
  /// LOADING STATES
  /// ----------------------------
  final getAllLatestChannelLoading = false.obs;
  final getAllFanNotificationsLoading = false.obs;
  final getAllCategoryListLoading = false.obs;
  final getAllSportsCategoriesLoading = false.obs;
  final getAllSportsBrandsLoading = false.obs;
  final getAllAthleteStoriesViewLoading = false.obs;
  final updateStoryViewedStatusLoading = false.obs;
  final getAllSearchedAthletesLoading = false.obs;
  final getAllChannelCategoryLoading = false.obs;
  final fanDetailsLoading = false.obs;

  /// ----------------------------
  /// SEARCH CONTROLLER
  /// ----------------------------
  TextEditingController athleteSearchQuery = TextEditingController();
  final RxString searchQuery = ''.obs;

  final isSearching = false.obs;

  /// ----------------------------
  /// SCROLL CONTROLLERS
  /// ----------------------------
  late ScrollController latestChannelScrollController;
  late ScrollController fanNotificationsScrollController;
  late ScrollController trackedAthletesScrollController;
  late ScrollController categoriesListScrollController;
  late ScrollController searchedAthletesScrollController;
  late ScrollController athleteStoriesViewScrollController;
  late ScrollController allChannelCategoryScrollController;

  /// ----------------------------
  /// THUMBNAIL CACHE
  /// ----------------------------
  Map<String, String> thumbnailCache = {};

  String? selectedCategoryId;
  String? selectedSportCategoryId;
  String? selectedSportBrandId;

  RxInt infiniteChannelListPage = 1.obs;
  RxBool hasMoreInfiniteChannelList = true.obs;
  RxBool isLoadingMoreInfiniteChannelList = false.obs;

  RxList<InfiniteContentItem> infiniteChannelList = <InfiniteContentItem>[].obs;

  ScrollController infiniteChannelListScrollController = ScrollController();

  final int infiniteLimit = 10;

  RxBool getAllInfiniteChannelListLoading = false.obs;
  final sportVisionListIsLoading = false.obs;
  final sportAllTrackAthletesIsLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getLoggedInUser();
    getFanDetails();
    getAllAthleteStoriesView();
    getAllLatestContent();
    getAllCategoryContent();
    getAllChannelInfiniteScroll();
    getSportVision();
    getSportAllTrackAthletes();
    getAllSportsBrands();
    getAllSportsCategories();
    fetchFanNotifications();

    debounce(
      searchQuery,
      (_) {
        if (searchQuery.value.isNotEmpty) {
          getAllAthleteSearchList();
        }
        if (searchQuery.value.isEmpty) {
          searchedAthletes.clear();
        }
      },
      time: const Duration(milliseconds: 300),
    );

    ever(selectedOuterTab, (tab) {
      if (tab == 0) {
        getLoggedInUser();
        getFanDetails();
        getAllAthleteStoriesView();
        getAllLatestContent();
        getAllCategoryContent();
      }

      // if (tab == 1) {
      //   getAllChannelInfiniteScroll();
      // }
      if (tab == 2) {
        getSportVision();
        getSportAllTrackAthletes();
        getAllSportsBrands();
        getAllSportsCategories();
      }
      if (tab == 3) {
        fetchFanNotifications();
      }
    });

    /// Scroll listeners
    searchedAthletesScrollController = ScrollController()
      ..addListener(paginationListenerForAllSearchedAthletes);

    latestChannelScrollController = ScrollController()
      ..addListener(paginationListenerForAllLatestContent);

    fanNotificationsScrollController = ScrollController()
      ..addListener(paginationListenerForAllFanNotifications);

    trackedAthletesScrollController = ScrollController()
      ..addListener(paginationListenerForAllTrackedAthletes);

    categoriesListScrollController = ScrollController()
      ..addListener(paginationListenerForAllCategoriesList);

    athleteStoriesViewScrollController = ScrollController()
      ..addListener(paginationListenerForAllAthleteStoriesView);

    allChannelCategoryScrollController = ScrollController()
      ..addListener(() {
        if (selectedCategoryId != null) {
          paginationListenerForAllChannelCategory();
        }
      });

    infiniteChannelListScrollController = ScrollController()
      ..addListener(paginationListenerForAllInfiniteChannelList);

    sportsCategoriesListScrollController = ScrollController()
      ..addListener(() {
        if (selectedSportCategoryId != null) {
          paginationListenerForAllSportsCategoriesList();
        }
      });

    sportsBrandsListScrollController = ScrollController()
      ..addListener(() {
        if (selectedSportBrandId != null) {
          paginationListenerForAllSportsBrandsList();
        }
      });
  }

  /// ----------------------------
  /// LOCAL USER (HIVE)
  /// ----------------------------
  void getLoggedInUser() {
    final fanBox = Hive.box<FanUserModel>('fan_user');
    final loggedFan = fanBox.get('current_user');
    if (loggedFan != null) fanUser.value = loggedFan;
  }

  Future<void> getFanDetails() async {
    final result = await apiProvider.get(
      ApiEndpoints.getfanDetails,
      isLoading: fanDetailsLoading,
      query: {'userId': fanUser.value?.id ?? ''},
    );

    if (result.success) {
      userDetails.value = UserDetailsResponse.fromJson(result.data);
    } else if (result.error != null) {
      AppLogger.d(result.error);
    }
  }

  Future<void> getSportVision() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllSportVision,
      isLoading: sportVisionListIsLoading,
      query: {'userId': fanUser.value?.id ?? '', 'sport': 'Padel'},
    );

    if (result.success) {
      final data = result.data?['data'] ?? {};
      final vision = data['vision'] ?? [];

      sportVisionList.value = List<Map<String, dynamic>>.from(
          vision.map((e) => Map<String, dynamic>.from(e)));
      AppLogger.d("the result of sport vision: $result");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getSportAllTrackAthletes() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAllSportAllTrackAthletes,
      isLoading: sportAllTrackAthletesIsLoading,
      query: {'userId': fanUser.value?.id ?? '', 'sport': 'Padel'},
    );

    if (result.success) {
      final data = result.data?['data'] ?? {};
      final athletes = data['athletes'] ?? [];

      sportAllTrackAthletes.value = List<Map<String, dynamic>>.from(
          athletes.map((e) => Map<String, dynamic>.from(e)));

      AppLogger.d("the result of sport athletes: $result");
    } else {
      AppLogger.d(result.error);
    }
  }

  RxInt sportsCategoriesListPage = 1.obs;
  RxBool hasMoreSportsCategoriesList = true.obs;
  RxBool isLoadingMoreSportsCategoriesList = false.obs;

  RxList<ContentItem> sportsCategoriesList = <ContentItem>[].obs;
  RxList<BrandContentItem> sportsBrandsList = <BrandContentItem>[].obs;

  ScrollController sportsCategoriesListScrollController = ScrollController();

  final int sportsCategoriesLimit = 10;

  RxBool getAllsportsCategoriesListLoading = false.obs;

  Future<void> getAllSportsCategoriesById(String categoryId,
      {bool isRefresh = true}) async {
    selectedCategoryId = categoryId;
    if (isRefresh) {
      sportsCategoriesListPage.value = 1;
      sportsCategoriesList.clear();
      hasMoreSportsCategoriesList.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllChannelInfiniteScrollList,
      query: {
        'userId': fanUser.value?.id ?? '',
        'sport': 'Padel',
        'categoryId': selectedCategoryId,
        'page': sportsCategoriesListPage.value.toString(),
        'limit': sportsCategoriesLimit.toString(),
      },
      isLoading: getAllsportsCategoriesListLoading,
    );

    if (!result.success) return;

    final parsed = CategoryContentResponse.fromJson(result.data);

    final fetched = parsed.data.content;

    if (fetched.isNotEmpty) {
      sportsCategoriesList.addAll(fetched);
    }

    if (fetched.length < sportsCategoriesLimit) {
      hasMoreSportsCategoriesList.value = false;
    }
  }

  void paginationListenerForAllSportsCategoriesList() {
    if (sportsCategoriesListScrollController.position.pixels >=
            sportsCategoriesListScrollController.position.maxScrollExtent -
                200 &&
        !isLoadingMoreSportsCategoriesList.value &&
        hasMoreSportsCategoriesList.value) {
      loadMoreAllSportsCategoriesList();
    }
  }

  Future<void> loadMoreAllSportsCategoriesList() async {
    if (isLoadingMoreSportsCategoriesList.value) return;

    isLoadingMoreSportsCategoriesList.value = true;
    sportsCategoriesListPage.value++;

    await getAllSportsCategoriesById(selectedSportCategoryId!,
        isRefresh: false);

    isLoadingMoreSportsCategoriesList.value = false;
  }

  RxInt sportsBrandsListPage = 1.obs;
  RxBool hasMoreSportsBrandsList = true.obs;
  RxBool isLoadingMoreSportsBrandsList = false.obs;

  ScrollController sportsBrandsListScrollController = ScrollController();

  final int sportsBrandsLimit = 10;

  RxBool getAllsportsBrandsListLoading = false.obs;

  Future<void> getAllSportsBrandsById(sportBrandId,
      {bool isRefresh = true}) async {
    selectedSportBrandId = selectedSportBrandId;
    if (isRefresh) {
      sportsBrandsListPage.value = 1;
      sportsBrandsList.clear();
      hasMoreSportsBrandsList.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllChannelInfiniteScrollList,
      query: {
        'userId': fanUser.value?.id ?? '',
        'sport': 'Padel',
        'brandId': selectedSportBrandId,
        'page': sportsBrandsListPage.value.toString(),
        'limit': sportsBrandsLimit.toString(),
      },
      isLoading: getAllsportsBrandsListLoading,
    );

    if (!result.success) return;

    final parsed = BrandContentResponse.fromJson(result.data);

    final fetched = parsed.data.content;

    if (fetched.isNotEmpty) {
      sportsBrandsList.addAll(fetched);
    }

    if (fetched.length < sportsBrandsLimit) {
      hasMoreSportsBrandsList.value = false;
    }
  }

  void paginationListenerForAllSportsBrandsList() {
    if (sportsBrandsListScrollController.position.pixels >=
            sportsBrandsListScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreSportsBrandsList.value &&
        hasMoreSportsBrandsList.value) {
      loadMoreAllSportsBrandsList();
    }
  }

  Future<void> loadMoreAllSportsBrandsList() async {
    if (isLoadingMoreSportsBrandsList.value) return;

    isLoadingMoreSportsBrandsList.value = true;
    sportsBrandsListPage.value++;

    await getAllSportsBrandsById(selectedSportBrandId, isRefresh: false);

    isLoadingMoreSportsBrandsList.value = false;
  }

  Future<void> getAllChannelInfiniteScroll({bool isRefresh = true}) async {
    if (isRefresh) {
      infiniteChannelListPage.value = 1;
      infiniteChannelList.clear();
      hasMoreInfiniteChannelList.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllChannelInfiniteScrollList,
      query: {
        'userId': fanUser.value?.id ?? '',
        'page': infiniteChannelListPage.value.toString(),
        'limit': infiniteLimit.toString(),
      },
      isLoading: getAllInfiniteChannelListLoading,
    );

    if (!result.success) return;

    final parsed = InfiniteContentResponse.fromJson(result.data);

    final fetched = parsed.data.content;

    if (fetched.isNotEmpty) {
      infiniteChannelList.addAll(fetched);
    }

    if (fetched.length < infiniteLimit) {
      hasMoreInfiniteChannelList.value = false;
    }
  }

  void paginationListenerForAllInfiniteChannelList() {
    if (infiniteChannelListScrollController.position.pixels >=
            infiniteChannelListScrollController.position.maxScrollExtent -
                200 &&
        !isLoadingMoreInfiniteChannelList.value &&
        hasMoreInfiniteChannelList.value) {
      loadMoreAllInfiniteChannelList();
    }
  }

  Future<void> loadMoreAllInfiniteChannelList() async {
    if (isLoadingMoreInfiniteChannelList.value) return;

    isLoadingMoreInfiniteChannelList.value = true;
    infiniteChannelListPage.value++;

    await getAllChannelInfiniteScroll(isRefresh: false);

    isLoadingMoreInfiniteChannelList.value = false;
  }

  Future<void> getAllCategoryContent({bool isRefresh = true}) async {
    if (isRefresh) {
      categoryListContentPage.value = 1;
      categoriesList.clear();
      hasMoreCategoriesList.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllCategoriesForFan,
      query: {'userId': fanUser.value?.id ?? ''},
      isLoading: getAllCategoryListLoading,
    );

    if (result.success) {
      final parsed = CategoryListResponse.fromJson(result.data);

      categoriesList.addAll(parsed.data.categories);

      // If pagination needed later, keep structure available.
      hasMoreCategoriesList.value = false;
    }
  }

  void paginationListenerForAllCategoriesList() {
    if (categoriesListScrollController.position.pixels >=
            categoriesListScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreCategoriesList.value &&
        hasMoreCategoriesList.value) {
      loadMoreAllCategoriesList();
    }
  }

  Future<void> loadMoreAllCategoriesList() async {
    if (isLoadingMoreCategoriesList.value) return;

    isLoadingMoreCategoriesList.value = true;
    categoryListContentPage.value += 1;

    await getAllCategoryContent(isRefresh: false);
    isLoadingMoreCategoriesList.value = false;
  }

  Future<void> updateStoryViewedStatus(String storyId) async {
    final userId = fanUser.value?.id ?? "";
    String story = storyId;

    final endpoint =
        "${ApiEndpoints.updateStoryViewedStatus}$story/view?userId=$userId";
    final result = await apiProvider.post(endpoint, {},
        isLoading: updateStoryViewedStatusLoading);

    if (result.success) {
      AppLogger.d(result.data);
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> getAllAthleteStoriesView({bool isRefresh = true}) async {
    if (isRefresh) {
      athleteStoriesViewContentPage.value = 1;
      athleteStoriesView.clear();
      hasMoreAthleteStoriesView.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllAthleteStoriesInFanView,
      query: {'userId': fanUser.value?.id ?? ''},
      isLoading: getAllAthleteStoriesViewLoading,
    );

    if (result.success) {
      final parsed = LatestStoryResponse.fromJson(result.data);

      athleteStoriesView.addAll(parsed.data.stories);

      // No pagination from API
      hasMoreAthleteStoriesView.value = false;
    }
  }

  void paginationListenerForAllAthleteStoriesView() {
    if (athleteStoriesViewScrollController.position.pixels >=
            athleteStoriesViewScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreAthleteStoriesView.value &&
        hasMoreAthleteStoriesView.value) {
      loadMoreAllAthleteStoriesView();
    }
  }

  Future<void> loadMoreAllAthleteStoriesView() async {
    if (isLoadingMoreAthleteStoriesView.value) return;

    isLoadingMoreAthleteStoriesView.value = true;
    athleteStoriesViewContentPage.value += 1;

    await getAllAthleteStoriesView(isRefresh: false);
    isLoadingMoreAthleteStoriesView.value = false;
  }

  /// ----------------------------
  /// VIDEO THUMBNAIL CACHE
  /// ----------------------------
  Future<String> getThumbnail(String url) async {
    if (thumbnailCache.containsKey(url)) {
      return thumbnailCache[url]!;
    }

    final thumb = await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";

    thumbnailCache[url] = thumb;
    return thumb;
  }

  /// ----------------------------
  /// LATEST CHANNEL API
  /// ----------------------------
  Future<void> getAllLatestContent({bool isRefresh = true}) async {
    if (isRefresh) {
      latestChannelContentPage.value = 1;
      latestChannel.clear();
      hasMoreLatestChannel.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getLatestContent,
      query: {
        'userId': fanUser.value?.id ?? '',
        'page': latestChannelContentPage.value.toString(), // FIXED
        'limit': '10'
      },
      isLoading: getAllLatestChannelLoading,
    );

    if (result.success) {
      final parsed = LatestChannelResponse.fromJson(result.data);

      latestChannel.addAll(parsed.data.channels);

      if (parsed.data.pagination.currentPage >=
          parsed.data.pagination.totalPages) {
        hasMoreLatestChannel.value = false;
      }
    }
  }

  void paginationListenerForAllLatestContent() {
    if (latestChannelScrollController.position.pixels >=
            latestChannelScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreLatestChannel.value &&
        hasMoreLatestChannel.value) {
      loadMoreAllLatestContent();
    }
  }

  Future<void> loadMoreAllLatestContent() async {
    if (isLoadingMoreLatestChannel.value) return;

    isLoadingMoreLatestChannel.value = true;
    latestChannelContentPage.value += 1;

    await getAllLatestContent(isRefresh: false);
    isLoadingMoreLatestChannel.value = false;
  }

  Future<void> getAllChannelCategory(String categoryId,
      {bool isRefresh = true}) async {
    selectedCategoryId = categoryId;

    if (isRefresh) {
      allChannelCategoryPage.value = 1;
      allChannelCategory.clear();
      hasMoreAllChannelCategory.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllChannelsByCategory,
      query: {
        'userId': fanUser.value?.id ?? '',
        'categoryId': categoryId,
        'page': allChannelCategoryPage.value.toString(),
        'limit': allChannelCategoryLimit.toString()
      },
      isLoading: getAllChannelCategoryLoading,
    );

    if (result.success) {
      final parsed = CategoryContentResponse.fromJson(result.data);

      allChannelCategory.addAll(parsed.data.content);

      if (parsed.data.pagination.currentPage >=
          parsed.data.pagination.totalPages) {
        hasMoreAllChannelCategory.value = false;
      }
    }
  }

  void paginationListenerForAllChannelCategory() {
    if (allChannelCategoryScrollController.position.pixels >=
            allChannelCategoryScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreAllChannelCategory.value &&
        hasMoreAllChannelCategory.value) {
      loadMoreAllChannelCategory();
    }
  }

  Future<void> loadMoreAllChannelCategory() async {
    if (isLoadingMoreAllChannelCategory.value) return;

    isLoadingMoreAllChannelCategory.value = true;
    allChannelCategoryPage.value += 1;

    await getAllChannelCategory(selectedCategoryId!, isRefresh: false);
    isLoadingMoreAllChannelCategory.value = false;
  }

  /// ----------------------------
  /// SEARCH ATHLETES API
  /// ----------------------------
  void paginationListenerForAllSearchedAthletes() {
    if (searchedAthletesScrollController.position.pixels >=
            searchedAthletesScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreSearchedAthletes.value &&
        hasMoreSearchedAthletes.value) {
      loadMoreAllSearchedAthletes();
    }
  }

  Future<void> loadMoreAllSearchedAthletes() async {
    if (!hasMoreSearchedAthletes.value || isLoadingMoreSearchedAthletes.value)
      return;

    isLoadingMoreSearchedAthletes.value = true;
    searchAthleteListPage.value += 1;

    await getAllAthleteSearchList(isRefresh: false);
    isLoadingMoreSearchedAthletes.value = false;
  }

  Future<void> getAllAthleteSearchList({bool isRefresh = true}) async {
    final queryText = athleteSearchQuery.text.trim();
    if (queryText.isEmpty) return;

    if (isRefresh) {
      searchAthleteListPage.value = 1;
      searchedAthletes.clear();
      hasMoreSearchedAthletes.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getSearchedAthletes,
      isLoading: getAllSearchedAthletesLoading,
      query: {
        'query': queryText,
        'userId': fanUser.value?.id ?? '',
        'page': searchAthleteListPage.value.toString(),
        'limit': searchAthleteLimit.toString(),
      },
    );

    if (result.success) {
      final data = AthletesResponse.fromJson(result.data);

      searchedAthletes.addAll(data.data.athletes ?? []);

      if (data.data.pagination.page >= data.data.pagination.totalPages) {
        hasMoreSearchedAthletes.value = false;
      }
    }
  }

  void onSearchChanged(String value) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      if (value.trim().isEmpty) {
        searchedAthletes.clear();
        hasMoreSearchedAthletes.value = false;
        return;
      }

      searchAthleteListPage.value = 1;
      hasMoreSearchedAthletes.value = true;

      getAllAthleteSearchList(isRefresh: true);
    });
  }

  Future<void> getAllSportsCategories() async {
    final result = await apiProvider.get(ApiEndpoints.getAllSportsCategories,
        query: {'userId': fanUser.value?.id ?? '', 'sport': 'Padel'},
        isLoading: getAllSportsCategoriesLoading);
    if (result.success) {
      final data = CategoryListResponse.fromJson(result.data);
      sportsCategories.assignAll(data.data.categories);
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAllSportsBrands() async {
    final result = await apiProvider.get(ApiEndpoints.getAllSportsBrands,
        query: {'userId': fanUser.value?.id ?? '', 'sport': 'Padel'},
        isLoading: getAllSportsBrandsLoading);
    if (result.success) {
      final data = BrandListResponse.fromJson(result.data);
      sportsBrands.assignAll(data.data.brands);
    } else {
      AppLogger.d(result.error);
    }
  }

  Rx<AthleteProfileFanviewResponse?> athleteFanview =
      Rx<AthleteProfileFanviewResponse?>(null);
  Future<bool> getAthlete(String athleteId) async {
    final result = await apiProvider.get(
      '${ApiEndpoints.getAthleteProfileByFan}$athleteId/profile',
      query: {"userId": fanUser.value?.id},
    );

    if (result.success) {
      AppLogger.d("the get athlete result is: ${result.data}");

      athleteFanview.value =
          AthleteProfileFanviewResponse.fromJson(result.data);

      return result.success;
    } else {
      AppLogger.d('Error: ${result.message}');
      return false;
    }
  }

  Future<void> markAllNotificationsAsRead(String id) async {
    try {
      final result = await apiProvider.post(
        ApiEndpoints.markAllNotificationsAsRead,
        {
          'userId': fanUser.value?.id ?? '',
          'ids': [id],
        },
      );

      AppLogger.d("Mark Notifications As Read: ${result.data}");

      if (result.success) {
        // Refresh notifications
        notifications.clear();
        await fetchFanNotifications(isRefresh: true);
      }
    } catch (e) {
      AppLogger.e("Mark All Notifications Error: $e");
    }
  }

  final getTrackedAllAthletesByFanLoading = false.obs;
  final getTrackAllAthletesByFanLimit = 10;
  final getTrackAllAthletesByFanPage = 1.obs;
  var trackedAthletes = <Athlete>[].obs;
  final isLoadingMoreTrackedAthletes = false.obs;
  final hasMoreTrackedAthletesByFan = true.obs;

  Future<void> getTrackedAllAthletesByFan({bool isRefresh = true}) async {
    if (isRefresh) {
      getTrackAllAthletesByFanPage.value = 1;
      trackedAthletes.clear();
      hasMoreTrackedAthletesByFan.value = true;
    }
    final result = await apiProvider.get(
      ApiEndpoints.getTrackedAthletesByFan,
      query: {
        'userId': fanUser.value?.id ?? '',
        'page': getTrackAllAthletesByFanPage.value.toString(),
        'limit': getTrackAllAthletesByFanLimit.toString()
      },
      isLoading: getTrackedAllAthletesByFanLoading,
    );

    if (result.success) {
      final data = AthletesResponse.fromJson(result.data);
      AppLogger.d("Tracked Athletes: ${data.data.athletes}");
      trackedAthletes.addAll(data.data.athletes ?? []);
      if (data.data.pagination!.page >= data.data.pagination!.totalPages) {
        hasMoreTrackedAthletesByFan.value = false;
      }
    } else {
      AppLogger.d("Error fetching tracked athletes: ${result.error}");
    }
  }

  void paginationListenerForAllTrackedAthletes() {
    if (trackedAthletesScrollController.position.pixels >=
            trackedAthletesScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreTrackedAthletes.value &&
        hasMoreTrackedAthletesByFan.value) {
      loadMoreAllTrackedAthletes();
    }
  }

  Future<void> loadMoreAllTrackedAthletes() async {
    if (isLoadingMoreTrackedAthletes.value) return;

    isLoadingMoreTrackedAthletes.value = true;
    getTrackAllAthletesByFanPage.value += 1;
    await getTrackedAllAthletesByFan(isRefresh: false);
    isLoadingMoreTrackedAthletes.value = false;
  }

  var notifications = <FanNotificationItem>[].obs;
  final isFanNotificationsLoading = false.obs;

  Future<void> fetchFanNotifications({bool isRefresh = true}) async {
    try {
      if (isRefresh) {
        fanNotificationsPage.value = 1;
        notifications.clear();
        hasMoreFanNotifications.value = true;
      }

      final result = await apiProvider.get(
        ApiEndpoints.getFanNotifications,
        query: {
          'userId': fanUser.value?.id ?? '',
          'limit': '10',
          'page': fanNotificationsPage.value.toString(),
          'filter': 'all'
        },
        isLoading: isFanNotificationsLoading,
      );

      AppLogger.d("Fan Notifications: ${result.data}");

      if (result.success) {
        final data = FanNotificationResponseModel.fromJson(result.data);

        final list = data.data.notifications;

        notifications.value = list.map((item) {
          return FanNotificationItem(
            id: item.id,
            type: item.type,
            message: item.message,
            isRead: item.isRead,
            createdAt: item.createdAt,
            actor: item.actor,
            athlete: item.athlete,
            channel: item.channel,
          );
        }).toList();

        if (data.data.pagination!.page >= data.data.pagination!.totalPages) {
          hasMoreFanNotifications.value = false;
        }
      }
    } catch (e) {
      AppLogger.e("Notification Error: $e");
    }
  }

  void paginationListenerForAllFanNotifications() {
    if (fanNotificationsScrollController.position.pixels >=
            fanNotificationsScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreFanNotifications.value &&
        hasMoreFanNotifications.value) {
      loadMoreAllFanNotifications();
    }
  }

  Future<void> loadMoreAllFanNotifications() async {
    if (isLoadingMoreFanNotifications.value) return;

    isLoadingMoreFanNotifications.value = true;
    fanNotificationsPage.value += 1;
    await fetchFanNotifications(isRefresh: false);
    isLoadingMoreFanNotifications.value = false;
  }
}

class UserDetailsResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final UserData? data;

  UserDetailsResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    return UserDetailsResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }

  // ⭐ Add this
  UserDetailsResponse copyWith({
    bool? status,
    int? statusCode,
    String? message,
    UserData? data,
  }) {
    return UserDetailsResponse(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class UserData {
  final int? totalTrackedAthletes;
  final AppUser? user;

  UserData({
    this.totalTrackedAthletes,
    this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      totalTrackedAthletes: json['totalTrackedAthletes'],
      user: json['user'] != null ? AppUser.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalTrackedAthletes': totalTrackedAthletes,
      'user': user?.toJson(),
    };
  }

  // ⭐ Correct copyWith() implementation
  UserData copyWith({
    int? totalTrackedAthletes,
    AppUser? user,
  }) {
    return UserData(
      totalTrackedAthletes: totalTrackedAthletes ?? this.totalTrackedAthletes,
      user: user ?? this.user,
    );
  }
}

class AppUser {
  final String? id;
  final String? email;
  final String? mobile;
  final String? dateOfBirth;
  final String? name;
  final String? role;
  final int? age;
  final String? gender;
  final String? country;
  final String? username;
  String? profilePicture;

  AppUser({
    this.id,
    this.email,
    this.mobile,
    this.dateOfBirth,
    this.name,
    this.role,
    this.age,
    this.gender,
    this.country,
    this.username,
    this.profilePicture,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'],
      mobile: json['mobile'],
      dateOfBirth: json['dateOfBirth'],
      name: json['name'],
      role: json['role'],
      age: json['age'],
      gender: json['gender'],
      country: json['country'],
      username: json['username'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'mobile': mobile,
      'dateOfBirth': dateOfBirth,
      'name': name,
      'role': role,
      'age': age,
      'gender': gender,
      'country': country,
      'username': username,
      'profilePicture': profilePicture,
    };
  }

  // ⭐ Correct copyWith for all fields
  AppUser copyWith({
    String? id,
    String? email,
    String? mobile,
    String? dateOfBirth,
    String? name,
    String? role,
    int? age,
    String? gender,
    String? country,
    String? username,
    String? profilePicture,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      name: name ?? this.name,
      role: role ?? this.role,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}

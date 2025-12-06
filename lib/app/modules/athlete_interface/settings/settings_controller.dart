import 'dart:async';

import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_controller.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/archeived_post_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:athlete_elite/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as m_file show FormData, MultipartFile;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../widgets/custom_toast.dart';

class AthleteSettingsController extends GetxController {
  late final bool isAthlete;
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  Rxn<AthleteUser> athleteUser = Rxn<AthleteUser>();
  final athleteEmailController = TextEditingController();
  final athletePhoneNumberController = TextEditingController();
  final athleteDateofbirthController = TextEditingController();
  final isEditProfileLoading = false.obs;
  final isSubmittedBrandsLoading = false.obs;
  final isUserDetailsLoading = false.obs;
  final isArchivedContentLoading = false.obs;
  final isAthletePreferencesLoading = false.obs;
  final isAthleteChangePasswordLoading = false.obs;
  final isSubmitQueryLoading = false.obs;
  final isSocialLinksLoading = false.obs;
  final isDeleteAthleteAccountLoading = false.obs;
  final isLoading = false.obs;
  final isButtonDisabled = true.obs;
  final changePasswordFormKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final submitedBrandsController = TextEditingController();
  RxBool studioPushNotifications = false.obs;
  RxBool cheersAndComments = false.obs;
  RxBool fanTracking = false.obs;
  RxString selectedLang = 'en'.obs;
  RxMap<String, String> generatedArchivedThumbnails = <String, String>{}.obs;

  RxList<ArchivedItem> archivedList = <ArchivedItem>[].obs;

  RxInt archivedPage = 1.obs;
  final int archivedLimit = 10;
  RxBool hasMoreArchived = true.obs;

  RxBool isLoadingMoreArchived = false.obs;
  RxBool isArchivedLoading = false.obs;
  late ScrollController archivedScrollController;

  final brandsController = TextEditingController();

  var aboutItems = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;

    isAthlete = args?['isAthlete'] ?? false;

    // newPasswordController.addListener(updateChangepasswordButtonState);
    // confirmPasswordController.addListener(updateChangepasswordButtonState);
    // messageController.addListener(_updateSubmitQueryButtonState);
    if (isAthlete) {
      getLoggedInUser();

      archivedScrollController = ScrollController()
        ..addListener(paginationListener);
    } else {
      selectedGender.value = normalizeGender(fanGenderController.text);
      getFanLoggedInUser();
      getFanDetails();
      fanEmailController.addListener(_emailFieldLogic);
      fanPhoneNumberController.addListener(_phoneFieldLogic);
    }
    messageController.addListener(_updateSubmitQueryButtonState);
    currentPasswordController.addListener(updateChangepasswordButtonState);
    newPasswordController.addListener(updateChangepasswordButtonState);
    confirmPasswordController.addListener(updateChangepasswordButtonState);
  }

  String normalizeGender(String value) {
    switch (value.toLowerCase()) {
      case "male":
        return "Male";
      case "female":
        return "Female";
      case "prefer not to say":
        return "Prefer not to say";
      default:
        return "";
    }
  }

  void updateSelectedGender(String? v) {
    final normalized = normalizeGender(v ?? '');
    selectedGender.value = normalized;
    fanGenderController.text = normalized; // keep textcontroller in sync
  }

  void updateSelectedCountry(String? v) {
    // final normalized = normalizeGender(v ?? '');
    selectedCountry.value = v ?? '';
    fanCountryController.text = v ?? ''; // keep textcontroller in sync
  }

  void toggleEditAndOpenDropdown() {
    isGenderEditing.toggle();
    if (isGenderEditing.value) {
      // open dropdown logic you already have if needed
      Future.delayed(const Duration(milliseconds: 100), () {
        openGenderDropdownMenu();
      });
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter valid phone number";
    }
    return null;
  }

  void _emailFieldLogic() {
    final typed = fanEmailController.text.trim();

    if (userEmail == null || userEmail!.isEmpty) {
      showOtpEmailButton.value = typed.isNotEmpty;
    } else {
      showOtpEmailButton.value = typed != userEmail;
    }

    if (typed == userEmail) {
      showEmailOtpField.value = false;
    }
  }

  void _phoneFieldLogic() {
    final typed = fanPhoneNumberController.text.trim();

    AppLogger.d(typed);

    if (userMobile == null || userMobile!.isEmpty) {
      showOtpMobileButton.value = typed.isNotEmpty;
    } else {
      showOtpMobileButton.value = typed != userMobile;
    }

    if (typed == userMobile) {
      showMobileOtpField.value = false;
    }
  }

  void paginationListener() {
    if (archivedScrollController.position.pixels >=
            archivedScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreArchived.value &&
        hasMoreArchived.value) {
      loadMoreDrafts();
    }
  }

  Future<void> loadMoreDrafts() async {
    if (!hasMoreArchived.value) return;

    isLoadingMoreArchived.value = true;
    archivedPage.value++;

    await getAthleteArchivedContent(isRefresh: false);
    isLoadingMoreArchived.value = false;
  }

  void getLoggedInUser() {
    final athleteBox = Hive.box<AthleteUser>('athlete_user');
    final loggedAthlete = athleteBox.get('current_user');

    if (loggedAthlete != null) {
      athleteUser.value = loggedAthlete;
    }
  }

  Future<void> postAthleteSubmitedBrands() async {
    final result = await apiProvider.post(
        ApiEndpoints.submittedBrandsForAthlete, {"name": aboutItems},
        isLoading: isSubmittedBrandsLoading);

    if (result.success) {
      AppLogger.d("update profile details ${result.data}");
      Get.back();
      CustomToast.show("Brands submitted successfully");
      submitedBrandsController.clear();
    } else {
      AppLogger.d(result.error);
      CustomToast.show(result.error);
    }
  }

  Future<void> getUserProfileDetails() async {
    final result = await apiProvider.get(ApiEndpoints.getUserProfileDetails,
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("get profile details ${result.data}");
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final String name = data["name"] ?? "";
      final String bio = data["bio"] ?? "";

      changeNameController.text = name;
      changeBioController.text = bio;
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<bool> updateUserProfileDetails() async {
    final result = await apiProvider.patch(ApiEndpoints.getUserProfileDetails,
        {"name": changeNameController.text, "bio": changeBioController.text},
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("update profile details ${result.data}");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> updateProfilePicture() async {
    MediaPickerController mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());
    AtheleteLandingController landingController = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());

    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return;
    }

    final formData = m_file.FormData.fromMap({
      'file': await m_file.MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.patch(
        ApiEndpoints.updateAthleteProfilePicture, formData,
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("update athlete profile picture ${result.data}");
      final newUrl = result.data['data']?['profilePicture'];

      if (newUrl == null) {
        AppLogger.e("Profile picture URL not found in response.");
        return;
      }

      final old = landingController.homeSectionResponse.value;

      landingController.homeSectionResponse.value = old?.copyWith(
        data: old.data.copyWith(
          profilePicture: newUrl,
        ),
      );
      landingController.profilePicture.value = newUrl;

      landingController.homeSectionResponse.refresh();

      CustomToast.show("Profile picture updated successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<bool> deleteAthleteProfilePicture() async {
    AtheleteLandingController landingController = Get.isRegistered()
        ? Get.find<AtheleteLandingController>()
        : Get.put(AtheleteLandingController());
    final result = await apiProvider.delete(
        ApiEndpoints.deleteAthleteProfilePicture,
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("delete profile picture ${result.data}");

      final old = landingController.homeSectionResponse.value;

      landingController.homeSectionResponse.value = old?.copyWith(
        data: old.data.copyWith(
          profilePicture: "",
        ),
      );
      landingController.profilePicture.value = "";

      landingController.homeSectionResponse.refresh();

      CustomToast.show("Profile picture deleted successfully");

      return result.success;
    } else {
      AppLogger.d(result.error);
      CustomToast.show(result.error);
      return false;
    }
  }

  Future<void> getAthleteUserDetails() async {
    final result = await apiProvider.get(ApiEndpoints.getAthleteUserDetails,
        isLoading: isUserDetailsLoading);

    if (result.success) {
      AppLogger.d("get profile details ${result.data}");
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final String email = data["email"] ?? "";
      final String phoneNumber = data["phoneNumber"] ?? "";
      final String dateOfBirth = data["dateOfBirth"] ?? "";

      athleteEmailController.text = email;
      athletePhoneNumberController.text = phoneNumber;
      athleteDateofbirthController.text = formatDate(dateOfBirth);
      athleteDobText.value = formatDate(dateOfBirth);
    } else {
      AppLogger.d(result.error);
    }
  }

  String convertToApiDate(String uiDate) {
    try {
      final parts = uiDate.split("/");
      return "${parts[2]}-${parts[1]}-${parts[0]}";
    } catch (e) {
      return uiDate;
    }
  }

  Future<bool> updateUserDetails() async {
    final dobApiFormat = convertToApiDate(athleteDateofbirthController.text);

    AppLogger.d("Sending DOB to API => $dobApiFormat");

    final result = await apiProvider.patch(
      ApiEndpoints.updateAthleteUserDetails,
      {
        "phoneNumber": athletePhoneNumberController.text,
        "email": athleteEmailController.text,
        "dateOfBirth": dobApiFormat
      },
      isLoading: isUserDetailsLoading,
    );

    if (result.success) {
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final String email = data["email"] ?? "";
      final String phoneNumber = data["phoneNumber"] ?? "";
      final String dateOfBirth = data["dateOfBirth"] ?? "";

      athleteEmailController.text = email;
      athletePhoneNumberController.text = phoneNumber;

      athleteDateofbirthController.text = formatDate(dateOfBirth);

      return true;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> deleteAccount() async {
    final result = await apiProvider.delete(ApiEndpoints.deleteAthleteAccount,
        isLoading: isDeleteAthleteAccountLoading);

    if (result.success) {
      AppLogger.d("delete account ${result.data}");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthletePreferences() async {
    final result = await apiProvider.get(ApiEndpoints.getAthletePreferences,
        isLoading: isAthletePreferencesLoading);

    if (result.success) {
      AppLogger.d("get profile details ${result.data}");
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final bool resStudioPushNotifications =
          data["studioPushNotifications"] ?? "";
      final bool resCheersAndComments = data["cheersAndComments"] ?? "";
      final bool resFanTracking = data["fanTracking"] ?? "";
      final prefLang =
          (data["preferredLanguage"] ?? "").toString().toUpperCase();

      studioPushNotifications.value = resStudioPushNotifications;
      cheersAndComments.value = resCheersAndComments;
      fanTracking.value = resFanTracking;
      selectedLang.value = prefLang == "ENGLISH" ? "en" : "es";
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> updateAthletePreferences() async {
    AppLogger.d("the selected lang is ${selectedLang.value}");

    final result = await apiProvider.patch(
        ApiEndpoints.updateAthletePreferences,
        {
          "studioPushNotifications": studioPushNotifications.value,
          "cheersAndComments": cheersAndComments.value,
          "fanTracking": fanTracking.value,
          "preferredLanguage":
              selectedLang.value == 'en' ? 'ENGLISH' : 'SPANISH'
        },
        isLoading: isAthletePreferencesLoading);

    if (result.success) {
      AppLogger.d("update profile details ${result.data}");
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final bool resStudioPushNotifications =
          data["studioPushNotifications"] ?? "";
      final bool resCheersAndComments = data["cheersAndComments"] ?? "";
      final bool resFanTracking = data["fanTracking"] ?? "";
      final prefLang =
          (data["preferredLanguage"] ?? "").toString().toUpperCase();

      studioPushNotifications.value = resStudioPushNotifications;
      cheersAndComments.value = resCheersAndComments;
      fanTracking.value = resFanTracking;
      selectedLang.value = prefLang == "ENGLISH" ? "en" : "es";
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteAllSocialLinks() async {
    final result = await apiProvider.get(
      ApiEndpoints.getAthleteAllSocialLinks,
      isLoading: isSocialLinksLoading,
    );

    if (result.success) {
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final Map<String, String> loaded = {};

      apiToLocalKey.forEach((apiKey, localKey) {
        loaded[localKey] = data[apiKey] ?? "";
      });

      socialLinks.value = loaded;
    } else {
      AppLogger.d(result.error);
    }
  }

  void updateSocialLink(String key, String url) {
    socialLinks[key] = url;
  }

  Future<void> updateAthleteSocialLinks() async {
    isSaving.value = true;

    final Map<String, String> payload = {};

    apiToLocalKey.forEach((apiKey, localKey) {
      final value = socialLinks[localKey];

      // Only add non-empty values
      if (value != null && value.trim().isNotEmpty) {
        payload[apiKey] = value.trim();
      }
    });

    AppLogger.d("FINAL Payload => $payload");

    final result = await apiProvider.patch(
      ApiEndpoints.updateAthleteSocialLinks,
      payload,
      isLoading: isSaving,
    );

    isSaving.value = false;

    if (result.success) {
      Get.back();
      CustomToast.show("Social links updated successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> submitQuery() async {
    final result = await apiProvider.post(
        ApiEndpoints.submitAthleteQuery,
        {
          "message": messageController.text,
        },
        isLoading: isSubmitQueryLoading);

    if (result.success) {
      AppLogger.d("query details ${result.data}");
      Get.back();
      messageController.clear();
      CustomToast.show("Query submitted successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> getAthleteArchivedContent({bool isRefresh = true}) async {
    if (isArchivedLoading.value || !hasMoreArchived.value) return;

    if (isRefresh) {
      archivedPage.value = 1;
      archivedList.clear();
      hasMoreArchived.value = true;
    }

    final result = await apiProvider.get(ApiEndpoints.getAthleteArchivedContent,
        query: {
          "page": archivedPage.value.toString(),
          "limit": archivedLimit.toString(),
        },
        isLoading: isArchivedContentLoading);

    if (result.success) {
      final List newItems = result.data["data"]["items"];

      if (newItems.isEmpty) {
        hasMoreArchived.value = false;
      } else {
        archivedList.addAll(
          newItems.map((e) => ArchivedItem.fromJson(e)).toList(),
        );
        archivedPage.value++;
        if (result.data["data"]["meta"]['page'] >=
            result.data["data"]["meta"]['totalPages']) {
          hasMoreArchived.value = false;
        }
      }
    } else {
      AppLogger.d(result.error);
    }
  }

  /// GROUP ITEMS BY EXACT CATEGORY VALUE
  Map<String, List<ArchivedItem>> get groupedArchived {
    Map<String, List<ArchivedItem>> data = {};

    for (var item in archivedList) {
      String key = item.category ?? "Unknown";

      data.putIfAbsent(key, () => []);
      data[key]!.add(item);
    }

    return data;
  }

  Future<String> generateDraftVideoThumbnail(String url) async {
    if (generatedArchivedThumbnails.containsKey(url)) {
      return generatedArchivedThumbnails[url]!;
    }

    final thumbPath = await VideoThumbnail.thumbnailFile(
          video: url,
          imageFormat: ImageFormat.PNG,
          maxHeight: 200,
          quality: 100,
        ) ??
        "";

    generatedArchivedThumbnails[url] = thumbPath;

    return thumbPath;
  }

  void updateChangepasswordButtonState() {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final currentPassword = currentPasswordController.text.trim();

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~]).{8,}$');

    bool isInvalid = currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty ||
        !passwordRegex.hasMatch(newPassword) ||
        confirmPassword != newPassword;
    isButtonDisabled.value = isInvalid;
  }

  void _updateSubmitQueryButtonState() {
    isQueryValid.value = messageController.text.isEmpty;
  }

  void addItem() {
    if (brandsController.text.trim().isEmpty) {
      CustomToast.show("Please enter something before adding");
      return;
    }

    aboutItems.add(brandsController.text.trim());
    brandsController.clear();
  }

  void removeItem(int index) {
    aboutItems.removeAt(index);
  }

  final changeNameController = TextEditingController();
  final changeUserNameController = TextEditingController();
  final changeBioController = TextEditingController();

  void toggleStudioPushNotifications(bool value) {
    studioPushNotifications.value = value;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
    }
  }

  void togglePushNotifications(bool value) {
    fanPushNotifications.value = value;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
    }
  }

  void toggleCommentNotifications(bool value) {
    fanCommentResponse.value = value;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
    }
  }

  void toggleCheersAndComments(bool value) {
    cheersAndComments.value = value;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
    }
  }

  void toggleFanTracking(bool value) {
    fanTracking.value = value;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
    }
  }

  Future<void> selectLanguage(String lang) async {
    selectedLang.value = lang;
    if (isAthlete) {
      await updateAthletePreferences();
      await LocaleService.changeLocale(lang);

      Get.updateLocale(LocaleService.currentLocale);
    } else {
      await updateFanPreferences();
      await LocaleService.changeLocale(lang);

      Get.updateLocale(LocaleService.currentLocale);
    }
  }

  // Social link
  final RxMap<String, String> socialLinks = <String, String>{}.obs;
  final RxBool isSaving = false.obs;

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
      key: 'x',
    ),
  ];

  /// Map API field names to local UI keys
  final Map<String, String> apiToLocalKey = {
    "spotify": "spotify",
    "youtube": "youtube",
    "instagram": "instagram",
    "fameMe": "pinterest", // or update if wrong
    "facebook": "facebook",
    "tictac": "tiktok", // API spelling wrong but maintain compatibility
    "twitter": "x",
  };

  final messageController = TextEditingController();
  RxBool isQueryValid = true.obs;
  final formKeyForAthleteQuery = GlobalKey<FormState>();
  final RxBool isSubmitting = false.obs;

  //Fan Interface
  final RxBool showOtpButtonForRow4 = false.obs;
  final RxBool showOtpButtonForRow5 = false.obs;

  @override
  void onClose() {
    messageController.dispose();
    currentPasswordController.removeListener(updateChangepasswordButtonState);
    newPasswordController.removeListener(updateChangepasswordButtonState);
    confirmPasswordController.removeListener(updateChangepasswordButtonState);
    messageController.removeListener(_updateSubmitQueryButtonState);
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    if (!isAthlete) {
      _mobileOtpTimer?.cancel();
    }
    super.onClose();
  }

  Future<void> logout(bool isAthlete) async {
    print("the isAthlete value is $isAthlete");
    if (isAthlete) {
      await Hive.box<AthleteUser>('athlete_user').clear();
      await Hive.box('auth_token').clear();
      Get.deleteAll(force: true);
    } else {
      await Hive.box<FanUserModel>('fan_user').clear();
      await Hive.box('auth_token').clear();
      Get.deleteAll(force: true);
    }
  }

  Future<void> onChangePassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      final result = await apiProvider.post(
        ApiEndpoints.athleteChangePassword,
        {
          'currentPassword': currentPasswordController.text,
          'newPassword': newPasswordController.text,
          'confirmPassword': confirmPasswordController.text
        },
        isLoading: isLoading,
      );
      if (result.success) {
        AppLogger.d(result.data);
        CustomToast.show("Successfully Saved Details");
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        Get.back();
      } else {
        AppLogger.d('Error: ${result.message}');
      }
    }
  }

//---------------------  FAN ---------------------------------------------------

  final fanDetailsLoading = false.obs;
  Rxn<UserDetailsResponse> userDetails = Rxn<UserDetailsResponse>();

  Rxn<FanUserModel> fanUser = Rxn<FanUserModel>();

  final fanAgeController = TextEditingController();
  final fanGenderController = TextEditingController();
  final fanCountryController = TextEditingController();
  final fanEmailController = TextEditingController();
  final fanPhoneNumberController = TextEditingController();
  final fanDateofbirthController = TextEditingController();
  var dobText = "".obs;
  var athleteDobText = "".obs;
  final emailOtpController = TextEditingController();
  final phoneOtpController = TextEditingController();

  RxBool isAgeEditing = false.obs;
  RxBool isGenderEditing = false.obs;
  RxBool isCountryEditing = false.obs;
  RxBool isEmailEditing = false.obs;
  RxBool isPhoneEditing = false.obs;
  RxBool isDateofbirthEditing = false.obs;
  void setDOB(DateTime date) {
    fanDateofbirthController.text =
        "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  DateTime tempSelectedDate = DateTime.now();

  RxBool showOtpEmailButton = false.obs;
  RxBool showEmailOtpField = false.obs;

  RxBool showOtpMobileButton = false.obs;
  RxBool showMobileOtpField = false.obs;

  String? userEmail;
  String? userMobile;

  RxBool fanPushNotifications = true.obs;
  RxBool fanCommentResponse = true.obs;

  void getFanLoggedInUser() {
    final fanBox = Hive.box<FanUserModel>('fan_user');
    final loggedFan = fanBox.get('current_user');
    if (loggedFan != null) fanUser.value = loggedFan;
  }

  Future<bool> deleteFanProfilePicture() async {
    FanLandingController fanLandingController = Get.isRegistered()
        ? Get.find<FanLandingController>()
        : Get.put(FanLandingController());
    AthleteSettingsController athleteSettingsController = Get.isRegistered()
        ? Get.find<AthleteSettingsController>()
        : Get.put(AthleteSettingsController());
    final result = await apiProvider.delete(
        ApiEndpoints.deleteFanProfilePicture,
        data: {"userId": fanUser.value?.id},
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("delete profile picture ${result.data}");
      // fanLandingController.userDetails.value =
      //     fanLandingController.userDetails.value?.copyWith(
      //   data: fanLandingController.userDetails.value?.data?.copyWith(
      //     user: fanLandingController.userDetails.value?.data?.user?.copyWith(
      //       profilePicture: null,
      //     ),
      //   ),
      // );
      fanLandingController.userDetails.value?.data?.user?.profilePicture = null;
      athleteSettingsController.userDetails.value?.data?.user?.profilePicture =
          null;
      athleteSettingsController.userDetails.refresh();
      fanLandingController.userDetails.refresh();

      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> getFanPreferences() async {
    final result = await apiProvider.get(ApiEndpoints.getFanPreferences,
        query: {"userId": fanUser.value?.id},
        isLoading: isAthletePreferencesLoading);

    AppLogger.d("the fan preferences result is: ${result.data}");

    if (result.success) {
      AppLogger.d("get fan preferences ${result.data}");
      final Map<String, dynamic> data = result.data["data"] ?? {};

      final bool resFanPushNotifications = data["pushNotifications"] ?? "";
      final bool resFanCommentResponse = data["commentRespond"] ?? "";
      final prefLang =
          (data["preferredLanguage"] ?? "").toString().toUpperCase();

      fanPushNotifications.value = resFanPushNotifications;
      fanCommentResponse.value = resFanCommentResponse;
      selectedLang.value = prefLang == "ENGLISH" ? "en" : "es";
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> onChangeFanPassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      final result = await apiProvider.post(
        ApiEndpoints.changeFanPassword,
        {
          'currentPassword': currentPasswordController.text,
          'newPassword': newPasswordController.text,
          'confirmPassword': confirmPasswordController.text
        },
        isLoading: isLoading,
      );
      if (result.success) {
        AppLogger.d(result.data);
        CustomToast.show("Successfully Saved Details");
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        Get.back();
      } else {
        AppLogger.d('Error: ${result.message}');
      }
    }
  }

  void openGenderDropdown() {
    Future.delayed(Duration(milliseconds: 100), () {
      Get.focusScope!.unfocus();
    });
  }

  final selectedGender = ''.obs;
  final GlobalKey genderDropdownKey = GlobalKey();

  final selectedCountry = ''.obs;
  final GlobalKey countryDropdownKey = GlobalKey();

  void openGenderDropdownMenu() {
    final context = genderDropdownKey.currentContext;
    if (context != null) {
      final gesture = context.findAncestorWidgetOfExactType<GestureDetector>();
      gesture?.onTap?.call(); // <- opens the dropdown
    }
  }

  void openCountryDropdownMenu() {
    final context = countryDropdownKey.currentContext;
    if (context != null) {
      final gesture = context.findAncestorWidgetOfExactType<GestureDetector>();
      gesture?.onTap?.call(); // <- opens the dropdown
    }
  }

  Future<void> updateFanUserDetails() async {
    AppLogger.d(
        "the request body is ${fanUser.value?.id} ${fanAgeController.text} ${fanGenderController.text} ${fanCountryController.text} ${fanDateofbirthController.text}");

    String gender = fanGenderController.text == "MALE"
        ? "Male"
        : fanGenderController.text == "FEMALE"
            ? "Female"
            : "Prefer not to say";
    final result = await apiProvider.put(
      ApiEndpoints.userFanDetails,
      {
        "userId": fanUser.value?.id,
        "age": int.parse(fanAgeController.text),
        "gender": gender,
        "country": fanCountryController.text,
        "dateOfBirth": formatDOBToApi(fanDateofbirthController.text),
      },
      isLoading: fanDetailsLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("Successfully Saved Details");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  String formatDOBToApi(String dob) {
    try {
      final parts = dob.split("/"); // ["23","09","1997"]
      final day = parts[0];
      final month = parts[1];
      final year = parts[2];

      return "$year-$month-$day";
    } catch (e) {
      return dob;
    }
  }

  Future<void> postSendOTPToMail() async {
    final result = await apiProvider.post(
      ApiEndpoints.sendOTPOnEmail,
      {"userId": fanUser.value?.id, "email": fanEmailController.text},
      isLoading: isLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      showOtpButtonForRow4.value = true;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> postVerifyMailOTP() async {
    final result = await apiProvider.post(
      ApiEndpoints.verifyOTPOnEmail,
      {
        "userId": fanUser.value?.id,
        "email": fanEmailController.text,
        "otp": emailOtpController.text
      },
      isLoading: isLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      showOtpButtonForRow5.value = true;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  // Future<void> postSendOTPToMobile() async {
  //   final result = await apiProvider.post(
  //     ApiEndpoints.sendOTPOnMobile,
  //     {"userId": fanUser.value?.id, "mobile": fanPhoneNumberController.text},
  //     isLoading: isLoading,
  //   );

  //   if (result.success) {
  //     AppLogger.d(result.data);
  //     showOtpButtonForRow4.value = true;
  //   } else {
  //     AppLogger.d('Error: ${result.message}');
  //   }
  // }

  // Future<void> postVerifyMobileOTP() async {
  //   final result = await apiProvider.post(
  //     ApiEndpoints.verifyOTPOnMobile,
  //     {
  //       "userId": fanUser.value?.id,
  //       "mobile": fanPhoneNumberController.text,
  //       "otp": phoneOtpController.text
  //     },
  //     isLoading: isLoading,
  //   );

  //   if (result.success) {
  //     AppLogger.d(result.data);
  //     showOtpButtonForRow5.value = true;
  //   } else {
  //     AppLogger.d('Error: ${result.message}');
  //   }
  // }

  final isMobileVerified = false.obs;
  final mobileOtpTimer = 0.obs;
  Timer? _mobileOtpTimer;

  void startMobileOtpTimer() {
    mobileOtpTimer.value = 60; // 60 seconds countdown
    _mobileOtpTimer?.cancel();

    _mobileOtpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mobileOtpTimer.value > 0) {
        mobileOtpTimer.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> postSendOTPToMobile() async {
    // Validate phone number before sending
    if (fanPhoneNumberController.text.isEmpty) {
      CustomToast.show(
        "Please enter phone number".tr,
      );
      return;
    }

    final phoneValidation = validatePhone(fanPhoneNumberController.text);
    if (phoneValidation != null) {
      CustomToast.show(
        phoneValidation.toString(),
      );
      return;
    }

    try {
      final result = await apiProvider.post(
        ApiEndpoints.sendOTPOnMobile,
        {
          "userId": fanUser.value?.id,
          "mobile": fanPhoneNumberController.text,
        },
        isLoading: isLoading,
      );

      if (result.success) {
        AppLogger.d(result.data);

        // Update UI state
        showMobileOtpField.value = true;
        showOtpMobileButton.value = false;

        // Start timer
        startMobileOtpTimer();

        CustomToast.show(
          result.data['message'] ?? "OTP sent successfully to your mobile".tr,
        );
      } else {
        AppLogger.e('Error: ${result.message}');
        CustomToast.show(
          result.message ?? "Failed to send OTP. Please try again.".tr,
        );
      }
    } catch (e) {
      AppLogger.e('Exception in postSendOTPToMobile: $e');
      CustomToast.show(
        "An error occurred. Please try again.".tr,
      );
    }
  }

  Future<void> postVerifyMobileOTP() async {
    // Validate OTP before verifying
    if (phoneOtpController.text.isEmpty) {
      CustomToast.show(
        "Please enter OTP".tr,
      );
      return;
    }

    if (phoneOtpController.text.length < 4) {
      CustomToast.show(
        "Please enter valid OTP".tr,
      );
      return;
    }

    try {
      final result = await apiProvider.post(
        ApiEndpoints.verifyOTPOnMobile,
        {
          "userId": fanUser.value?.id,
          "mobile": fanPhoneNumberController.text,
          "otp": phoneOtpController.text,
        },
        isLoading: isLoading,
      );

      if (result.success) {
        AppLogger.d(result.data);

        // Update UI state
        isMobileVerified.value = true;
        showMobileOtpField.value = false;
        _mobileOtpTimer?.cancel();

        CustomToast.show(
          result.data['message'] ?? "Mobile number verified successfully".tr,
        );

        // Clear OTP field
        phoneOtpController.clear();
      } else {
        AppLogger.e('Error: ${result.message}');
        CustomToast.show(
          result.message ?? "Invalid OTP. Please try again.".tr,
        );
      }
    } catch (e) {
      AppLogger.e('Exception in postVerifyMobileOTP: $e');
      CustomToast.show(
        "An error occurred. Please try again.".tr,
      );
    }
  }

  void resetMobileVerification() {
    showOtpMobileButton.value = true;
    showMobileOtpField.value = false;
    isMobileVerified.value = false;
    mobileOtpTimer.value = 0;
    _mobileOtpTimer?.cancel();
    phoneOtpController.clear();
  }

  Future<void> getFanDetails() async {
    final result = await apiProvider.get(
      ApiEndpoints.getfanDetails,
      isLoading: isUserDetailsLoading,
      query: {'userId': fanUser.value?.id ?? ''},
    );

    if (result.success) {
      userDetails.value = UserDetailsResponse.fromJson(result.data);
      final user = userDetails.value?.data?.user;
      changeNameController.text = user?.name == null ? '' : user?.name ?? '';
      changeUserNameController.text =
          user?.username == null ? '' : user?.username ?? '';
      fanAgeController.text =
          user?.age == null ? '' : user?.age.toString() ?? '';
      fanGenderController.text = user?.gender == null ? '' : user?.gender ?? '';
      selectedGender.value = user?.gender == null
          ? ''
          : user?.gender == "MALE"
              ? "Male"
              : user?.gender == "FEMALE"
                  ? "Female"
                  : user?.gender == "PREFER_NOT_TO_SAY"
                      ? "Prefer not to say"
                      : '';
      fanCountryController.text =
          user?.country == null ? '' : user?.country ?? '';
      selectedCountry.value = user?.country == null ? '' : user?.country ?? '';
      fanEmailController.text = user?.email == null ? '' : user?.email ?? '';
      fanPhoneNumberController.text =
          user?.mobile == null ? '' : user?.mobile ?? '';
      // Convert API date format to display format (DD/MM/YYYY)
      if (user?.dateOfBirth != null && user!.dateOfBirth!.isNotEmpty) {
        final parsedDate = parseDateFromAPI(user.dateOfBirth!);
        final formattedDate = formatDateForDOB(parsedDate);
        fanDateofbirthController.text = formattedDate;
        dobText.value = formattedDate;
        print("✅ Final Displayed Date: ${fanDateofbirthController.text}");
      } else {
        fanDateofbirthController.text = '';
        print("⚠️ Date of Birth is null or empty");
      }

      userEmail = user?.email;
      userMobile = user?.mobile;
    } else if (result.error != null) {
      AppLogger.d(result.error);
    }
  }

  DateTime parseDateFromAPI(String dateStr) {
    try {
      if (dateStr.isEmpty) return DateTime(2000, 1, 1);

      print("📅 API Date Received: $dateStr");

      // Try ISO format first (yyyy-MM-dd or yyyy-MM-ddTHH:mm:ss)
      final isoDate = DateTime.tryParse(dateStr);
      if (isoDate != null) {
        print("📅 Parsed as ISO: $isoDate");
        return isoDate;
      }

      // Try DD/MM/YYYY format
      if (dateStr.contains('/')) {
        final parts = dateStr.split('/');
        if (parts.length == 3) {
          final date = DateTime(
            int.parse(parts[2]), // year
            int.parse(parts[1]), // month
            int.parse(parts[0]), // day
          );
          print("📅 Parsed as DD/MM/YYYY: $date");
          return date;
        }
      }

      // Try DD-MM-YYYY format
      if (dateStr.contains('-') && dateStr.split('-')[0].length <= 2) {
        final parts = dateStr.split('-');
        if (parts.length == 3) {
          final date = DateTime(
            int.parse(parts[2]), // year
            int.parse(parts[1]), // month
            int.parse(parts[0]), // day
          );
          print("📅 Parsed as DD-MM-YYYY: $date");
          return date;
        }
      }

      return DateTime(2000, 1, 1);
    } catch (e) {
      print("❌ Date parsing error: $e");
      return DateTime(2000, 1, 1);
    }
  }

// Parse date from display format (DD/MM/YYYY) back to DateTime
  DateTime parseDateFromDOB(String dateStr) {
    try {
      if (dateStr.isEmpty) return DateTime(2000, 1, 1);

      // Handle DD/MM/YYYY format (display format)
      if (dateStr.contains('/')) {
        final parts = dateStr.split('/');
        if (parts.length == 3) {
          return DateTime(
            int.parse(parts[2]), // year
            int.parse(parts[1]), // month
            int.parse(parts[0]), // day
          );
        }
      }

      // Fallback to tryParse for other formats
      return DateTime.tryParse(dateStr) ?? DateTime(2000, 1, 1);
    } catch (e) {
      return DateTime(2000, 1, 1);
    }
  }

// Format DateTime to DD/MM/YYYY for display
  String formatDateForDOB(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

// Format DateTime to yyyy-MM-dd for API
  String formatDateForAPI(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<bool> updateFanUserProfileDetails() async {
    final result = await apiProvider.put(
        ApiEndpoints.updateFanUserProfileDetails,
        {
          "userId": fanUser.value?.id ?? "",
          "name": changeNameController.text,
          "username": changeUserNameController.text
        },
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("update profile details ${result.data}");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
    }
  }

  Future<void> updateFanProfilePicture() async {
    MediaPickerController mediaPickerController = Get.isRegistered()
        ? Get.find<MediaPickerController>()
        : Get.put(MediaPickerController());
    FanLandingController fanLandingController = Get.isRegistered()
        ? Get.find<FanLandingController>()
        : Get.put(FanLandingController());

    final picked = mediaPickerController.selectedImages.first;

    final filePath = picked.path;

    if (filePath == null) {
      AppLogger.d("No file path found for mobile upload");
      return;
    }

    final formData = m_file.FormData.fromMap({
      'file': await m_file.MultipartFile.fromFile(
        filePath,
        filename: picked.name,
      ),
    });

    final result = await apiProvider.post(
      "${ApiEndpoints.updateFanProfilePicture}?userId=${fanUser.value?.id}",
      formData,
      isLoading: isEditProfileLoading,
    );

    AppLogger.d("updated profile picture ${result.data}");

    if (result.success) {
      final newUrl = result.data['data']?['user']?['profilePicture'];

      if (newUrl == null) {
        AppLogger.e("Profile picture URL not found in response.");
        return;
      }

      fanLandingController.userDetails.value =
          fanLandingController.userDetails.value?.copyWith(
        data: fanLandingController.userDetails.value?.data?.copyWith(
          user: fanLandingController.userDetails.value?.data?.user?.copyWith(
            profilePicture: newUrl,
          ),
        ),
      );

      fanLandingController.userDetails.refresh();

      AppLogger.d("Profile picture updated: $newUrl");
    }
  }

  Future<void> submitFanQuery() async {
    final result = await apiProvider.post(
        ApiEndpoints.postFanQuery,
        {
          "userId": fanUser.value?.id,
          "email": fanEmailController.text,
          "message": messageController.text,
        },
        isLoading: isSubmitQueryLoading);

    if (result.success) {
      AppLogger.d("query details ${result.data}");
      Get.back();
      messageController.clear();
      CustomToast.show("Query submitted successfully");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<void> updateFanPreferences() async {
    AppLogger.d("the selected lang is ${selectedLang.value}");

    final result = await apiProvider.put(
      ApiEndpoints.updateFanPreferences,
      {
        "userId": fanUser.value?.id,
        "pushNotifications": fanPushNotifications.value,
        "commentRespond": fanCommentResponse.value,
        "preferredLanguage": selectedLang.value == 'en' ? 'ENGLISH' : 'SPANISH'
      },
      isLoading: isAthletePreferencesLoading,
    );

    if (result.success) {
      AppLogger.d("update profile details ${result.data}");

      // FIX: Read the "preferences" map
      final Map<String, dynamic> prefs =
          result.data["data"]["preferences"] ?? {};

      // FIX: Use safe casting
      final bool resFanPushNotifications =
          (prefs["pushNotifications"]) ?? false;

      final bool resFanCommentResponse = (prefs["commentRespond"]) ?? false;

      final String prefLang =
          (prefs["preferredLanguage"] ?? "").toString().toUpperCase();

      fanPushNotifications.value = resFanPushNotifications;
      fanCommentResponse.value = resFanCommentResponse;
      selectedLang.value = prefLang == "ENGLISH" ? "en" : "es";
    } else {
      AppLogger.d(result.error);
    }
  }
}

// Social Media Item Model
class SocialMediaItem {
  final String name;
  final Image image;
  final Color color;
  final String urlHint;
  final String key;

  SocialMediaItem({
    required this.name,
    required this.image,
    required this.color,
    required this.urlHint,
    required this.key,
  });
}

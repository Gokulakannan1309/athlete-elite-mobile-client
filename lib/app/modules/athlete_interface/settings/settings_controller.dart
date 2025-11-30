import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/athlete_user.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/archeived_post_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/fan_landing_controller.dart';
import 'package:athlete_elite/app/modules/media_upload/media_picker_controller.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/common_reusable_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
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

      archivedScrollController = ScrollController();
      archivedScrollController.addListener(paginationListener);
    } else {
      selectedGender.value = normalizeGender(fanGenderController.text);
      getFanLoggedInUser();
      getFanDetails();
      fanEmailController.addListener(_emailFieldLogic);
      fanPhoneNumberController.addListener(_phoneFieldLogic);
    }
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

    final result = await apiProvider.patch(
        ApiEndpoints.updateAthleteProfilePicture, formData,
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("update profile picture ${result.data}");
    } else {
      AppLogger.d(result.error);
    }
  }

  Future<bool> deleteAthleteProfilePicture() async {
    final result = await apiProvider.delete(
        ApiEndpoints.deleteAthleteProfilePicture,
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("delete profile picture ${result.data}");
      return result.success;
    } else {
      AppLogger.d(result.error);
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
    isQueryValid.value = messageController.text.isNotEmpty;
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
  final changeBioController = TextEditingController();

  void toggleStudioPushNotifications(bool value) {
    studioPushNotifications.value = value;
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

  void selectLanguage(String lang) {
    selectedLang.value = lang;
    if (isAthlete) {
      updateAthletePreferences();
    } else {
      updateFanPreferences();
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
  RxBool isQueryValid = false.obs;
  final formKeyForAthleteQuery = GlobalKey<FormState>();
  final RxBool isSubmitting = false.obs;

  //Fan Interface
  final RxBool showOtpButtonForRow4 = false.obs;
  final RxBool showOtpButtonForRow5 = false.obs;

  @override
  void onClose() {
    messageController.dispose();
    newPasswordController.removeListener(updateChangepasswordButtonState);
    confirmPasswordController.removeListener(updateChangepasswordButtonState);
    messageController.removeListener(_updateSubmitQueryButtonState);
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> logout(bool isAthlete) async {
    print("the isAthlete value is $isAthlete");
    if (isAthlete) {
      await Hive.box<AthleteUser>('athlete_user').clear();
      await Hive.box('auth_token').clear();
    } else {
      await Hive.box<FanUserModel>('fan_user').clear();
      await Hive.box('auth_token').clear();
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
    final result = await apiProvider.delete(
        ApiEndpoints.deleteFanProfilePicture,
        data: {"userId": fanUser.value?.id},
        isLoading: isEditProfileLoading);

    if (result.success) {
      AppLogger.d("delete profile picture ${result.data}");
      return result.success;
    } else {
      AppLogger.d(result.error);
      return false;
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

  final genderDropdownKey = GlobalKey();
  final selectedGender = ''.obs;
  void openGenderDropdownMenu() {
    final key = genderDropdownKey;

    if (key?.currentContext != null) {
      GestureBinding.instance.handlePointerEvent(
        PointerDownEvent(
          position: (key!.currentContext!.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero),
        ),
      );
    }
  }

  Future<void> updateFanUserDetails() async {
    AppLogger.d(
        "the request body is ${fanUser.value?.id} ${fanAgeController.text} ${fanGenderController.text} ${fanCountryController.text} ${fanDateofbirthController.text}");
    final result = await apiProvider.put(
      ApiEndpoints.userFanDetails,
      {
        "userId": fanUser.value?.id,
        "age": int.parse(fanAgeController.text),
        "gender": "Male",
        "country": "India",
        "dateOfBirth": "1997-09-23"
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

  Future<void> postSendOTPToMobile() async {
    final result = await apiProvider.post(
      ApiEndpoints.sendOTPOnMobile,
      {"userId": fanUser.value?.id, "mobile": fanPhoneNumberController.text},
      isLoading: isLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      showOtpButtonForRow4.value = true;
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> postVerifyMobileOTP() async {
    final result = await apiProvider.post(
      ApiEndpoints.verifyOTPOnMobile,
      {
        "userId": fanUser.value?.id,
        "mobile": fanPhoneNumberController.text,
        "otp": phoneOtpController.text
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

  Future<void> getFanDetails() async {
    final result = await apiProvider.get(
      ApiEndpoints.getfanDetails,
      isLoading: isUserDetailsLoading,
      query: {'userId': fanUser.value?.id ?? ''},
    );

    if (result.success) {
      userDetails.value = UserDetailsResponse.fromJson(result.data);
      final user = userDetails.value?.data?.user;
      changeNameController.text =
          user?.username == null ? '' : user?.username ?? '';
      fanAgeController.text =
          user?.age == null ? '' : user?.age.toString() ?? '';
      fanGenderController.text = user?.gender == null ? '' : user?.gender ?? '';
      fanCountryController.text =
          user?.country == null ? '' : user?.country ?? '';
      fanEmailController.text = user?.email == null ? '' : user?.email ?? '';
      fanPhoneNumberController.text =
          user?.mobile == null ? '' : user?.mobile ?? '';
      fanDateofbirthController.text =
          user?.dateOfBirth == null ? '' : user?.dateOfBirth ?? '';
      userEmail = user?.email;
      userMobile = user?.mobile;
    } else if (result.error != null) {
      AppLogger.d(result.error);
    }
  }

  Future<bool> updateFanUserProfileDetails() async {
    final result = await apiProvider.put(
        ApiEndpoints.updateFanUserProfileDetails,
        {
          "userId": fanUser.value?.id ?? "",
          "name": changeNameController.text,
          "username": changeNameController.text
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
      "${ApiEndpoints.updateFanProfilePicture}?userId=${fanUser.value?.id}",
      formData,
      isLoading: isEditProfileLoading,
    );

    if (result.success) {
      AppLogger.d("update profile picture ${result.data}");
    } else {
      AppLogger.d(result.error);
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

import 'dart:async';
import 'package:athlete_elite/app/constants/api_endpoints.dart';
import 'package:athlete_elite/app/data/models/fan_interface/fan_user_model.dart';
import 'package:athlete_elite/app/data/models/fan_interface/response_model/track_all_athlete_by_fan_view/athletes_response_fan_view.dart';
import 'package:athlete_elite/app/data/providers/api_provider.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:athlete_elite/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FanSignupController extends GetxController {
  ApiProvider apiProvider =
      Get.isRegistered() ? Get.find<ApiProvider>() : Get.put(ApiProvider());
  final signUpFormKey = GlobalKey<FormState>();
  final signUpOtpFormKey = GlobalKey<FormState>();
  final signupAboutMeFormKey = GlobalKey<FormState>();
  final emailOrUsernameOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  final otpController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  final languages = ['English', 'Spanish'].obs;
  final selectedLanguage = 'English'.obs;

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }

  RxList<AthleteFanView> allAthletes = <AthleteFanView>[].obs;
  var selectedAthleteIds = <String>[].obs;

  var isLoadingMoreAthletes = false.obs;
  var hasMoreAllAthletes = true.obs;
  late ScrollController allAthletesScrollController;

  var getAllAthletePage = 1.obs;
  var getAllAthleteLimit = 10.obs;
  final getAllAthletesLoading = false.obs;
  RxInt secondsRemaining = 30.obs;
  Timer? _timer;

  // Reactive variables
  RxString selectedCountry = ''.obs;
  RxString selectedGender = ''.obs;

  final isLoading = false.obs;
  final isGSSOLoading = false.obs;
  final isButtonDisabled = true.obs;
  final isAboutMeButtonDisabled = true.obs;
  final trackMultipleAthletesLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrUsernameOrPhoneController.addListener(_updateButtonState);
    selectedGender.listen((_) => _aboutMeButtonState());
    selectedCountry.listen((_) => _aboutMeButtonState());
    selectedLanguage.listen((_) => _aboutMeButtonState());

    startOtpTimer();
    allAthletesScrollController = ScrollController();
    allAthletesScrollController.addListener(paginationListenerForAllAthletes);
  }

  void startOtpTimer() {
    secondsRemaining.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtpTimer() async {
    final result = await apiProvider.post(
      ApiEndpoints.fanSignupResendOtp,
      {
        'identifier': emailOrUsernameOrPhoneController.text,
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("OTP successfully has been resent to your email.");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  void _updateButtonState() {
    isButtonDisabled.value = emailOrUsernameOrPhoneController.text.isEmpty;
  }

  void _aboutMeButtonState() {
    isAboutMeButtonDisabled.value = selectedGender.value.isEmpty ||
        selectedCountry.value.isEmpty ||
        selectedLanguage.value.isEmpty;
  }

  var routineItems = <Map<String, dynamic>>[
    {
      'images': [
        'assets/images/routine.png',
        'assets/images/profile.png',
        'assets/images/get_to_know.png',
        'assets/images/routine.png',
        'assets/images/advice.png',
        'assets/images/sports.png',
        'assets/images/profile.png',
        'assets/images/advice.png',
        'assets/images/advice.png',
        'assets/images/sports.png',
        'assets/images/profile.png',
        'assets/images/advice.png',
      ],
    },
  ].obs;

  Future<bool> onSignupRequest(String otpType, bool isAthlete) async {
    final result = await apiProvider.post(
      ApiEndpoints.fanSignupRequest,
      {'identifier': emailOrUsernameOrPhoneController.text},
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(
          "result.data['data']['userId'] ${result.data['data']['userId']}");
      AppLogger.d(result.data);
      CustomToast.show("OTP has been sent to your $otpType.");
      startOtpTimer();
      NavigationHelper.toNamed(
        AppRoutes.fanSignupOTPView,
        arguments: {'isAthlete': false},
        transition: Transition.rightToLeft,
      );
      return result.success;
    } else {
      AppLogger.d('Error: ${result.message}');
      return result.success;
    }
  }

  Future<void> getAllAthleteList({bool isRefresh = true}) async {
    if (isRefresh) {
      getAllAthletePage.value = 1;
      allAthletes.clear();
      hasMoreAllAthletes.value = true;
    }

    final result = await apiProvider.get(
      ApiEndpoints.getAllAthletes,
      isLoading: getAllAthletesLoading,
      query: {
        'page': getAllAthletePage.value.toString(),
        'limit': getAllAthleteLimit.value.toString(),
      },
    );

    if (result.success) {
      final data = AthletesResponseFanView.fromJson(result.data);

      allAthletes.addAll(data.data.formatted);

      if (data.data.pagination.currentPage >= data.data.pagination.totalPages) {
        hasMoreAllAthletes(false);
      }
    }
  }

  Future<void> trackMultipleAthletes() async {
    final userBox = Hive.box<FanUserModel>('fan_user');
    await userBox.get('current_user');
    final result = await apiProvider.post(
      ApiEndpoints.trackMultipleAthleteProfiles,
      {
        'userId': userBox.values.single.id,
        'athleteIds': selectedAthleteIds.toList(),
      },
      isLoading: trackMultipleAthletesLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("Successfully Tracked Selected Athletes");
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  void toggleSelect(String id) {
    if (selectedAthleteIds.contains(id)) {
      selectedAthleteIds.remove(id);
    } else {
      selectedAthleteIds.add(id);
    }
  }

  Future<void> loadMoreAllAthletes() async {
    if (!hasMoreAllAthletes.value) return;

    isLoadingMoreAthletes.value = true;
    getAllAthletePage.value++;

    await getAllAthleteList(isRefresh: false);
    isLoadingMoreAthletes.value = false;
  }

  void paginationListenerForAllAthletes() {
    if (allAthletesScrollController.position.pixels >=
            allAthletesScrollController.position.maxScrollExtent - 200 &&
        !isLoadingMoreAthletes.value &&
        hasMoreAllAthletes.value) {
      loadMoreAllAthletes();
    }
  }

  Future<void> onSignupOTPVerify(bool isAthlete) async {
    final result = await apiProvider.post(
      ApiEndpoints.fanSignupVerify,
      {
        'identifier': emailOrUsernameOrPhoneController.text,
        'otp': otpController.text
      },
      isLoading: isLoading,
    );
    if (result.success) {
      AppLogger.d(result.data);
      CustomToast.show("OTP has been verified. Please reset your password.");
      String userId = result.data['data']['userId'];
      NavigationHelper.toNamed(
        AppRoutes.fanResetPasswordView,
        arguments: {'isAthlete': isAthlete, 'userId': userId},
        transition: Transition.rightToLeft,
      );
    } else {
      AppLogger.d('Error: ${result.message}');
    }
  }

  Future<void> onSignupAboutMe(
      bool isAthlete, String userId, String accessToken) async {
    AppLogger.d("the user id is $userId");
    AppLogger.d("the access token is $accessToken");
    AppLogger.d(
        "the first name is ${firstnameController.text}, last name is ${lastnameController.text}, username is ${usernameController.text}, age is ${ageController.text}, gender is ${selectedGender.value}, country is ${selectedCountry.value}, language is ${selectedLanguage.value}");
    apiProvider.dio.options.headers["Authorization"] = "Bearer $accessToken";
    final result = await apiProvider.post(
      ApiEndpoints.fanFirstTimeAboutMe,
      {
        "userId": userId,
        "firstName": firstnameController.text,
        "lastName": lastnameController.text,
        "username": usernameController.text,
        "age": int.tryParse(ageController.text) ?? 0,
        "gender": selectedGender.value,
        "country": selectedCountry.value,
        "language": selectedLanguage.value,
      },
      isLoading: isLoading,
    );

    if (result.success) {
      AppLogger.d(result.data);

      final data = result.data['data'];
      final userJson = data['user'];

      final user = FanUserModel.fromJson({
        'id': userJson['id'],
        'email': userJson['email'],
        'userName': userJson['username'],
        'name': userJson['name'],
        'role': userJson['role'],
        'status': userJson['status'],
      });

      final userBox = Hive.box<FanUserModel>('fan_user');
      await userBox.put('current_user', user);

      final tokenBox = await Hive.openBox('auth_token');
      await tokenBox.put('access_token', accessToken);
      final token = accessToken;
      await Get.find<ApiProvider>().setAccessToken(accessToken);

      CustomToast.show("Successfully Saved Details");
      getAllAthleteList();

      NavigationHelper.toNamed(
        AppRoutes.trackAthleteSelectScreen,
        arguments: {'isAthlete': isAthlete},
        transition: Transition.rightToLeft,
      );
    } else {
      AppLogger.d('Error: ${result.error}');
    }
  }

  @override
  void onClose() {
    emailOrUsernameOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

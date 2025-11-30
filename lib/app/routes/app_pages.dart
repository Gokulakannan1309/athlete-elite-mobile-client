import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/athelete_landing_binding.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/studio/upload_from_studio/studio_post_select_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/add_intro_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/athlete_post_category_select_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/athelete_landing/sub_screens/edit_post_screen.dart'
    show EditPostScreen;
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_binding.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/athelete_home_view.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/upload_section/athlete_channel_upload.dart';
import 'package:athlete_elite/app/modules/athlete_interface/home/video_reel_view/video_reel_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/login/login_view.dart';
import 'package:athlete_elite/app/modules/athlete_interface/preffered_language/preffered_language_binding.dart';
import 'package:athlete_elite/app/modules/athlete_interface/reset_password/forgot_password/forgot_password_otp_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/reset_password/forgot_password/forgot_pasword_request_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/add_social_links_screen.dart';
import 'package:athlete_elite/app/modules/athlete_interface/settings/archeived_post_screen.dart'
    show ArcheivedPostScreen;
import 'package:athlete_elite/app/modules/athlete_interface/settings/athlete_setting_view.dart'
    show AthleteSettingView;
import 'package:athlete_elite/app/modules/athlete_interface/settings/user_preference_screen.dart'
    show AthleteUserPreferencesScreen;
import 'package:athlete_elite/app/modules/common_set_profile/set_profile_pic_binding.dart';
import 'package:athlete_elite/app/modules/common_set_profile/set_profile_pic_view.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/athlete_profile_view.dart';
import 'package:athlete_elite/app/modules/fan_interface/athlete_profile/athlete_profile_view_binding.dart';
import 'package:athlete_elite/app/modules/fan_interface/landing/story_view/story_viewer_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/reset_password/fan_reset_password_binding.dart';
import 'package:athlete_elite/app/modules/fan_interface/reset_password/fan_reset_password_view.dart';
import 'package:athlete_elite/app/modules/fan_interface/signup/fan_signup_binding.dart';
import 'package:athlete_elite/app/modules/fan_interface/signup/signup_sub_screen/signup_otp_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/signup/signup_sub_screen/track_athlete_select_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/user_details/fan_user_preference_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/user_details/user_detail_edit_screen.dart';
import 'package:athlete_elite/app/modules/fan_interface/video_reel_view/video_reel_screen_fan.dart';
import 'package:athlete_elite/app/modules/splash/splash_view.dart';
import 'package:athlete_elite/app/services/no_internet_screen.dart';
import 'package:get/get.dart';
import '../modules/athlete_interface/athelete_landing/athelete_landing_view.dart';
import '../modules/athlete_interface/athelete_landing/sub_screens/add_intro_edit_screen.dart';
import '../modules/athlete_interface/athelete_landing/sub_screens/athlete_content_tag_screen.dart';
import '../modules/athlete_interface/athelete_landing/sub_screens/fan_follow_list_screen.dart';
import '../modules/athlete_interface/athelete_landing/sub_screens/fav_sports_moment_select_screen.dart';
import '../modules/athlete_interface/athelete_landing/studio/send_to_studio_screen.dart';
import '../modules/athlete_interface/home/athelete_add_story/add_story_screen.dart';
import '../modules/athlete_interface/login/login_binding.dart';
import '../modules/athlete_interface/preffered_language/preffered_language_view.dart';
import '../modules/athlete_interface/reset_password/reset_password_binding.dart';
import '../modules/athlete_interface/reset_password/reset_password_view.dart';
import '../modules/athlete_interface/settings/change_password_screen.dart';
import '../modules/athlete_interface/settings/edit_profile_screen.dart';
import '../modules/athlete_interface/settings/help_support_screen.dart';
import '../modules/athlete_interface/settings/settings_binding.dart';
import '../modules/athlete_interface/settings/submit_brands_screen.dart';
import '../modules/athlete_interface/settings/user_details_screen.dart';
import '../modules/fan_interface/landing/fan_landing_binding.dart';
import '../modules/fan_interface/landing/fan_landing_view.dart';
import '../modules/fan_interface/landing/sub_screens/explore_categories.dart';
import '../modules/fan_interface/signup/fan_signup_view.dart';
import '../modules/fan_interface/signup/signup_sub_screen/about_me_detail_screen.dart';
import '../modules/fan_interface/track_athlete/fan_track_athlete_screen.dart';
import '../modules/onboard_view/onboard_screen_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardScreenView,
      page: () => OnboardScreenView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.noInternetScreen,
      page: () => NoInternetScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return LoginView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteResetPassword,
      // page: () => const ResetPasswordView(),
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ResetPasswordView(
          isAthlete: args?['isAthlete'] ?? 'default',
          isFirstTimeLogin: args?['isFirstTimeLogin'] ?? false,
          userId: args?['userId'] ?? null,
          resetToken: args?['resetToken'] ?? '',
        );
      },
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.prefferedLanguageScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return PrefferedLanguageView(
          isAthlete: args?['isAthlete'] ?? 'default',
          userId: args?['userId'] ?? '',
        );
      },
      binding: PrefferedLanguageBinding(),
    ),
    GetPage(
      name: AppRoutes.setProfilePicScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return SetProfilePicView(isAthlete: args?['isAthlete'] ?? true);
      },
      binding: SetProfilePicBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordRequestScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ForgotPasswordRequestScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordOTPScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ForgotPasswordOTPScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
          userId: args?['userId'],
        );
      },
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteLandingScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AtheleteLandingView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteHomeScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AtheleteHomeView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteAddIntroScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AddIntroScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteaddIntroEditScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AddIntroEditScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.atheletefavSportsSelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FavSportsMomentSelectScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteAddStoryScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AddStoryScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteFanListScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanFollowListScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AtheleteHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteSendToStudioScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return SendToStudioScreen(
            isAthlete: args?['isAthlete'] ?? 'default',
            mediaType: args?['mediaType'] ?? 'default',
            selectedMedia: args?['selectedMedia'] ?? 'default');
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.atheleteSelectPostFromStudioScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return StudioPostSelectScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'] ?? 'default',
          selectedMedia: args?['selectedMedia'] ?? 'default',
          contentItem: args?['contentItem'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athletePostContentTagScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteContentTagScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
          previewItem: args?['previewItem'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteUploadChannelSelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteChannelUpload(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteNewSchedulePostCategorySelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteNewPostShcedulePostCategorySelectScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteNewScheduleStoryCategorySelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteNewStoryShcedulePostCategorySelectScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteNewStoryPostReadyViewScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteNewStoryPostReadyViewScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteNewPostCategorySelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteNewPostCategorySelectScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'],
          selectedMedia: args?['selectedMedia'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteVideoReelView,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return VideoReelScreenFull(
          isAthlete: args?['isAthlete'] ?? 'default',
          reelsData: args?['reels'],
          startIndex: args?['startIndex'] ?? 0,
        );
      },
      binding: AtheleteHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteVideoReelViewForFan,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return VideoReelScreenFanView(
          isAthlete: args?['isAthlete'] ?? 'default',
          reelsData: args?['reels'],
          startIndex: args?['startIndex'] ?? 0,
        );
      },
      binding: FanLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.fanToViewStoriesScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return StoryViewerScreen(
          initialIndex: args?['initialIndex'] ?? 0,
          stories: args?['stories'],
        );
      },
      binding: FanLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.editPostScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EditPostScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
          isEditpostType: args?['isEditpostType'] ?? 'default',
          mediaType: args?['mediaType'] ?? 'default',
          selectedMedia: args?['selectedMedia'] ?? 'default',
          previewItem: args?['previewItem'] ?? 'default',
        );
      },
      binding: AtheleteLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteSettingScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteSettingView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteProfileViewForFan,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteProfileView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: AthleteProfileViewBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteUserDetailsScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteUserDetailsScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteUserPreferencesScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteUserPreferencesScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.athleteChangePasswordScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthleteChangePasswordScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.archeivedPostScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ArcheivedPostScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.addSocialLinksScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AddSocialLinksScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.helpAndSupportScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return HelpAndSupportScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.submitBrandsScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return SubmitBrandsScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return EditProfileScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.fanSignupView,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanSignupView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.aboutMeDetailScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AboutMeDetailScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
          userId: args?['userId'] ?? '',
        );
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.trackAthleteSelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return TrackAthleteSelectScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.fanLandingView,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanLandingView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: FanLandingBinding(),
    ),
    GetPage(
      name: AppRoutes.fanTrackAthleteScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanTrackAthleteScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.exploreCategories,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return ExploreCategories(
          isAthlete: args?['isAthlete'] ?? 'default',
          categoryName: args?['categoryName'],
        );
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.userDetailEditScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return UserDetailEditScreen(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.fanUserPreferenceScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanUserPreferenceScreen(
          isAthlete: args?['isAthlete'] ?? 'default',
        );
      },
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.fanSignupOTPView,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanSignupOTPView(isAthlete: args?['isAthlete'] ?? 'default');
      },
      binding: FanSignupBinding(),
    ),
    GetPage(
      name: AppRoutes.fanResetPasswordView,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return FanResetPasswordView(
          isAthlete: args?['isAthlete'] ?? 'default',
          userId: args?['userId'] ?? '',
        );
      },
      binding: FanResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.athletePostCategorySelectScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        return AthletePostCategorySelectScreen(
          sheetType: args?['sheetType'] ?? 'default',
          isAthlete: args?['isAthlete'] ?? 'default',
          mediaType: args?['mediaType'] ?? 'default',
          selectedMedia: args?['selectedMedia'] ?? [],
          previewItem: args?['previewItem'] ?? 'default',
        );
      },
      binding: FanResetPasswordBinding(),
    ),
  ];
}

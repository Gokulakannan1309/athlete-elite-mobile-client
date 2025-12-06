class ApiEndpoints {
  static const String athleteLogin = '/auth/athlete/login';
  static const String athleteFirstTimerResetPassword =
      '/auth/athlete/first-time-reset-password';
  static const String athleteResetPassword = '/auth/athlete/reset-password';
  static const String athleteForgotPasswordRequest =
      '/auth/athlete/forgot-password';
  static const String athleteForgotPasswordVerify = '/auth/athlete/verify-otp';
  static const String athleteForgotPasswordResendOtp =
      '/auth/athlete/resend-otp';
  static const String athleteLanguagePreference =
      '/auth/athlete/select-language';
  static const String athleteChangePassword = '/auth/athlete/change-password';

  //Set Profile Image
  static const String athleteSetProfileImage = '/athlete/profile/picture';

  //Go to Channel - Home View
  static const String homeSectionDetailsOfGoToChannel =
      '/athlete/go-to-channel/home-section';
  static const String removeFanFromTrack = '/athlete/go-to-channel/fans/';
  static const String getAthleteChannelCategories =
      '/athlete/go-to-channel/categories';
  static const String getAthleteChannelBrands = '/athlete/go-to-channel/brands';
  static const String postChannelToArchive = '/athlete/general-flows/channels/';
  static const String deleteChannelFromUpload =
      '/athlete/go-to-channel/channels/';

// Go to Channel - Intro
  static const String updateAtheleteIntroVideo =
      '/athlete/go-to-channel/home/intro/content';
  static const String updateAboutstoIntro =
      '/athlete/go-to-channel/home/intro/about';
  static const String addFavesportsmoments =
      '/athlete/go-to-channel/home/fav-sports-moments';
  static const String deleteFavSportsMoments =
      '/athlete/go-to-channel/home/fav-sports-moments/';
  static const String updateAtheleteaboutMe =
      '/athlete/go-to-channel/home/intro/about';

// Go to Channel - Categories
  static const String updateCategoryPoster =
      '/athlete/go-to-channel/home/categories/';
  static const String deleteCategoryPoster =
      '/athlete/go-to-channel/home/categories/';
  static const String updateBrandPoster = '/athlete/go-to-channel/home/brands/';
  static const String deleteBrandPoster = '/athlete/go-to-channel/home/brands/';

  static const String getAllAthleteDraftChannelList =
      '/athlete/content-management/drafts';

  static const String updateDraftChannelPost =
      '/athlete/content-management/drafts/';

  static const String postDraftChannelPost =
      '/athlete/content-management/drafts/';

  static const String deleteDraftChannelPost =
      '/athlete/content-management/drafts/';

  // Home - Upload
  static const String getAllAthleteUploadChannels =
      '/athlete/content-management/Uploads';

  // Home - Schedule
  static const String getAllAthleteScheduleChannels =
      '/athlete/content-management/scheduled';

  //Go to Channel - Content Library
  static const String getAllAthleteChannelsByCategory =
      '/athlete/go-to-channel/content-library/summary';

  static const String getAllAthleteFansList = '/athlete/go-to-channel/fans';

  //Settings - Profile
  static const String getUserProfileDetails = '/athlete/settings/profile';
  static const String deleteAthleteProfilePicture =
      '/athlete/settings/profile-picture';
  static const String updateAthleteProfilePicture =
      '/athlete/settings/profile-picture';

  //Settings - User Details
  static const String getAthleteUserDetails = '/athlete/settings/user-details';
  static const String updateAthleteUserDetails =
      '/athlete/settings/user-details';

  // Settings - Archived Content
  static const String getAthleteArchivedContent =
      '/athlete/settings/archived-channels';
  static const String restoreChannelFromArchive =
      '/athlete/settings/archived-channels/';
  static const String deleteChannelFromArchive =
      '/athlete/settings/archived-channels/';

  static const String submitAthleteQuery = '/athlete/settings/help-support';

  static const String getAthletePreferences = '/athlete/settings/preferences';

  static const String updateAthletePreferences =
      '/athlete/settings/preferences';

  static const String getAthleteAllSocialLinks =
      '/athlete/settings/social-links';
  static const String updateAthleteSocialLinks =
      '/athlete/settings/social-links';

  static const String submittedBrandsForAthlete =
      '/athlete/settings/submitted-brand';

  static const String deleteAthleteAccount = '/athlete/settings/account';

  static const String postAthleteChannelFromSchedule =
      '/athlete/content-management/scheduled/';

  static const String deleteAthleteChannelFromSchedule =
      '/athlete/content-management/scheduled/';

  static const String getAthleteAllContentStudio = '/athlete/send-to-studio';

  static const String updateContentStudio = '/athlete/send-to-studio';

  static const String postNewChannelViaDirectUpload =
      '/athlete/direct-content/channel';

  static const String updateLikeCountForChannel =
      '/athlete/general-flows/channels/';

  static const String getAllCommentsForChannel =
      '/athlete/general-flows/channels/';
  static const String postNewCommentForChannel =
      '/athlete/general-flows/channels/';

  static const String replyForCommentsInChannel =
      '/athlete/general-flows/channels/';

  static const String reactCommentForChannel =
      '/athlete/general-flows/comments/';

  static const String shareChannel = '/athlete/general-flows/channels/';

  static const String postNewStoryByAthlete = '/athlete/direct-content/story';
  static const String deleteStoryByAthlete =
      '/api/athlete/direct-content/story/';
  static const String getAllAthleteStories = '/athlete/direct-content/stories';
  static const String getAthleteStoryViews = '/athlete/general-flows/stories/';

  static const String getAllCategories = '/athlete/direct-content/categories';

  static const String getAllBrands = '/athlete/direct-content/brands';

  static const String getAllPrivateCommunityListForAthlete =
      '/athlete/go-to-channel/private-community';
  static const String postNewThoughtByAthlete =
      '/athlete/go-to-channel/private-community';
  static const String deletePrevateCommunityPostByAthlete =
      '/athlete/go-to-channel/private-community/';

  static const String getAthleteNotifications = '/athlete/notifications';
  static const String markAllAthleteNotificationsAsRead =
      '/athlete/notifications/mark-all-read';
  static const String markAthleteNotificationAsRead = '/athlete/notifications/';

  static const String fanLogin = '/auth/fan/login';
  static const String fanResetPassword = '/auth/fan/reset-password';
  static const String fanForgotPasswordRequest = '/auth/fan/forgot-password';
  static const String fanForgotPasswordVerify = '/auth/fan/verify-otp';
  static const String fanForgotPasswordResendOtp = '/auth/fan/resend-otp';

  static const String fanSignupRequest = '/auth/fan/signup';
  static const String fanSignupVerify = '/auth/fan/verify-signup-otp';
  static const String fanSignupResendOtp = '/auth/fan/resend-signup-otp';
  static const String fanfirstTimerSetPassword = '/auth/fan/set-password';
  static const String fanFirstTimeAboutMe = '/fan/profile/complete-profile';

  static const String getAllAthletes = '/fan/athletes';
  static const String getSearchedAthletes = '/fan/search/athletes';
  static const String getfanDetails = '/fan/profile/details';
  static const String getLatestContent = '/fan/home/latest-channels';

  static const String getAllCategoriesForFan = '/fan/home/categories';

  static const String getAllAthleteStoriesInFanView = '/fan/home/stories';

  static const String updateStoryViewedStatus = '/fan/home/stories/';

  static const String getAllChannelsByCategory = '/fan/home/categories/content';

  static const String getAllChannelInfiniteScrollList =
      '/fan/home/infinity-content';

  static const String getAllSportVision = '/fan/home/sports/vision';

  static const String getAllSportAllTrackAthletes = '/fan/home/sports/athletes';

  static const String getAllSportsCategories = '/fan/home/sports/categories';

  static const String getAllSportsBrands = '/fan/home/sports/brands';

  static const String getAllSportsCategoriesById =
      '/fan/home/sports/categories/content';

  static const String getAllSportsBrandsById =
      '/fan/home/sports/brands/content';

  static const String updateFanUserProfileDetails = '/fan/settings/profile';
  static const String updateFanProfilePicture =
      '/fan/profile/set-profile-picture';
  static const String userFanDetails = '/fan/settings/details';
  static const String sendOTPOnEmail = '/fan/settings/details/send-email-otp';
  static const String verifyOTPOnEmail =
      '/fan/settings/details/verify-email-otp';
  static const String sendOTPOnMobile = '/fan/settings/details/send-phone-otp';
  static const String verifyOTPOnMobile =
      '/fan/settings/details/verify-phone-otp';
  static const String updateFanPreferences = '/fan/settings/preferences';
  static const String deleteFanProfilePicture = '/fan/settings/profile-picture';

  static const String changeFanPassword = '/auth/fan/change-password';

  static const String getFanPreferences =
      '/fan/settings/preferences'; //  -----> TO DO
  static const String postFanQuery = '/fan/settings/help';

  // Athlete profile
  static const String getAthleteProfileByFan = '/fan/athletes/';
  static const String trackSingleAthleteProfile = '/fan/athletes/track';
  static const String trackMultipleAthleteProfiles = '/fan/track-athlete';
  static const String untrackSingleAthleteProfile = '/fan/athletes/track';
  static const String updateFcmDeviceToken = '/auth/save-device-token';

  static const String getUploadedStoryViewForAthlete =
      '/athlete/general-flows/stories';
  static const String actionChannelInFanView = '/fan/interactions/channels/';
  static const String reactCommentInFanView = '/fan/interactions/comments/';
  static const String getFanNotifications = '/fan/home/notifications';
  static const String getTrackedAthletesByFan = '/fan/athletes/tracked';
  static const String markAllNotificationsAsRead =
      '/fan/home/notifications/read';
}

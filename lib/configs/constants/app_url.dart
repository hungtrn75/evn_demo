class AppUrl {
  AppUrl._();

  static const String baseUrl = "https://survey.eofactory.ai/core/api/";
  static const String baseUrlWithoutPrefix =
      "https://survey.eofactory.ai/core/api/view?path=";
  static const String gravatar = "https://www.gravatar.com/avatar";
  static const String login = "auth/login";
  static const String signUp = "auth/mobile/register";
  static const String me = "auth/me";
  static const String updateProfile = "profile";
  static const String changePassword = "auth/change-password";
  static const String surveys = "mobile/surveys?per_page=all";
  static const String optionsWithoutRef =
      "mobile/options/{option}/choices?per_page=all&sort=name";
  static const String optionsWithRef = "mobile/options/{option}/choices";
  static const String submitSurvey = "mobile/surveys/{survey_id}/records";
  static const String farmStatistic = "mobile/surveys/{survey_id}/statistic";
  static const String farms = "mobile/surveys/{survey_id}/records";
  static const String farmByBoundsV2 = "http://123.25.15.198:6791/submit";
  static const String versionCode = "versions/latest";
  static const String getLocation = "territories/location";
}

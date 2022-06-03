class AppUrl {
  AppUrl._();

  static const String MAP_ACCESS_TOKEN =
      "pk.eyJ1IjoiaHVuZ3Rybjc1IiwiYSI6ImNraWUwdndkNDFvdjEyenM1aHI4MW03MmUifQ.wxzz5LIISMr_qcmdc4U-Cg";
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
  static const String vectorTileUrl =
      "https://vntilesgl.eofactory.ai/styles/demo/style.json";

  //https://api.mapbox.com/directions/v5/mapbox/driving-traffic/105.81003946417917%2C20.999086220327072%3B105.8133768462609%2C20.99444937359999?alternatives=false&geometries=geojson&language=vi&overview=full&steps=true&access_token=pk.eyJ1IjoiaHVuZ3Rybjc2IiwiYSI6ImNsM25ydzVlMzAyajAzY245ajZzOGFtcnYifQ.qQk5HscMJFKR-zemt0w0AA
  static const String directionUrl =
      "https://api.mapbox.com/directions/v5/mapbox/driving-traffic/{waypoints}?alternatives=false&geometries=geojson&language=vi&overview=full&steps=true&access_token=$MAP_ACCESS_TOKEN";

  // https://api-gtvtqs.eofactory.ai/api/autocomplete?search=c%C3%A1t&limit=5
  static const String geocodeUrl =
      "https://api-gtvtqs.eofactory.ai/api/autocomplete";

  //https://api-gtvtqs.eofactory.ai/api/reversegeocoding?lat=21.022188167867625&lng=105.8233922656733
  static const String reverseGeocodeUrl =
      "https://api-gtvtqs.eofactory.ai/api/reversegeocoding";
}

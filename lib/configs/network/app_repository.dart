import 'package:collect_data/configs/network/rest_client.dart';
import 'package:collect_data/models/reverse_geocoding.dart';
import 'package:collect_data/models/routing.dart';

class AppRepository {
  final RestClient restClient;

  AppRepository({required this.restClient});

  Future<ReverseGeocodingWrapper> reverseGeocoding(
      {required double latitude, required double longitude}) async {
    return restClient.reverseGeocoding(latitude, longitude);
  }

  Future<DirectionInfo> routing(String waypoints) {
    return restClient.getDirection(waypoints);
  }

  Future<List<ReverseGeocoding>> geocoding(String q) {
    return restClient.geocoding(q, 10);
  }
}

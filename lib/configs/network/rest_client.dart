import 'package:collect_data/models/reverse_geocoding.dart';
import 'package:collect_data/models/routing.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/app_url.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppUrl.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(AppUrl.versionCode)
  Future<dynamic> getVersion();

  @GET(AppUrl.directionUrl)
  Future<DirectionInfo> getDirection(
    @Path("waypoints") String waypoints,
  );

  @GET(AppUrl.geocodeUrl)
  Future<dynamic> geocoding(
    @Query("search") String search,
    @Query("limit") int limit,
  );

  @GET(AppUrl.reverseGeocodeUrl)
  Future<ReverseGeocodingWrapper> reverseGeocoding(
    @Query("lat") double latitude,
    @Query("lng") double longitude,
  );
}

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/app_url.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppUrl.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(AppUrl.versionCode)
  Future<dynamic> getVersion();
}

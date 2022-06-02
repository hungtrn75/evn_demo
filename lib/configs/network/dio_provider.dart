import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/app_variables.dart';
import '../injector/pref.dart';

class DioProvider {
  static Dio instance(LocalPref pref) {
    final dio = Dio();

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          // String? token = await pref.getString(AppVariable.TOKEN_KEY);
          // if (token != null) {
          //   options.headers["Authorization"] = 'Bearer $token';
          // }
          options.headers["Accept"] = 'application/json';
          log(
            "onRequest: ${options.uri}\n"
            "data=${options.data}\n"
            "method=${options.method}\n"
            "headers=${options.headers}\n"
            "queryParameters=${options.queryParameters}",
          );
          return handler.next(options);
        },
        onResponse: (Response response, handler) async {
          log("onResponse: $response");
          return handler.next(response);
        },
        onError: (DioError err, handler) async {
          return handler.next(err);
        },
      ),
    );
    return dio;
  }
}

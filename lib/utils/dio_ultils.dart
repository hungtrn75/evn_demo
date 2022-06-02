import 'package:dio/dio.dart';

class DioUtils {
  static String handleNormalError(e,
      {void Function(Map<String, dynamic>)? onErrorResponse}) {
    var result = "";
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          result = "Check your connection";
          break;
        case DioErrorType.receiveTimeout:
          result = "Unable to connect to the server";
          break;
        default:
          var defaultError = e.response?.statusMessage ?? e.error.toString();

          if (e.response?.data != null && e.response?.data is Map) {
            defaultError =
                e.response!.data['message'] as String? ?? defaultError;
            if (e.response!.data['errors'] != null && onErrorResponse != null) {
              onErrorResponse(e.response!.data['errors']);
            }
          }
          switch (e.response?.statusCode) {
            case 500:
              result = defaultError;
              break;
            case 404:
              result = defaultError;
              break;
            default:
              result = defaultError;
          }
      }
    } else {
      result = e.toString();
    }
    return result;
  }
}

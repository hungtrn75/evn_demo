// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://survey.eofactory.ai/core/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> getVersion() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'versions/latest',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getDirection(waypoints) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'https://api.mapbox.com/directions/v5/mapbox/driving-traffic/${waypoints}?alternatives=false&geometries=geojson&language=vi&overview=full&steps=true&access_token=',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> geocoding(search, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'limit': limit
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(
            _dio.options, 'https://api-gtvtqs.eofactory.ai/api/autocomplete',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> reverseGeocoding(latitude, longitude) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': latitude,
      r'limit': longitude
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'https://api-gtvtqs.eofactory.ai/api/reversegeocoding',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

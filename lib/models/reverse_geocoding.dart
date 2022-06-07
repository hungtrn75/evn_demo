import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:collect_data/utils/map_utils.dart';
import 'package:collect_data/utils/struct_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'reverse_geocoding.freezed.dart';

part 'reverse_geocoding.g.dart';

@freezed
class ReverseGeocodingWrapper with _$ReverseGeocodingWrapper {
  const factory ReverseGeocodingWrapper({ReverseGeocoding? data}) =
      _ReverseGeocodingWrapper;

  factory ReverseGeocodingWrapper.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodingWrapperFromJson(json);
}

@freezed
class ReverseGeocoding with _$ReverseGeocoding {
  const ReverseGeocoding._();
  const factory ReverseGeocoding({
    String? id,
    String? name,
    @JsonKey(name: 'feature_type') String? featureType,
    @JsonKey(name: 'province_name') String? provinceName,
    @JsonKey(name: 'district_name') String? districtName,
    @JsonKey(name: 'commune_name') String? communeName,
    dynamic? center,
    dynamic? geometry,
  }) = _ReverseGeocoding;

  factory ReverseGeocoding.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodingFromJson(json);

  Pair<LatLngBounds, dynamic> featureCollection() {
    final String type = geometry["type"] as String;
    switch (type) {
      case "MultiPolygon":
        {
          final coordinates = (geometry["coordinates"][0][0] as List<dynamic>)
              .map((e) => LatLng(e[1], e[0]))
              .toList();
          final bounds = boundsFromLatLngList(coordinates);
          return Pair(bounds, {
            "id": AppVariable.GEOCODING_FILL_LAYER,
            "type": "FeatureCollection",
            "features": [
              {
                "id": AppVariable.GEOCODING_FILL_LAYER,
                "type": "Feature",
                "properties": {
                  "id": AppVariable.GEOCODING_FILL_LAYER,
                },
                "geometry": geometry,
              },
              {
                "id": AppVariable.GEOCODING_OUTER_LINE_LAYER,
                "type": "Feature",
                "properties": {
                  "id": AppVariable.GEOCODING_OUTER_LINE_LAYER,
                },
                "geometry": geometry,
              },
            ]
          });
        }
      case "MultiLineString":
        {
          final coordinates = (geometry["coordinates"][0] as List<dynamic>)
              .map((e) => LatLng(e[1], e[0]))
              .toList();
          final bounds = boundsFromLatLngList(coordinates);
          return Pair(bounds, {
            "id": AppVariable.GEOCODING_LINE_LAYER,
            "type": "FeatureCollection",
            "features": [
              {
                "id": AppVariable.GEOCODING_LINE_LAYER,
                "type": "Feature",
                "properties": {
                  "id": AppVariable.GEOCODING_LINE_LAYER,
                },
                "geometry": geometry,
              },
            ]
          });
        }
      default:
        {
          final coordinates = [
            LatLng(geometry["coordinates"][1], geometry["coordinates"][0])
          ];
          final bounds = boundsFromLatLngList(coordinates);
          return Pair(bounds, {
            "id": AppVariable.GEOCODING_SYMBOL_LAYER,
            "type": "FeatureCollection",
            "features": [
              {
                "type": "Feature",
                "properties": {
                  "id": AppVariable.GEOCODING_SYMBOL_LAYER,
                },
                "geometry": geometry,
              },
            ]
          });
        }
    }
  }
}

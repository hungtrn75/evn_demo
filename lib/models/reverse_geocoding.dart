import 'package:freezed_annotation/freezed_annotation.dart';

part 'reverse_geocoding.freezed.dart';
part 'reverse_geocoding.g.dart';

@freezed
class ReverseGeocodingWrapper with _$ReverseGeocodingWrapper {
  const factory ReverseGeocodingWrapper({
    ReverseGeocoding? data
  }) = _ReverseGeocodingWrapper;

  factory ReverseGeocodingWrapper.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodingWrapperFromJson(json);
}

@freezed
class ReverseGeocoding with _$ReverseGeocoding {
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
}

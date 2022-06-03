// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_geocoding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReverseGeocodingWrapper _$$_ReverseGeocodingWrapperFromJson(
        Map<String, dynamic> json) =>
    _$_ReverseGeocodingWrapper(
      data: json['data'] == null
          ? null
          : ReverseGeocoding.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReverseGeocodingWrapperToJson(
        _$_ReverseGeocodingWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_ReverseGeocoding _$$_ReverseGeocodingFromJson(Map<String, dynamic> json) =>
    _$_ReverseGeocoding(
      id: json['id'] as String?,
      name: json['name'] as String?,
      featureType: json['feature_type'] as String?,
      provinceName: json['province_name'] as String?,
      districtName: json['district_name'] as String?,
      communeName: json['commune_name'] as String?,
      center: json['center'],
      geometry: json['geometry'],
    );

Map<String, dynamic> _$$_ReverseGeocodingToJson(_$_ReverseGeocoding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'feature_type': instance.featureType,
      'province_name': instance.provinceName,
      'district_name': instance.districtName,
      'commune_name': instance.communeName,
      'center': instance.center,
      'geometry': instance.geometry,
    };

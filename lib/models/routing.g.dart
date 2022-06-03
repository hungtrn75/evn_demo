// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DirectionInfo _$$_DirectionInfoFromJson(Map<String, dynamic> json) =>
    _$_DirectionInfo(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RouteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DirectionInfoToJson(_$_DirectionInfo instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

_$_RouteInfo _$$_RouteInfoFromJson(Map<String, dynamic> json) => _$_RouteInfo(
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'],
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => LegInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RouteInfoToJson(_$_RouteInfo instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'geometry': instance.geometry,
      'legs': instance.legs,
    };

_$_LegInfo _$$_LegInfoFromJson(Map<String, dynamic> json) => _$_LegInfo(
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => StepInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LegInfoToJson(_$_LegInfo instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'steps': instance.steps,
    };

_$_StepInfo _$$_StepInfoFromJson(Map<String, dynamic> json) => _$_StepInfo(
      maneuver: json['maneuver'] == null
          ? null
          : ManueverInfo.fromJson(json['maneuver'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'],
    );

Map<String, dynamic> _$$_StepInfoToJson(_$_StepInfo instance) =>
    <String, dynamic>{
      'maneuver': instance.maneuver,
      'duration': instance.duration,
      'distance': instance.distance,
      'geometry': instance.geometry,
    };

_$_ManueverInfo _$$_ManueverInfoFromJson(Map<String, dynamic> json) =>
    _$_ManueverInfo(
      instruction: json['instruction'] as String?,
      bearingAfter: (json['bearing_after'] as num?)?.toDouble(),
      bearingBefore: (json['bearing_before'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ManueverInfoToJson(_$_ManueverInfo instance) =>
    <String, dynamic>{
      'instruction': instance.instruction,
      'bearing_after': instance.bearingAfter,
      'bearing_before': instance.bearingBefore,
    };

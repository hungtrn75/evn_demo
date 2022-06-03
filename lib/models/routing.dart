import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'routing.freezed.dart';

part 'routing.g.dart';

@freezed
class DirectionInfo with _$DirectionInfo {
  const factory DirectionInfo({
    List<RouteInfo>? routes,
  }) = _DirectionInfo;

  factory DirectionInfo.fromJson(Map<String, dynamic> json) =>
      _$DirectionInfoFromJson(json);
}

@freezed
class RouteInfo with _$RouteInfo {
  const factory RouteInfo({
    double? duration,
    double? distance,
    dynamic geometry,
    List<LegInfo>? legs,
  }) = _RouteInfo;

  factory RouteInfo.fromJson(Map<String, dynamic> json) =>
      _$RouteInfoFromJson(json);
}

@freezed
class LegInfo with _$LegInfo {
  const factory LegInfo({
    double? duration,
    double? distance,
    List<StepInfo>? steps,
  }) = _LegInfo;

  factory LegInfo.fromJson(Map<String, dynamic> json) =>
      _$LegInfoFromJson(json);
}

@freezed
class StepInfo with _$StepInfo {
  const factory StepInfo({
    ManueverInfo? maneuver,
    double? duration,
    double? distance,
    dynamic geometry,
  }) = _StepInfo;

  factory StepInfo.fromJson(Map<String, dynamic> json) =>
      _$StepInfoFromJson(json);
}

@freezed
class ManueverInfo with _$ManueverInfo {
  const factory ManueverInfo({
    String? instruction,
    @JsonKey(name: 'bearing_after') double? bearingAfter,
    @JsonKey(name: 'bearing_before') double? bearingBefore,
  }) = _ManueverInfo;

  factory ManueverInfo.fromJson(Map<String, dynamic> json) =>
      _$ManueverInfoFromJson(json);
}

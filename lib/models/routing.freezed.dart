// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectionInfo _$DirectionInfoFromJson(Map<String, dynamic> json) {
  return _DirectionInfo.fromJson(json);
}

/// @nodoc
mixin _$DirectionInfo {
  List<RouteInfo>? get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectionInfoCopyWith<DirectionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionInfoCopyWith<$Res> {
  factory $DirectionInfoCopyWith(
          DirectionInfo value, $Res Function(DirectionInfo) then) =
      _$DirectionInfoCopyWithImpl<$Res>;
  $Res call({List<RouteInfo>? routes});
}

/// @nodoc
class _$DirectionInfoCopyWithImpl<$Res>
    implements $DirectionInfoCopyWith<$Res> {
  _$DirectionInfoCopyWithImpl(this._value, this._then);

  final DirectionInfo _value;
  // ignore: unused_field
  final $Res Function(DirectionInfo) _then;

  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      routes: routes == freezed
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>?,
    ));
  }
}

/// @nodoc
abstract class _$$_DirectionInfoCopyWith<$Res>
    implements $DirectionInfoCopyWith<$Res> {
  factory _$$_DirectionInfoCopyWith(
          _$_DirectionInfo value, $Res Function(_$_DirectionInfo) then) =
      __$$_DirectionInfoCopyWithImpl<$Res>;
  @override
  $Res call({List<RouteInfo>? routes});
}

/// @nodoc
class __$$_DirectionInfoCopyWithImpl<$Res>
    extends _$DirectionInfoCopyWithImpl<$Res>
    implements _$$_DirectionInfoCopyWith<$Res> {
  __$$_DirectionInfoCopyWithImpl(
      _$_DirectionInfo _value, $Res Function(_$_DirectionInfo) _then)
      : super(_value, (v) => _then(v as _$_DirectionInfo));

  @override
  _$_DirectionInfo get _value => super._value as _$_DirectionInfo;

  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$_DirectionInfo(
      routes: routes == freezed
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectionInfo implements _DirectionInfo {
  const _$_DirectionInfo({final List<RouteInfo>? routes}) : _routes = routes;

  factory _$_DirectionInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DirectionInfoFromJson(json);

  final List<RouteInfo>? _routes;
  @override
  List<RouteInfo>? get routes {
    final value = _routes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DirectionInfo(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectionInfo &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  _$$_DirectionInfoCopyWith<_$_DirectionInfo> get copyWith =>
      __$$_DirectionInfoCopyWithImpl<_$_DirectionInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectionInfoToJson(this);
  }
}

abstract class _DirectionInfo implements DirectionInfo {
  const factory _DirectionInfo({final List<RouteInfo>? routes}) =
      _$_DirectionInfo;

  factory _DirectionInfo.fromJson(Map<String, dynamic> json) =
      _$_DirectionInfo.fromJson;

  @override
  List<RouteInfo>? get routes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DirectionInfoCopyWith<_$_DirectionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) {
  return _RouteInfo.fromJson(json);
}

/// @nodoc
mixin _$RouteInfo {
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  dynamic get geometry => throw _privateConstructorUsedError;
  List<LegInfo>? get legs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteInfoCopyWith<RouteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteInfoCopyWith<$Res> {
  factory $RouteInfoCopyWith(RouteInfo value, $Res Function(RouteInfo) then) =
      _$RouteInfoCopyWithImpl<$Res>;
  $Res call(
      {double? duration,
      double? distance,
      dynamic geometry,
      List<LegInfo>? legs});
}

/// @nodoc
class _$RouteInfoCopyWithImpl<$Res> implements $RouteInfoCopyWith<$Res> {
  _$RouteInfoCopyWithImpl(this._value, this._then);

  final RouteInfo _value;
  // ignore: unused_field
  final $Res Function(RouteInfo) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
    Object? legs = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      legs: legs == freezed
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<LegInfo>?,
    ));
  }
}

/// @nodoc
abstract class _$$_RouteInfoCopyWith<$Res> implements $RouteInfoCopyWith<$Res> {
  factory _$$_RouteInfoCopyWith(
          _$_RouteInfo value, $Res Function(_$_RouteInfo) then) =
      __$$_RouteInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {double? duration,
      double? distance,
      dynamic geometry,
      List<LegInfo>? legs});
}

/// @nodoc
class __$$_RouteInfoCopyWithImpl<$Res> extends _$RouteInfoCopyWithImpl<$Res>
    implements _$$_RouteInfoCopyWith<$Res> {
  __$$_RouteInfoCopyWithImpl(
      _$_RouteInfo _value, $Res Function(_$_RouteInfo) _then)
      : super(_value, (v) => _then(v as _$_RouteInfo));

  @override
  _$_RouteInfo get _value => super._value as _$_RouteInfo;

  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
    Object? legs = freezed,
  }) {
    return _then(_$_RouteInfo(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      legs: legs == freezed
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<LegInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteInfo implements _RouteInfo {
  const _$_RouteInfo(
      {this.duration, this.distance, this.geometry, final List<LegInfo>? legs})
      : _legs = legs;

  factory _$_RouteInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RouteInfoFromJson(json);

  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final dynamic geometry;
  final List<LegInfo>? _legs;
  @override
  List<LegInfo>? get legs {
    final value = _legs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RouteInfo(duration: $duration, distance: $distance, geometry: $geometry, legs: $legs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteInfo &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.geometry, geometry) &&
            const DeepCollectionEquality().equals(other._legs, _legs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(geometry),
      const DeepCollectionEquality().hash(_legs));

  @JsonKey(ignore: true)
  @override
  _$$_RouteInfoCopyWith<_$_RouteInfo> get copyWith =>
      __$$_RouteInfoCopyWithImpl<_$_RouteInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteInfoToJson(this);
  }
}

abstract class _RouteInfo implements RouteInfo {
  const factory _RouteInfo(
      {final double? duration,
      final double? distance,
      final dynamic geometry,
      final List<LegInfo>? legs}) = _$_RouteInfo;

  factory _RouteInfo.fromJson(Map<String, dynamic> json) =
      _$_RouteInfo.fromJson;

  @override
  double? get duration => throw _privateConstructorUsedError;
  @override
  double? get distance => throw _privateConstructorUsedError;
  @override
  dynamic get geometry => throw _privateConstructorUsedError;
  @override
  List<LegInfo>? get legs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RouteInfoCopyWith<_$_RouteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

LegInfo _$LegInfoFromJson(Map<String, dynamic> json) {
  return _LegInfo.fromJson(json);
}

/// @nodoc
mixin _$LegInfo {
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<StepInfo>? get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegInfoCopyWith<LegInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegInfoCopyWith<$Res> {
  factory $LegInfoCopyWith(LegInfo value, $Res Function(LegInfo) then) =
      _$LegInfoCopyWithImpl<$Res>;
  $Res call({double? duration, double? distance, List<StepInfo>? steps});
}

/// @nodoc
class _$LegInfoCopyWithImpl<$Res> implements $LegInfoCopyWith<$Res> {
  _$LegInfoCopyWithImpl(this._value, this._then);

  final LegInfo _value;
  // ignore: unused_field
  final $Res Function(LegInfo) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInfo>?,
    ));
  }
}

/// @nodoc
abstract class _$$_LegInfoCopyWith<$Res> implements $LegInfoCopyWith<$Res> {
  factory _$$_LegInfoCopyWith(
          _$_LegInfo value, $Res Function(_$_LegInfo) then) =
      __$$_LegInfoCopyWithImpl<$Res>;
  @override
  $Res call({double? duration, double? distance, List<StepInfo>? steps});
}

/// @nodoc
class __$$_LegInfoCopyWithImpl<$Res> extends _$LegInfoCopyWithImpl<$Res>
    implements _$$_LegInfoCopyWith<$Res> {
  __$$_LegInfoCopyWithImpl(_$_LegInfo _value, $Res Function(_$_LegInfo) _then)
      : super(_value, (v) => _then(v as _$_LegInfo));

  @override
  _$_LegInfo get _value => super._value as _$_LegInfo;

  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$_LegInfo(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      steps: steps == freezed
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LegInfo implements _LegInfo {
  const _$_LegInfo({this.duration, this.distance, final List<StepInfo>? steps})
      : _steps = steps;

  factory _$_LegInfo.fromJson(Map<String, dynamic> json) =>
      _$$_LegInfoFromJson(json);

  @override
  final double? duration;
  @override
  final double? distance;
  final List<StepInfo>? _steps;
  @override
  List<StepInfo>? get steps {
    final value = _steps;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LegInfo(duration: $duration, distance: $distance, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LegInfo &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  _$$_LegInfoCopyWith<_$_LegInfo> get copyWith =>
      __$$_LegInfoCopyWithImpl<_$_LegInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LegInfoToJson(this);
  }
}

abstract class _LegInfo implements LegInfo {
  const factory _LegInfo(
      {final double? duration,
      final double? distance,
      final List<StepInfo>? steps}) = _$_LegInfo;

  factory _LegInfo.fromJson(Map<String, dynamic> json) = _$_LegInfo.fromJson;

  @override
  double? get duration => throw _privateConstructorUsedError;
  @override
  double? get distance => throw _privateConstructorUsedError;
  @override
  List<StepInfo>? get steps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LegInfoCopyWith<_$_LegInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

StepInfo _$StepInfoFromJson(Map<String, dynamic> json) {
  return _StepInfo.fromJson(json);
}

/// @nodoc
mixin _$StepInfo {
  ManueverInfo? get maneuver => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  dynamic get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepInfoCopyWith<StepInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepInfoCopyWith<$Res> {
  factory $StepInfoCopyWith(StepInfo value, $Res Function(StepInfo) then) =
      _$StepInfoCopyWithImpl<$Res>;
  $Res call(
      {ManueverInfo? maneuver,
      double? duration,
      double? distance,
      dynamic geometry});

  $ManueverInfoCopyWith<$Res>? get maneuver;
}

/// @nodoc
class _$StepInfoCopyWithImpl<$Res> implements $StepInfoCopyWith<$Res> {
  _$StepInfoCopyWithImpl(this._value, this._then);

  final StepInfo _value;
  // ignore: unused_field
  final $Res Function(StepInfo) _then;

  @override
  $Res call({
    Object? maneuver = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      maneuver: maneuver == freezed
          ? _value.maneuver
          : maneuver // ignore: cast_nullable_to_non_nullable
              as ManueverInfo?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  $ManueverInfoCopyWith<$Res>? get maneuver {
    if (_value.maneuver == null) {
      return null;
    }

    return $ManueverInfoCopyWith<$Res>(_value.maneuver!, (value) {
      return _then(_value.copyWith(maneuver: value));
    });
  }
}

/// @nodoc
abstract class _$$_StepInfoCopyWith<$Res> implements $StepInfoCopyWith<$Res> {
  factory _$$_StepInfoCopyWith(
          _$_StepInfo value, $Res Function(_$_StepInfo) then) =
      __$$_StepInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {ManueverInfo? maneuver,
      double? duration,
      double? distance,
      dynamic geometry});

  @override
  $ManueverInfoCopyWith<$Res>? get maneuver;
}

/// @nodoc
class __$$_StepInfoCopyWithImpl<$Res> extends _$StepInfoCopyWithImpl<$Res>
    implements _$$_StepInfoCopyWith<$Res> {
  __$$_StepInfoCopyWithImpl(
      _$_StepInfo _value, $Res Function(_$_StepInfo) _then)
      : super(_value, (v) => _then(v as _$_StepInfo));

  @override
  _$_StepInfo get _value => super._value as _$_StepInfo;

  @override
  $Res call({
    Object? maneuver = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$_StepInfo(
      maneuver: maneuver == freezed
          ? _value.maneuver
          : maneuver // ignore: cast_nullable_to_non_nullable
              as ManueverInfo?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepInfo implements _StepInfo {
  const _$_StepInfo(
      {this.maneuver, this.duration, this.distance, this.geometry});

  factory _$_StepInfo.fromJson(Map<String, dynamic> json) =>
      _$$_StepInfoFromJson(json);

  @override
  final ManueverInfo? maneuver;
  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final dynamic geometry;

  @override
  String toString() {
    return 'StepInfo(maneuver: $maneuver, duration: $duration, distance: $distance, geometry: $geometry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepInfo &&
            const DeepCollectionEquality().equals(other.maneuver, maneuver) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.geometry, geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maneuver),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(geometry));

  @JsonKey(ignore: true)
  @override
  _$$_StepInfoCopyWith<_$_StepInfo> get copyWith =>
      __$$_StepInfoCopyWithImpl<_$_StepInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepInfoToJson(this);
  }
}

abstract class _StepInfo implements StepInfo {
  const factory _StepInfo(
      {final ManueverInfo? maneuver,
      final double? duration,
      final double? distance,
      final dynamic geometry}) = _$_StepInfo;

  factory _StepInfo.fromJson(Map<String, dynamic> json) = _$_StepInfo.fromJson;

  @override
  ManueverInfo? get maneuver => throw _privateConstructorUsedError;
  @override
  double? get duration => throw _privateConstructorUsedError;
  @override
  double? get distance => throw _privateConstructorUsedError;
  @override
  dynamic get geometry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StepInfoCopyWith<_$_StepInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

ManueverInfo _$ManueverInfoFromJson(Map<String, dynamic> json) {
  return _ManueverInfo.fromJson(json);
}

/// @nodoc
mixin _$ManueverInfo {
  String? get instruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'bearing_after')
  double? get bearingAfter => throw _privateConstructorUsedError;
  @JsonKey(name: 'bearing_before')
  double? get bearingBefore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManueverInfoCopyWith<ManueverInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManueverInfoCopyWith<$Res> {
  factory $ManueverInfoCopyWith(
          ManueverInfo value, $Res Function(ManueverInfo) then) =
      _$ManueverInfoCopyWithImpl<$Res>;
  $Res call(
      {String? instruction,
      @JsonKey(name: 'bearing_after') double? bearingAfter,
      @JsonKey(name: 'bearing_before') double? bearingBefore});
}

/// @nodoc
class _$ManueverInfoCopyWithImpl<$Res> implements $ManueverInfoCopyWith<$Res> {
  _$ManueverInfoCopyWithImpl(this._value, this._then);

  final ManueverInfo _value;
  // ignore: unused_field
  final $Res Function(ManueverInfo) _then;

  @override
  $Res call({
    Object? instruction = freezed,
    Object? bearingAfter = freezed,
    Object? bearingBefore = freezed,
  }) {
    return _then(_value.copyWith(
      instruction: instruction == freezed
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String?,
      bearingAfter: bearingAfter == freezed
          ? _value.bearingAfter
          : bearingAfter // ignore: cast_nullable_to_non_nullable
              as double?,
      bearingBefore: bearingBefore == freezed
          ? _value.bearingBefore
          : bearingBefore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_ManueverInfoCopyWith<$Res>
    implements $ManueverInfoCopyWith<$Res> {
  factory _$$_ManueverInfoCopyWith(
          _$_ManueverInfo value, $Res Function(_$_ManueverInfo) then) =
      __$$_ManueverInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? instruction,
      @JsonKey(name: 'bearing_after') double? bearingAfter,
      @JsonKey(name: 'bearing_before') double? bearingBefore});
}

/// @nodoc
class __$$_ManueverInfoCopyWithImpl<$Res>
    extends _$ManueverInfoCopyWithImpl<$Res>
    implements _$$_ManueverInfoCopyWith<$Res> {
  __$$_ManueverInfoCopyWithImpl(
      _$_ManueverInfo _value, $Res Function(_$_ManueverInfo) _then)
      : super(_value, (v) => _then(v as _$_ManueverInfo));

  @override
  _$_ManueverInfo get _value => super._value as _$_ManueverInfo;

  @override
  $Res call({
    Object? instruction = freezed,
    Object? bearingAfter = freezed,
    Object? bearingBefore = freezed,
  }) {
    return _then(_$_ManueverInfo(
      instruction: instruction == freezed
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String?,
      bearingAfter: bearingAfter == freezed
          ? _value.bearingAfter
          : bearingAfter // ignore: cast_nullable_to_non_nullable
              as double?,
      bearingBefore: bearingBefore == freezed
          ? _value.bearingBefore
          : bearingBefore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManueverInfo implements _ManueverInfo {
  const _$_ManueverInfo(
      {this.instruction,
      @JsonKey(name: 'bearing_after') this.bearingAfter,
      @JsonKey(name: 'bearing_before') this.bearingBefore});

  factory _$_ManueverInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ManueverInfoFromJson(json);

  @override
  final String? instruction;
  @override
  @JsonKey(name: 'bearing_after')
  final double? bearingAfter;
  @override
  @JsonKey(name: 'bearing_before')
  final double? bearingBefore;

  @override
  String toString() {
    return 'ManueverInfo(instruction: $instruction, bearingAfter: $bearingAfter, bearingBefore: $bearingBefore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManueverInfo &&
            const DeepCollectionEquality()
                .equals(other.instruction, instruction) &&
            const DeepCollectionEquality()
                .equals(other.bearingAfter, bearingAfter) &&
            const DeepCollectionEquality()
                .equals(other.bearingBefore, bearingBefore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instruction),
      const DeepCollectionEquality().hash(bearingAfter),
      const DeepCollectionEquality().hash(bearingBefore));

  @JsonKey(ignore: true)
  @override
  _$$_ManueverInfoCopyWith<_$_ManueverInfo> get copyWith =>
      __$$_ManueverInfoCopyWithImpl<_$_ManueverInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManueverInfoToJson(this);
  }
}

abstract class _ManueverInfo implements ManueverInfo {
  const factory _ManueverInfo(
          {final String? instruction,
          @JsonKey(name: 'bearing_after') final double? bearingAfter,
          @JsonKey(name: 'bearing_before') final double? bearingBefore}) =
      _$_ManueverInfo;

  factory _ManueverInfo.fromJson(Map<String, dynamic> json) =
      _$_ManueverInfo.fromJson;

  @override
  String? get instruction => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bearing_after')
  double? get bearingAfter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'bearing_before')
  double? get bearingBefore => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ManueverInfoCopyWith<_$_ManueverInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reverse_geocoding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReverseGeocodingWrapper _$ReverseGeocodingWrapperFromJson(
    Map<String, dynamic> json) {
  return _ReverseGeocodingWrapper.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodingWrapper {
  ReverseGeocoding? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReverseGeocodingWrapperCopyWith<ReverseGeocodingWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodingWrapperCopyWith<$Res> {
  factory $ReverseGeocodingWrapperCopyWith(ReverseGeocodingWrapper value,
          $Res Function(ReverseGeocodingWrapper) then) =
      _$ReverseGeocodingWrapperCopyWithImpl<$Res>;
  $Res call({ReverseGeocoding? data});

  $ReverseGeocodingCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReverseGeocodingWrapperCopyWithImpl<$Res>
    implements $ReverseGeocodingWrapperCopyWith<$Res> {
  _$ReverseGeocodingWrapperCopyWithImpl(this._value, this._then);

  final ReverseGeocodingWrapper _value;
  // ignore: unused_field
  final $Res Function(ReverseGeocodingWrapper) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReverseGeocoding?,
    ));
  }

  @override
  $ReverseGeocodingCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReverseGeocodingCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReverseGeocodingWrapperCopyWith<$Res>
    implements $ReverseGeocodingWrapperCopyWith<$Res> {
  factory _$$_ReverseGeocodingWrapperCopyWith(_$_ReverseGeocodingWrapper value,
          $Res Function(_$_ReverseGeocodingWrapper) then) =
      __$$_ReverseGeocodingWrapperCopyWithImpl<$Res>;
  @override
  $Res call({ReverseGeocoding? data});

  @override
  $ReverseGeocodingCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ReverseGeocodingWrapperCopyWithImpl<$Res>
    extends _$ReverseGeocodingWrapperCopyWithImpl<$Res>
    implements _$$_ReverseGeocodingWrapperCopyWith<$Res> {
  __$$_ReverseGeocodingWrapperCopyWithImpl(_$_ReverseGeocodingWrapper _value,
      $Res Function(_$_ReverseGeocodingWrapper) _then)
      : super(_value, (v) => _then(v as _$_ReverseGeocodingWrapper));

  @override
  _$_ReverseGeocodingWrapper get _value =>
      super._value as _$_ReverseGeocodingWrapper;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_ReverseGeocodingWrapper(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReverseGeocoding?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReverseGeocodingWrapper implements _ReverseGeocodingWrapper {
  const _$_ReverseGeocodingWrapper({this.data});

  factory _$_ReverseGeocodingWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_ReverseGeocodingWrapperFromJson(json);

  @override
  final ReverseGeocoding? data;

  @override
  String toString() {
    return 'ReverseGeocodingWrapper(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReverseGeocodingWrapper &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_ReverseGeocodingWrapperCopyWith<_$_ReverseGeocodingWrapper>
      get copyWith =>
          __$$_ReverseGeocodingWrapperCopyWithImpl<_$_ReverseGeocodingWrapper>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReverseGeocodingWrapperToJson(this);
  }
}

abstract class _ReverseGeocodingWrapper implements ReverseGeocodingWrapper {
  const factory _ReverseGeocodingWrapper({final ReverseGeocoding? data}) =
      _$_ReverseGeocodingWrapper;

  factory _ReverseGeocodingWrapper.fromJson(Map<String, dynamic> json) =
      _$_ReverseGeocodingWrapper.fromJson;

  @override
  ReverseGeocoding? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReverseGeocodingWrapperCopyWith<_$_ReverseGeocodingWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

ReverseGeocoding _$ReverseGeocodingFromJson(Map<String, dynamic> json) {
  return _ReverseGeocoding.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocoding {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'feature_type')
  String? get featureType => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_name')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_name')
  String? get districtName => throw _privateConstructorUsedError;
  @JsonKey(name: 'commune_name')
  String? get communeName => throw _privateConstructorUsedError;
  dynamic? get center => throw _privateConstructorUsedError;
  dynamic? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReverseGeocodingCopyWith<ReverseGeocoding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodingCopyWith<$Res> {
  factory $ReverseGeocodingCopyWith(
          ReverseGeocoding value, $Res Function(ReverseGeocoding) then) =
      _$ReverseGeocodingCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'feature_type') String? featureType,
      @JsonKey(name: 'province_name') String? provinceName,
      @JsonKey(name: 'district_name') String? districtName,
      @JsonKey(name: 'commune_name') String? communeName,
      dynamic? center,
      dynamic? geometry});
}

/// @nodoc
class _$ReverseGeocodingCopyWithImpl<$Res>
    implements $ReverseGeocodingCopyWith<$Res> {
  _$ReverseGeocodingCopyWithImpl(this._value, this._then);

  final ReverseGeocoding _value;
  // ignore: unused_field
  final $Res Function(ReverseGeocoding) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? featureType = freezed,
    Object? provinceName = freezed,
    Object? districtName = freezed,
    Object? communeName = freezed,
    Object? center = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      featureType: featureType == freezed
          ? _value.featureType
          : featureType // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: provinceName == freezed
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      communeName: communeName == freezed
          ? _value.communeName
          : communeName // ignore: cast_nullable_to_non_nullable
              as String?,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReverseGeocodingCopyWith<$Res>
    implements $ReverseGeocodingCopyWith<$Res> {
  factory _$$_ReverseGeocodingCopyWith(
          _$_ReverseGeocoding value, $Res Function(_$_ReverseGeocoding) then) =
      __$$_ReverseGeocodingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'feature_type') String? featureType,
      @JsonKey(name: 'province_name') String? provinceName,
      @JsonKey(name: 'district_name') String? districtName,
      @JsonKey(name: 'commune_name') String? communeName,
      dynamic? center,
      dynamic? geometry});
}

/// @nodoc
class __$$_ReverseGeocodingCopyWithImpl<$Res>
    extends _$ReverseGeocodingCopyWithImpl<$Res>
    implements _$$_ReverseGeocodingCopyWith<$Res> {
  __$$_ReverseGeocodingCopyWithImpl(
      _$_ReverseGeocoding _value, $Res Function(_$_ReverseGeocoding) _then)
      : super(_value, (v) => _then(v as _$_ReverseGeocoding));

  @override
  _$_ReverseGeocoding get _value => super._value as _$_ReverseGeocoding;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? featureType = freezed,
    Object? provinceName = freezed,
    Object? districtName = freezed,
    Object? communeName = freezed,
    Object? center = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$_ReverseGeocoding(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      featureType: featureType == freezed
          ? _value.featureType
          : featureType // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceName: provinceName == freezed
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String?,
      communeName: communeName == freezed
          ? _value.communeName
          : communeName // ignore: cast_nullable_to_non_nullable
              as String?,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReverseGeocoding implements _ReverseGeocoding {
  const _$_ReverseGeocoding(
      {this.id,
      this.name,
      @JsonKey(name: 'feature_type') this.featureType,
      @JsonKey(name: 'province_name') this.provinceName,
      @JsonKey(name: 'district_name') this.districtName,
      @JsonKey(name: 'commune_name') this.communeName,
      this.center,
      this.geometry});

  factory _$_ReverseGeocoding.fromJson(Map<String, dynamic> json) =>
      _$$_ReverseGeocodingFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'feature_type')
  final String? featureType;
  @override
  @JsonKey(name: 'province_name')
  final String? provinceName;
  @override
  @JsonKey(name: 'district_name')
  final String? districtName;
  @override
  @JsonKey(name: 'commune_name')
  final String? communeName;
  @override
  final dynamic? center;
  @override
  final dynamic? geometry;

  @override
  String toString() {
    return 'ReverseGeocoding(id: $id, name: $name, featureType: $featureType, provinceName: $provinceName, districtName: $districtName, communeName: $communeName, center: $center, geometry: $geometry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReverseGeocoding &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.featureType, featureType) &&
            const DeepCollectionEquality()
                .equals(other.provinceName, provinceName) &&
            const DeepCollectionEquality()
                .equals(other.districtName, districtName) &&
            const DeepCollectionEquality()
                .equals(other.communeName, communeName) &&
            const DeepCollectionEquality().equals(other.center, center) &&
            const DeepCollectionEquality().equals(other.geometry, geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(featureType),
      const DeepCollectionEquality().hash(provinceName),
      const DeepCollectionEquality().hash(districtName),
      const DeepCollectionEquality().hash(communeName),
      const DeepCollectionEquality().hash(center),
      const DeepCollectionEquality().hash(geometry));

  @JsonKey(ignore: true)
  @override
  _$$_ReverseGeocodingCopyWith<_$_ReverseGeocoding> get copyWith =>
      __$$_ReverseGeocodingCopyWithImpl<_$_ReverseGeocoding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReverseGeocodingToJson(this);
  }
}

abstract class _ReverseGeocoding implements ReverseGeocoding {
  const factory _ReverseGeocoding(
      {final String? id,
      final String? name,
      @JsonKey(name: 'feature_type') final String? featureType,
      @JsonKey(name: 'province_name') final String? provinceName,
      @JsonKey(name: 'district_name') final String? districtName,
      @JsonKey(name: 'commune_name') final String? communeName,
      final dynamic? center,
      final dynamic? geometry}) = _$_ReverseGeocoding;

  factory _ReverseGeocoding.fromJson(Map<String, dynamic> json) =
      _$_ReverseGeocoding.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'feature_type')
  String? get featureType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'province_name')
  String? get provinceName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'district_name')
  String? get districtName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'commune_name')
  String? get communeName => throw _privateConstructorUsedError;
  @override
  dynamic? get center => throw _privateConstructorUsedError;
  @override
  dynamic? get geometry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReverseGeocodingCopyWith<_$_ReverseGeocoding> get copyWith =>
      throw _privateConstructorUsedError;
}

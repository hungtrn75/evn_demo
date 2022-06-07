part of 'geocoding_bloc.dart';

class GeocodingState extends Equatable {
  final bool loading;
  final String error;
  final List<ReverseGeocoding> geocodings;

  const GeocodingState(
      {required this.loading, required this.error, required this.geocodings});

  factory GeocodingState.init() {
    return const GeocodingState(loading: false, error: "", geocodings: []);
  }

  factory GeocodingState.error(String error) {
    return GeocodingState(loading: false, error: error, geocodings: []);
  }

  GeocodingState copyWith(
      {bool? loading, String? error, List<ReverseGeocoding>? geocodings}) {
    return GeocodingState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      geocodings: geocodings ?? this.geocodings,
    );
  }

  @override
  List<Object> get props => [loading, error, geocodings];
}

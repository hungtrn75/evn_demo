part of 'geocoding_bloc.dart';

abstract class GeocodingEvent extends Equatable {
  const GeocodingEvent();
}

class GeocodingSearchEvent extends GeocodingEvent {
  final String q;

  const GeocodingSearchEvent(this.q);

  @override
  List<Object> get props => [q];
}

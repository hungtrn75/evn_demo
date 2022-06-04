part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapRoutingEvent extends MapEvent {
  final LatLng source;
  final LatLng destination;

  const MapRoutingEvent({required this.source, required this.destination});

  @override
  List<Object?> get props => [source, destination];
}

class MapClearEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}

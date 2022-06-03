part of 'power_poles_detail_bloc.dart';

abstract class PowerPolesDetailEvent extends Equatable {
  const PowerPolesDetailEvent();
}

class PowerPolesDetailReverseGeocodingEvent extends PowerPolesDetailEvent {
  final double latitude;
  final double longitude;

  const PowerPolesDetailReverseGeocodingEvent({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}

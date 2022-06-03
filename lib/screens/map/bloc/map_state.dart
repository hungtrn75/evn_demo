part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool loading;
  final String error;
  final DirectionInfo? directionInfo;

  const MapState(
      {required this.loading,
      required this.error,
      required this.directionInfo});

  factory MapState.init() {
    return const MapState(loading: false, error: "", directionInfo: null);
  }

  MapState copyWith(
      {bool? loading, String? error, DirectionInfo? directionInfo}) {
    return MapState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        directionInfo: directionInfo ?? this.directionInfo);
  }

  @override
  List<Object?> get props => [loading, error, directionInfo];
}

part of 'power_poles_detail_bloc.dart';

class PowerPolesDetailState extends Equatable {
  final bool loading;
  final ReverseGeocoding? reverseGeocoding;
  final String error;

  const PowerPolesDetailState({
    required this.reverseGeocoding,
    required this.loading,
    required this.error,
  });

  factory PowerPolesDetailState.init() {
    return const PowerPolesDetailState(
        reverseGeocoding: null, loading: false, error: "");
  }

  factory PowerPolesDetailState.error(String error) {
    return PowerPolesDetailState(
        reverseGeocoding: null, loading: false, error: error);
  }

  factory PowerPolesDetailState.result(ReverseGeocoding result) {
    return PowerPolesDetailState(
        reverseGeocoding: result, loading: false, error: "");
  }

  PowerPolesDetailState copyWith(
      {bool? loading, ReverseGeocoding? reverseGeocoding, String? error}) {
    return PowerPolesDetailState(
      reverseGeocoding: reverseGeocoding ?? this.reverseGeocoding,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [reverseGeocoding, loading, error];
}

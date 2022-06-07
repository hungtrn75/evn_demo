import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/network/app_repository.dart';
import 'package:collect_data/models/reverse_geocoding.dart';
import 'package:collect_data/utils/dio_ultils.dart';
import 'package:equatable/equatable.dart';

part 'geocoding_event.dart';

part 'geocoding_state.dart';

class GeocodingBloc extends Bloc<GeocodingEvent, GeocodingState> {
  final AppRepository appRepository = DI.resolve();

  GeocodingBloc() : super(GeocodingState.init()) {
    on<GeocodingEvent>(_onEvent, transformer: sequential());
  }

  void _onEvent(GeocodingEvent event, Emitter<GeocodingState> emit) {
    if (event is GeocodingSearchEvent) {
      return _onSearch(event, emit);
    }
  }

  void _onSearch(
      GeocodingSearchEvent event, Emitter<GeocodingState> emit) async {
    try {
      emit(state.copyWith(loading: true));
      final resp = await appRepository.geocoding(event.q);
      emit(state.copyWith(loading: false, error: "", geocodings: resp));
    } catch (e) {
      final error = DioUtils.handleNormalError(e);
      emit(GeocodingState.error(error));
    }
  }
}

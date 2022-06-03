import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/network/app_repository.dart';
import 'package:collect_data/models/reverse_geocoding.dart';
import 'package:collect_data/utils/dio_ultils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'power_poles_detail_event.dart';

part 'power_poles_detail_state.dart';

class PowerPolesDetailBloc
    extends Bloc<PowerPolesDetailEvent, PowerPolesDetailState> {
  final AppRepository appRepository = DI.resolve();

  PowerPolesDetailBloc()
      : super(
          PowerPolesDetailState.init(),
        ) {
    on<PowerPolesDetailEvent>(_onEvent, transformer: sequential());
  }

  void _onEvent(
      PowerPolesDetailEvent event, Emitter<PowerPolesDetailState> emit) {
    if (event is PowerPolesDetailReverseGeocodingEvent) {
      return _onReverseGeocoding(event, emit);
    }
  }

  void _onReverseGeocoding(PowerPolesDetailReverseGeocodingEvent event,
      Emitter<PowerPolesDetailState> emit) async {
    try {
      emit(const PowerPolesDetailState(
          reverseGeocoding: null, loading: true, error: ""));
      final resp = await appRepository.reverseGeocoding(
          latitude: event.latitude, longitude: event.longitude);

      emit(PowerPolesDetailState.result(resp.data!));
    } catch (e) {
      final error = DioUtils.handleNormalError(e);
      emit(PowerPolesDetailState.error(error));
    }
  }
}

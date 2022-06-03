import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/network/app_repository.dart';
import 'package:collect_data/models/routing.dart';
import 'package:collect_data/utils/dio_ultils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

part 'map_event.dart';

part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final AppRepository appRepository = DI.resolve();

  MapBloc() : super(MapState.init()) {
    on<MapEvent>(_onEvent, transformer: sequential());
  }

  void _onEvent(MapEvent event, Emitter<MapState> emit) {
    if (event is MapRoutingEvent) {
      return _onRouting(event, emit);
    }
  }

  void _onRouting(MapRoutingEvent event, Emitter<MapState> emit) async {
    try {
      emit(state.copyWith(loading: true, error: ""));
      final waypoints =
          "${event.source.longitude}%2C${event.source.latitude}%3B${event.destination.longitude}%2C${event.destination.latitude}";
      final resp = await appRepository.routing(waypoints);
      emit(state.copyWith(directionInfo: resp, loading: false));
    } catch (e) {
      final error = DioUtils.handleNormalError(e);
      debugPrint("_onRoutingError: $e");
      emit(state.copyWith(error: error, loading: false));
    }
  }
}

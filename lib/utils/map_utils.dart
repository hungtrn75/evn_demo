import 'dart:math';

import 'package:collect_data/models/routing.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  double? x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > x1!) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1!) y1 = latLng.longitude;
      if (latLng.longitude < y0!) y0 = latLng.longitude;
    }
  }
  return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
}

List<Map<String, dynamic>> turnArrowFeatures(StepInfo current, StepInfo next) {
  final currentPointList =
      (current.geometry as Map<String, dynamic>)["coordinates"] as List<dynamic>;
  final nextPointList =
      (next.geometry as Map<String, dynamic>)["coordinates"] as List<dynamic>;

  final startIndex = max(currentPointList.length - 4, 0);
  final endIndex = min(nextPointList.length, 4);
  final last =
      currentPointList.getRange(startIndex, currentPointList.length).toList();
  final first = nextPointList.getRange(0, endIndex).toList();

  final to = first.last as List<dynamic>;
  final from = first[first.length - 2] as List<dynamic>;
  debugPrint("111: $from, $to");
  return [
    {
      "id": 6,
      "type": "Feature",
      "properties": {
        "id": 6,
      },
      "geometry": {
        "coordinates": [
          ...last,
          ...first,
        ],
        "type": "LineString"
      }
    },
    {
      "id": 7,
      "type": "Feature",
      "properties": {
        "id": 7,
        "bearing": 180 + bearing(
          from[1],
          from[0],
          to[1],
          to[0],
        ),
      },
      "geometry": {"type": "Point", "coordinates": first.last}
    },
  ];
}

double bearing(double lat1, double lon1, double lat2, double lon2) {
  final fLon1 = toRad(lon1);
  final fLon2 = toRad(lon2);
  final fLat1 = toRad(lat1);
  final fLat2 = toRad(lat2);

  final a = sin(fLon2 - fLon1) * cos(fLat2);
  final b = cos(fLat1) * sin(fLat2) - sin(fLat1) * cos(fLat2) * cos(fLon2 - fLon1);

  return toDeg(atan2(a, b));
}

double toRad(double degree) {
  return degree * pi / 180;
}

double toDeg(double radian) {
  return radian * 180 / pi;
}

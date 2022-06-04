import 'package:collect_data/models/routing.dart';
import 'package:collect_data/utils/struct_utils.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../configs/constants/app_variables.dart';
import 'tuft_utils.dart';

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

Pair<List<Map<String, dynamic>>, LatLngBounds> turnArrowFeatures(
    StepInfo? current, StepInfo next) {
  List<LatLng> coordinates = [];
  List<LatLng> arrowLineCurrent = [];
  List<LatLng> arrowCurrentSliced = [];
  List<LatLng> arrowUpcomingSliced = [];
  final arrowLineUpcoming =
      ((next.geometry as Map<String, dynamic>)["coordinates"] as List<dynamic>)
          .map((e) => LatLng(e[1], e[0]))
          .toList();

  if (current == null) {
    arrowUpcomingSliced = TurfMisc.lineSliceAlongWithUnits(
        arrowLineUpcoming, 0.0, 40, TurfConstants.UNIT_METERS);
  } else {
    final currentPointList = ((current.geometry
            as Map<String, dynamic>)["coordinates"] as List<dynamic>)
        .map((e) => LatLng(e[1], e[0]))
        .toList();
    arrowLineCurrent = currentPointList.reversed.toList();

    arrowCurrentSliced = TurfMisc.lineSliceAlongWithUnits(
        arrowLineCurrent, 0.0, 30, TurfConstants.UNIT_METERS);

    arrowUpcomingSliced = TurfMisc.lineSliceAlongWithUnits(
        arrowLineUpcoming, 0.0, 30, TurfConstants.UNIT_METERS);
  }
  coordinates = [...arrowCurrentSliced.reversed, ...arrowUpcomingSliced];

  final featureCollection = [
    {
      "id": AppVariable.NAVIGATION_BODY_INNER_LAYER,
      "type": "Feature",
      "properties": {
        "id": AppVariable.NAVIGATION_BODY_INNER_LAYER,
      },
      "geometry": {
        "coordinates":
            coordinates.map((e) => [e.longitude, e.latitude]).toList(),
        "type": "LineString"
      }
    },
    {
      "id": AppVariable.NAVIGATION_HEAD_ARROW_LAYER,
      "type": "Feature",
      "properties": {
        "id": AppVariable.NAVIGATION_HEAD_ARROW_LAYER,
        "bearing": TurfMeasurement.bearing(
            coordinates.last, coordinates[coordinates.length - 2]),
      },
      "geometry": {
        "type": "Point",
        "coordinates": [coordinates.last.longitude, coordinates.last.latitude]
      }
    },
  ];
  final temp1 = TurfMisc.lineSliceAlongWithUnits(
      arrowLineCurrent, 0.0, 80, TurfConstants.UNIT_METERS);

  final temp2 = TurfMisc.lineSliceAlongWithUnits(
      arrowLineUpcoming, 0.0, 80, TurfConstants.UNIT_METERS);
  return Pair(featureCollection, boundsFromLatLngList([...temp1, ...temp2]));
}

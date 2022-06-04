import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class TurfMisc {
  static List<LatLng> lineSliceAlongWithUnits(
      List<LatLng> coords, double startDist, double stopDist, String units) {
    List<LatLng> slice = [];

    double travelled = 0;

    for (int i = 0; i < coords.length; i++) {
      if (startDist >= travelled && i == coords.length - 1) {
        break;
      } else if (travelled > startDist && slice.isEmpty) {
        double overshot = startDist - travelled;
        if (overshot == 0) {
          slice.add(coords[i]);
          return slice;
        }

        double direction =
            TurfMeasurement.bearing(coords[i], coords[i - 1]) - 180;
        final interpolated =
            TurfMeasurement.destination(coords[i], overshot, direction, units);
        slice.add(interpolated);
      }

      if (travelled >= stopDist) {
        double overshot = stopDist - travelled;
        if (overshot == 0) {
          slice.add(coords[i]);
          return slice;
        }
        double direction =
            TurfMeasurement.bearing(coords[i], coords[i - 1]) - 180;
        final interpolated =
            TurfMeasurement.destination(coords[i], overshot, direction, units);
        slice.add(interpolated);
        return slice;
      }

      if (travelled >= startDist) {
        slice.add(coords[i]);
      }

      if (i == coords.length - 1) {
        return slice;
      }

      travelled +=
          TurfMeasurement.distanceWithUnits(coords[i], coords[i + 1], units);
    }

    if (travelled < startDist) {
      throw Exception("Start position is beyond line");
    }

    return slice;
  }
}

class TurfMeasurement {
  static double bearing(LatLng point1, LatLng point2) {
    final fLon1 = degreesToRadians(point1.longitude);
    final fLon2 = degreesToRadians(point2.longitude);
    final fLat1 = degreesToRadians(point1.latitude);
    final fLat2 = degreesToRadians(point2.latitude);

    final a = sin(fLon2 - fLon1) * cos(fLat2);
    final b =
        cos(fLat1) * sin(fLat2) - sin(fLat1) * cos(fLat2) * cos(fLon2 - fLon1);

    return radiansToDegrees(atan2(a, b));
  }

  static LatLng destination(
      LatLng point, double distance, double bearing, String units) {
    double longitude1 = degreesToRadians(point.longitude);
    double latitude1 = degreesToRadians(point.latitude);
    double bearingRad = degreesToRadians(bearing);

    double radians = TurfConversion.lengthToRadiansWithUnits(distance, units);
    double latitude2 = asin(sin(latitude1) * cos(radians) +
        cos(latitude1) * sin(radians) * cos(bearingRad));
    double longitude2 = longitude1 +
        atan2(sin(bearingRad) * sin(radians) * cos(latitude1),
            cos(radians) - sin(latitude1) * sin(latitude2));

    return LatLng(radiansToDegrees(latitude2), radiansToDegrees(longitude2));
  }

  static double degreesToRadians(double degree) {
    return degree * pi / 180;
  }

  static double radiansToDegrees(double radian) {
    return radian * 180 / pi;
  }

  static double distanceWithUnits(LatLng point1, LatLng point2, String units) {
    double difLat = degreesToRadians((point2.latitude - point1.latitude));
    double difLon = degreesToRadians((point2.longitude - point1.longitude));
    double lat1 = degreesToRadians(point1.latitude);
    double lat2 = degreesToRadians(point2.latitude);

    double value = pow(sin(difLat / 2), 2) +
        pow(sin(difLon / 2), 2) * cos(lat1) * cos(lat2);

    return TurfConversion.radiansToLengthWithUnits(
        2 * atan2(sqrt(value), sqrt(1 - value)), units);
  }
}

class TurfConversion {
  static final Map<String, double> FACTORS = {
    TurfConstants.UNIT_MILES: 3960,
    TurfConstants.UNIT_NAUTICAL_MILES: 3441.145,
    TurfConstants.UNIT_DEGREES: 57.2957795,
    TurfConstants.UNIT_RADIANS: 1,
    TurfConstants.UNIT_INCHES: 250905600,
    TurfConstants.UNIT_YARDS: 6969600,
    TurfConstants.UNIT_METERS: 6373000,
    TurfConstants.UNIT_CENTIMETERS: 6.373e+8,
    TurfConstants.UNIT_KILOMETERS: 6373,
    TurfConstants.UNIT_FEET: 20908792.65,
    TurfConstants.UNIT_CENTIMETRES: 6.373e+8,
    TurfConstants.UNIT_METRES: 6373000,
    TurfConstants.UNIT_KILOMETRES: 6373,
  };

  static double lengthToRadians(double distance) {
    return lengthToRadiansWithUnits(distance, TurfConstants.UNIT_DEFAULT);
  }

  static double lengthToRadiansWithUnits(double distance, String units) {
    return distance / FACTORS[units]!;
  }

  static double radiansToLength(double radians) {
    return radiansToLengthWithUnits(radians, TurfConstants.UNIT_DEFAULT);
  }

  static double radiansToLengthWithUnits(double radians, String units) {
    return radians * FACTORS[units]!;
  }
}

class TurfConstants {
  static const String UNIT_MILES = "miles";
  static const String UNIT_NAUTICAL_MILES = "nauticalmiles";
  static const String UNIT_KILOMETERS = "kilometers";
  static const String UNIT_RADIANS = "radians";
  static const String UNIT_DEGREES = "degrees";
  static const String UNIT_INCHES = "inches";
  static const String UNIT_YARDS = "yards";
  static const String UNIT_METERS = "meters";
  static const String UNIT_CENTIMETERS = "centimeters";
  static const String UNIT_FEET = "feet";
  static const String UNIT_CENTIMETRES = "centimetres";
  static const String UNIT_METRES = "metres";
  static const String UNIT_KILOMETRES = "kilometres";
  static const String UNIT_DEFAULT = UNIT_KILOMETERS;
}

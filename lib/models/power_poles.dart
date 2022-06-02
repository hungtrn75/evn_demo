import 'package:hive/hive.dart';

part 'power_poles.g.dart';

@HiveType(typeId: 1)
class PowerPoles extends HiveObject {
  @HiveField(0)
  String? elevation;
  @HiveField(1)
  String? property;
  @HiveField(2)
  double? latitude;
  @HiveField(3)
  double? longitude;
  @HiveField(4)
  String uuid;

  PowerPoles(
      {this.elevation,
      this.property,
      this.latitude,
      this.longitude,
      required this.uuid});

  Map<String, dynamic> toJson() {
    final result = {
      "type": "Feature",
      "properties": {
        "uuid": uuid,
        "elevation": elevation,
        "property": property,
      },
      "geometry": {
        "type": "Point",
        "coordinates": [longitude, latitude]
      }
    };

    return result;
  }
}
